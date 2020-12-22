import java.util.Random;

public class Exercise_3 {

	public static void main(String[] args) {
		Random random = new Random();

		// giải đặc biệt
		int[] dacbiet = new int[5];
		System.out.print("Giải đặc biệt |");
		System.out.print("  ");
		for (int i = 0; i < 5; i++) {
			dacbiet[i] = random.nextInt(9);
			System.out.print(dacbiet[i]);
		}

		// giải nhất

		int[] nhat = new int[5];
		System.out.print("\nGiải nhất     |");
		System.out.print("  ");
		for (int i = 0; i < 5; i++) {
			nhat[i] = random.nextInt(9);
			System.out.print(nhat[i]);
		}

		// giải nhì
		int[] nhi = new int[10];
		System.out.print("\nGiải nhì      |");
		for (int i = 0; i < 10; i++) {
			nhi[i] = random.nextInt(9);
			if ((i) % 5 == 0) {
				System.out.print("  ");
			}
			System.out.print(nhi[i]);
		}

		// giải ba
		int[] ba = new int[30];
		System.out.print("\nGiải ba       |");
		for (int i = 0; i < 30; i++) {
			ba[i] = random.nextInt(9);
			if ((i) % 5 == 0) {
				System.out.print("  ");
			}
			System.out.print(ba[i]);
		}

		// giải tư
		int[] tu = new int[16];
		System.out.print("\nGiải tư       |");
		for (int i = 0; i < 16; i++) {
			tu[i] = random.nextInt(9);
			if ((i) % 4 == 0) {
				System.out.print("  ");
			}
			System.out.print(tu[i]);
		}

		// giải năm
		int[] nam = new int[24];
		System.out.print("\nGiải năm      |");
		for (int i = 0; i < 24; i++) {
			nam[i] = random.nextInt(9);
			if ((i) % 4 == 0) {
				System.out.print("  ");
			}
			System.out.print(nam[i]);
		}

		// giải sáu
		int[] sau = new int[9];
		System.out.print("\nGiải sáu      |");
		for (int i = 0; i < 9; i++) {
			sau[i] = random.nextInt(9);
			if ((i) % 3 == 0) {
				System.out.print("  ");
			}
			System.out.print(sau[i]);
		}

		// giải bảy
		int[] bay = new int[8];
		System.out.print("\nGiải bảy      |");
		for (int i = 0; i < 8; i++) {
			bay[i] = random.nextInt(9);
			if ((i) % 2 == 0) {
				System.out.print("  ");
			}
			System.out.print(bay[i]);
		}
		// Giải đặc biệt
		System.out.print("\nGiải đặc biệt là : " + dacbiet[3] + dacbiet[4]);

		// Lô giải nhất
		System.out.print("\nLô giải nhất là : " + nhat[3] + nhat[4]);

		// Lô giải nhì
		System.out.print("\nLô giải nhì là : ");
		for (int i = 0; i < 10; i++) {
			if (i % 3 == 0) {
				System.out.print(nhi[i]);
			}
		}

	}

}
