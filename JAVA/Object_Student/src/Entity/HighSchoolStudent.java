package Entity;

public class HighSchoolStudent extends HocSinh {
	private int id;
	private String nameSc;
	private String clazz;
	private String desiredUniversity;

	public HighSchoolStudent(String nameP, int id, String nameSc, String clazz, String desiredUniversity) {
		super(nameP);
		this.id = id;
		this.nameSc = nameSc;
		this.clazz = clazz;
		this.desiredUniversity = desiredUniversity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNameSc() {
		return nameSc;
	}

	public void setNameSc(String nameSc) {
		this.nameSc = nameSc;
	}

	public String getClazz() {
		return clazz;
	}

	public void setClazz(String clazz) {
		this.clazz = clazz;
	}

	public String getDesiredUniversity() {
		return desiredUniversity;
	}

	public void setDesiredUniversity(String desiredUniversity) {
		this.desiredUniversity = desiredUniversity;
	}
	
	public void printYc(HighSchoolStudent HighSchoolStudent) {
		System.out.println("id : "+HighSchoolStudent.id);
		System.out.println("name : "+HighSchoolStudent.getNameHs());
		System.out.println("class : "+HighSchoolStudent.clazz);
		System.out.println("DesiredUniversity :"+HighSchoolStudent.desiredUniversity);
	}

}
