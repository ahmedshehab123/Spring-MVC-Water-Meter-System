/**
 * 
 */



jQuery(function($) {
	
	
	function loadtree() {
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				var treeData = JSON.parse(xhttp.responseText);
				var tree=$('#jstree').jstree({ 'core' : {
				    'data' : treeData
				} });
				tree.on('changed.jstree', function (e, data) {
				    var i, j, r = [];
				    for(i = 0, j = data.selected.length; i < j; i++) {
				      r.push(data.instance.get_node(data.selected[i]).text);
				    }
				    JSON.stringify(data.node.original); // data.node.original.device
				    //$('#highlight').html('Selected: ' + r.join(', '));
				    $('#siteID').html(data.node.original.device.siteID);
				    $('#model').html(data.node.original.device.model);
				    $('#serial').html(data.node.original.device.meterSerialNumber);
				    $('#customerID').html(data.node.original.device.customerID);
				    $('#customerName').html(data.node.original.device.cutomerName);
				    $('#standMeter').html(data.node.original.device.hardwareID);
				  })
			}
		};
		xhttp.open("GET", "treedata", true);
		xhttp.send();
	}
	
	
	
	loadtree();
	
});
