import java.util.Scanner;

public class Exercise_2 {

	public static void main(String[] args) {
//		Q1();
//		Q2();
//		Q3();
//		Q4();
//		Q5();
//		Q6();
		Q7();

	}

	public static void Q1() {
		Scanner input = new Scanner(System.in);

		System.out.print("Nhập họ và Tên : ");
		String hoten = input.nextLine();

		System.out.printf("%S", hoten);

		input.close();
	}

	public static void Q2() {
		Scanner input = new Scanner(System.in);

		System.out.print("Nhập xâu : ");
		String hoten = input.nextLine();
		char c = 'a';
		int count = 0;

		System.out.print("Vị trí của a là : ");
		for (int i = 0; i < hoten.length(); i++) {
			if (c == hoten.charAt(i)) {
				count++;
				System.out.print(" " + i);
			}
		}
		System.out.println("\nSố lần xuất hiện của a trong chuỗi là : " + count);

		input.close();
	}

	public static void Q3() {

		Scanner input = new Scanner(System.in);

		System.out.print("Nhập xâu : ");
		String s = input.nextLine();
		System.out.print("Nhập x ");
		char x = input.next().charAt(0);
		System.out.print("Nhập y ");
		char y = input.next().charAt(0);

		System.out.println("Xâu sau khi đổi x -> y :");
		for (int i = 0; i < s.length(); i++) {
			if (x == s.charAt(i)) {
				s = s.replace(x, y);
			}
		}

		System.out.print(s);

		input.close();
	}

	public static void Q4() {
		Scanner input = new Scanner(System.in);
		System.out.print("Nhập xâu : ");
		String s = input.nextLine();

		// sử dụng phương thức StringBuffer(String string)
		// Đảo ngược bộ đệm đó và sau đó biến đổi bộ đệm vào trong một String với sự
		// giúp đỡ của phương thức toString() trong Java.
		String x = new StringBuffer(s).reverse().toString();
		System.out.print("Xâu sau khi đảo ngược : " + x);

		input.close();
	}

	public static void Q5() {
		Scanner input = new Scanner(System.in);

		System.out.print("Nhập xâu : ");
		String s = input.nextLine();

		for (int i = 0; i < s.length(); i++) {
			System.out.println("số " + i + " là chữ " + s.charAt(i));
		}

		input.close();
	}

	public static void Q6() {
		Scanner input = new Scanner(System.in);

		String s = "Java-Nơi trí tưởng tượng bay xa";
		String[] a = s.split("[ \\-]");
		for (int i = 0; i < a.length; i++) {
			System.out.println("a[" + i + "]" + "  " + a[i]);
		}

//		for (String w : a) {
//			System.out.println(w);
//		}

		input.close();
	}

	public static void Q7() {
		Scanner input = new Scanner(System.in);

		String userName = "tuan";
		String passWord = "1234";
		String user;
		String pass;

		do {
			System.out.println("|------------------");
			System.out.print("|Nhập user name :");
			user = input.next();
			System.out.println("|------------------");
			System.out.print("|Nhập password :");
			pass = input.next();
			System.out.println("|------------------");
		} while (userName.equals(user) == false || passWord.equals(pass) == false);

		System.out.println("Đăng Nhập thành công!!");
		input.close();
	}

}
