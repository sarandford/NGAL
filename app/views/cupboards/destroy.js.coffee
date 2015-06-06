$("input[name='cupboard_item']:checked").each ->
	$(this).parent('div').remove()
