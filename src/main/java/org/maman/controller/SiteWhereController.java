package org.maman.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SiteWhereController {
	@RequestMapping(value="/adminsitewhere",method=RequestMethod.GET)
	public String siteWhereAdmin(){
		
		
		return "setting";
	}
	@RequestMapping(value="/sitewhereframe",method=RequestMethod.GET)
	public String siteWhere(){
		
		
		return "redirect:http://104.237.2.91:8080/sitewhere/admin/";
	}

}
