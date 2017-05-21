
$(document).ready(function () {
	$('#show-recover').click(function (e) {
		e.preventDefault();
		$('#login-modal').modal('hide').on('hidden.bs.modal',function (e) {
			$('#recover-modal').modal('show');
			$(this).off('hidden.bs.modal');
		});
	});
	$('#show-register').click(function (e) {
		e.preventDefault();
		$('#login-modal').modal('hide').on('hidden.bs.modal',function (e) {
			$('#register-modal').modal('show');
			$(this).off('hidden.bs.modal');
		});
	});

});