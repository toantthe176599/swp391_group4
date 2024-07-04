/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

/**
 *
 * @author LENOVO
 */
public class Blog {

    private String id, title, content, author, startDate, image, status, creator;

    public Blog() {
    }

    public Blog(String id, String title, String content, String author, String startDate, String image, String status, String creator) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.author = author;
        this.startDate = startDate;
        this.status = status;
        this.image = image;
        this.creator = creator;
    }

    public Blog(String title, String content, String author, String startDate, String image, String status, String creator) {
        this.title = title;
        this.content = content;
        this.author = author;
        this.startDate = startDate;
        this.status = status;
        this.image = image;
        this.creator = creator;
    }

    public String getImage() {
        return image;
    }

    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public String getAuthor() {
        return author;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getStatus() {
        return status;
    }

    public String getCreator() {
        return creator;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

}
