package Entity;

public class Student {
	private int id;
	private String name;
	private String homeTown;
	private int diem;

	public Student(String name, String homeTown) {
		this.name = name;
		this.homeTown = homeTown;
		this.diem = 0;
	}

	public int getDiem() {
		return diem;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHomeTown() {
		return homeTown;
	}

	public void setHomeTown(String homeTown) {
		this.homeTown = homeTown;
	}

	public void Student(int diem) {
		this.diem += diem;
	}

	public void setDiem(int diem) {
		this.diem = diem;
	}

	public String StudentPhanLoai(int diem) {
		if (diem < 4)
			return "Yếu";
		if (diem < 6)
			return "Trung bình";
		if (diem < 8)
			return "Khá";
		return "Giỏi";
	}

	public void studentPrinter(Student student) {
		System.out.println("Họ tên : " + student.name);
		System.out.println("điểm : " + student.diem);
	}

}
