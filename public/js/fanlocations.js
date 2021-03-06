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
    '/568867936464127/insights/page_fans_country?access_token=EAACEdEose0cBADCZC9XsPsozcN5TZCryZC19eVuN5f3OhpEdmYKSqnQEBHUrZCcvUe1PRQpjj9aNldFHwIraI0UvcJLdoLT7nZAucb1TZBZAxiyV5KlRPIGR0Sr7oqtCdNKYp2f88goOtFYGZCbDlB09UPzkmWbZAqVziwfoyi9J2WgZDZD',
    'GET',
    {},
    function(response) {
      var locationData = response.data[0]['values'][0]['value']
      var locationsArray = []

      for (var country in locationData) {
        if (!locationData.hasOwnProperty(country)){
          continue;
        }
        locationsArray.push({"hc-key": country.toLowerCase(),
          "value": locationData[country]})
      }
      plotFansOnMap(locationsArray);
    }
  );

};

function plotFansOnMap(locationsArray){
    // Initiate the chart
    $('#fan-map').highcharts('Map', {

        title : {
            text : 'Fans of CorsiCat'
        },

        subtitle : {
            text : 'Source map: <a href="www.facebook.com/corsicat.360">CorsiCat Facebook Page</a>'
        },

        mapNavigation: {
            enabled: true,
            buttonOptions: {
                verticalAlign: 'bottom'
            }
        },

        colorAxis: {
            min: 0
        },

        series : [{
            data : locationsArray,
            mapData: Highcharts.maps['custom/world-eckert3'],
            joinBy: 'hc-key',
            name: 'Number of CorsiCat Fans',
            states: {
                hover: {
                    color: '#BADA55'
                }
            },
            dataLabels: {
                enabled: true,
                format: '{point.name}'
            }
        }]
    });
};
