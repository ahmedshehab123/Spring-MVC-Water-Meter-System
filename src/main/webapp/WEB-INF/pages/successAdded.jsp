<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

             <div class="x_content" id="tabs-1">

                    <form class="form-horizontal form-label-left" novalidate>

                      <p>For add new devices when new customer use new one <code>WaterMeter</code>  </p>
                      <center> <span style="color: red;" class="section">${success }</span></center>
                      

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Longtuide <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="longtude" name="longtude"class="form-control col-md-7 col-xs-12"    required="required" type="text">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Latitude <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="latitude" name="latitude" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >City <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="btn btn-round btn-success" id="addcity" onchange="updateDistrict()" name="city">
								<option value="">Please select City</option>
								<c:forEach var="cityOBJ" items="${city }">
									<option value="${cityOBJ}">${cityOBJ}</option>
								</c:forEach>
						</select>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">District <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div id="updatedistrict">
                          <select class="btn btn-round btn-success" id="adddistrict" onchange="updateVillage()" name="district">
								<option value="">Please select District</option>
								<c:forEach var="cityOBJ" items="${villages }">
									<option value="${cityOBJ}">${cityOBJ}</option>
								</c:forEach>
						</select>
						</div>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="website">Village <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div id="updatevillage">
                          <select class="btn btn-round btn-success" id="addvillage" onchange="updateRoads()" name="village">
								<option value="">Please select Village</option>
								<c:forEach var="cityOBJ" items="${villages }">
									<option value="${cityOBJ}">${cityOBJ}</option>
								</c:forEach>
						</select>
						</div>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="website">Road Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div id="updateRoad">
                          <select class="btn btn-round btn-success" id="addroadNumber" onchange="" name="roadNumber">
								<option value="">Please select Road</option>
								<c:forEach var="cityOBJ" items="${roads }">
									<option value="${cityOBJ}">${cityOBJ}</option>
								</c:forEach>
						</select>
						</div>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="occupation">Location Serial Number <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="locationSerialNumber"
							name="locationSerialNumber"  class="optional form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="password" class="control-label col-md-3">Model</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="model" name="model"  class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="password2" class="control-label col-md-3 col-sm-3 col-xs-12">Meter serial number</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="meterSerialNumber"
							name="meterSerialNumber" data-validate-linked="password" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="telephone">Customer ID <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="customerID" name="customerID" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">Customer Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="cutomerName" name="cutomerName" class="form-control col-md-7 col-xs-12"></input>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="telephone">Intial Counter <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="intialCounter"
							name="intialCounter" required="required" data-validate-length-range="8,20" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="telephone">Hardware ID <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="hardwareID" name="hardwareID" required="required"  class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <button type="submit" class="btn btn-primary">Cancel</button>
                          <button id="send" type="submit" class="btn btn-success" onclick="addDevice()" >Add</button>
                        </div>
                      </div>
                    </form>
                  </div>