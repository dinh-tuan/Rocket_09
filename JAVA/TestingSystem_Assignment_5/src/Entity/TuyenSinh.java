package Entity;

import java.util.Scanner;

public class TuyenSinh implements ITuyenSinh {
	Scanner input = new Scanner(System.in);
	int n;
	private ThiSinh[] thisinh1;

	@Override
	public void themMoiThiSinh() {

		System.out.print("Nhập số thí sinh : ");
		n = input.nextInt();
		input.nextLine();
		thisinh1 = new ThiSinh[n];
		for (int i = 0; i < n; i++) {
			System.out.println("Thí sinh số " + (i + 1));
			System.out.print("Mời bạn chọn Khối (A - Khối A , B - Khối B, C - Khối C ) :");
			String Khoi = input.nextLine();
			switch (Khoi) {
			case "A":
				thisinh1[i] = new Khoi_A();
				thisinh1[i].ThongTin();
				break;
			case "B":
				thisinh1[i] = new Khoi_B();
				thisinh1[i].ThongTin();
				break;
			case "C":
				thisinh1[i] = new Khoi_C();
				thisinh1[i].ThongTin();
				break;
			}

		}

	}

	@Override
	public void hienThi() {
		for (int i = 0; i < thisinh1.length; i++) {
			if (thisinh1[i] instanceof Khoi_A) {
				thisinh1[i].hienThiThongTin();
				System.out.print("Thi khối A với các môn : " + ((Khoi_A) thisinh1[i]).getSubjects());
			} else if (thisinh1[i] instanceof Khoi_B) {
				thisinh1[i].hienThiThongTin();
				System.out.print("Thi khối B với các môn : " + ((Khoi_B) thisinh1[i]).getSubjects());
			} else {
				thisinh1[i].hienThiThongTin();
				System.out.print("Thi khối C với các môn : " + ((Khoi_C) thisinh1[i]).getSubjects());
			}
		}
	}

	@Override
	public void timKiem() {
		System.out.print("Nhập số báo danh cần tìm kiếm : ");
		int search = input.nextInt();
		for (int i = 0; i < thisinh1.length; i++) {
			if (thisinh1[i].getId() == search) {
				thisinh1[i].hienThiThongTin();
				if (thisinh1[i] instanceof Khoi_A) {
					System.out.print("Thi khối A với các môn : " + ((Khoi_A) thisinh1[i]).getSubjects());
				} else if (thisinh1[i] instanceof Khoi_B) {
					System.out.print("Thi khối B với các môn : " + ((Khoi_B) thisinh1[i]).getSubjects());
				} else {
					System.out.print("Thi khối C với các môn : " + ((Khoi_C) thisinh1[i]).getSubjects());
				}
			}
		}
	}

}
