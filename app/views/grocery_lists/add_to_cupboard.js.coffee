<% @cupboards.each do |cupboard| %>
$(".food_list").append("<div class='cupboard_items'><input name= 'cupboard_item' type= 'checkbox' value: '<%=cupboard.id%>'> <%= cupboard.food.name %> </input></div>")
<% end %>
$("input[name='grocery_list_item']:checked").each ->
	$(this).parent('div').remove()
