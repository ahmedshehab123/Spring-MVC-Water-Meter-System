/**
 * 
 */


		 function searchCity() {
			var city = $("#city").val();
			var district = $("#district").val();
			var village = $("#village").val();
			var roadNumber = $("#roadNumber").val();
			search(city, district, village, roadNumber);
		}
		 function searchDistrict() {
			var district = $("#district").val();
			var city = $("#city").val();
			var village = $("#village").val();
			var roadNumber = $("#roadNumber").val();
			search(city, district, village, roadNumber);
		}
		function searchVillage() {
			var village = $("#village").val();
			var city = $("#city").val();
			var district = $("#district").val();
			var roadNumber = $("#roadNumber").val();
			search(city, district, village, roadNumber);
		}
		 function searchRoadNumber() {
			var roadNumber = $("#roadNumber").val();
			var city = $("#city").val();
			var district = $("#district").val();
			var village = $("#village").val();
			search(city, district, village, roadNumber);
		}
		

	
function search(city, district, village, roadNumber) {
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("devicesDiv").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET",
			"search?city=" + city + "&district=" + district
					+ "&village=" + village + "&roadNumber="
					+ roadNumber + " ", true);
	xhttp.send();
}



$(function() {
	$("#searchById").click(function(){
		var customerName= $("#customerName").val();
		var customerID=$("#customerID").val().toString();
		searchByCustomerId(customerName, customerID);
	});
	
});
function searchByCustomerId(customerName, customerID) {
	var xhttp;

	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("deviceLocation").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET",
			"searchById?customerName=" + customerName + "&customerID="+customerID+" ", true);
	xhttp.send();
}



