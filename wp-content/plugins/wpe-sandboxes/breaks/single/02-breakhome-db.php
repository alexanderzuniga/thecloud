<?php

require __DIR__ .'/../abstractBreak.php';

class wpeBreak extends abstractBreak {
    function __construct(){
        $this->cdesc = "My theme looks odd, the display isn't correct.";
        $this->repl = "Visit site.";
        $this->hint = "Maybe a home/siteurl setting somewhere?";
    }

    function breakSite() {
        // Set what we want the home/siteurl values to be.
        $home_url = "'http://wpengine.angelfire.com'"; //lol
        // This is the query we'll run.
        $query = "UPDATE wp_options SET option_value = $home_url WHERE option_name = 'home' OR option_name = 'siteurl'"; 
        // This next bit is a WP core global object that's super handy.
        // https://codex.wordpress.org/Class_Reference/wpdb
        global $wpdb;
        // Use a method of the $wpdb object to run our query.
        $wpdb->get_results($query); 
    }
}
