<?php


define("USER_DATA_FILE",     WP_PLUGIN_DIR . "/wpe-sandboxes/user_data.json");
define("SITE_CONTENT_MD5",     WP_PLUGIN_DIR . "/wpe-sandboxes/site_content.md5");

class WpeSandbox
{
    public static function register_user($user_name, $user_email, $notify_email = null){
        // write these values to a file (yes, to a file. we are breaking lots of things here)
        $user_data = array('user_name'=>$user_name, 'user_email'=>$user_email, 'notify_email'=>$notify_email);
        file_put_contents(USER_DATA_FILE, json_encode($user_data));
        self::notify_register();
    }

    public static function start_break($breaknum){
        // save hash of site content
        self::put_site_content();
        // get this break
        $break = self::get_break($breaknum);
        // update database
        self::set_table_status($breaknum, 'active');
        // email instructor
        self::notify_start($breaknum, $break->getBreakDetails());
        // print break details in popup
        $break->printBreakDesc();
        // start break
        self::break_it($break);
    }

    public static function complete_break($breaknum){
        // verify break was successful
        if (self::verify_site()){
            $status = 'complete';
            $success = true;
        } else {
            $status = 'fail';
            $success = false;
        }
        self::set_table_status($breaknum, $status);
        self::notify_complete($breaknum, $success);
        $break = self::get_break($breaknum);
        return ($success === false) ? false : $break->getBreakDetails();
    }

    public static function get_user_data_json(){
        if (file_exists(USER_DATA_FILE)){
            return file_get_contents(USER_DATA_FILE);
        } else {
            return null;
        }
    }

    private static function break_it($break){
        try {
            $break->breakSite();
            WpeCommon::purge_varnish_cache();
            WpeCommon::purge_memcached();
        } catch (Exception $e) {
            echo $e->message();
            return False;
        }
        return True;
    }

    private static function notify_start($breaknum, $break_desc){
        $user_name = self::get_user_name();
        $subject = "$user_name has started break #$breaknum";
        $msg = "$user_name has started break #$breaknum";
        self::notify($subject, $msg);
    }

    private static function notify_error($breaknum, $error_desc){
        $subject = "Break #$breaknum has caused an error";
        $user_name = self::get_user_name();
        $msg = "Break #$breaknum has caused $user_name to experience an error.";
        self::notify($subject, $msg);
    }

    private static function notify_complete($breaknum, $succss=true){
        $user_name = self::get_user_name();
        $subject = "$user_name has submitted fix for break #$breaknum";
        $msg = "$user_name has submitted fix for break #$breaknum";
        self::notify($subject, $msg);
    }

    private static function notify_register(){
        $user_name = self::get_user_name();
        $subject = "$user_name has registered a sandbox";
        $msg = "$user_name has registered a sandbox";
        self::notify($subject, $msg);
    }

    private static function notify($subject, $message){
        $user_data = self::get_user_data();
        $notify_email = $user_data['notify_email'];
        $user_name = $user_data['user_name'];
        $user_email = $user_data['user_email'];
        $headers = "From: $user_name <$user_email>" . "\r\n";
        //wp_mail($notify_email, $subject, $message, $headers);
    }

    /**
     *
     *
     * @param int $index        Row id to be updated
     * @param string $status    New row status
     * @return False on error or the number of rows affected
     */
    private static function set_table_status($index, $status){
        global $wpe_sb_table_name;
        global $wpdb;
        $allowed_status = array('pending', 'active', 'complete', 'error', 'unsuccessful_complete');
        if (in_array($status, $allowed_status)){
            return $wpdb->update(
                $table = $wpe_sb_table_name,
                $data = array(
                    'status' => "$status"),
                $where = array(
                    'id' => $index)
                );
        } else {
            return false;
        }
    }

    private static function get_filename($index){
        global $wpe_sb_table_name;
        global $wpdb;
        $query = "SELECT * FROM $wpe_sb_table_name WHERE id=$index LIMIT 1";
        $results = $wpdb->get_results($query);
        $filename = str_rot13(base64_decode($results[0]->file));
        return $filename;
    }

    private static function get_break($breaknum){
        // get filename out of the database
        $filename = self::get_filename($breaknum);
        // instantiate new break
         try {
            global $wpe_sb_breaks_path;
            require_once $wpe_sb_breaks_path . $filename;
            $b = new wpeBreak();
        } catch (Exception $e) {
            error_log($e->message());
            return null;
        }
        // return break
        return $b;
    }

    private static function get_user_data(){
        return json_decode(file_get_contents(USER_DATA_FILE), 1);
    }

    private static function get_user_name(){
        $user_data = self::get_user_data();
        return $user_data['user_name'];
    }

    private static function put_site_content(){
        $content = self::curl_site();
        file_put_contents(SITE_CONTENT_MD5, md5($content));
    }

    private static function verify_site(){
        $content = self::curl_site();
        $md5 = md5($content);
        $old_md5 = file_get_contents(SITE_CONTENT_MD5);
        # just return true for now, until we find a more consistent checking mechanism
        #return $md5 == $old_md5;
        return true;
    }

    private static function curl_site(){
        $ch = curl_init();
        $url = get_site_url();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        $result = curl_exec($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if ($http_code != 200){
            return null;
        }
        // close cURL resource, and free up system resources
        curl_close($ch);
        return $result;
    }

    // For break-a-thon
    public static function email_my_break(){
        // zip up the whole dang plugin
        require_once(__DIR__.'/hzip.php');
        $zip_path = __DIR__ . '/breakathonsubmit.zip';
        // remove zip if it already exists
        unlink($zip_path);
        // zip it up
        HZip::zipDir(__DIR__, $zip_path);
        // get user data
        $user_data = self::get_user_data();
        $user_name = $user_data['user_name'];
        $user_email = $user_data['user_email'];
        $dest_email = $user_data['notify_email'];
        $to = array($dest_email, $user_email);
        $subject = "New Break Submission from $user_name";
        $msg = "To whom it may concern,\n\n".
            "A new break has been submitted by $user_name from $user_email\n".
            "Please review the attachment at your earliest convenience.\n".
            "Warmest regards,\n\n\n".
            "$user_name";
        $headers = "From: $user_name <$user_email>" . "\r\n";
        return wp_mail($to, $subject, $msg, $headers, $zip_path);
    }
}
