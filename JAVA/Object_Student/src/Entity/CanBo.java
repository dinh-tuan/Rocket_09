package Entity;

public class CanBo {
	private String name;
	private int age;
	private gender gender;
	private String address;

//	public CanBo(String name, int age, gender gender, String address) {
//		this.name = name;
//		this.age = age;
//		this.gender = gender;
//		this.address = address;
//	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public gender getGender() {
		return gender;
	}

	public void setGender(gender gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void printCanBo(CanBo canBo) {
		System.out.println("Tên : " + canBo.name);
		System.out.println("Tuổi : " + canBo.age);
		System.out.println("Giới Tính : " + canBo.gender);
		System.out.println("Địa Chỉ : " + canBo.address);
	}

	public String toString() {
		String danhSach = "\n";
		danhSach += "Tên : " + name + "\n";
		danhSach += "Tuổi : " + age + "\n";
		danhSach += "Giới Tính : " + gender + "\n";
		danhSach += "Địa Chỉ : " + address + "\n";
		return danhSach;
	}
}
