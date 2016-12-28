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
        // Make awesome breaky things happen here!
    }
}
