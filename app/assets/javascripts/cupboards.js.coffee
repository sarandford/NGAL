$ ->
	$(document).on "click","#food_add_button", ->
		dairy_product = $("#food_input").val()
		data = name: dairy_product
		$.ajax
			type: 'POST'
			url: "/cupboards"
			data: data
	$(document).on "click", "#delete_from_cupboard_button", ->
		selected = []
		$("input[name='cupboard_item']:checked").each ->
			selected.push ($(this).val())
		data = items_to_delete: selected
		if selected ==[]
			return
		else
			$.ajax 
				type: "DELETE"
				url: "cupboards/#{selected.first}"
				data: data

	$(document).on "click", "#delete_from_cupboard_and_add_to_grocery_list_button", ->
		selected = []
		$("input[name='cupboard_item']:checked").each ->
			selected.push ($(this).val())
		if selected == []
			return 
		else 
			data = items_to_add: selected
			$.ajax
				type: "POST"
				url: "grocery_lists/"
				data: data



