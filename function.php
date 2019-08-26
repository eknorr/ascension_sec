<!-- function.php hardening of your theme -->

<?php																	//hides the author username 
	add_action('template_redirect', 'bwp_template_redirect');
	function bwp_template_redirect() {
		if (is_author()) {
			wp_redirect( home_url() ); exit;
		}
	}
?>

<?php //the following has to be added at the bottom before the ?> 

function no_wordpress_errors(){											//error message
  return 'why oh why, didn't I take the blue pill?';
}
add_filter( 'login_errors', 'no_wordpress_errors' );
add_filter( 'wpv_filter_override_auth_errors', 'no_wordpress_errors' );

/* Hide WP version strings from scripts and styles
 * @return {string} $src
 * @filter script_loader_src
 * @filter style_loader_src
 */
function fjarrett_remove_wp_version_strings( $src ) {
 global $wp_version;
 parse_str(parse_url($src, PHP_URL_QUERY), $query);
 if ( !empty($query['ver']) && $query['ver'] === $wp_version ) {
 $src = remove_query_arg('ver', $src);
 }
 return $src;
}
add_filter( 'script_loader_src', 'fjarrett_remove_wp_version_strings' );
add_filter( 'style_loader_src', 'fjarrett_remove_wp_version_strings' );

/* Hide WP version strings from generator meta tag */
function wpmudev_remove_version() {
return '';
}
add_filter('the_generator', 'wpmudev_remove_version');