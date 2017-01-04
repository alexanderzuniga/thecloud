<?php
/**
 * This file adds the Home Page to the Theme.
 *
 * @author Bites to Brand
 * @package Generate
 * @subpackage Customizations
 */
 
add_action( 'genesis_meta', 'btb_home_genesis_meta' );
/**
 * Add widget support for homepage. If no widgets active, display the default loop.
 *
 */
function btb_home_genesis_meta() {

	if ( is_active_sidebar( 'home-slider' ) || is_active_sidebar( 'home-top' ) || is_active_sidebar( 'home-triple-bottom' ) || is_active_sidebar( 'home-double-bottom' ) ) {

		remove_action( 'genesis_loop', 'genesis_do_loop' );
		add_action( 'genesis_loop', 'btb_home_sections' );
		add_filter( 'genesis_pre_get_option_site_layout', '__genesis_return_content_sidebar' );
		add_filter( 'body_class', 'btb_add_home_body_class' );

	}
	
}

function btb_home_sections() {

	genesis_widget_area( 'home-slider', array(
		'before' => '<div class="home-slider widget-area">',
		'after'  => '</div>',
	) );

	genesis_widget_area( 'home-top', array(
		'before' => '<div class="home-top widget-area">',
		'after'  => '</div>',
	) );
	
	if ( is_active_sidebar( 'home-triple-bottom' ) || is_active_sidebar( 'home-double-bottom' ) ) {

		echo '<div class="home-bottom">';

		genesis_widget_area( 'home-triple-bottom', array(
			'before' => '<div class="home-triple-bottom widget-area">',
			'after'  => '</div>',
		) );
		
		genesis_widget_area( 'home-double-bottom', array(
			'before' => '<div class="home-double-bottom widget-area">',
			'after'  => '</div>',
		) );

		echo '</div>';
	
	}
	
}

//* Add body class to home page		
function btb_add_home_body_class( $classes ) {

	$classes[] = 'btb-home';
	return $classes;
	
}

genesis();