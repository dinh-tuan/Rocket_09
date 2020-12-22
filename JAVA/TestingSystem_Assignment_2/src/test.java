import java.util.Random;
import java.util.Scanner;

/**
 * Chương trình liệt kê tất cả các số nguyên tố nhỏ hơn n.
 * 
 * @author viettuts.vn
 */
public class test {

	public static void main(String[] args) {

		Random random = new Random();

		int[] arr = new int[100];
		for (int i = 0; i < 100; i++) {
			arr[i] = random.nextInt(100);
			System.out.print(" " + arr[i]);
		}

		// a)
		int max = arr[0];
		int max2 = arr[0];

		for (int i = 1; i < arr.length; i++) {
			if (max < arr[i]) {
				max = arr[i];
			}
			if (max2 < arr[i] && arr[i] != max) {
				max2 = arr[i];
			}
		}

		System.out.println("\nSố lớn nhất là : " + max);
		System.out.println("\nSố lớn thứ hai là : " + max2);

		// b)
		for (int i = 0; i < arr.length; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				if (arr[i] < arr[j]) {
					int tang = arr[i];
					arr[i] = arr[j];
					arr[j] = tang;
				}
			
			}
			System.out.print(" " +arr[i]);
		}
		
		// c) 
		

	}
}
