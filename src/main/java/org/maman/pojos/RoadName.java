package org.maman.pojos;

import java.util.List;

public class RoadName {
	private String text;
	private List<Device> children;

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public List<Device> getChildren() {
		return children;
	}

	public void setChildren(List<Device> children) {
		this.children = children;
	}
	
}
