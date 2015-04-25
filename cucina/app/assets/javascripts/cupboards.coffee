$ ->
	$(document).on "click", "cupboard_button", ->
		$.ajax
			type: 'GET'
			url: '/cupboards'



