package Entity;

import java.util.Scanner;

public class News implements INews{
    private int id;
    private String title;
    private String publishDate;
    private String author;
    private String content;
    private float averageRate;
    private int[] rates;

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

    public int[] getRates() {
        return rates;
    }

    public void setRates(int[] rates) {
        this.rates = rates;
    }

    @Override
    public void display() {
        System.out.println("Title : " + title);
        System.out.println("Publish Date : " + publishDate);
        System.out.println("Author : " + author);
        System.out.println("Content : " + content);
        System.out.println("AverageRate : " + averageRate);
    }

    @Override
    public float calculate() {
        float temp = (float)(rates[0] + rates[1] + rates[2])/3;
        this.averageRate = temp;
        return temp;
    }

    public void insertNews(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Mời nhập title: ");
        this.title = scanner.nextLine();

        System.out.println("Mời nhập Publish Date: ");
        this.publishDate = scanner.nextLine();

        System.out.println("Mời nhập Author: ");
        this.author = scanner.nextLine();

        System.out.println("Mời nhập Content: ");
        this.content = scanner.nextLine();

        System.out.println("Mời nhập 3 đánh giá của bạn.");
        int[] rate_temp = new  int[3];
        for(int i=0; i<3; i++){
            System.out.println("Nhập đánh giá "+(i+1)+":");
            rate_temp[i] = scanner.nextInt();
        }
        this.rates = rate_temp;

    }
}