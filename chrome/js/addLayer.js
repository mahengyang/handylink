console.log('this is from addLayer.js');

var url = "http://angryang.com/cgi-bin/ruby/user_info.rb";
// get user info from server
$.get(url,function(data,status){
	console.log("response from server "+ data)

	ul = $("<ul></ul>")
	for(i in data){
		console.log(data[i])
		
		link = $("<a></a>").text(data[i].title).attr("href",data[i].url)
		$("<li></li>").prepend(link).prependTo(ul)
	}
	$("<div class='linkweb'></div>").prepend(ul).prependTo(document.body);
  });