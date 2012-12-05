var Student = {
	init: function() {
		$(".correct_answer").hide();
		$(".answer_on_click").on("click", function(event) { // TODO: event/this/toggle
			event.preventDefault();
			this.toggleAnswer();
			});
	},
	toggleAnswer: function() {
		if ($(".answer_on_click").text() === "Show answer?") {
			$(".correct_answer").show();
			$(".answer_on_click").text("Hide answer?");
		} else {
			$(".correct_answer").hide();
			$(".answer_on_click").text("Show answer?");
		}
	}
}

$(document).ready(function(){ Student.init(); });