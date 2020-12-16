import java.util.Scanner;

public class Exercise_2_Q5 {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);

		System.out.print("Nhập số : ");
		int n = input.nextInt();
		int count = 0;
		System.out.print(n + " = ");
		for (int i = 2; i <= n; i++) {
			for (; n % i == 0; n /= i) {
				System.out.print((count++ != 0 ? " x " : "") + i);
			}

		}

	}

}
