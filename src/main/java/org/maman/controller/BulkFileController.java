package org.maman.controller;


import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;

import org.maman.model.MeterDevice;
import org.maman.services.MeterDevicesServices;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BulkFileController {
	@Autowired
	MeterDevicesServices meterServices;
	private static final Logger logger = LoggerFactory
			.getLogger(BulkFileController.class);

	static String removeQuotes(String input){
		return input.replaceAll("\"", "");
	}
	@RequestMapping(value="/uploadfile",method=RequestMethod.POST)
	public String uploadfile(@RequestParam MultipartFile bulkfile){
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
		                MeterDevice device=new MeterDevice();
		                device.setLongtude(Double.parseDouble(removeQuotes(country[0])));
		                device.setLatitude(Double.parseDouble(removeQuotes(country[1])));
		                device.setCity(removeQuotes(country[2]));
		                device.setDistrict(removeQuotes(country[3]));
		                device.setVillage(removeQuotes(country[4]));
		                device.setRoadNumber(removeQuotes(country[5]));
		                device.setLocationSerialNumber(removeQuotes(country[6]));
		                device.setModel(removeQuotes(country[7]));
		                device.setMeterSerialNumber(removeQuotes(country[8]));
		                device.setCustomerID(removeQuotes(country[9]));
		                device.setCutomerName(removeQuotes(country[10]));
		                device.setHardwareID(removeQuotes(country[11]));
		                device.setIntialCounter(Integer.parseInt(removeQuotes(country[12])));
		                meterServices.adddevice(device);
		            	}

		            }

				
				return "saveFile";
				
			} catch(FileNotFoundException e){}
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
		return "saveFile";
		
		
	}

}
