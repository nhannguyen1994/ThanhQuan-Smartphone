


$(document).ready(function () {
	var date = new Date();
	var toDay = date.getDate();
	var toMonth = date.getMonth();
	var toYear = date.getFullYear();
	var monthsOfYear = getDaysOfMonth();


	for(var i = 1; i <= monthsOfYear; i++) {
		if (toDay == i) {
			$('#memberDayOfBirth').append('<option selected="selected"> '+ i + ' </option>');
		} else {
			$('#memberDayOfBirth').append('<option>' + i + '</option>');
		}
	}

	for (var i = 0; i < 12; i++) {
		if ((toMonth+1) == i+1) {
			$('#memberMonthOfBirth').append('<option selected="selected"> ' + (i+1) + ' </option>');
		} else {
			$('#memberMonthOfBirth').append('<option>' + (i+1) + '</option>');
		}
	}



	for (var i = 1900; i <= toYear; i++) {
		if (toYear == i) {
			$('#memberYearOfBirth').append('<option selected="selected"> ' + toYear + ' </option>');
		} else {
			$('#memberYearOfBirth').append('<option> ' + i + ' </option>');
		}
	}

	function getDaysOfMonth() {
		return new Date(date.getFullYear(),date.getMonth() + 1,0).getDate();
	}

	// setTimeOut(function () {
	// 	$('.list-group-default').trigger('click');
	// 	alert('clicked');
	// },10);
	


	$('.user-info-default').show();

	$('.onclick').on('click',function () {
		var thisTab = $(this).attr('showSmallTabs');
		$('.sm-tab').hide();
		$('.' + thisTab).slideDown();
	});


	$('.customize-button').on('click',function () {
		$('.user-info-default').slideToggle();
		$('.user-info-customize').slideToggle();
	});

	$('.customize-cancel-button').on('click',function () {
		$('.user-info-default').slideToggle();
		$('.user-info-customize').slideToggle();
	});

	$('.changePasswordButton').on('click',function () {
		$('.security').slideToggle();
		$('.password-customize').slideToggle();
	});

	$('.cancelChangePassBtn').on('click',function () {
		$('.security').slideToggle();
		$('.password-customize').slideToggle();
	});


});

