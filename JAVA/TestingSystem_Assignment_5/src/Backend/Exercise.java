package Backend;

import java.util.Scanner;

import Entity.News;
import Entity.ThiSinh;
import Entity.TuyenSinh;

public class Exercise {
	public static void Q1() {
		News news1 = new News();
		Scanner input = new Scanner(System.in);

		int x = 0;
		do {
			Menu();
			x = input.nextInt();
			switch (x) {
			case 1:
				news1.insertNews();
				System.out.println("----------------------->");
				news1.Display();
				break;
			case 2:
				news1.Display();
				break;
			case 3:
				news1.Calculate();
				System.out.println("----------------------->");
				news1.Display();
				break;

			case 4:
				System.out.println("Good Bye");
				break;
			}
		} while (x != 4);

		input.close();
	}

	public static void Menu() {
		System.out.println("----------------------->");
		System.out.println("1 - Insert news");
		System.out.println("2 - View list news");
		System.out.println("3 - Average rate");
		System.out.println("4 - Exit");
		System.out.println("----------------------->");
	}

	public static void Q2() {
		TuyenSinh tuyensinh = new TuyenSinh();
		Scanner input = new Scanner(System.in);

		int x = 0;
		do {
			MenuQ2();
			x = input.nextInt();
			switch (x) {
			case 1:
				tuyensinh.themMoiThiSinh();
				System.out.println("\n--------------------------------------------------------------->");
				tuyensinh.hienThi();
				break;
			case 2:
				tuyensinh.hienThi();
				break;
			case 3:
				tuyensinh.timKiem();
				break;

			case 4:
				System.out.println("Kết thúc !!!!!!!!!!");
				break;
			}
		} while (x != 4);

		input.close();
	}

	public static void MenuQ2() {
		System.out.println("\n--------------------------------------------------------------->");
		System.out.println("1 - Thêm mới thí sinh");
		System.out.println("2 - Hiện thị thông tin của thí sinh và khối thi của thí sinh");
		System.out.println("3 - Tìm kiếm theo số báo danh");
		System.out.println("4 - Thoát khỏi chương trình");
		System.out.println("--------------------------------------------------------------->");
	}
}
