var Teacher = {
	init: function() {
		$('#student_radio, #teacher_radio').on('click', this.toggleTeacherDropdown);
		this.hideTeacherDefault();
	},
	toggleTeacherDropdown: function() {
		var $self = $(this);
		if ($('#teacher_radio').is (':checked')) {
			// debugger
			$('#toggle_teacher_search').hide();
		} else {
			$('#toggle_teacher_search').show();
		}
	},

	hideTeacherDefault: function() {
		if( $('#teacher_radio').is (':checked')) {
			$('#toggle_teacher_search').hide();
		}
	}
};

$(document).ready(function(){ Teacher.init(); });