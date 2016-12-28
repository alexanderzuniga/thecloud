<?php

/*
 * This file builds the database table full of break information.
 * If you found it and feel like cheating, then good for you I guess!
 */

function wpe_sb_create_table($table){

    global $wpdb;

    /*
     * Create the table
     * https://codex.wordpress.org/Creating_Tables_with_Plugins
     */

    $charset_collate = $wpdb->get_charset_collate();

    $wpdb->query("DROP TABLE IF EXISTS `$table`");
    $sql = "CREATE TABLE `$table` (
      `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
      `file` varchar(255),
      `status` varchar(255) DEFAULT 'pending',
      PRIMARY KEY (`id`))
      $charset_collate;";
    require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
    dbDelta( $sql );

    /*
     * Set up breaks array with content
     * We're doing it like this so we can put them in a particular order.
     */

    $breaks = array();

    if ( is_multisite() === true ){

        $breaks[] = '01-breakhome-conf.php';
        $breaks[] = '02-breakhome-db.php';
        $breaks[] = '03-wsod-plugin.php';
        $breaks[] = '04-fileperms.php';
        $breaks[] = '05-my-first-break.php';

    } else {

        $breaks[] = '01-breakhome-conf.php';
        $breaks[] = '02-breakhome-db.php';
        $breaks[] = '03-wsod-plugin.php';
        $breaks[] = '04-fileperms.php';
        $breaks[] = '05-my-first-break.php';

    }

    /*
     * Insert the array into our db table with encoded filenames.
     */
    foreach ($breaks as $b){
      $wpdb->insert($table,array('file'=>db_encode($b)));
    }

} // end function wpe_sb_create_table()

/* Function to encode data in the database,
 * so they can't just easily look there for answers.
 */

// This should probably be somewheres else.
function db_encode($thing){
  $encoded = base64_encode(str_rot13($thing));
  return $encoded;
}
/*
function db_decode($thing){
  $decoded = str_rot13(base64_decode($thing));
  return $decoded;
}
*/
