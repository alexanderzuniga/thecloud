<?php

require __DIR__ .'/../abstractBreak.php';

class wpeBreak extends abstractBreak {
    function __construct(){
        $this->cdesc = "My main site doesn't load... it redirects somewhere dumb.";
        $this->repl = "Visit site.";
        $this->hint = "Maybe a multisite database setting somewhere?";
    }

    function breakSite() {
        // Set what we want the blog url to be.
        $dumb_domain = "superdumbthing.angelfire.com"; //lol
        // This is the query we'll run.
        $query = "UPDATE wp_blogs SET domain = '$dumb_domain' WHERE blog_id=1";
        // This next bit is a WP core global object that's super handy.
        // https://codex.wordpress.org/Class_Reference/wpdb
        global $wpdb;
        // Use a method of the $wpdb object to run our query.
        $wpdb->get_results($query);
    }
}
