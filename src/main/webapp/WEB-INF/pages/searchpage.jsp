<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Search | Devices</title>
<script
	src="/WaterMeterMonitoringSystem/resources/scripts/searchDevices.js"></script>
<script
	src="/WaterMeterMonitoringSystem/resources/scripts/updateSelectors.js"></script>
	<script
	src="/WaterMeterMonitoringSystem/resources/scripts/editAddDelete.js"></script>
    <style type="text/css">
input {
	width: 100%
	
}
input{border-radius: 15px;}
</style>
  </head>
<%@ include file="header.jsp"%>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Search <small>specific device</small></h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Projects</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  			<div id="selectors">
				<table>
					<tr>
						<td><select class="btn btn-round btn-success" id="city" onchange="searchCity()" name="city">
								<option value="">Please select City</option>
								<c:forEach var="device" items="${device }">
									<option value="${device.city}">${device.city}</option>
								</c:forEach>
						</select></td>
						<td><select class="btn btn-round btn-success" id="district" onchange="searchDistrict()" name="district">
								<option value="">Please select district</option>
								<c:forEach var="device" items="${device }">
									<option value="${device.district}">${device.district}</option>
								</c:forEach>
						</select></td>
						<td><select class="btn btn-round btn-success" id="village" onchange="searchVillage()" name="village">
								<option value="">Please select village</option>
								<c:forEach var="device" items="${device }">
									<option value="${device.village}">${device.village}</option>
								</c:forEach>
						</select></td>
						<td><select class="btn btn-round btn-success" id="roadNumber" onchange="searchRoadNumber()" name="roadNumber">
								<option value="">Please select road name</option>
								<c:forEach var="device" items="${device }">
									<option value="${device.roadNumber}">${device.roadNumber}</option>
								</c:forEach>
						</select></td>
					</tr>
				</table>
				</div>
                  <div class="x_content" id="devicesDiv">

                    

                    <!-- start project list -->
                    <table class="table table-striped projects">
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
						    <th>Initial Stand meter</th> 
							<!-- <th>Connected Status</th> -->
							<th>HardwareID</th>
							<th>Edit</th>
							<th>Delete</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="device" items="${device }">
                          <tr id="${device.siteID }_display">
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
								<%-- <td>${device.status }</td> --%>
								<td>${device.hardwareID }</td>                          
                          <td>
                            
                            <a href="#" class="btn btn-info btn-xs" onclick="edit('${device.siteID }')"><i class="fa fa-pencil"></i> Edit </a></td>
                         <td>   <a href="#" class="btn btn-danger btn-xs" onclick="deleteDevice('${device.siteID }')"><i class="fa fa-trash-o"></i> Delete </a>
                          </td>
                        </tr>
                        <tr id="${device.siteID }_edit" style="display: none;">

								<td><input  id="longtude${device.siteID }" name="longtude"
									value="${device.longtude }" /></td>
								<td><input id="latitude${device.siteID }" name="latitude"
									value="${device.latitude }" /></td>
								<td><input id="city${device.siteID }" name="city"
									value="${device.city }" /></td>
								<td><input id="district${device.siteID }" name="district"
									value="${device.district }" /></td>
								<td><input id="village${device.siteID }" name="village"
									value="${device.village }" /></td>
								<td><input id="roadNumber${device.siteID }"
									name="roadNumber" value="${device.roadNumber }" /></td>
								<td><input id="locationSerialNumber${device.siteID }"
									name="locationSerialNumber"
									value="${device.locationSerialNumber }" /></td>
								<td><input id="model${device.siteID }" name="model"
									value="${device.model }" /></td>
								<td><input id="meterSerialNumber${device.siteID }"
									name="meterSerialNumber" value="${device.meterSerialNumber }" /></td>
								<td><input id="customerID${device.siteID }"
									name="customerID" value="${device.customerID }" /></td>
								<td><input id="cutomerName${device.siteID }"
									name="cutomerName" value="${device.cutomerName }" /></td>
								<td><input id="intialCounter${device.siteID }"
									name="intialCounter" value="${device.intialCounter }" /></td>
								<%-- <td><input id="status${device.siteID }" name="status"
									value="${device.status }" /></td> --%>
								<td><input id="hardwareID${device.siteID }"
									name="hardwareID" value="${device.hardwareID }" /></td>
								<td><button class="btn btn-round btn-success"onclick="update('${device.siteID}')"
										type="button">Save</button></td>
								<td><a class="btn btn-round btn-danger"href="#" onclick="cancel('${device.siteID }')">Cancel</a></td>
							</tr>
							</c:forEach>
                      </tbody>
                    </table>
                    <!-- end project list -->

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>
<%@ include file="footer.jsp"%>
    