<% @grocery_list_items.each do |item| %>
$("#grocery_list_area").append("<input type= 'checkbox' data-id: '<%=item.id%>'> <%= item.food.name %> </input>")
<% end %>
