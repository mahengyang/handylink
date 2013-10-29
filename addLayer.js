console.log('this is from addLayer.js');
$('#hplogo').children().text("enyo");
var newdiv = "<div class='linkweb'></div>";
$(document.body).append(newdiv)
$('.linkweb').append("<a href='http://www.jd.com'>京东</a><p />")
$('.linkweb').append("<a href='http://www.taobao.com'>淘宝</a><p />")
$('.linkweb').append("<a href='http://www.ifanr.com'>爱范儿</a><p />")
$('.linkweb').append("<a href='http://www.zhihu.com'>知乎</a><p />")
$('.linkweb').append("<a href='http://www.appinn.com'>小众软件</a><p />")