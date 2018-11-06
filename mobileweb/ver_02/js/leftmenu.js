$(document).ready(function() {
	$("#menu-close").click(function(e) {
		e.preventDefault();
		$("#sidebar-wrapper").toggleClass("active");
		$("body").css("overflow", "visible");
	}).css("cursor", "pointer");

	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#sidebar-wrapper").toggleClass("active");
		$("body").css("overflow", "hidden");
	}).css("cursor", "pointer");

	$(".mini_menu, .sub-drop-menu-close").click(function() {
		/*if ($(".sub-drop-menu").css("display") == "none") {
			$(".sub-drop-menu").slideDown();
		} else {
			$(".sub-drop-menu").slideUp();
		}*/

		$(".sub-drop-menu").toggle();
	}).css("cursor", "pointer");
});