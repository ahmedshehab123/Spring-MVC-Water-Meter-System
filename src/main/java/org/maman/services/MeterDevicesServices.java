package org.maman.services;

import java.util.ArrayList;
import java.util.List;

import org.maman.model.MeterDevice;
import org.maman.pojos.City;
import org.maman.pojos.Device;
import org.maman.pojos.District;
import org.maman.pojos.RoadName;
import org.maman.pojos.Village;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import com.mongodb.BasicDBObject;

@Service
public class MeterDevicesServices {
	@Autowired
	MongoOperations mongoTemplate;
	
	public MeterDevice adddevice(MeterDevice device){
		mongoTemplate.insert(device);
		return device;
	}

	
	public List<MeterDevice> diplayMeterDevices(){
		
		List<MeterDevice> devices=mongoTemplate.findAll(MeterDevice.class);
		return devices;
	}
	public void deleteDevice(String siteID){
		BasicQuery query=new BasicQuery("{siteID:'" + siteID + "'}");
		mongoTemplate.remove(query, MeterDevice.class);
		
	}
	public List<MeterDevice> searchDevice(String city,String district,String village,String roadNumber){
		//, {district:'"+district+"'},{village:'"+village+"'},{roadNumber:"+roadNumber+"} 
		String q = "{'$and':[";
		boolean c=false, d=false, v=false;
		if(!city.isEmpty()){
			q += "{city:'"+city+"'}";
			c=true;
		}
		
		if(!district.isEmpty()){
			if(c) q+=", ";
			q +="{district:'"+district+"'}";
			d=true;
			
		}
		if(!village.isEmpty()){
			if(c || d) q+=", ";
			q +="{village:'"+village+"'}";
			v = true;
			
		}
		if(!roadNumber.isEmpty()){
			if(c || d || v) q+=", ";
			q +="{roadNumber:'"+roadNumber+"'}";
		}
		
				q += " ] }";
			
				
		
		if(city.isEmpty()&& district.isEmpty() && village.isEmpty()&& roadNumber.isEmpty()){
			//q ="{'$and':[{city:'"+city+"'},{district:'"+district+"'},{village:'"+village+"'},{roadNumber:'"+roadNumber+"'} ] }";
			List<MeterDevice> devices=mongoTemplate.findAll(MeterDevice.class);
			return devices;
		}else{
			BasicQuery query=new BasicQuery(q);
			List<MeterDevice> device=mongoTemplate.find(query, MeterDevice.class);
			return device;
		}
	}
	
	
	public void updateDeviceInfo(String siteID,double longtude,double latitude,String city,String district,String village,String roadNumber,
			String locationSerialNumber, String model, String meterSerialNumber, String customerID, String cutomerName, int intialCounter,
			 String hardwareID){
		
		BasicQuery selectQuery=new BasicQuery("{siteID:'"+siteID+"'}");
		Update updateQuery = new Update();
		updateQuery.set("longtude", longtude);
		updateQuery.set("latitude", latitude);
		updateQuery.set("city", city);
		updateQuery.set("district", district);
		updateQuery.set("village", village);
		updateQuery.set("roadNumber", roadNumber);
		updateQuery.set("locationSerialNumber", locationSerialNumber);
		updateQuery.set("model", model);
		updateQuery.set("meterSerialNumber", meterSerialNumber);
		updateQuery.set("customerID", customerID);
		updateQuery.set("cutomerName", cutomerName);
		updateQuery.set("intialCounter", intialCounter);
		updateQuery.set("hardwareID", hardwareID);
		
		mongoTemplate.updateMulti(selectQuery, updateQuery, MeterDevice.class);
		
	}
	
	
	
	public List<MeterDevice> searchByNameAndId(String cutomerName,long customerID){
		String q ="{'$and':[{cutomerName:'"+cutomerName+"'},{customerID:"+customerID+"}] }";
		BasicQuery query=new BasicQuery(q);
		List<MeterDevice> device=mongoTemplate.find(query, MeterDevice.class);
		return device;	
		
		
		
	}
	
	
	
	public List<String> getCities(){
		@SuppressWarnings("unchecked")
		List<String> city=	mongoTemplate.getCollection("devices").distinct("city");
		return city;
	}
	public List<String> getDistric(String cityName){
			
			@SuppressWarnings("unchecked")
			List<String> district=	mongoTemplate.getCollection("devices").distinct("district",new BasicDBObject("city", new BasicDBObject("$eq", cityName)));
			
		return district;
	}
	public List<String> getvillages(String districtName){
		
		@SuppressWarnings("unchecked")
		List<String> village=	mongoTemplate.getCollection("devices").distinct("village",new BasicDBObject("district", new BasicDBObject("$eq", districtName)));
		return village;
		
	}
	public List<String> getRoadName(String villageName){
		
		@SuppressWarnings("unchecked")
		List<String> roadName=	mongoTemplate.getCollection("devices").distinct("roadNumber",new BasicDBObject("village", new BasicDBObject("$eq", villageName)));
		
		return roadName;
	}
	public List<String> getDeviceinfo(String roadName){
		@SuppressWarnings("unchecked")
		List<String> device=	mongoTemplate.getCollection("devices").distinct("hardwareID",new BasicDBObject("roadNumber", new BasicDBObject("$eq", roadName)));
		return device;		
	}
	public MeterDevice fullDate(String hardwareID){
		
		BasicQuery query=new BasicQuery("{hardwareID:'" + hardwareID + "'}");
		MeterDevice devices=mongoTemplate.findOne(query, MeterDevice.class);
		return devices;
	}
	
	public List<City> getTree(){
		
		List<City> cities=new ArrayList<City>();
		List<String> citiesNames = getCities();
		for(String cityName : citiesNames){
			City city=new City();
			city.setText(cityName);
			
			
			/**
			 * District loading...
			 */
			List<String> districtsNames = getDistric(cityName);
			List<District> districts = new ArrayList<District>();
			for(String districtName : districtsNames){
				District district=new District();
				district.setText(districtName);
				districts.add(district);
				/**
				 * village loading...
				 */
			List<String> villageNames=getvillages(districtName);
			List<Village> villages=new ArrayList<Village>();	
			for(String villageName:villageNames){
				Village village=new Village();
				village.setText(villageName);
				villages.add(village);
				/**
				 * road loading...
				 */
			List<String> roadNames=getRoadName(villageName);
			List<RoadName> roads=new ArrayList<RoadName>();
			for(String road:roadNames){
				
				RoadName roadName=new RoadName();
				roadName.setText(road);
				roads.add(roadName);
				/**
				 * device id loading...
				 */
			List<String> deviceIfo=getDeviceinfo(road);
			List<Device> devices=new ArrayList<Device>();
			for(String device:deviceIfo){
				Device deviceObj=new Device();
				deviceObj.setText(device);
				deviceObj.setDevice(fullDate(device));
				devices.add(deviceObj);
				
			}
			roadName.setChildren(devices);
 			}
			
			village.setChildren(roads);	
				
			}
			district.setChildren(villages);
			
				
			}
			city.setChildren(districts);
			cities.add(city);
		}
		
		return cities;
	}
	
	
	
	
	
	
	
	
}
