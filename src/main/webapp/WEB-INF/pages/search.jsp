<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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