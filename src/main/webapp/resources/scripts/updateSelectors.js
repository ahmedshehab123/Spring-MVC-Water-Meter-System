/**
 * 
 */



function updateSelectors() {
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("selectors").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET", "updateselectors", true);
	xhttp.send();
}

function updateDevices() {
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("devicesDiv").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET", "updateselectors", true);
	xhttp.send();
}