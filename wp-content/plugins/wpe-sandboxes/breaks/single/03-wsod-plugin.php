<?php

require __DIR__ .'/../abstractBreak.php';

class wpeBreak extends abstractBreak {
    function __construct(){
        $this->cdesc = "My website is busted...";
        $this->repl = "Visit the site.";
        $this->hint = "You WOULD want a hint, wouldn't you.";
    }
    
    function breakSite() {
        // Unzip plugin from assets folder
        $this->unzip_plugin('crafty-social-buttons');

        // Activate plugin
        $plugin_path = WP_PLUGIN_DIR . '/crafty-social-buttons/crafty-social-buttons.php';
        $result = activate_plugin($plugin_path);
        if ( is_wp_error( $result ) ) {
            echo "oh noes, error!";
        }

        // Break the plugin (cause 500 error)
        $file_contents = file_get_contents($plugin_path);
        $new_contents = "<?php open( ?>\n" . $file_contents;
        file_put_contents($plugin_path, $new_contents);
    }
}
