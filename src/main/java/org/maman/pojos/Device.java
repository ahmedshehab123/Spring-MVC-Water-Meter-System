package org.maman.pojos;

import org.maman.model.MeterDevice;

public class Device {
	public String text;
	MeterDevice device=new MeterDevice();
	

	public MeterDevice getDevice() {
		return device;
	}

	public void setDevice(MeterDevice device) {
		this.device = device;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	

}
