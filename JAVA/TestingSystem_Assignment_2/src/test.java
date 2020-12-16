import java.util.Scanner;

/**
 * Chương trình liệt kê tất cả các số nguyên tố nhỏ hơn n.
 * 
 * @author viettuts.vn
 */
public class test {

	public static boolean isPrimeNumber(int n) {
		// so nguyen n < 2 khong phai la so nguyen to
		if (n < 2) {
			return false;
		}
		// check so nguyen to khi n >= 2
		for (int i = 2; i <= n; i++) {
			if (n % i == 0) {
				return false;
			}
		}
		return true;
	}

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		System.out.print("Nhập n = ");
		int n = scanner.nextInt();
		System.out.printf("Tất cả các số nguyên tố nhỏ hơn %d là: \n", n);
		if (n >= 2) {
			System.out.print(2);
		}
		for (int i = 3; i < n; i += 2) {
			if (isPrimeNumber(i)) {
				System.out.print(" " + i);
			}
		}
	}

}
