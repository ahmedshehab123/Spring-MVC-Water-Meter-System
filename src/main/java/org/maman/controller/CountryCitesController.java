package org.maman.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.maman.model.CountryCites;
import org.maman.services.CountryCitiesServices;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CountryCitesController {
	private static final Logger logger = LoggerFactory
			.getLogger(CountryCitesController.class);
	@Autowired
	CountryCitiesServices countryServices;
	@RequestMapping(value="/uploadCities",method=RequestMethod.GET)
	public String getUploadCities(){
		
		
		return "saveCites";
	}
	@RequestMapping(value="/savecountry",method=RequestMethod.POST)
	public String uploadfile(@RequestParam MultipartFile bulkfile,ModelMap model){
		String csvFile=null;
		BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";
		
		if (!bulkfile.isEmpty()) {
			try {
				byte[] bytes = bulkfile.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator+bulkfile.getOriginalFilename());
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				
				logger.info("Server File Location="
						+ serverFile.getAbsolutePath());
				 csvFile = serverFile.getAbsolutePath();
		        
		        

		            br = new BufferedReader(new FileReader(csvFile));
		            while ((line = br.readLine()) != null) {

		                // use comma as separator
		            	if(!line.isEmpty()){
		                String[] country = line.split(cvsSplitBy);
		                CountryCites countryCities=new CountryCites();
		                countryCities.setPostalCode(Integer.parseInt(country[0]));
		                countryCities.setCity(country[2]);
		                countryCities.setDistrict(country[3]);
		                countryCities.setVillage(country[4]);
		                countryCities.setRoadName(country[5]);
		                countryServices.saveCities(countryCities);		                
		                model.addAttribute("success", "File uploaded successfully");
		                
		                
		            	}

		            }

				
				return "saveCites";
				
			} catch(FileNotFoundException e){
				
			}
			catch (IOException e) {
	            e.printStackTrace();
	        }
			
			catch (Exception e) {
				e.printStackTrace();
				return "errorpage";
			}
			finally {
	            if (br != null) {
	                try {
	                    br.close();
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
			
		} else {
			return "errorpage";
		}
		return "saveCites";
		
		
	}
	
	@RequestMapping(value="/displaydistricts",method=RequestMethod.GET)
	public String getDistricts(HttpServletRequest request,@RequestParam String city){
		
		List<String> district=countryServices.getDistrict(city);
		request.setAttribute("district", district);
		return "districttree";
	}
	@RequestMapping(value="/displayvillages",method=RequestMethod.GET)
	public String getvillages(@RequestParam String district,HttpServletRequest request){
		List<String> villages=countryServices.getVillages(district);
		request.setAttribute("villages", villages);
		return "villagetree";
	
	}
	@RequestMapping(value="/displayroads",method=RequestMethod.GET)
	public String getRoads(@RequestParam String village,HttpServletRequest request){
		List<String> roads=countryServices.getRoads(village);
		request.setAttribute("roads", roads);
		return "roadtree";
	
	}
	

}
