console.log "HERE"
$(".search_results").append("<%= escape_javascript(render(:partial =>'search', locals: {urls: @urls})) %>");
