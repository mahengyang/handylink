// register event for control..
$(document).ready(function(){
    $("#nowpage").click(getCurrentPageUrl);
    $("#urlname").blur(checkInputUrl);
});

function getCurrentPageUrl(){
    chrome.tabs.query({'active': true}, function (tabs) {
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
    //alert("");
    url = $("#urlname").val();
    urlExists(url, function(exists){
        if (exists)
        {
            $("#info").text("");
        }
        else
        {
            $("#info").attr("color", "red");
            $("#info").text("url does not exist!");
        }
    });
}

function urlExists(link, callback){
    if (typeof callback !== 'function') {
       throw 'Not a valid callback';
    }   

    $.ajax({
        type: "HEAD",
        url: link,
        success: function() {
            //allback(true);
            colose.log(true);
        },
        error: function() {
            //callback(false);
            colose.log(false);
        }            
    });
}