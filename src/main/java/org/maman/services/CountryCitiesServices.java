package org.maman.services;

import java.util.List;

import org.maman.model.CountryCites;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Service;

import com.mongodb.BasicDBObject;
@Service
public class CountryCitiesServices {
	@Autowired
	MongoOperations mongoTemplate;
	
	public CountryCites saveCities(CountryCites country){
		mongoTemplate.insert(country);
		return country;
	}
	public List<String> getCities(){
		@SuppressWarnings("unchecked")
		List<String> city=	mongoTemplate.getCollection("CountryCites").distinct("city");
		//List<CountryCites> city=mongoTemplate.findAll(CountryCites.class);
		return city;
		
	}
	public List<String> getDistrict(String city){

		@SuppressWarnings("unchecked")
		List<String> district=	mongoTemplate.getCollection("CountryCites").distinct("district",new BasicDBObject("city", new BasicDBObject("$eq", city)));
		
	return district;
		
	}
	public List<String> getVillages(String district){
		@SuppressWarnings("unchecked")
		List<String> village=	mongoTemplate.getCollection("CountryCites").distinct("village",new BasicDBObject("district", new BasicDBObject("$eq", district)));
		return village;
		
		
	}
	public List<String> getRoads(String village){
		@SuppressWarnings("unchecked")
		List<String> roadName=	mongoTemplate.getCollection("CountryCites").distinct("roadName",new BasicDBObject("village", new BasicDBObject("$eq", village)));
		
		return roadName;
		
	}
	

}
