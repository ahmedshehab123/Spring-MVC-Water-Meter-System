package org.maman.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.maman.model.MeterDevice;
import org.maman.model.Users;
import org.maman.services.MeterDevicesServices;
import org.maman.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	@Autowired
	UserServices userServices;
	@Autowired
	MeterDevicesServices devicesServices;
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@RequestParam String email,String password,HttpServletRequest request,ModelMap model){
		
		Users user=userServices.login(email, password);
		if(user==null){
			model.addAttribute("loginerror", "username or password error");
			return "loginerror";
		}else{
			request.getSession().setAttribute("userlogin", user);
			List<MeterDevice> device = devicesServices.diplayMeterDevices();
			request.setAttribute("device", device);
		return "home";
		}
	}
	@RequestMapping(value="/home",method=RequestMethod.GET)
	public String home(HttpServletRequest request,ModelMap model){
		
		
			
			List<MeterDevice> device = devicesServices.diplayMeterDevices();
			request.setAttribute("device", device);
		return "home";
		
	}

}
