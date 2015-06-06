$("input[name='grocery_list_item']:checked").each ->
	$(this).parent('div').remove()
