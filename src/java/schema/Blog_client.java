/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Blog_client {
    private String blog_id;
    private String title;
    private String content;
    private Date publishDate;
    private String image;
    private String author;

    public Blog_client() {
    }

    public Blog_client(String blog_id, String title, String content, Date publishDate, String image, String author) {
        this.blog_id = blog_id;
        this.title = title;
        this.content = content;
        this.publishDate = publishDate;
        this.image = image;
        this.author = author;
    }

    public String getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(String blog_id) {
        this.blog_id = blog_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "Blog_client{" + "blog_id=" + blog_id + ", title=" + title + ", content=" + content + ", publishDate=" + publishDate + ", image=" + image + ", author=" + author + '}';
    }
   
}
