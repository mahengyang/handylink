// register event for control..
$(document).ready(function(){
    $("#nowpage").click(getCurrentPageUrl);
    $("#urlname").blur(checkInputUrl);
    $("#addlink").click(addhandylink);

});

function getCurrentPageUrl(){
    chrome.tabs.query({'active': true, "currentWindow": true}, function (tabs) {
        url = "";
        try
        {
            url = tabs[0].url;
            url = url.split('/')[2];
        }
        catch(err)
        {
            url = "";
        }
        console.log(url);

        $("#urlname").val(url);
    });
}

function checkInputUrl()
{
    url = $("#urlname").val();

    urlExists(url, function(exists){
        if (exists)
        {
            $("#hintinfo").text("Ps:if more than one, please use a semicolon.");
        }
        else
        {
            $("#hintinfo").attr("color", "red");
            $("#hintinfo").text("url does not exist!");
        }
    });
}

function urlExists(link, callback){
    if (typeof callback !== 'function') {
       throw 'Not a valid callback';
    }   

    if (link){
        /*
        req = new XMLHttpRequest();
        // 这个link要包含协议名(例如：http://www.baidu.com/)
        // 如果不包含，会被解读为访问自己的资源文件。
        req.open("HEAD", link);

        req.onreadystatechange = function(){
            // If the request completed, close the extension popup
            if (req.readyState == this.DONE) {
                callback(req.status == 200);
            }
        };
        req.send();
        */

        $.ajax({
            type: "HEAD",
            url: link,
            success: function() {
                allback(true);
                //console.log(true);
            },
            error: function() {
                callback(false);
                //console.log(false);
            }
        })
    }
}

function addhandylink(){
    req = new XMLHttpRequest();
    req.open("POST", "http://angryang.com/cgi/ruby/dbconn.rb", true);

    params = "url=" + $("#urlname").val()
             + "&mac=angryang" // todo get mac address 
             + "&title=testname"; // todo get website title.

    console.log(params);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    req.onreadystatechange = function(){ 
        // If the request completed, close the extension popup
        if (req.readyState == 4){
            if (req.status == 200) {
                //$("#mailaddr").val("OK");
            }
        }            
    };
    req.send(params);
    //$("#email").val("OK");

    return false;
}