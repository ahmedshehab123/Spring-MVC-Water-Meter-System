/**
 * 
 */
function updateDistrict() {
			var city = $("#addcity").val();
			
			updateDistrictFromServer(city);
		}
function updateVillage(){
	
	var district=$("#adddistrict").val();
	updateVillageFromServer(district);
	
}

function updateRoads(){
	var village=$("#addvillage").val();
	updateRoadsFromServer(village);
	
}

function updateDistrictFromServer(city) {
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("updatedistrict").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET",
			"displaydistricts?city="+city+"" , true);
	xhttp.send();
}

function updateVillageFromServer(district){
	
	
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("updatevillage").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET",
			"displayvillages?district="+district+"" , true);
	xhttp.send();
	
}
function updateRoadsFromServer(village){

	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("updateRoad").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET",
			"displayroads?village="+village+"" , true);
	xhttp.send();
	
}