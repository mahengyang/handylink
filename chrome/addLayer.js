console.log('this is from addLayer.js');
$('#hplogo').children().text("enyo");

var user_info = "http://angryang.com/cgi-bin/ruby/user_info.rb";
$.get(user_info,function(data,status){
	console.log("response from server "+ data)

	newdiv = "<div class='linkweb'></div>";
	$(document.body).append(newdiv)
	$('.linkweb').append("<ul>")
	user_info = data.enyo
	for(i in user_info){
		console.log(user_info[i])
		$('.linkweb').append("<li><a href=\"" + user_info[i].url + "\"></a>" + user_info[i].name + "</li>")
	}

	$('.linkweb').append("</ul>")
  });