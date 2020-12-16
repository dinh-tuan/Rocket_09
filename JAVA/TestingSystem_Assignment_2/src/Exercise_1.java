import java.util.Scanner;

public class Exercise_1 {

	public static void main(String[] args) {

		
		Scanner input = new Scanner(System.in);
		/*
		 * Question 1: Viết chương trình nhập vào một số thực. Đơn vị tính cho số này là
		 * centimet (cm). Hãy in ra số tương đương tính bằng foot (số thực, có 2 số lẻ
		 * thập phân) và inch (số thực, có 2 số lẻ thập phân). Với 1 inch = 2.54 cm và 1
		 * foot = 12 inches
		 */
		

		System.out.print("Nhập só thực (cm) : ");
		double so_thuc = input.nextDouble();
		double inch = so_thuc / 2.54;
		System.out.printf("Inch = %.2f \n", inch);
		double foot = inch / 12;
		System.out.printf("Foot = %.2f \n", foot);

		// %.2f
		/*
		 * Question 2: Viết chương trình nhập vào số giây từ 0 tới 68399, đổi số giây
		 * này thành dạng [giờ:phút:giây], mỗi thành phần là một số nguyên có 2 chữ số.
		 * Ví dụ: 02:11:05
		 */

		System.out.print("Nhập vào số giây từ 0 - 68399 : ");
		int so_giay = input.nextInt();
		if (so_giay >= 0 && so_giay <= 68399) {
			int so_phut = so_giay / 60;
			int so_gio = so_phut / 60;
			System.out.printf("giờ giấc là : %02d:%02d:%02d \n", so_gio, (so_phut % 60), (so_giay % 60));
		} else {
			System.out.println("số giây nhập không trong giới hạn từ 0 - 68399");
		}

//		if (so_giay >= 0 && so_giay <= 68399) {
//			String giay = String.format("%02d", so_giay % 60);
//			String phut = String.format("%02d", so_phut % 60);
//			String gio = String.format("%02d", so_gio);
//			System.out.println("giờ giấc là : " + gio + ":" + phut + ":" + giay);
//		} else {
//			System.out.print("số giây nhập không trong giới hạn từ 0 - 68399");
//		}

		/*
		 * Question 3: Viết chương trình nhập vào 4 số nguyên. Hiển thị ra số lớn nhất
		 * và nhỏ nhất Ví dụ: nhập vào 4 số 1,2,3,4 thì kết quả là: Số lớn nhất là: 4 Số
		 * nhỏ nhất là: 1
		 */

		System.out.println("Nhập 4 số vào đây :");
		System.out.print("+ Số thứ nhất : ");
		int so_thu_nhat = input.nextInt();
		System.out.print("+ Số thứ hai : ");
		int so_thu_hai = input.nextInt();
		System.out.print("+ Số thứ ba : ");
		int so_thu_ba = input.nextInt();
		System.out.print("+ Số thứ tư : ");
		int so_thu_tu = input.nextInt();

		int Q3[] = { so_thu_nhat, so_thu_hai, so_thu_ba, so_thu_tu };

		int Max = Q3[0], Min = Q3[0];// giả sử Max Q3[0] chứa phần tử cao nhất, Min Q3[0] thì ngược lại

		for (int i = 1; i < Q3.length; i++) {
			if (Max < Q3[i]) {
				Max = Q3[i];
			}
			if (Min > Q3[i]) {
				Min = Q3[i];
			}
		}

		System.out.println("Số lớn nhất là : " + Max);
		System.out.println("Số bé nhất là : " + Min);

		/*
		 * Question 4: Nhập vào hai số tự nhiên a và b. Tính hiệu của hai số đó. Nếu
		 * hiệu số lớn hơn 0 thì in ra dòng chữ [Số thứ nhất lớn hơn số thứ hai]. Nếu
		 * hiệu số nhỏ hơn 0 thì in ra dòng chữ [Số thứ nhất nhỏ hơn số thứ hai].
		 */

		System.out.print("Nhập số a : ");
		int a = input.nextInt();
		System.out.print("Nhập số b : ");
		int b = input.nextInt();
		int c = a - b;
		if (c > 0) {
			System.out.println("a lớn hơn b");
		} else if (c == 0) {
			System.out.println("a bằng b");
		} else {
			System.out.println("b lớn hơn a");
		}

//		Question 5: Nhập vào 2 số tự nhiên a và b. Kiểm tra xem a có chia hết cho b không

		int d = a % b;
		if (d == 0) {
			System.out.println("a chia hết cho b");
		} else {
			System.out.println("a không chia hết cho b");
		}

		/*
		 * Question 6: Xếp loại sinh viên theo các qui luật dưới đây: Nếu điểm >= 9.0 -
		 * Loại xuất sắc Nếu 8.0<= điểm < 9.0 - Loại giỏi Nếu 7.0<= điểm < 8.0 - Loại
		 * khá Nếu 6.0 <= điểm < 7.0 - Loại trung bình khá Nếu 5.0 <= điểm < 6.0 - Loại
		 * trung bình Nếu điểm < 5.0 - Loại kém Với điểm = ( (điểm toán)*2 + điểm lý +
		 * điểm hóa )/4 Viết Chương trình: a. Nhập vào điểm 3 môn học b. Tính điểm trung
		 * bình c. Xác định học lực của học sinh dựa trên điểm trung bình d. Hiển thị
		 * học lực của học sinh
		 */

		System.out.print("Nhập điểm toán : ");
		int diem_toan = input.nextInt();
		System.out.print("Nhập điểm lý : ");
		int diem_ly = input.nextInt();
		System.out.print("Nhập điểm hóa : ");
		int diem_hoa = input.nextInt();

		int diem_trung_binh = ((diem_toan) * 2 + diem_ly + diem_hoa) / 4;
		System.out.println("Điểm trung bình là : " + diem_trung_binh);

		if (diem_trung_binh >= 9) {
			System.out.println("Loại xuất sắc");
		} else if (8 <= diem_trung_binh && diem_trung_binh < 9) {
			System.out.println("Loại giỏi");
		} else if (7 <= diem_trung_binh && diem_trung_binh < 8) {
			System.out.println("Loại khá ");
		} else if (6 <= diem_trung_binh && diem_trung_binh < 7) {
			System.out.println("Loại trung bình khá ");
		} else if (5 <= diem_trung_binh && diem_trung_binh < 6) {
			System.out.println("Loại trung bình ");
		} else {
			System.out.println("Loại kém");
		}

		input.close();
	}

}
