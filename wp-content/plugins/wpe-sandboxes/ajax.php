<?php


function wpe_sandboxes_ajax(){

    $breaknum = $_REQUEST['break'];
    echo "<h3>Break #$breaknum Begin!</h3>\n"
        ."<div style='text-align:center'>"
        ."You just got logged out, and this site is now broken.</div>\n"
        ."<hr>\n";

    // Do the break and tell em some stuff.
    require('class-wpe-sandbox.php');
    WpeSandbox::start_break($breaknum);

    echo "\n<hr>\n<div style='text-align:center'>Now fix it up!</div>\n";

    // Log the user out
    //wp_logout();

    // Done!
    wp_die();
}
// only allow if they're logged in.
add_action( 'wp_ajax_wpe_break', 'wpe_sandboxes_ajax' );

function wpe_break_done(){

    // Check the break, return break info array.
    require('class-wpe-sandbox.php');
    $breaknum = $_REQUEST['break'];
    $break = WpeSandbox::complete_break($breaknum);

    if ($break === false){
      # TODO: Be more informative here.  Show the hint?
      $output = "<h3>Uh ohs.</h3>\n<hr/>\n<p>You dun goofed.</p>";
    } else {
        $output = "<h3>Break #$breaknum Done!</h3>\n"
                . "<div style='text-align:center'>Good job!</div>\n"
                . "<hr/>\n"
                . "<p>This break was brought to you by <em>";
        $output .= isset($break['author']) ? $break['author'] : 'WP Engine';
        $output .= ".</em></p>"
                . "\n<hr>\n<div style='text-align:center'>"
                . "<a href='javascript:location.reload()'>On to the next one!</a></div>\n";
    }
    echo $output;

    wp_die();
}
// only allow if they're logged in.
add_action( 'wp_ajax_wpe_break_done', 'wpe_break_done' );

function wpe_breakathon_submit(){

    //$breaknum = $_REQUEST['break'];
    require('class-wpe-sandbox.php');
    $shipit = WpeSandbox::email_my_break();

    if ($shipit === true){
        echo "<h3 style='text-align:center'>Your stuff has been submitted!  Yaaaay!</h3>"
            ."<p style='text-align:center'>Just refresh the page if you want to re-submit.</p>"
            ."<p style='text-align:center'>Either way, get on witcha bad self!</p>";
    } else {
        echo "<h3 style='text-align:center'>Uh ohs.</h3>"
            ."<p>There was some kinda problem... Check /var/log/mail.log ?</p>";
    }

    wp_die();
}
add_action( 'wp_ajax_wpe_breakathon_submit', 'wpe_breakathon_submit' );
