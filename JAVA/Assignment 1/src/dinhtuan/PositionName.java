package dinhtuan;

public enum PositionName {
	Dev("Dev"), Test("Test"), Scrum_Master("Scrum_Master"), PM("PM");

	String value;

	PositionName(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
