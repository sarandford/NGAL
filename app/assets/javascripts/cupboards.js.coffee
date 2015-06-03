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
		console.log "HERE I AM "
		selected = []
		$("input[name='cupboard_item']:checked").each ->
			console.log $(this).val()
			selected.push $(this).val()//stores an array of the cupboard item ids
		console.log selected
		data: items_to_delete: selected
		$.ajax 
			type: "DELETE"
			url: "cupboards/#{selected.first}"
			data: data



