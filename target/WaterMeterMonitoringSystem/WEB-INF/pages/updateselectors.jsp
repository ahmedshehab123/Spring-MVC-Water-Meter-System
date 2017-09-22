<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
								<option value="0">Please select road name</option>
								<c:forEach var="device" items="${device }">
									<option value="${device.roadNumber}">${device.roadNumber}</option>
								</c:forEach>
						</select></td>
					</tr>
				</table>