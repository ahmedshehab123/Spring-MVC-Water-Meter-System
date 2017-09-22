/**
 * 
 */

// This example adds a search box to a map, using the Google Place Autocomplete
      // feature. People can enter geographical searches. The search box will return a
      // pick list containing a mix of places and predicted search terms.

      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      function initAutocomplete() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -6.121435, lng: 106.774124},
          zoom: 5,
          mapTypeId: 'roadmap'
        });

        // Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
          
          
          
          
        });  
        
        
        
        addMarkers(map);
      }
      
      
      
      function addMarkers(map){
    	  $("#datatable tr").not(":first").each(
    			  function(){
    				  
    				  var cols = $(this).find("td");
    				  var longitude= cols[0].innerText;
    				  var lattitude=cols[1].innerText;
    				  var city=cols[2].innerText;
    				  var district=cols[3].innerText;
    				  var village=cols[4].innerText;
    				  var roadNumber=cols[5].innerText;
    				  var locationSerialNumber=cols[6].innerText;
    				  var model=cols[7].innerText;
    				  var meterSerialNumber=cols[8].innerText;
    				  var customerID=cols[9].innerText;
    				  var cutomerName=cols[10].innerText;
    				  var intialCounter=cols[11].innerText;
    				  var hardwareID=cols[12].innerText;
    				  
    				  
    				  var myloc = new google.maps.LatLng(lattitude,longitude);
    			      var marker = new google.maps.Marker({position: myloc});

    			        marker.setMap(map);
    			        var infowindow = new google.maps.InfoWindow({
    			            content: "City : " + city + "<br>" + "District : " + district +"<br>" + "Village : " + village +"<br>" + "Road number : " + roadNumber
    			            +"<br>" + "Location serial no : " + locationSerialNumber +"<br>" + "Model : " + model +"<br>" + "Meter serial no : " + meterSerialNumber +"<br>" + "Customer ID : " + customerID
    			            +"<br>" + "Customer Id : " + customerID +"<br>" + "Customer name : " + cutomerName +"<br>"+ "Intial Counter : " + intialCounter + "<br>"+"Hardware ID  : " + hardwareID
    			          });
    			          //infowindow.open(map,marker);
    			        marker.addListener('click', function() {
    			        	infowindow.open(map,marker);
    			        	
    			        });

    				  
    			  }
    	  );
    	  
      }
      
      
