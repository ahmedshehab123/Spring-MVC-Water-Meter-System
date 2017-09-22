package org.maman.model;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="measurements")
public class Measurements {
	@Id
	private String measurementsID;
	private String assets;
	private double hardwareID;
	private double aDC;
	private double counter;
	private Date eventDate;
	private Date receivedDate;
	public String getMeasurementsID() {
		return measurementsID;
	}
	public void setMeasurementsID(String measurementsID) {
		this.measurementsID = measurementsID;
	}
	public String getAssets() {
		return assets;
	}
	public void setAssets(String assets) {
		this.assets = assets;
	}
	public double getHardwareID() {
		return hardwareID;
	}
	public void setHardwareID(double hardwareID) {
		this.hardwareID = hardwareID;
	}
	public double getaDC() {
		return aDC;
	}
	public void setaDC(double aDC) {
		this.aDC = aDC;
	}
	public double getCounter() {
		return counter;
	}
	public void setCounter(double counter) {
		this.counter = counter;
	}
	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	public Date getReceivedDate() {
		return receivedDate;
	}
	public void setReceivedDate(Date receivedDate) {
		this.receivedDate = receivedDate;
	}
	

}
