package Entity;

public abstract class Person {
	private String nameP;

	public Person(String nameP) {
		this.nameP = nameP;
	}

	public String getNameP() {
		return nameP;
	}

	public void setNameP(String nameP) {
		this.nameP = nameP;
	}

}
