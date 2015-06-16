<% if @add_from_cupboard %>
<% @grocery_list_items.each do |item| %>
$(".grocery_list").append("<div class= 'grocery_list_item'><input type= 'checkbox' name='grocery_list_item' value= '<%=item.id%>'> <%= item.food.name %> </input></div>")
<% end %>
$("input[name='cupboard_item']:checked").each ->
	$(this).parent('div').remove()
<% else %>
console.log "HERE I AM AGAIN"
$("#grocery_list_input").val("")
$(".grocery_list").append("<div class='grocery_list_item'><input name= 'grocery_list_item' type= 'checkbox' value= '<%=@grocery_list.id%>'> <%= @food.name %> </input></div>")
<% end %>
