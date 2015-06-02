$("#food_input").val("")
$(".food_list").append("<input type= 'checkbox' data-id: '<%=@food.id%>'> <%= @food.name %> </input>")
