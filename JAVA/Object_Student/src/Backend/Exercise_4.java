package Backend;

import java.util.Scanner;

import Entity.Student;

public class Exercise_4 {
	public void Q1() {
		Scanner input = new Scanner(System.in);

		Student Student1 = new Student("Tuấn", "Hà Nội");
		System.out.print("Điểm của học sinh là :");
		int p = input.nextInt();
		Student1.setDiem(p);
		System.out.print("Cộng thêm :");
		int n = input.nextInt();
		Student1.Student(n);
		System.out.println(Student1.StudentPhanLoai(n + p));
		Student1.studentPrinter(Student1);

		input.close();

	}
}
