<?php

require __DIR__ .'/../abstractBreak.php';

class wpeBreak extends abstractBreak {
    function __construct(){
        // Fill these things in
        $this->author = "WP Engine";
        $this->cdesc = "Put a description of what the customer might say here.";
        $this->repl  = "Put some replication steps here.";
        $this->hint  = "You're break is so badass that someone might not be able to figure it out! Put a hint here.";
    }

    function breakSite() {
     //BEGIN CONFIG INJECTION
        $path = get_home_path();
        //set path to the config file
        $wp_conf_path = $path . "wp-config.php";

        // Get the contents of that file.
        $wp_conf = file_get_contents($wp_conf_path);

        // Look for DB_COLLATE line to put our stuff below.
        $find = "#(DB_COLLATE.*)#";

        // The $1 here is the match above (Just like HTML Post Processing!)

        // The $ is escaped with a \ so PHP doesn't think it's a normal PHP variable.
        $repl = "\$1\ndefine( 'WP_DEBUG_LOG', true );\ndefine( 'WP_DEBUG_DISPLAY', true );";

        // Create a new variable with the results of our search-replace.
        $wp_conf_new = preg_replace($find, $repl, $wp_conf);

        // Output the result to the wp-config.php file. :)
        file_put_contents($wp_conf_path, $wp_conf_new);

      //BEGIN LOG INJECTION

        $elog = fopen( $path . "wp-content/debug.log", "w") or die ("UNABLE TO OPEN FILE! :( ");

        $message = "PAY YOUR DEVELOPER YOU CHEAP BASTARD!\n";

        fwrite($elog, $message);

        fclose($elog);

    }
}
