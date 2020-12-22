import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;

public class nhap {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.println("Nhập số :");
		int x = input.nextInt();
		int[] mang = new int[x];
		for (int i = 0; i < x; i++) {
			System.out.println("số thứ " + (i + 1));
			mang[i] = input.nextInt();
		}
		for (int mang1 : mang) {
			System.out.print(mang1);
		}

		input.close();
	}
}