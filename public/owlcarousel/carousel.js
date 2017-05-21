$(document).ready(function(){
	$(".owl-carousel").owlCarousel({
		loop:true,
		//margin:0,
		//stagePadding:20,
		responsive: {
			1: {
				items:1,
				nav:true,
				autoplay:true,
				autoplayTimeout:60000,
			},
			768: {
				items:2,
				nav:true,
				autoplay:true,
				autoplayTimeout:60000,
			},
			962: {
				items:4,
				nav:true,
				autoplay:true,
				autoplayTimeout:60000,
			},
			1920: {
				items:4,
				nav:true,
				autoplay:true,
				autoplayTimeout:60000,
				
			},
		}
	})
});