package org.maman.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;



@Document(collection="devices")
public class MeterDevice {
	@Id
	private String siteID;
	private double longtude;
	private double latitude;
	private String city;
	private String district;
	private String village;
	private String roadNumber;
	private String locationSerialNumber;
	private String model;
	private String meterSerialNumber;
	private String customerID;
	private String cutomerName;
	private String hardwareID;
	private int intialCounter;
	
	public String getSiteID() {
		return siteID;
	}
	public void setSiteID(String siteID) {
		this.siteID = siteID;
	}
	public double getLongtude() {
		return longtude;
	}
	public void setLongtude(double longtude) {
		this.longtude = longtude;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getVillage() {
		return village;
	}
	public void setVillage(String village) {
		this.village = village;
	}
	
	public String getRoadNumber() {
		return roadNumber;
	}
	public void setRoadNumber(String roadNumber) {
		this.roadNumber = roadNumber;
	}
	
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
	public String getCutomerName() {
		return cutomerName;
	}
	public void setCutomerName(String cutomerName) {
		this.cutomerName = cutomerName;
	}
	
	public int getIntialCounter() {
		return intialCounter;
	}
	public void setIntialCounter(int intialCounter) {
		this.intialCounter = intialCounter;
	}
	public String getLocationSerialNumber() {
		return locationSerialNumber;
	}
	public void setLocationSerialNumber(String locationSerialNumber) {
		this.locationSerialNumber = locationSerialNumber;
	}
	public String getMeterSerialNumber() {
		return meterSerialNumber;
	}
	public void setMeterSerialNumber(String meterSerialNumber) {
		this.meterSerialNumber = meterSerialNumber;
	}
	public String getCustomerID() {
		return customerID;
	}
	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}
	public String getHardwareID() {
		return hardwareID;
	}
	public void setHardwareID(String hardwareID) {
		this.hardwareID = hardwareID;
	}
	
	
	
	
	
	

}
