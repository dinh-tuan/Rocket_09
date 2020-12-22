package com.vti.entity;

import java.time.LocalDate;

public class Program {

	public static void main(String[] args) {
		// create Department
		Department Department1 = new Department();
		Department1.id = 1;
		Department1.name = "Sale";

		Department Department2 = new Department();
		Department2.id = 2;
		Department2.name = "Marketing";

		Department Department3 = new Department();
		Department3.id = 3;
		Department3.name = "Manager";

		Department Department4 = new Department();
		Department4.id = 4;
		Department4.name = "Engineer";

		// create Position
		Position Position1 = new Position();
		Position1.id = 1;
		Position1.name = PositionName.Dev;

		Position Position2 = new Position();
		Position2.id = 2;
		Position2.name = PositionName.Test;

		Position Position3 = new Position();
		Position3.id = 3;
		Position3.name = PositionName.Scrum_Master;

		Position Position4 = new Position();
		Position4.id = 1;
		Position4.name = PositionName.PM;

		// create Group
		Group Group1 = new Group();
		Group1.id = 1;
		Group1.name = "1 con vịt";
		Group1.createDate = LocalDate.of(2002, 01, 01);

		Group Group2 = new Group();
		Group2.id = 2;
		Group2.name = "2 con vịt";
		Group2.createDate = LocalDate.of(2003, 01, 01);

		// create Account
		Account Account1 = new Account();
		Account1.id = 1;
		Account1.email = "tuan@gmail.com";
		Account1.userName = "Tuấn";
		Account1.fullName = "Đình Văn Tuấn";
		Account1.department = Department1;
		Account1.position = Position1;
		Account1.createDate = LocalDate.of(2020, 07, 23);

		Group[] groupOfAccount1 = { Group1, Group2 };
		Account1.group = groupOfAccount1;
		Account[] accountOfGroup = { Account1 };
		Group1.account = accountOfGroup;

		// create TypeQuestion
		TypeQuestion TypeQuestion1 = new TypeQuestion();
		TypeQuestion1.id = 1;
		TypeQuestion1.name = TypeName.Essay;

		TypeQuestion TypeQuestion2 = new TypeQuestion();
		TypeQuestion2.id = 2;
		TypeQuestion2.name = TypeName.Multiple_Choice;

		// CategoryQuestion
		CategoryQuestion CategoryQuestion1 = new CategoryQuestion();
		CategoryQuestion1.id = 1;
		CategoryQuestion1.name = "Java";

		CategoryQuestion CategoryQuestion2 = new CategoryQuestion();
		CategoryQuestion2.id = 2;
		CategoryQuestion2.name = ".NET";

		CategoryQuestion CategoryQuestion3 = new CategoryQuestion();
		CategoryQuestion3.id = 3;
		CategoryQuestion3.name = "SQL";

		CategoryQuestion CategoryQuestion4 = new CategoryQuestion();
		CategoryQuestion4.id = 4;
		CategoryQuestion4.name = "Ruby";

		// create Question
		Question Question1 = new Question();
		Question1.id = 1;
		Question1.content = "How much ?";
		Question1.category = CategoryQuestion4;
		Question1.type = TypeQuestion1;
		Question1.createDate = LocalDate.of(2020, 01, 20);

		Question Question2 = new Question();
		Question2.id = 2;
		Question2.content = "Do you love me ?";
		Question2.category = CategoryQuestion2;
		Question2.type = TypeQuestion1;
		Question2.createDate = LocalDate.of(2020, 02, 20);

		Question Question3 = new Question();
		Question3.id = 3;
		Question3.content = "What is your name ?";
		Question3.category = CategoryQuestion4;
		Question3.type = TypeQuestion2;
		Question3.createDate = LocalDate.of(2020, 12, 20);

		Question Question4 = new Question();
		Question4.id = 4;
		Question4.content = "Trick or treat ?";
		Question4.category = CategoryQuestion1;
		Question4.type = TypeQuestion1;
		Question4.createDate = LocalDate.of(2020, 07, 20);

		// create Answer
		Answer Answer1 = new Answer();
		Answer1.id = 1;
		Answer1.content = "19000vnđ";
		Answer1.question = Question1;
		Answer1.isCorrect = true;

		Answer Answer2 = new Answer();
		Answer2.id = 2;
		Answer2.content = "No";
		Answer2.question = Question2;
		Answer2.isCorrect = true;

		Answer Answer3 = new Answer();
		Answer3.id = 3;
		Answer3.content = "20 year old";
		Answer3.question = Question3;
		Answer3.isCorrect = false;

		Answer Answer4 = new Answer();
		Answer4.id = 4;
		Answer4.content = "Trick";
		Answer4.question = Question4;
		Answer4.isCorrect = true;

		// create Exam
		Exam Exam1 = new Exam();
		Exam1.id = 1;
		Exam1.code = "A001";
		Exam1.title = "Check";
		Exam1.categoryQuestion = CategoryQuestion1;
		Exam1.duration = 20;
		Exam1.createDate = LocalDate.of(2020, 03, 22);

		Exam Exam2 = new Exam();
		Exam2.id = 2;
		Exam2.code = "A002";
		Exam2.title = "Check";
		Exam2.categoryQuestion = CategoryQuestion2;
		Exam2.duration = 20;
		Exam2.createDate = LocalDate.of(2020, 03, 14);

		Exam Exam3 = new Exam();
		Exam3.id = 3;
		Exam3.code = "A003";
		Exam3.title = "Check";
		Exam3.categoryQuestion = CategoryQuestion3;
		Exam3.duration = 20;
		Exam3.createDate = LocalDate.of(2020, 8, 14);

		// question Of Exam
		Question[] questionOfExam1 = { Question4 };
		Exam1.Question = questionOfExam1;
		Question[] questionOfExam2 = { Question4 };
		Exam2.Question = questionOfExam2;
		Question[] questionOfExam3 = { Question4, Question3 };
		Exam3.Question = questionOfExam3;

		// Print
		System.out.println("Account 1 la : " + Account1.email);
		System.out.println("Answer 1 la : " + Answer1.content);
		System.out.println("CategoryQuestion 1 la : " + CategoryQuestion1.name);
		System.out.println("Exam 1 la : " + Exam1.code);
		System.out.println("Department 1 la : " + Department1.name);
		System.out.println("Group 1 la : " + Group1.name);
		System.out.println("Position 1 la : " + Position1.name);
		System.out.println("Question 1 la : " + Question1.content);
		System.out.println("TypeQuestion 1 la : " + TypeQuestion1.name);

	}
}
