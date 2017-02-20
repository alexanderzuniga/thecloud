<?php
/**
 * @package dbsize
 * @author Edmund Turbin
 * @version 1.0
 */

/*
Plugin Name: DB Size Dashboard Widget
Plugin URI: http://wordpress.org/extend/plugins/dbsize/
Description: This plugin allows you to see how much space your database is taking up in a Dashboard Widget.
Author: Edmund Turbin
Version: 1.0
Author URI: http://edmundturbin.com
*/

function calculate_data_unit($filesize) {

	// fix loop to show bytes
	$bytes = array( 'KB','KB', 'MB', 'GB', 'TB' );

	do {
		$i = 0;
		$filesize /= 1024;
		$calculate_data_unit['size'] = round( $filesize, 2); // round the filesize
		$calculate_data_unit['unit'] = $bytes[ $i ]; // set the type in bytes
		++$i;	
	} while ($filesize > 1024);

	return $calculate_data_unit; 
} 

// Calculate DB size by adding table size + index size:
function db_size(){
	
	global $wpdb;
	$dbsize = 0;
	$query = "SHOW table STATUS";
	$results = $wpdb->get_results( $query );
	foreach( $results as $row ){
		$dbsize += $row->Data_length + $row->Index_length;
	} 
	// Check the file size display type
	$dbsize = calculate_data_unit( $dbsize );
	// Display DB size results
	$dbsize_widget_display = $dbsize['size'] . " " . $dbsize['unit'];
	return $dbsize_widget_display;
}

function db_tables(){
	global $wpdb;
	$query = "SELECT TABLE_NAME `table`, CONCAT(ROUND((DATA_LENGTH + INDEX_LENGTH) / (1024 * 1024), 2), ' MB') `total` FROM information_schema.TABLES 
			  WHERE TABLE_SCHEMA = '" . DB_NAME . "' " . 
			  "ORDER BY DATA_LENGTH + INDEX_LENGTH DESC";
	$results = $wpdb->get_results( $query );
	echo "<p class='hndle'><strong>Your Database Tables</strong></p><table><thead><tr><th>Table</th><th>Size</th></tr></thead><tbody>";
	foreach( $results as $row ){
		echo "<tr><td>" . $row->table . "</td><td>" . $row->total . "</td></tr>";
	}
	echo "</tbody></table>";
}

function list_plugins(){
	$plugins = get_plugins();
	echo "<p class='hndle'><strong>Your Plugins</strong></p>";
	echo "<small>* - note that plugin is disallowed by WP Engine</small><ul>";
	foreach( $plugins as $row){
		$scanned = disallowed_plugin_scan($row['Name']);
		echo "<li>" . $scanned . "</li>";
	}
	echo "</ul>";
}

function disallowed_plugin_scan( $plugin ){
	$disallowed_plugins = [ 'Akismet', 'Uploads by Proxy' ];
	if( in_array( $plugin, $disallowed_plugins )){
		return $plugin . " *";
	}
	else {
		return $plugin;
	}
}

// Create the Dashboard widget
add_action( 'wp_dashboard_setup', 'dbsize_add_dashboard_widgets' );

function dbsize_add_dashboard_widgets($args) {
	global $wp_meta_boxes;
	wp_add_dashboard_widget( 
		'dbsize_dashboard_widget', 
		'Your Website Stats', 
		'dbsize_dashboard_widget_display'
	);
	
	// Move dashboard widget to top right
	$normal_dashboard = $wp_meta_boxes['dashboard']['normal']['core'];
	$dbsize_widget_backup = array( 'dbsize_dashboard_widget' => $normal_dashboard['dbsize_dashboard_widget'] );
 	unset( $normal_dashboard['dbsize_dashboard_widget'] );

 	// Merge the two arrays together so our widget is at the beginning
 	$sorted_dashboard = array_merge( $dbsize_widget_backup, $normal_dashboard );
 
 	// Save the sorted array back into the original metaboxes 
 	$wp_meta_boxes['dashboard']['normal']['core'] = $sorted_dashboard;
}

function dbsize_dashboard_widget_display( $vars, $args ){
	$display = db_size();
	echo "<p>" . __( 'Your database is currently ') . $display . "</p>";
	db_tables();
	list_plugins();
}

add_action( 'add_meta_boxes', 'dbsize_add_meta_box' );

function dbsize_add_meta_box(){
	add_meta_box('dbsize', 'Database Size', 'dash_widget', 'dashboard', 'side', 'high');
}

?>