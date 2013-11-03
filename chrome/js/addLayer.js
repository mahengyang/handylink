console.log('this is from addLayer.js');
$('#hplogo').children().text("enyo");

var user_info = "http://angryang.com/cgi-bin/ruby/user_info.rb";
// get user info from server
$.get(user_info,function(data,status){
	console.log("response from server "+ data)
	user_info = data.enyo

	ul = $("<ul></ul>")
	for(i in user_info){
		console.log(user_info[i])
		
		link = $("<a></a>").text(user_info[i].name).attr("href",user_info[i].url)
		$("<li></li>").prepend(link).prependTo(ul)
	}
	$("<div class='linkweb'></div>").prepend(ul).prependTo(document.body);
  });