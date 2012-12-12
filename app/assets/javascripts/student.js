var Student = {
	init: function() {
		$(".correct_answer").hide();
		$(".question-list").on("click", 'a.answer_on_click', this.toggleAnswer);
	},
	
	toggleAnswer: function(event) {
		event.preventDefault();
		var $self = $(this);
		if ($self.text() === "Show answer?") {
			$self.siblings('.correct_answer').show()
			$self.text("Hide answer?");
		} else {
			$self.siblings('.correct_answer').hide()
			$self.text("Show answer?");
		}
	}
}

$(document).ready(function(){ Student.init(); });