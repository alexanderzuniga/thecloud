<?php
/**
 * Plugin Name: WPE Training Sandboxes
 * Description: Break this site in specific ways to practice troubleshooting.
 * Version: 0.1
 * Author: Daniel Bennett and Natalie Rogers
 * Text Domain: wpe-sandboxes
 *
 * @package WPE Training Sandboxes
 * @author Daniel Bennett and Natalie Rogers
 */

// Ajax for admin page.
require(plugin_dir_path(__FILE__) . 'ajax.php');

global $wpdb;

// Set some possibly gross global variable things.
global $wpe_sb_table_name;
global $wpe_sb_breaks_path;
if ( is_multisite() === true ){
    $wpe_sb_table_name = $wpdb->prefix . 'wpe_mu_sandboxes';
    $wpe_sb_breaks_path = __DIR__ . "/breaks/mu/";
} else {
    $wpe_sb_table_name = $wpdb->prefix . 'wpe_sandboxes';
    $wpe_sb_breaks_path = __DIR__ . "/breaks/single/";
}

/* Runs on plugin activation */
function wpe_sandboxes_activate(){

    // Create sandbox table if it doesn't exist.
    require(plugin_dir_path(__FILE__) . 'table.php');
    global $wpe_sb_table_name;
    wpe_sb_create_table($wpe_sb_table_name);

    // @todo: Add Reset Site link(s) to index.php in case stuff is too broken.
    $prepend = "
    <div style='position:fixed;bottom:0;right:0; z-index: 50; text-align:right; padding:15px; margin:5px; background:#fff; border:solid 1px #ccc'>
    Give up? Open these links <em>in new tabs</em>:
    <u><a href='#https://overdrive.wpengine.io/utilities/refresh_site/dbennett3'>Reset Site Files</a></u>
    - <u><a href='#https://overdrive.wpengine.io/utilities/refresh_db/dbennett3'>Reset Database</a></u><br/>
    It will take awhile, and you'll need to re-install this plugin afterwards.
    </div>
    ";
    $file = get_home_path() . 'index.php';
//    $indexContents = file_get_contents($file);
//    file_put_contents($file, $prepend . $indexContents);
    /* thanks to:
     * http://stackoverflow.com/questions/3332262/how-do-i-prepend-file-to-beginning
     * http://stackoverflow.com/questions/3667466/php-fopen-returns-false-but-file-is-readable-writable
     */

}
register_activation_hook( __FILE__, 'wpe_sandboxes_activate' );


/* Add button and page in wp-admin, and add our .css and .js */
function wpe_sandboxes_register_page(){
    add_menu_page( 'WPE Sandboxes', 'WPE Sandboxes', 'manage_options',
        'wpe-sandboxes/admin_page.php', '', 'dashicons-hammer', 1 );
    wp_enqueue_style( 'wpe-sandbox-style', plugins_url('style.css', __FILE__), array(), '0.1' );

    wp_enqueue_script( 'wpe-sandbox-script', plugins_url('script.js', __FILE__), array('jquery'), '0.1' );
    wp_localize_script( 'wpe-sandbox-script', 'ajax_object',
        array( 'ajax_url' => admin_url('admin-ajax.php') )
    );
    wp_localize_script( 'wpe-sandbox-script', 'loading_gif',
        array( 'url' => plugins_url('assets/loading.gif', __FILE__) )
    );
}
add_action( 'admin_menu', 'wpe_sandboxes_register_page' );


/* @todo: Let's clean up after ourselves
 * https://codex.wordpress.org/Function_Reference/register_deactivation_hook
 * https://codex.wordpress.org/Function_Reference/register_uninstall_hook
 */
