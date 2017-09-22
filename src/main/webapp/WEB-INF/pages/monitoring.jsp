<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Monitoring | Devices</title>
<script type="text/javascript"
	src="/WaterMeterMonitoringSystem/resources/lib/jquery-1.11.0.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/lib/jstree.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/scripts/searchDevices.js"></script>
<script src="/WaterMeterMonitoringSystem/resources/scripts/loadtree.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
</head>
<%@ include file="header.jsp"%>


<!-- page content -->
<div class="right_col" role="main">
	<table>

		<tr>
			<td><div id="jstree"></div></td>

			<td rowspan="2"><div style="height: 500px; width: 800px;">
					<input id="pac-input" class="controls" type="text"
						placeholder="Search Box">
					<div id="map"></div>
				</div> <script
					src="/WaterMeterMonitoringSystem/resources/scripts/mapscript.js">
					
				</script> <script
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArWYJPKygVVKCULRRoPNPuevICWZs-Pe4&libraries=places&callback=initAutocomplete"
					async defer></script></td>
		</tr>
		<tr>
			<td><div id="highlight">
					<table>
						<tr>
							<td>Site id :</td>
							<td id="siteID"></td>
						</tr>
						<tr>
							<td>Model :</td>
							<td id="model"></td>
						</tr>
						<tr>
							<td>Serial :</td>
							<td id="serial"></td>
						</tr>
						<tr>
							<td>Customer id :</td>
							<td id="customerID"></td>
						</tr>
						<tr>
							<td>Customer name :</td>
							<td id="customerName"></td>
						</tr>
						<tr>
							<td>Stand Meter :</td>
							<td id="standMeter"></td>
						</tr>
						<!-- <tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr> -->
					</table>
				</div></td>

		</tr>
	</table>

	<div class="">
		<div class="page-title">
			<div class="title_left"></div>

			<div class="title_right">
				<div
					class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">

				</div>
			</div>
		</div>

		<div class="clearfix"></div>

		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>Monitor Devices</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false"><i
									class="fa fa-wrench"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">Settings 1</a></li>
									<li><a href="#">Settings 2</a></li>
								</ul></li>
							<li><a class="close-link"><i class="fa fa-close"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">

						<table id="datatable-checkbox" class="table table-striped table-bordered bulk_action dataTable no-footer">
							<thead>
								<tr>
									<th>Long</th>
									<th>Lat</th>
									<!-- <th>Site ID</th> -->
									<th>City</th>
									<th>District</th>
									<th>Village</th>
									<th>Road Name</th>
									<th>Location serial</th>
									<th>Model</th>
									<th>Meter serial Number</th>
									<th>Customer Id</th>
									<th>Customer Name</th>
									<!-- <th>Battery Voltage</th> -->
									<th>Initail Stand meter</th>
									<!-- <th>Connected Status</th> -->
									<th>HardwareID</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach var="device" items="${device }">

									<tr>
										<td>${device.longtude }</td>
										<td>${device.latitude }</td>
										<%-- <td>${device.siteID }</td> --%>
										<td>${device.city }</td>
										<td>${device.district }</td>
										<td>${device.village }</td>
										<td>${device.roadNumber }</td>
										<td>${device.locationSerialNumber }</td>
										<td>${device.model }</td>
										<td>${device.meterSerialNumber }</td>
										<td>${device.customerID }</td>
										<td>${device.cutomerName }</td>
										<td>${device.intialCounter }</td>
										<%-- <td>${device.batteryVoltage }</td>
						<td>${device.status }</td> --%>
										<td>${device.hardwareID }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- jQuery -->
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/nprogress/nprogress.js"></script>
<!-- iCheck -->
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/iCheck/icheck.min.js"></script>
<!-- Datatables -->
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/datatables.net-scroller/js/datatables.scroller.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/jszip/dist/jszip.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/pdfmake/build/pdfmake.min.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/vendors/pdfmake/build/vfs_fonts.js"></script>

<!-- Custom Theme Scripts -->
<script
	src="/WaterMeterMonitoringSystem/resources/build/js/custom.min.js"></script>

<!-- Datatables -->
<script>
	$(document).ready(function() {
		var handleDataTableButtons = function() {
			if ($("#datatable-buttons").length) {
				$("#datatable-buttons").DataTable({
					dom : "Bfrtip",
					buttons : [ {
						extend : "copy",
						className : "btn-sm"
					}, {
						extend : "csv",
						className : "btn-sm"
					}, {
						extend : "excel",
						className : "btn-sm"
					}, {
						extend : "pdfHtml5",
						className : "btn-sm"
					}, {
						extend : "print",
						className : "btn-sm"
					}, ],
					responsive : true
				});
			}
		};

		TableManageButtons = function() {
			"use strict";
			return {
				init : function() {
					handleDataTableButtons();
				}
			};
		}();

		$('#datatable').dataTable();

		$('#datatable-keytable').DataTable({
			keys : true
		});

		$('#datatable-responsive').DataTable();

		$('#datatable-scroller').DataTable({
			ajax : "js/datatables/json/scroller-demo.json",
			deferRender : true,
			scrollY : 380,
			scrollCollapse : true,
			scroller : true
		});

		$('#datatable-fixed-header').DataTable({
			fixedHeader : true
		});

		var $datatable = $('#datatable-checkbox');

		$datatable.dataTable({
			'order' : [ [ 1, 'asc' ] ],
			'columnDefs' : [ {
				orderable : false,
				targets : [ 0 ]
			} ]
		});
		$datatable.on('draw.dt', function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_flat-green'
			});
		});

		TableManageButtons.init();
	});
</script>
<!-- /Datatables -->
</body>
</html>