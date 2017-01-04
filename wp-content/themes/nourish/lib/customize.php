<?php
/**
 * Customizer additions.
 *
 * @package      Bites
 * @link         http://bitestobrand.com/
 * @author       Bites to Brand
 * @copyright    Copyright (c) 2015, Bites To Brand
 * @license      GPL-2.0+
 */
 
/**
 * Get default primary color for Customizer.
 *
 * Abstracted here since at least two functions use it.
 *
 * @since 1.0.0
 *
 * @return string Hex color code for primary color.
 */
function btb_customizer_get_default_primary_color() {
	return '#737373';
}

/**
 * Get default accent color for Customizer.
 *
 * Abstracted here since at least two functions use it.
 *
 * @since 1.0.0
 *
 * @return string Hex color code for accent color.
 */
function btb_customizer_get_default_accent_color() {
	return '#dfa5ab';
}
 
add_action( 'customize_register', 'btb_customizer_register' );
/**
 * Register settings and controls with the Customizer.
 *
 * @since 1.0.0
 * 
 * @param WP_Customize_Manager $wp_customize Customizer object.
 */
function btb_customizer_register() {

	global $wp_customize;
	
	$wp_customize->add_setting(
		'btb_primary_color',
		array(
			'default' => btb_customizer_get_default_primary_color(),
		)
	);

	$wp_customize->add_control(
		new WP_Customize_Color_Control(
			$wp_customize,
			'btb_primary_color',
			array(
				'description' => __( 'Change the default primary color for your post title, buttons, and links.', 'btb' ),
			    'label'    => __( 'Primary Color', 'btb' ),
			    'section'  => 'colors',
			    'settings' => 'btb_primary_color',
			)
		)
	);
	
	$wp_customize->add_setting(
		'btb_accent_color',
		array(
			'default' => btb_customizer_get_default_accent_color(),
		)
	);

	$wp_customize->add_control(
		new WP_Customize_Color_Control(
			$wp_customize,
			'btb_accent_color',
			array(
				'description' => __( 'Change the default accent color for your links.', 'btb' ),
			    'label'    => __( 'Accent Color', 'btb' ),
			    'section'  => 'colors',
			    'settings' => 'btb_accent_color',
			)
		)
	);

}

add_action( 'wp_enqueue_scripts', 'btb_css' );
/**
* Checks the settings for the accent color, highlight color, and header
* If any of these value are set the appropriate CSS is output
*
* @since 1.0.0
*/
function btb_css() {

	$handle  = defined( 'CHILD_THEME_NAME' ) && CHILD_THEME_NAME ? sanitize_title_with_dashes( CHILD_THEME_NAME ) : 'child-theme';

	$color = get_theme_mod( 'btb_primary_color', btb_customizer_get_default_primary_color() );
	$color_accent = get_theme_mod( 'btb_accent_color', btb_customizer_get_default_accent_color() );

	$css = '';
		
	$css .= ( btb_customizer_get_default_primary_color() !== $color ) ? sprintf( '
		
		.title-area,
		button, input[type="button"], 
		input[type="reset"], 
		input[type="submit"], 
		.button, 
		.entry-content .button,
		.enews-widget input[type="submit"],
		.content .entry-header .entry-meta .entry-categories a:hover {
			background: %1$s;
		}
		
		.title-area {
			outline-color: %1$s;
		}
		
		a:hover,
		.entry-title a:hover, 
		.footer-widgets .entry-title a:hover {
			color: %1$s;
		}
		
		.woocommerce .woocommerce-message,
		.woocommerce .woocommerce-info {
			border-top-color: %1$s !important;
		}
		
		.woocommerce .woocommerce-message::before,
		.woocommerce .woocommerce-info::before,
		.woocommerce div.product p.price,
		.woocommerce div.product span.price,
		.woocommerce ul.products li.product .price,
		.woocommerce form .form-row .required {
			color: %1$s !important;
		}
		
		.woocommerce #respond input#submit, 
		.woocommerce a.button, 
		.woocommerce button.button, 
		.woocommerce input.button,
		.woocommerce span.onsale,
		.easyrecipe .ui-button-text-icon-primary .ui-button-text, 
		.easyrecipe .ui-button-text-icons .ui-button-text {
			background-color: %1$s !important;
		}
		
		', $color ) : '';

	$css .= ( btb_customizer_get_default_accent_color() !== $color_accent ) ? sprintf( '

		a,
		.genesis-nav-menu li:hover,
		.genesis-nav-menu a:hover,
		.site-header .genesis-nav-menu a:hover,
		.entry-title a,
		.sidebar .widget-title a {
			color: %1$s;
		}
		
		', $color_accent ) : '';
		
		
	if ( btb_customizer_get_default_primary_color() !== $color_accent || btb_customizer_get_default_accent_color() !== $color_highlight ) {
		$css .= '
		}
		';
	}

	if( $css ){
		wp_add_inline_style( $handle, $css );
	}

}
