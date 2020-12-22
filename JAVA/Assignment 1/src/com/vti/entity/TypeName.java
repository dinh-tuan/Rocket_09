package com.vti.entity;

public enum TypeName {
	Essay("Essay"), Multiple_Choice("Multiple-Choice");

	String value;

	TypeName(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
