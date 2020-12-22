package Entity;

import java.util.Scanner;

public class ThiSinh {
	private int id;
	private String name;
	private String address;
	private String priorityLevel;

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPriorityLevel() {
		return priorityLevel;
	}

	public void setPriorityLevel(String priorityLevel) {
		this.priorityLevel = priorityLevel;
	}

	public void ThongTin() {
		Scanner input = new Scanner(System.in);
		System.out.print("Nhập số báo danh :");
		this.id = input.nextInt();
		input.nextLine();
		System.out.print("Nhập tên :");
		this.name = input.nextLine();

		System.out.print("Nhập địa chỉ :");
		this.address = input.nextLine();

		System.out.print("Nhập mức ưu tiên :");
		this.priorityLevel = input.nextLine();

	}

//	public void nhapThongTin() {
//		Scanner input = new Scanner(System.in);
//		System.out.print("Nhập số thí sinh : ");
//		int n = input.nextInt();
//		input.nextLine();
//		ThiSinh[] thisinh = new ThiSinh[n];
//		for (int i = 0; i < n; i++) {
//			System.out.println("Thí sinh số " + (i + 1));
//			System.out.print("Mời bạn chọn Khối (A - Khối A , B - Khối B, C - Khối C ) :");
//			String Khoi = input.nextLine();
//			switch (Khoi) {
//			case "A":
//				thisinh[i] = new Khoi_A();
//				ThongTin();
//				break;
//			case "B":
//				thisinh[i] = new Khoi_B();
//				ThongTin();
//				break;
//			case "C":
//				thisinh[i] = new Khoi_C();
//				ThongTin();
//				break;
//			}
//
//		}
//	}

	public void hienThiThongTin() {
		System.out.printf("\n\nSố báo danh : %03d", id);
		System.out.println("\nHọ tên :" + name);
		System.out.println("Địa chỉ :" + address);
		System.out.println("Mức ưu tiên :" + priorityLevel);
	}
}
