<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table  border="1" >
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
					<th>Battery Voltage</th>
					<!-- <th>Initail Stand meter</th> -->
					<th>Connected Status</th>
					<th>HardwareID</th>
				</tr>
				
				<c:forEach var="device" items="${devices }">
				
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
					<td>${device.batteryVoltage }</td>
					<td>${device.status }</td>
					<td>${device.hardwareID }</td>
				</tr>
				</c:forEach>
			</table>
