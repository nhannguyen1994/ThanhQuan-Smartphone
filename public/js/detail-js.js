$(document).ready(function () {
	$('.ClickEvent').on('click',function () {
		var imgSrc = $(this).attr('src');
		$('.showImageAfterOnclick').attr('src',imgSrc);
	});

	$('.onclickColor').on('click',function () {
		var productColor = $(this).attr('productColor');
		$('.mau').hide();
		$('.'+ productColor).show();
	});
}); 





