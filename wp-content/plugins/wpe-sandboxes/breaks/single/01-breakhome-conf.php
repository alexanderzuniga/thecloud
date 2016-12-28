<?php

require __DIR__ .'/../abstractBreak.php';

class wpeBreak extends abstractBreak {
    function __construct(){
        $this->cdesc = "My site looks weird, and the links don't work.";
        $this->repl = "Visit site.";
        $this->hint = "Maybe a home/siteurl setting somewhere?";
    }

    function breakSite() {
        // Get the path to wp-config.php using WP built-in function.
        $wp_conf_path = get_home_path()."wp-config.php";
        // Get the contents of that file.
        $wp_conf = file_get_contents($wp_conf_path);
        // Look for DB_COLLATE line to put our stuff below.
        $find = "#(DB_COLLATE.*)#";
        // The $1 here is the match above (Just like HTML Post Processing!)
        // The $ is escaped with a \ so PHP doesn't think it's a normal PHP variable.
        $repl = "\$1\ndefine( 'WP_HOME','http://supercoolsite.geocities.com');\ndefine( 'WP_SITEURL','http://supercoolsite.geocities.com');";
        // Create a new variable with the results of our search-replace.
        $wp_conf_new = preg_replace($find, $repl, $wp_conf);
        // Output the result to the wp-config.php file. :)
        file_put_contents($wp_conf_path, $wp_conf_new);
    }
}
