/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import modal.Friend;
import modal.User;

/**
 *
 * @author duynh
 */
public class FriendDao {
    
    DBContext db = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    Connection connection = null;
    
     public FriendDao() {
        db = new DBContext();
    }
    
    public ArrayList<Friend> getFriendList(int id) {
        String sql = "select [User].ID as 'UseriD', [User].displayname as 'Displayname', [User].avatar as 'UserAvatar',ftime from ( select UserID2,Friend.[time] as 'ftime' from [Friend]\n"
                + "                    where UserID1 = ? and [status] = 0\n"
                + "                union \n"
                + "                select UserID1,Friend.[time] as 'ftime' from [Friend]\n"
                + "                where UserID2 = ? and [status] = 0) as f\n"
                + "  join [User] on [User].[ID] = f.UserID2";
        ArrayList<Friend> printList = new ArrayList<>();
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setInt(2, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                User friend = new User();
                friend.setID(rs.getInt("UseriD"));
                if (rs.getBytes("UserAvatar") != null) {
                    friend.setAvatar(Base64.getEncoder().encodeToString(rs.getBytes("UserAvatar")));
                } else {
                    friend.setAvatar(null);
                }
                friend.setDisplayname(rs.getString("displayname"));

                Friend f = new Friend();
                f.setUserID2(friend);
                f.setStatus(0);
                f.setTime(rs.getDate("ftime"));
                printList.add(f);
            }
        } catch (Exception ex) {
            Logger.getLogger(FriendDao.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
            }
            if (stm != null) {
                try {
                    stm.close();
                } catch (Exception e) {
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (Exception e) {
                }
            }
        }
        return printList;
    }


    public int getTotalFriend(int id) {
        ArrayList<Friend> getList = getFriendList(id);
        int count = 0;
        for (Friend f : getList) {
            count++;
        }
        return count;
    }
    
    public void pendingFriend() {
        String sql = "INSERT INTO [Friend]\n"
                + "           ([UserID1]\n"
                + "           ,[UserID2]\n"
                + "           ,[status]\n"
                + "           ,[time])\n"
                + "     VALUES\n"
                + "           (?,\n"
                + "		   ?,\n"
                + "		   ?,\n"
                + "		   ?)";

    }

    public void acceptFriend() {
        String sql = "UPDATE [Friend]\n"
                + "   SET [status] =? \n"
                + "      ,[time] = ?\n"
                + " WHERE UserID1 = ?";
    }

    public void cancelFriendRequest() {
        String sql = "DELETE FROM [Friend]\n"
                + "      WHERE UserID1 = ?";
    }

    public void denielFriendRequest() {
        String sql = "DELETE FROM [Friend]\n"
                + "      WHERE UserID1 = ?";
    }

}
