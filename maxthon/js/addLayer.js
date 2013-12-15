console.log('this is from addLayer.js');

var url = "http://angryang.com/cgi-bin/ruby/user_info.rb?handle=get";
border = $("<div class='header'></div>").css({
    "height": "10px",
    "background-color": "red"
});
// get user info from server
$.get(url,function(data,status){
	console.log("response from server")

	ul = $("<ul></ul>").css({
	"padding": "0px 0px 0px 0px",
    "margin-top": "10px",
    "margin-bottom": "5px",
    "margin-left": "0px",
    "margin-right": "0px"
	});
	for(i in data){
		console.log(data[i].title+" "+data[i].url)
		
		link = $("<a></a>").text(data[i].title).attr("href",data[i].url).css({
			"font-size": "20px",
			"color": "white",
			"text-decoration":"none",
			"outline":"none"
		});
		$("<li></li>").prepend(link).prependTo(ul).css({
			"padding": "0px 0px 0px 0px",
			"margin": "0px 0px 0px 0px",
			"list-style-type": "none",
			"vertical-align": "middle",
    		"padding-bottom": "5px",
			"text-align": "center"
		});
	}
	$("<div class='linkweb'><div class='header' style='height: 10px;background-color: red'></div></div>")
		.prepend(ul)
		.prepend(border)
		.prependTo(document.body)
		.css({ 
			"z-index":"19999",
			"position":"fixed",
			"right":"0px",
			"top":"200px",
    		"width":" 80px",
    		"font-family":" 微软雅黑",
    		"color":" #D32525",
    		"opacity":" 0.6",
    		"font-size":" 20px",
    		"background-color":" black"
		});
  });