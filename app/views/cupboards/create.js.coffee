$("#food_input").val("")

$(".food_list").append("<div class='cupboard_items'><input name= 'cupboard_item' type= 'checkbox' value: '<%=@cupboard.id%>'> <%= @food.name %> </input></div>")
