package org.maman.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.maman.model.CountryCites;
import org.maman.model.MeterDevice;
import org.maman.pojos.City;
import org.maman.services.CountryCitiesServices;
import org.maman.services.MeterDevicesServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MeterDeviceController {
	@Autowired
	MeterDevicesServices devicesServices;
	@Autowired
	CountryCitiesServices countryServices;
	@RequestMapping(value = "/managedevices", method = RequestMethod.GET)
	public String deviceManagement(HttpServletRequest request) {
		List<String> city=countryServices.getCities();
		request.setAttribute("city", city);
		List<MeterDevice> device = devicesServices.diplayMeterDevices();
		request.setAttribute("device", device);
		return "addDevice";
	}
	@RequestMapping(value = "/savefile", method = RequestMethod.GET)
	public String saveFile(HttpServletRequest request) {
		
		return "saveFile";
	}
	
	@RequestMapping(value = "/searchpage", method = RequestMethod.GET)
	public String search(HttpServletRequest request) {
		
		List<MeterDevice> device = devicesServices.diplayMeterDevices();
		request.setAttribute("device", device);
		return "searchpage";
	}

	@RequestMapping(value = "/monitor", method = RequestMethod.GET)
	public String getMap(HttpServletRequest request) {
		List<MeterDevice> device = devicesServices.diplayMeterDevices();
		request.setAttribute("device", device);
		return "monitoring";
	}

	@RequestMapping(value = "/addDevice", method = RequestMethod.POST)
	public String addDevice(@ModelAttribute("device") MeterDevice devices, HttpServletRequest request, ModelMap model) {
		devices = devicesServices.adddevice(devices);
		List<MeterDevice> device = devicesServices.diplayMeterDevices();
		request.setAttribute("device", device);
		model.addAttribute("success", "device added to : " + devices.getCutomerName());
		return "successAdded";
	}

	@RequestMapping(value = "/deletedevice", method = RequestMethod.GET)
	public String deleteDevice(@RequestParam String siteID, HttpServletRequest request) {
		devicesServices.deleteDevice(siteID);
		List<MeterDevice> device = devicesServices.diplayMeterDevices();
		request.setAttribute("device", device);
		return "search";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(HttpServletRequest request, @RequestParam String city, @RequestParam String district,
			@RequestParam String village, @RequestParam String roadNumber) {
		List<MeterDevice> device = devicesServices.searchDevice(city, district, village, roadNumber);
		request.setAttribute("device", device);

		return "search";
	}

	@RequestMapping(value = "/updateDevice", method = RequestMethod.POST)
	public String updateDeviceInfo(HttpServletRequest request, @RequestParam String siteID,
			@RequestParam double longtude, @RequestParam double latitude, @RequestParam String city,
			@RequestParam String district, @RequestParam String village, @RequestParam String roadNumber,
			@RequestParam String locationSerialNumber, @RequestParam String model, @RequestParam String meterSerialNumber,
			@RequestParam String customerID, @RequestParam String cutomerName, @RequestParam int intialCounter,
			 @RequestParam String hardwareID) {

		devicesServices.updateDeviceInfo(siteID, longtude, latitude, city, district, village, roadNumber,
				locationSerialNumber, model, meterSerialNumber, customerID, cutomerName, intialCounter,
				hardwareID);
		List<MeterDevice> device = devicesServices.diplayMeterDevices();
		request.setAttribute("device", device);
		return "search";
	}

	@RequestMapping(value = "/searchById", method = RequestMethod.GET)
	public String searchById(HttpServletRequest request, @RequestParam String customerName,
			@RequestParam long customerID) {
		List<MeterDevice> devices = devicesServices.searchByNameAndId(customerName, customerID);
		request.setAttribute("devices", devices);
		return "searchById";
	}

	@RequestMapping(value = "/updateselectors", method = RequestMethod.GET)
	public String updateSelectors(HttpServletRequest request) {
		List<MeterDevice> device = devicesServices.diplayMeterDevices();
		request.setAttribute("device", device);
		return "updateselectors";
	}
	@ResponseBody
	@RequestMapping(value="treedata",method=RequestMethod.GET)
	public List<City> treeData(){
		List<City> city=devicesServices.getTree();
		return city;
	}

}
