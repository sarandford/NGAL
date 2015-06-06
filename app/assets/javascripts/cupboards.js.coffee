$ ->
	$(document).ready ->
		food = new Bloodhound({datumTokenizer: Bloodhound.tokenizers.obj.whitespace('food'),queryTokenizer: Bloodhound.tokenizers.whitespace, local: [{ dairy: 'milk' },
			{ food: 'eggs' },
			{ food: 'cheese' },
			{ food: 'yogurt'}]})
		food.initialize()
		$('.typeahead#food_input').typeahead(null, {
			displayKey: 'food',
			source: food.ttAdapter()})

	$(document).on "click", "#cupboard_button", ->
		$("#cupboard_display_area").toggle()

	$(document).on "click", "#recipe_button", ->
		$("#recipe_display_area").toggle()

	$(document).on "click", "#grocery_list_button", ->
		$("#grocery_list_display_area").toggle()

	$(document).on "click","#food_add_button", ->
		dairy_product = $("#food_input").val()
		data = name: dairy_product
		$.ajax
			type: 'POST'
			url: "/cupboards"
			data: data
	$(document).on "click", "#delete_from_cupboard_button", ->
		console.log "HEREREREERE"
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



