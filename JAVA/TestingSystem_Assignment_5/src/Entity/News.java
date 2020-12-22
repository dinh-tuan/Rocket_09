package Entity;

import java.util.Scanner;

public class News implements INews {
	private int id;
	private String title;
	private String publishDate;
	private String author;
	private String content;
	private float averageRate;

//	public News(int id, String title, String publishDate, String author, String content) {
//		this.id = id;
//		this.title = title;
//		this.publishDate = publishDate;
//		this.author = author;
//		this.content = content;
//	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public float getAverageRate() {
		return averageRate;
	}

	public void Display() {
		System.out.println("Title : " + title);
		System.out.println("PublishDate : " + publishDate);
		System.out.println("Author : " + author);
		System.out.println("Content : " + content);
		System.out.println("AverageRate : " + averageRate);

	}

	public float Calculate() {
		Scanner input = new Scanner(System.in);
		float[] Rates = new float[3];
		System.out.println("Nhập 1");
		Rates[0] = input.nextFloat();
		System.out.println("Nhập 2");
		Rates[1] = input.nextFloat();
		System.out.println("Nhập 3");
		Rates[2] = input.nextFloat();
		averageRate = (float)(Rates[0] + Rates[1] + Rates[2])/3;
		return averageRate;

	}

	public void insertNews() {
		Scanner input = new Scanner(System.in);
//		News news1 = new News(1, "A", "2002/02/02", "Tuấn", "TRuyện tranh");
		System.out.println("nhập title :");
		this.title = input.nextLine();
		System.out.println("nhập PublishDate :");
		this.publishDate = input.nextLine();
		System.out.println("nhập author :");
		this.author = input.nextLine();
		System.out.println("nhập Content :");
		this.content = input.nextLine();
	}

}
