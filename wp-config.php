<?php

// Configuration common to all environments
include_once __DIR__ . '/wp-config.common.php';

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'site_samuzu');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Duxc?K^[?!B54dr31JP]AZ2u8fv1ejS0R*+6N.cwL!|So$fA<i:69aY@:s+eo@M%');
define('SECURE_AUTH_KEY',  'I5@z#@t)3c);~3e,e-,@Le}~6M7{_1V9I*<lu1P@NSX,68^Me1/JNV21m$1=:+(#');
define('LOGGED_IN_KEY',    'U7$b|}3qjC2gu|I`PeNx2M}jJo*=ZsunsY*$N.Q1ny]0=0g*kUz-^T2d>F7I@Gzj');
define('NONCE_KEY',        '2t/D_`} {e({TH)i};Bof 7UM!6M#Vj5!OoTe*oM6wjPcPuLfZtfg^lEQW@]*C|K');
define('AUTH_SALT',        'SHT(VrZ,v&amz??Yyc:5d*f:bH13BWu,gl)huQ%GR:nxk/wf$}S+sj zff:1GQfl');
define('SECURE_AUTH_SALT', '~(+Tm`;pc[GGIJ;.u%|P{.Z2Yh (S9KgAWLCNYcxOcT(x+b6`1E5>?$kTO&lu.w4');
define('LOGGED_IN_SALT',   'Ue%AD:Rp>h=tG-ZqyByb=Vb2*#bKGJ+7N!9aFt4__JxH/B{z1Es9#U}YxO$zJV[E');
define('NONCE_SALT',       'gQWwIp!|{]bXTvYRd<f*h217 b 7-,Nk&/SDYVq#M1Js&i&w1%.b?u  vw14A;np');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

define('VP_ENVIRONMENT', 'default');
/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
