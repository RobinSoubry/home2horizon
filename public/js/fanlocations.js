 window.fbAsyncInit = function() {
    FB.init({
      appId      : '568867936464127',
      xfbml      : true,
      version    : 'v2.6',
      status     : true,    // check login status
      cookie     : true,    // enable cookies to allow the server to access the session
    });


    FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
    });

    getFanLocations();

  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));


function getFanLocations(){
  FB.api(
    '/568867936464127/insights/page_fans_country?access_token=EAACEdEose0cBAIYII5bB0MWv1evaFIEGtUwWiAFCcqqtgiyvxWOTuVHcxhFZAXHQpY4AiBREGNsj6E6YYjCMEOTA4f39eY6MS38kINagggCXIbj5bsgXfN7Q0nn2gOt5pDNoahTNxinwxt0ypbbLuY61BjtbECjua2gkFVAZDZD',
    'GET',
    {},
    function(response) {
        console.log(response)
    }
  );
}

