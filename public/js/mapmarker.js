$(document).ready(function() {
  getLocations();
});

// Get locations
// =============
function getLocations(){
  var ajaxRequest = $.ajax({
    url: '/locations',
    method: 'GET'
  });

  ajaxRequest.done(plotLocations);

  ajaxRequest.fail(function(){
    console.log("Ajax call failed");
  });
}

function plotLocations(responseData){
  var map = new google.maps.Map(document.getElementById('map-canvas'), {
      zoom: 2,
      center: {lat: 0, lng: 0}
    });

  var locations = responseData['locations'];
  console.log(locations)

  setMarkers(map, locations);
}

function setMarkers(map, locations) {
  var image = {
    url: '../assets/hh_mapmarker_small.png',
    size: new google.maps.Size(20, 20),
    origin: new google.maps.Point(0,0),
    anchor: new google.maps.Point(10, 10)
  };

  for (var i = 0; i < locations.length; i++) {
    var myLatLng

    geoLocationUrl = "https://maps.googleapis.com/maps/api/geocode/json?address=" + locations[i] + "&key=AIzaSyAYxe_ruMNpxR7Cvxsys5RkPCyN8BNozdA"

    var geoCodeLocation = $.ajax({
      url: geoLocationUrl,
      method: 'GET'
    });

    geoCodeLocation.done(locationData);

    function locationData(responseLongLat){
      var myLatLng = responseLongLat.results[0].geometry.location
      console.log(myLatLng);
      var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: image
      });
    }
  }
}
