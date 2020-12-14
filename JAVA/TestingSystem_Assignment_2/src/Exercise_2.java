import java.util.Scanner;

public class Exercise_2 {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		/*
		 * Question 1: Nhập số liệu cho dãy số thực a0 , a1 ,..., an-1 . Hãy liệt kê các
		 * phần tử xuất hiện trong dãy đúng một lần
		 */

		System.out.print("Nhập số phần tử mảng : ");
		int n = input.nextInt();
		double[] Q1 = new double[n];
		System.out.print("Nhập phần tử của mảng : ");
		for (int i = 0; i < n; i++) {
			Q1[i] = input.nextDouble();
		}

		for (int i = 0; i < Q1.length; i++) {
			for (int j = i + 1; j < Q1.length; j++) {
				if (Q1[i] == Q1[j]) {
					Q1[i] = 0;
				}

			}
			if (Q1[i] != 0) {
				System.out.print(Q1[i] + " | ");
			}

		}

		/*
		 * Question 2: Nhập số liệu cho dãy số thực a0 , a1 ,..., an-1. Hãy liệt kê các
		 * phần tử xuất hiện trong dãy đúng 2 lần.
		 */
		/*
		 * System.out.println("Question 2 "); int count; for (int i = 0; i < Q1.length;
		 * i++) { count = 1; for (int j = i + 1; j < Q1.length; j++) { if (Q1[i] ==
		 * Q1[j]) { count++; Q1[j] = 0; }
		 * 
		 * } if (Q1[i] != 0) { Q1[i] = count; System.out.println(count); }
		 * 
		 * }
		 */
	}

}
