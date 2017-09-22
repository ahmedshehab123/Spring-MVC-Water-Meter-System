<!DOCTYPE html>
<%@ include file="header.jsp"%>
 <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
              
                
		
		
			

			<div style="height: 900px; width: 1600px;">
					<input id="pac-input" class="controls" type="text"
						placeholder="Search Box">
					<div id="map"></div>
				</div> <script
					src="/WaterMeterMonitoringSystem/resources/scripts/mapscript.js">
					
				</script> <script
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyArWYJPKygVVKCULRRoPNPuevICWZs-Pe4&libraries=places&callback=initAutocomplete"
					async defer></script>
		
		
			
				

		
		<table id="datatable" style="display: none;" border="1" >
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
				
				<c:forEach var="device" items="${device }">
				
				<tr >
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
			</table>
                
                
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

			
			

        <!-- footer content -->
        <%@ include file="footer.jsp"%>
        
        