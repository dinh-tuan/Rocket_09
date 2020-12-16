import java.util.Scanner;

public class Exercise_2_Q4 {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);

		System.out.print("Nhập số : ");
		int i = input.nextInt();
		int sum = 0;
		int n;
		while (i != 0) {
			n = i % 10;
			sum += n;
			i /= 10;
		}
		System.out.println("TỔng của từng phần tử trong số vừa nhập là :"+sum);

		input.close();
	}

}
