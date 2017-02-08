<?php
# Database Configuration
define( 'DB_NAME', 'site_samuzu' );
define( 'DB_USER', 'root' );
define( 'DB_PASSWORD', 'root' );
define( 'DB_HOST', '127.0.0.1' );
define( 'DB_HOST_SLAVE', '127.0.0.1' );
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', 'utf8_unicode_ci');
define('WP_DEBUG', true);
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', false );
$table_prefix = 'wp_';

# Security Salts, Keys, Etc
define('AUTH_KEY',         '=K.,rL~{Ft4zcwx$@ji}7|PbSV+6M)gRZ*jXLAU~YCA`DF?/KQRx%P>6fBC7v+-&');
define('SECURE_AUTH_KEY',  '(arOBLSmr&&Vl,LN* _6!3=BT{P7>V% 3KlJLZi0@lo0h;j*FM+8#9];~v+N,tO-');
define('LOGGED_IN_KEY',    'b|U[KJBwdnn[AxhK)Fv)B4OmB[k7Qc^[QK}T/k!^ZLlrL--6#3z(:Ni@1^(r.r~u');
define('NONCE_KEY',        'j7fd:eUZpmOxh5~i.e:<*N}02GZ&I[7&O1Sq{:~W|V/1A6uo=44`*?Sl%ZORboez');
define('AUTH_SALT',        ':PWIY]`oi`-&v$Qvu;WGP]Lsp+iSX3`>jTOu>bj#)YcZX-6j:J7Jz!i!E(>UlN>#');
define('SECURE_AUTH_SALT', 'yLdv?V*kN{p=Uj&d9=Bz;f>nV_U|A)m34w`uwe?k,4+~s)PN8-Dy<6,cF(3j2Zv5');
define('LOGGED_IN_SALT',   'ZxKJb^J|knDA?Rp2 ]U9p(cvp.}r7HcxZFJ|BvXk6Lb,1O~zE>-y _z6t^/>|}UY');
define('NONCE_SALT',       'J#*>/Jm69~-ZzPz2:[B`! Q<P?){hq]h+->pO}Dkh Qo)CxdHTIkC=Uo19Ol9%Vg');


# Localized Language Stuff

define( 'WP_CACHE', TRUE );

define( 'WP_AUTO_UPDATE_CORE', false );

define( 'PWP_NAME', 'thecloud' );

define( 'FS_METHOD', 'direct' );

define( 'FS_CHMOD_DIR', 0775 );

define( 'FS_CHMOD_FILE', 0664 );

define( 'PWP_ROOT_DIR', '/nas/wp' );

define( 'WPE_APIKEY', 'f22a493e8c96241d962bffe12b955f9fe6334cfa' );

define( 'WPE_FOOTER_HTML', "" );

define( 'WPE_CLUSTER_ID', '100740' );

define( 'WPE_CLUSTER_TYPE', 'pod' );

define( 'WPE_ISP', true );

define( 'WPE_BPOD', false );

define( 'WPE_RO_FILESYSTEM', false );

define( 'WPE_LARGEFS_BUCKET', 'largefs.wpengine' );

define( 'WPE_SFTP_PORT', 2222 );

define( 'WPE_LBMASTER_IP', '' );

define( 'WPE_CDN_DISABLE_ALLOWED', false );

define( 'DISALLOW_FILE_MODS', FALSE );

define( 'DISALLOW_FILE_EDIT', FALSE );

define( 'DISABLE_WP_CRON', true );

define( 'WPE_FORCE_SSL_LOGIN', false );

define( 'FORCE_SSL_LOGIN', false );

/*SSLSTART*/ if ( isset($_SERVER['HTTP_X_WPE_SSL']) && $_SERVER['HTTP_X_WPE_SSL'] ) $_SERVER['HTTPS'] = 'on'; /*SSLEND*/

define( 'WPE_EXTERNAL_URL', false );

define( 'WP_POST_REVISIONS', 3 );

define( 'WPE_WHITELABEL', 'wpengine' );

define( 'WP_TURN_OFF_ADMIN_BAR', false );

define( 'WPE_BETA_TESTER', false );

umask(0002);

$wpe_cdn_uris=array ( );

$wpe_no_cdn_uris=array ( );

$wpe_content_regexs=array ( );

$wpe_all_domains=array ( 0 => 'thecloud.com', 1 => 'thecloud.gov', 2 => 'thecloud.org', 3 => 'thecloud.wpengine.com', );

$wpe_varnish_servers=array ( 0 => 'pod-100740', );

$wpe_special_ips=array ( 0 => '104.199.121.102', );

$wpe_ec_servers=array ( );

$wpe_largefs=array ( );

$wpe_netdna_domains=array ( );

$wpe_netdna_domains_secure=array ( );

$wpe_netdna_push_domains=array ( );

$wpe_domain_mappings=array ( );

$memcached_servers=array ( );

define( 'WP_SITEURL', 'http://thecloud.wpengine.com' );

define( 'WP_HOME', 'http://thecloud.wpengine.com' );
define('WPLANG','');

# WP Engine ID


# WP Engine Settings






# That's It. Pencils down
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');

$_wpe_preamble_path = null; if(false){}
