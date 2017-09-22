package org.maman.pojos;

import java.util.List;

public class Village {
	private String text;
	private List<RoadName> children;
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<RoadName> getChildren() {
		return children;
	}
	public void setChildren(List<RoadName> children) {
		this.children = children;
	}
	
	
	
	

}
