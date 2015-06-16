$ ->
	$(document).on "click","#grocery_list_add_button", ->
		console.log "HERE"
		item = $("#grocery_list_input").val()
		data = name: item
		$.ajax
			type: 'POST'
			url: "/grocery_lists"
			data: data

	$(document).on "click", "#add_to_cupboard_button", ->
		selected = []
		$("input[name='grocery_list_item']:checked").each ->
			selected.push ($(this).val())
		if selected == []
			return 
		else 
			data = items_to_add: selected
			$.ajax
				type: "POST"
				url: "grocery_lists/add_to_cupboard"
				data: data

	$(document).on "click", "#delete_from_grocery_list_button", ->
		selected = []
		$("input[name='grocery_list_item']:checked").each ->
			selected.push ($(this).val())
		if selected == []
			return 
		else 
			data = items_to_delete: selected
			$.ajax
				type: "DELETE"
				url: "grocery_lists/#{selected[0]}"
				data: data

