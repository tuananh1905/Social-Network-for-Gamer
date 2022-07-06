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
public class Message {
    private Integer ID;
    private Integer senderID;
    private Integer receiveID;
    private String content;
    private String image;
    private Date time;

    public Message() {
    }

    public Message(Integer ID, Integer senderID, Integer receiveID, String content, String image, Date time) {
        this.ID = ID;
        this.senderID = senderID;
        this.receiveID = receiveID;
        this.content = content;
        this.image = image;
        this.time = time;
    }

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Integer getSenderID() {
        return senderID;
    }

    public void setSenderID(Integer senderID) {
        this.senderID = senderID;
    }

    public Integer getReceiveID() {
        return receiveID;
    }

    public void setReceiveID(Integer receiveID) {
        this.receiveID = receiveID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    
    
    
}
