function initialize() {
    var mapOptions = {
        zoom: 2,
        center: new google.maps.LatLng(0, 0)
    }
    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    setMarkers(map, hhLocations);
}

// Locations to plot
var hhLocations = [
    ['CorsiCat', 42.142527, 9.115410, 4],
    ['Socotra', 12.492308, 53.823677, 5],
    ['Mongol Rally -Team TLP', 47.207093, 95.660595, 3],
    ['Talisker Whiskey Atlantic Challenge', 29.322933, -40.854755, 2],
];

function setMarkers(map, locations) {
    // Marker sizes are expressed as a Size of X,Y
    var image = {
        url: '../assets/hh_mapmarker_small.png',
        // This marker is 20 pixels wide by 20 pixels tall.
        size: new google.maps.Size(20, 20),
        // The origin for this image is 0,0.
        origin: new google.maps.Point(0,0),
        // The anchor for this image is the base of the icon
        anchor: new google.maps.Point(10, 10)
    };

    // Shapes define the click-able region of the icon.
    var shape = {
        coords: [1, 1, 1, 20, 18, 20, 18 , 1],
        type: 'poly'
    };

    // Plot markers from list
    for (var i = 0; i < locations.length; i++) {
        var adventure = locations[i];
        var myLatLng = new google.maps.LatLng(adventure[1], adventure[2]);
        var infowindow = new google.maps.InfoWindow({
            content:adventure[0]
        });
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            icon: image,
            shape: shape,
            title: adventure[0],
            zIndex: adventure[3]
        });
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map,marker);
        });
    }
}

google.maps.event.addDomListener(window, 'load', initialize);
