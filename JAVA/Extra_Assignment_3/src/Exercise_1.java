import java.util.Scanner;

public class Exercise_1 {

	public static void main(String[] args) {
//		Q12();
//		Q3();
//		Q4();
		Q5();
	}

	public static void Q12() {
		Scanner input = new Scanner(System.in);

		System.out.print("Nhập số phần tử : ");
		int n = input.nextInt();
		double[] Q12 = new double[n];
		for (int i = 0; i < n; i++) {
			System.out.print("Nhập phần tử thứ " + (i + 1) + " : ");
			Q12[i] = input.nextDouble();
		}

		double sum1 = 0;
		for (int i = 0; i < n; i++) {
			sum1 += Q12[i];
		}

		System.out.println("Tổng phần tử trong dãy là : " + sum1);
		System.out.printf("Trung bình phần tử trong dãy là : %.02f", sum1 / n);

		double sum2 = 0;
		for (int i = 0; i < n; i++) {
			if (Q12[i] < 0) {
				sum2 += Q12[i];
			}
		}
		System.out.println("\nTổng các số âm phần tử trong dãy là : " + sum2);

		double sum3 = 0;
		for (int i = 0; i < n; i++) {
			if (Q12[i] > 0) {
				sum3 += Q12[i];
			}
		}
		System.out.println("Tổng các số dương phần tử trong dãy là : " + sum3);

		double sum4 = 0;
		for (int i = 0; i < n; i++) {
			if (Q12[i] % 2 == 0) {
				sum4 += Q12[i];
			}
		}
		System.out.println("Tổng các chẵn phần tử trong dãy là : " + sum4);

		double sum5 = 0;
		for (int i = 0; i < n; i++) {
			if (Q12[i] % 2 != 0) {
				sum5 += Q12[i];
			}
		}
		System.out.println("Tổng các số lẻ phần tử trong dãy là : " + sum5);

		System.out.print("Nhập x : ");
		double x = input.nextDouble();
		for (int i = 0; i < n; i++) {

			if (Q12[i] == x) {
				System.out.println("vị trí xuất hiện đầu tiên của phần tử " + x + "là " + i);
				break;
			}

		}
		input.close();
	}

	public static void Q3() {
		Scanner input = new Scanner(System.in);

		int[] Q3 = new int[16];
		for (int i = 0; i < 16; i++) {
			System.out.print("nhập số phần tử thứ " + (i + 1) + ": ");
			Q3[i] = input.nextInt();
		}

		for (int i = 0; i < 16; i++) {
			System.out.print(Q3[i]);
			if ((i + 1) % 4 == 0) {
				System.out.print("\n");
			}
		}

		input.close();
	}

	public static void Q4() {
		Scanner input = new Scanner(System.in);

		System.out.print("Nhập số phần tử :");
		int n = input.nextInt();
		int[] Q4 = new int[n];

		for (int i = 0; i < n; i++) {
			System.out.print("Số " + (i + 1) + " là ");
			Q4[i] = input.nextInt();
		}

		System.out.print("Tăng :");
		for (int i = 0; i < n; i++) {
			for (int j = i + 1; j < n; j++) {
				if (Q4[i] > Q4[j]) {
					int tang = Q4[i];
					Q4[i] = Q4[j];
					Q4[j] = tang;
				}
			}
			System.out.print(" " + Q4[i]);
		}

		System.out.print("\nGiảm :");
		for (int i = 0; i < n; i++) {
			for (int j = i + 1; j < n; j++) {
				if (Q4[i] < Q4[j]) {
					int tang = Q4[i];
					Q4[i] = Q4[j];
					Q4[j] = tang;
				}
			}
			System.out.print(" " + Q4[i]);
		}
		
		input.close();
	}
	
	public static void Q5() {
		Scanner input = new Scanner(System.in);

		System.out.println("Nhập số phần tử :");
		int n = 10;
		int[] Q4 = new int[n];

		for (int i = 0; i < n; i++) {
			System.out.print("Số " + (i + 1) + " là ");
			Q4[i] = input.nextInt();
		}

		System.out.print("Tăng :");
		for (int i = 0; i < n; i++) {
			for (int j = i + 1; j < n; j++) {
				if (Q4[i] > Q4[j]) {
					int tang = Q4[i];
					Q4[i] = Q4[j];
					Q4[j] = tang;
				}
			}
			System.out.print(" " + Q4[i]);
		}

		System.out.print("\nGiảm :");
		for (int i = 0; i < n; i++) {
			for (int j = i + 1; j < n; j++) {
				if (Q4[i] < Q4[j]) {
					int tang = Q4[i];
					Q4[i] = Q4[j];
					Q4[j] = tang;
				}
			}
			System.out.print(" " + Q4[i]);
		}
		
		input.close();
	}
}
