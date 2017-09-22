/**
 * 
 */

function edit(id) {

	$("#" + id.toString() + "_edit").show();
	$("#" + id.toString() + "_display").hide();
}

function cancel(id) {
	$("#" + id.toString() + "_edit").hide();
	$("#" + id.toString() + "_display").show();
}

function deleteDevice(id) {
	var xhttp;

	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("devicesDiv").innerHTML = xhttp.responseText;
			updateSelectors();
		}
	};
	xhttp.open("GET", "deletedevice?siteID=" + id, true);
	xhttp.send();
}
			 function addDevice() {
				var longtude = $("#longtude").val();
				
				var latitude = $("#latitude").val();
				var city = $("#addcity").val();
				var district = $("#adddistrict").val();
				var village = $("#addvillage").val();
				var roadNumber = $("#addroadNumber").val();
				var locationSerialNumber = $("#locationSerialNumber").val();
				var model = $("#model").val();
				var meterSerialNumber = $("#meterSerialNumber").val();
				var customerID = $("#customerID").val();
				var cutomerName = $("#cutomerName").val();
				var intialCounter = parseInt($("#intialCounter").val());
				var status = $("#status").val();
				var hardwareID = $("#hardwareID").val();
				
				createDevice(longtude, latitude, city, district, village,
						roadNumber, locationSerialNumber, model,
						meterSerialNumber, customerID, cutomerName,
						intialCounter,  hardwareID);}
			 
			 
			


function createDevice(longtude, latitude, city, district, village, roadNumber,
		locationSerialNumber, model, meterSerialNumber, customerID,
		cutomerName, intialCounter,  hardwareID) {
	var xhttp;

	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("tabs-1").innerHTML = xhttp.responseText;
			search("", "", "", "0");
			
		}
	};
	xhttp.open("POST", "addDevice?longtude=" + longtude + "&latitude="
			+ latitude + "&city=" + city + "&district=" + district
			+ "&village=" + village + "&roadNumber=" + roadNumber + ""
			+ "&locationSerialNumber=" + locationSerialNumber + "&model="
			+ model + "&meterSerialNumber=" + meterSerialNumber
			+ "&customerID=" + customerID + "" + "&cutomerName=" + cutomerName
			+ "&intialCounter=" + intialCounter +"&hardwareID=" + hardwareID + "", true);
	xhttp.send();
}

function update(id) {

	var siteID = id
	var longtude = $("#longtude" + id + "").val();
	var latitude = $("#latitude" + id + "").val();
	var city = $("#city" + id + "").val();
	var district = $("#district" + id + "").val();
	var village = $("#village" + id + "").val();
	var roadNumber = $("#roadNumber" + id + "").val();
	var locationSerialNumber = $("#locationSerialNumber" + id + "").val();
	var model = $("#model" + id + "").val();
	var meterSerialNumber = $("#meterSerialNumber" + id + "").val();
	var customerID = $("#customerID" + id + "").val();
	var cutomerName = $("#cutomerName" + id + "").val();
	var intialCounter = parseInt($("#intialCounter" + id + "").val());
	var hardwareID = $("#hardwareID" + id + "").val();
	updateDevice(siteID, longtude, latitude, city, district, village,
			roadNumber, locationSerialNumber, model, meterSerialNumber,
			customerID, cutomerName, intialCounter,  hardwareID);

}

function updateDevice(siteID, longtude, latitude, city, district, village,
		roadNumber, locationSerialNumber, model, meterSerialNumber, customerID,
		cutomerName, intialCounter,  hardwareID) {
	var xhttp;

	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("devicesDiv").innerHTML = xhttp.responseText;
			updateSelectors();
		}
	};
	xhttp.open("POST", "updateDevice?siteID=" + siteID + "&longtude="
			+ longtude + "&latitude=" + latitude + "&city=" + city
			+ "&district=" + district + "&village=" + village + "&roadNumber="
			+ roadNumber + "" + "&locationSerialNumber=" + locationSerialNumber
			+ "&model=" + model + "&meterSerialNumber=" + meterSerialNumber
			+ "&customerID=" + customerID + "" + "&cutomerName=" + cutomerName
			+ "&intialCounter=" + intialCounter +  "&hardwareID=" + hardwareID + "", true);
	xhttp.send();
}
