# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$(document).on "click", "#search_button", ->
		selected = []
		$("input[name='cupboard_item_to_search']:checked").each ->
			selected.push ($(this).val())
		if selected == []
			return 
		else 
			data = items_to_search: selected
			$.ajax
				type: "GET"
				url: "recipes/search"
				data: data
