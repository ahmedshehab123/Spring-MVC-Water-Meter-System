package org.maman.pojos;

import java.util.List;

public class District {
	private String text;
	private List<Village> children;

	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<Village> getChildren() {
		return children;
	}
	public void setChildren(List<Village> children) {
		this.children = children;
	}
	public void setDistrictName(String districtName) {
	
	}
	

}
