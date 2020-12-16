import java.util.Scanner;

public class Exercise_2_Q123 {

	public static int count(int a[], int n, int i) {
		int count = 0;
		for (int j = 0; j < n; j++) {
			if (a[j] == i)
				count++;
		}
		return (count);
	}

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);

		System.out.print("Nhập số phần tử : ");
		int n = input.nextInt();
		int[] array = new int[n];
		for (int i = 0; i < n; i++) {
			System.out.print("Nhập phần tử thứ " + (i + 1) + " : ");
			array[i] = input.nextInt();
		}
		// Q1 :
		System.out.print("Các phần tử xuất hiện 1 lần : ");
		for (int i = 0; i < n; i++) {
			if (count(array, n, array[i]) == 1)
				System.out.print(" " + array[i]);
		}
		// Q2
		System.out.print("\nCác phần tử xuất hiện 2 lần : ");
		for (int i = 0; i < n; i++) {
			if (count(array, n, array[i]) == 2 && count(array, i, array[i]) == 0)
				System.out.print(" " + array[i]);
		}
		// Q3
		for (int i = 0; i < n; i++) {
			if (count(array, i, array[i]) == 0) {
				System.out.println("\nPhan tu " + array[i] + " xuat hien " + count(array, n, array[i]) + " lan");
			}
		}
		
		input.close();
	}

}
