package org.maman.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.maman.model.MeterDevice;
import org.maman.model.RegUser;
import org.maman.model.Users;
import org.maman.services.MeterDevicesServices;
import org.maman.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	 
	
	@Autowired()
	UserServices userServices;
	@Autowired
	MeterDevicesServices devicesServices;
	
	
	@RequestMapping(value={ "/", "/welcome**" },method=RequestMethod.GET)
	public String getLanding(HttpServletRequest request){
		
		List<MeterDevice> device=devicesServices.diplayMeterDevices();	
		request.setAttribute("device", device);
		return "login";
	}
	
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String signUP(@ModelAttribute("user") RegUser user,HttpServletRequest request,ModelMap model){
		boolean checkExistuser=userServices.checkExistEMail(user.getEmail());
		boolean checkFinal=userServices.checkExistEMailFinal(user.getEmail());
		if(checkExistuser==true||checkFinal==true){
		user=userServices.createUser(user);
		request.getSession().setAttribute("userlogin", user);
		userServices.sendEmailToAdmin(user.getId());
		return "waiting";
		}else{
			model.addAttribute("userexist", "This email   already regitered before  ");
			return "signuperror";
		}
		
		
	}
	@RequestMapping(value="/saveuser",method=RequestMethod.GET)
	public String saveUser(@ModelAttribute("user") Users user,@RequestParam String userID){
		boolean checkFinal=userServices.checkExistEMailFinal(user.getEmail());
		if(checkFinal==true){
		user=userServices.saveUser(user);
		userServices.removeUserFromReg(userID);
		userServices.sendEmailTouser(user.getEmail());
		return "useradded";
		}else{
		
			return "userexit";
		}
	}
	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public String adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Hello World");
		model.addObject("message", "This is protected page!");
		model.setViewName("admin");

		return "setting";

	}
	@RequestMapping(value="/adminconfirm",method=RequestMethod.GET)
	public String adminConfirm(@RequestParam String userID,HttpServletRequest request){
		
		RegUser user=userServices.firstRegistration(userID);
		
		request.setAttribute("user", user);
		
		
		return "adminconfirm";
	}

}
