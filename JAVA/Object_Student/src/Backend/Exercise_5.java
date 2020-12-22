package Backend;

import java.util.List;
import java.util.ArrayList;
import java.util.Scanner;

import Entity.CanBo;
import Entity.HighSchoolStudent;
import Entity.KySu;
import Entity.gender;

public class Exercise_5 {
	public static void Q2() {
		Scanner input = new Scanner(System.in);
		List<CanBo> canBo = new ArrayList<CanBo>();
//		canBo.add(new CanBo("Tuấn", 16, gender.MALE, "Hà Nội"));
//		canBo.add(new CanBo("Tú", 13, gender.MALE, "Hà Nội"));
//		canBo.add(new CanBo("Quỳnh Anh", 16, gender.FEMALE, "Hà Nội"));
//		canBo.add(new CanBo("Nguyễn Duy", 16, gender.MALE, "Thanh Hóa"));
		System.out.print("Nhập số cán bộ : ");
		int x = input.nextInt();
		for (int i = 0; i < x; i++) {
			System.out.println("Thông tin của cán bộ " + (i + 1));
			System.out.println("Nhập tên :");
			canBo.get(i).setName(input.nextLine());
//			System.out.println("Nhập tuổi :");
//			canBo.get(i).setAge(input.nextInt());
//			System.out.println("Nhập giới tính :");
//			canBo.get(i).setGender(gender.valueOf(input.nextLine()));
//			System.out.println("Nhập quê quán :");
//			canBo.get(i).setAddress(input.nextLine());

		}

		System.out.print("mời bạn nhập tên cần tìm kiếm : ");
		String search = input.nextLine();
		for (int i = 0; i < canBo.size(); i++) {
			if (search.equals(canBo.get(i).getName())) {
				System.out.println(canBo.get(i).toString());
			}
		}
		System.out.println("------------------------------------------------------------>");
		System.out.println("Danh sách các cán bộ : ");
		System.out.println(canBo.toString());
		System.out.print("mời bạn nhập tên cần xóa : ");
		String xoa = input.nextLine();
		for (int i = 0; i < canBo.size(); i++) {
			if (xoa.equals(canBo.get(i).getName())) {
				System.out.println(canBo.remove(i));
			}
		}
		System.out.println("------------------------------------------------------------>");
		System.out.println("Danh sách các cán bộ sau khi xóa : ");
		System.out.println(canBo.toString());

		input.close();

	}

	public static void Q3() {
		HighSchoolStudent HighSchoolStudent1 = new HighSchoolStudent("ok", 1, "Phú Diễn", "Chuyên Văn", "Đại học Công Nghệ");
		HighSchoolStudent1.setNameHs("Nam");

		HighSchoolStudent1.printYc(HighSchoolStudent1);

	}
}
