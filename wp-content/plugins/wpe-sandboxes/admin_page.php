<div id='wpe-sb-wrap'>
<h1>WPE Sandbox / Breakfix test area.</h1>

<h3>Here you can break this site to test your troubleshooting abilities.</h3>

<div id="wpe-blackout-bg"></div>
<div id='wpe-break-output'></div>

<?php

require('class-wpe-sandbox.php');

if ( $user_data_json = WpeSandbox::get_user_data_json() ){
  $user_data = json_decode($user_data_json);
  echo "<p>Hello $user_data->user_name!  You ready to break some stuff???  Click on a link below!</p>";
} else {
  if ( isset($_POST['register_user']) ){
    echo "Thanks!  Refreshing the page...";
    // do the user registration...
    WpeSandbox::register_user($_POST['user_name'], $_POST['user_email'], $_POST['notify_email']);
    // refresh the page so it sinks in properly.
    header("Refresh:0");
    exit;

  } else {
?>

<hr/>
<p>Hey!  Please fill out the form below to get started.<br/>
It does not do any validation or anything,<br/>
so double-check what you put in.</p>
<p>This is how you'll get credit for your work!</p>

<form name="register_user" method="post">
  <input type="hidden" name="register_user" value="true">
  <div style="font-family: monospaced">
  Your Name: <input type="text" name="user_name" style="width: 280px"><br/>
  Your Email: <input type="text" name="user_email" style="width: 280px"><br/>
  Your Instructor's Email: <input type="text" name="notify_email" style="width: 280px"><br/>
  </div>
  <input type="submit" value="It's Go Time!">
</form>

<?php
    exit;
  }
} // end register_user form

?>

<hr/>
<?php
    $breakathon_file = plugin_dir_path(__FILE__) . 'break-a-thon';
    $maybe_breakathon = file_exists($breakathon_file);
    if($maybe_breakathon === true) {
?>
<table><tr>
<td style="border-right: solid 1px #ddd; padding-right: 10px; vertical-align: top">

<?php echo file_get_contents($breakathon_file); ?>

</td><td>
<?php } // end break-a-thon schpeal

    // Get list of breaks and their statuses
    global $wpdb;
    global $wpe_sb_table_name;
    $query = "SELECT * from $wpe_sb_table_name";
    $result = $wpdb->get_results($query);

    // For progress bar
    $progress_max_width = 500;
    $num_breaks['total'] = count($result);
    $num_breaks['complete'] = 0;

    // Prevent more than one active break at a time
    $active_break = false;

    // Related to break highlighting
    $last_complete = -1;

    // Loop through results to check for break statuses
    foreach ($result as $r){
        if ($r->status == 'active'){
            $active_break = $r->id;
            $num_breaks['active'] += 1;
        }
        else if ($r->status == 'complete'){
            $num_breaks['complete'] += 1;
            $last_complete = $r->id;
        }
    }

    // Output progress bar
    $percent_complete = $num_breaks['complete'] / $num_breaks['total'];
    echo "<div style='margin:0;padding:0; width:".$progress_max_width
        ."px; border: solid 1px #ccc; background-color: #def; border-radius: 3px'>"
            ."<div style='margin:0;padding:0;width:"
            .($percent_complete * $progress_max_width)
            ."px; background-color:#09f; border-radius: 3px'>"
            ."&nbsp;</div>\n"
        ."</div><br/>\n";
?>


<table>
<?php
    // Output break list, with break or done butans depending on things.
    $output = "<tr>\n";
    $x = 1; // for columnar output
    foreach ($result as $r){
        $highlight_break = "";
        if (($active_break === false && $r->id == ($last_complete+1)) || $r->status == 'active'){
            $highlight_break = "; font-weight: bold";
        }
        $output .= "<td style='text-align:right$highlight_break'>Break $r->id:</td>"
                . "\n\t<td style='text-align:left$highlight_break'>";
        if ($active_break === false){
            $output .= "<a href='javascript:void(0)' class='wpe-break' break_num='$r->id'>";
            $output .= ($r->status == 'complete') ? 'Break again?' : 'Start break';
            $output .= "</a>";
        }
        else if ($active_break == $r->id){
            $output .= "<a href='javascript:void(0)' class='wpe-break-done'"
                    . " break_num='$r->id'>Fixed!</a>";
        }
	      if ($maybe_breakathon === true && $r->id > 4) {
            $output .= "</td><td>"
                    . "&lt;- This one should be yours.";
        }
        $output .= "</td>\n";
        if ( $maybe_breakathon === true ) $break_list_columns = 1;
        else $break_list_columns = 3;
        if ($x % $break_list_columns == 0){
            $output .= "</tr><tr>\n";
        }
        $x++;
    }
    $output .= "</tr>\n";
    echo $output;
?>
</table>

<?php if($maybe_breakathon === true) { ?>
</td>
</tr></table>
<?php } ?>

<hr/>

</div>

<?php if($maybe_breakathon === true) { ?>
<b>All done?  Click here -&gt;
    <a href='javascript:void(0)' class='wpe-break-submit'>Submit to Break-A-Thon!</a>
</b>
(Only your last/most recent submission will be considered.)
<?php } ?>
