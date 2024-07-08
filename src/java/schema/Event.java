/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

import java.util.List;

/**
 *
 * @author LENOVO
 */
public class Event {

    private String id, name, title, artist, organizer, description, startTime, startDate, destination, status, category, area_quantity;
    private String img_event, img_position;
    private List<AreaEvent> areas;

    public Event() {
    }

    private Event(buildEvent build) {
        
        this.id = build.id;
        this.name = build.name;
        this.title = build.title;
        this.artist = build.artist;
        this.organizer = build.organizer;
        this.description = build.description;
        this.startTime = build.startTime;
        this.startDate = build.startDate;
        this.destination = build.destination;
        this.status = build.status;
        this.category = build.category;
        this.area_quantity = build.area_quantity;
        this.areas = build.areas;
        this.img_event = build.img_event;
        this.img_position = build.img_position;
     
    }



    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getTitle() {
        return title;
    }

    public String getArtist() {
        return artist;
    }

    public String getOrganizer() {
        return organizer;
    }

    public String getDescription() {
        return description;
    }

    public String getImg_event() {
        return img_event;
    }

    public String getImg_position() {
        return img_position;
    }

    public String getStartTime() {
        return startTime;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getDestination() {
        return destination;
    }

    public String getStatus() {
        return status;
    }

    public String getCategory() {
        return category;
    }

    public String getArea_quantity() {
        return area_quantity;
    }

    public List<AreaEvent> getAreas() {
        return areas;
    }

    public static class buildEvent {

        private String id, name, title, artist, organizer, description, startTime, startDate, destination, status, category, area_quantity;
        private String img_event, img_position;
        private List<AreaEvent> areas;

        public buildEvent setId(String id) {
            this.id = id;
            return this;
        }

        public buildEvent setImgEvent(String imgevent) {
            this.img_event = imgevent;
            return this;
        }

        public buildEvent setImgPosition(String imgposition) {
            this.img_position = imgposition;
            return this;
        }

        public buildEvent setName(String name) {
            this.name = name;
            return this;
        }

        public buildEvent setArtist(String artist) {
            this.artist = artist;
            return this;
        }

        public buildEvent setOrganizer(String organizer) {
            this.organizer = organizer;
            return this;
        }

        public buildEvent setDescription(String description) {
            this.description = description;
            return this;
        }

        public buildEvent setStartTime(String startTime) {
            this.startTime = startTime;
            return this;
        }

        public buildEvent setStartDate(String startDate) {
            this.startDate = startDate;
            return this;
        }

        public buildEvent setDestination(String destination) {
            this.destination = destination;
            return this;
        }

        public buildEvent setStatus(String status) {
            this.status = status;
            return this;
        }

        public buildEvent setCategory(String category) {
            this.category = category;
            return this;
        }

        public buildEvent setArea_quantity(String area_quantity) {
            this.area_quantity = area_quantity;
            return this;
        }

        public buildEvent setAreas(List<AreaEvent> areas) {
            this.areas = areas;
            return this;
        }

        public buildEvent setTitle(String title) {
            this.title = title;
            return this;
        }

        public Event build() {
            return new Event(this);
        }

    }
 @Override
        public String toString() {
            return "buildEvent{" + "id=" + id + ", name=" + name + ", title=" + title + ", artist=" + artist + ", organizer=" + organizer + ", description=" + description + ", startTime=" + startTime + ", startDate=" + startDate + ", destination=" + destination + ", status=" + status + ", category=" + category + ", area_quantity=" + area_quantity + ", img_event=" + img_event + ", img_position=" + img_position + ", areas=" + areas + '}';
        }
}
