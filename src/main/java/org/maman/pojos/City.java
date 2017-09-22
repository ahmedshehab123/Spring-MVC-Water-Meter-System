package org.maman.pojos;

import java.util.List;

public class City {
	public String text;
	public List<District> children;
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<District> getChildren() {
		return children;
	}
	public void setChildren(List<District> children) {
		this.children = children;
	}
	

}
