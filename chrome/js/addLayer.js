console.log('this is from addLayer.js');

var url = "http://angryang.com/cgi-bin/ruby/user_info.rb?handle=get";
// get user info from server
$.get(url,function(data,status){
	console.log("response from server")

	ul = $("<ul></ul>")
	for(i in data){
		console.log("-----title--"+data[i].title)
		console.log("-----url--"+data[i].url)
		
		link = $("<a></a>").text(data[i].title).attr("href",data[i].url)
		$("<li></li>").prepend(link).prependTo(ul)
	}
	$("<div class='linkweb'></div>").prepend(ul).prependTo(document.body);
  });