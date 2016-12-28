<?php
/**
 * This file adds the Category Index template to the Theme.
 *
 */
 
/*
Template Name: Category Index
*/

add_action( 'genesis_meta', 'btb_category_genesis_meta' );
/**
 * Add widget support for category index. If no widgets active, display the default loop.
 *
 */
function btb_category_genesis_meta() {

	if ( is_active_sidebar( 'category-index' )) {

		remove_action( 'genesis_loop', 'genesis_do_loop' );
		add_action( 'genesis_loop', 'btb_category_sections' );
		add_filter( 'genesis_pre_get_option_site_layout', '__genesis_return_content_sidebar' );

	}
	
}

function btb_category_sections() {

	genesis_widget_area( 'category-index', array(
		'before' => '<div class="category-index widget-area">',
		'after'  => '</div>',
	) );
	
}

genesis();