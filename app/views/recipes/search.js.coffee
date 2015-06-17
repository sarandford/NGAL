$(".search_results").html("<%= escape_javascript(render(partial: 'search', locals: {urls: @urls})) %>")
