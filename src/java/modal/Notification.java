/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import java.util.Date;

/**
 *
 * @author TuanAnh
 */
public class Notification {
    private int ID;
    private int UserID;
    private int PostID;
    private String typeOfNotification;
    private String content;
    private Date time;

    public Notification() {
    }

    public Notification(int ID, int UserID, int PostID, String typeOfNotification, String content, Date time) {
        this.ID = ID;
        this.UserID = UserID;
        this.PostID = PostID;
        this.typeOfNotification = typeOfNotification;
        this.content = content;
        this.time = time;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public int getPostID() {
        return PostID;
    }

    public void setPostID(int PostID) {
        this.PostID = PostID;
    }

    public String getTypeOfNotification() {
        return typeOfNotification;
    }

    public void setTypeOfNotification(String typeOfNotification) {
        this.typeOfNotification = typeOfNotification;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
    
}
