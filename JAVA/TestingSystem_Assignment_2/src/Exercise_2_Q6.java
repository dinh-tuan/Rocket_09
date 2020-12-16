import java.util.Scanner;

public class Exercise_2_Q6 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("Nhập n = ");
		int n = scanner.nextInt();

		for (int i = 1; i < n; i++) {
			int count = 0;
			for (int j = 1; j <= i; j++) {
				if (i % j == 0) {
					count++;
				}
			}
			if (count == 2) {
				System.out.print(" " + i);
			}
		}

	}

}
