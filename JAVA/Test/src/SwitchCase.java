
public class SwitchCase {

	public static void main(String[] args) {
		int x = 3;

		switch (x) {
		// 1 or 2
		case 1:
		case 2:
			System.out.println("case 2");
			break;
		case 1 + 2:
			System.out.println("case 3");
			break;
		default:
			System.out.println("default");
			break;
		}

	}

}
