<?php
# Database Configuration
define( 'DB_NAME', 'wp_shurkus' );
define( 'DB_USER', 'shurkus' );
define( 'DB_PASSWORD', 'GSD0v9QaPR47p92K' );
define( 'DB_HOST', '127.0.0.1' );
define( 'DB_HOST_SLAVE', '127.0.0.1' );
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', 'utf8_unicode_ci');
$table_prefix = 'wp_';

# Security Salts, Keys, Etc
define('AUTH_KEY',         'LqXu+.>oH+9?y{2<<dOOye]XxDjo!li^)YW/F8>5(|gLaqPG|`D.Oxq$8{Ip+l^,');
define('SECURE_AUTH_KEY',  '%bI{j*Q{.aq8-k-@aztTmKO`@*We+Z{`|!{4YI&yJR$v01@Gxbvpn[`Zw>+krYiV');
define('LOGGED_IN_KEY',    'o4DBtuzK(pjdE;B^(W9OuB<o>!~sB0nr)~O .gu(FF(L*=Mk[nI `2w-TZe[j0)9');
define('NONCE_KEY',        '{Y;RVZy]_onD!Z3-${MQ-+J)<bGKH)_&yhtqS=$C--tBWAlu3K-Smq2:7=U8r-E+');
define('AUTH_SALT',        'LwGs`CZZy/ZWUx<{(zy8AVA/l)(D~X_0Z1X",cE(XEy.l[u}mMjo)+54_"ZDO6Do');
define('SECURE_AUTH_SALT', '*rq8lxkqkR9j9GD$c;B$oAbN?uET86>4t08_Q?ctu0qZPyQE3CEM|QvTkd,cwJpj');
define('LOGGED_IN_SALT',   '8e4?y/?CIOX;z%^p3si{7[C5^7.v7iX~l.t,EShsRp[zI07>1tEEI@C$zq2zQ~w+');
define('NONCE_SALT',       'jiq%b03k{0|7VoJ1Ws"VKa*7 -g{?j{WF4;( W$S.k`E45is}O32WiusLX.7_Eb4');


# Localized Language Stuff

define( 'WP_CACHE', TRUE );

define( 'WP_AUTO_UPDATE_CORE', false );

define( 'PWP_NAME', 'shurkus' );

define( 'FS_METHOD', 'direct' );

define( 'FS_CHMOD_DIR', 0775 );

define( 'FS_CHMOD_FILE', 0664 );

define( 'PWP_ROOT_DIR', '/nas/wp' );

define( 'WPE_APIKEY', '78753cc92f93bd32fefa7b5680fe330505160dfd' );

define( 'WPE_FOOTER_HTML', "" );

define( 'WPE_CLUSTER_ID', '40098' );

define( 'WPE_CLUSTER_TYPE', 'pod' );

define( 'WPE_ISP', true );

define( 'WPE_BPOD', false );

define( 'WPE_RO_FILESYSTEM', false );

define( 'WPE_LARGEFS_BUCKET', 'largefs.wpengine' );

define( 'WPE_LBMASTER_IP', '45.56.115.11' );

define( 'WPE_CDN_DISABLE_ALLOWED', false );

define( 'DISALLOW_FILE_EDIT', FALSE );

define( 'DISALLOW_FILE_MODS', FALSE );

define( 'DISABLE_WP_CRON', false );

define( 'WPE_FORCE_SSL_LOGIN', false );

define( 'FORCE_SSL_LOGIN', false );

/*SSLSTART*/ if ( isset($_SERVER['HTTP_X_WPE_SSL']) && $_SERVER['HTTP_X_WPE_SSL'] ) $_SERVER['HTTPS'] = 'on'; /*SSLEND*/

define( 'WPE_EXTERNAL_URL', false );

define( 'WP_POST_REVISIONS', FALSE );

define( 'WPE_WHITELABEL', 'wpengine' );

define( 'WP_TURN_OFF_ADMIN_BAR', false );

define( 'WPE_BETA_TESTER', false );

#define('WP_DEBUG', true);

#define('WP_DEBUG_LOG', true);

umask(0002);

$wpe_cdn_uris=array ( );

$wpe_no_cdn_uris=array ( );

$wpe_content_regexs=array ( );

$wpe_all_domains=array ( 0 => 'shurkus.com', 1 => 'shurkus.wpengine.com', 2 => 'www.shurkus.com', );

$wpe_varnish_servers=array ( 0 => 'pod-40098', );

$wpe_special_ips=array ( 0 => '45.56.115.11', );

$wpe_ec_servers=array ( );

$wpe_largefs=array ( );

$wpe_netdna_domains=array ( );

$wpe_netdna_domains_secure=array ( );

$wpe_netdna_push_domains=array ( );

$wpe_domain_mappings=array ( );

$memcached_servers=array ( 'default' =>  array ( 0 => 'unix:///tmp/memcached.sock', ), );

define( 'WPE_SFTP_PORT', 2222 );
define('WPLANG','');



# WP Engine ID


define('PWP_DOMAIN_CONFIG', 'www.shurkus.com' );

# WP Engine Settings


define( 'WPE_MONITOR_ADMIN_AJAX', true );



# That's It. Pencils down
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');

$_wpe_preamble_path = null; if(false){}
