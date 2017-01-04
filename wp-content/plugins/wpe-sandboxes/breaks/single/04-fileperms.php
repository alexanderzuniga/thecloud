<?php

require __DIR__ .'/../abstractBreak.php';

class wpeBreak extends abstractBreak {
    function __construct(){
        $this->cdesc = "My site shows a blank page. There's some weird stuff in the themes section of the dashboard.";
        $this->repl = "Log in to wp-admin.  Click Themes.";
        $this->hint = "Could be permission settings somewhere...";
    }

    function breakSite() {
        // Get theme directory using a WP core function.
        $dir = get_home_path()."wp-content/themes/";
        // Change the perms on the folder for lulz.
        chmod($dir, 444);
    }
}
