$(document).ready(function(){
	$(".owl-carousel").owlCarousel({
		loop:true,
		margin:10,
		//stagePadding:20,
		responsive: {
			1: {
				items:3,
				nav:true,
			},
			768: {
				items:5,
				nav:true,
			},
			962: {
				items:10,
	
			},
			1920: {
				items:10,
			},
		}
	})
});