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

  var projects = responseData['projects'];

  setMarkers(map, projects);
}

function setMarkers(map, projects) {
  var image = {
    url: '../assets/hh_mapmarker_small.png',
    size: new google.maps.Size(20, 20),
    origin: new google.maps.Point(0,0),
    anchor: new google.maps.Point(10, 10)
  };

  for (var i = 0; i < projects.length; i++) {
    var myLatLng

    var myLatLng = new google.maps.LatLng(projects[i].lat, projects[i].lng)

    console.log(myLatLng);

    var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: image
    });
  }
}
