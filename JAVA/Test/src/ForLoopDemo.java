
public class ForLoopDemo {

	public static void main(String[] args) {
		for (int i = 20; i >= 0; i--) {
			if(i == 10) {
				break;
			}
			if(i%2 == 0) {
				continue;
			}
			System.out.println(i);
		}

	}

}
