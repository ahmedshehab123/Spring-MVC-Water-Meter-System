package org.maman.controller;

import javax.servlet.http.HttpSession;

import org.maman.model.Users;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class LogoutController {
     @RequestMapping(value="/logout",method=RequestMethod.GET)
     public String logout(@ModelAttribute("user") Users user,HttpSession session){
    	 session.invalidate();
        
    	 
    	 return "login";
     }
}
