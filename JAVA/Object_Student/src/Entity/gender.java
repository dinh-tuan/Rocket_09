package Entity;

public enum gender {
	MALE("Male"),FEMALE("Female"),UNKNOWN("Unknown");
	
	String value;
	
	gender(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
