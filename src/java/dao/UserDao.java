/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modal.Game;
import modal.User;

/**
 *
 * @author LENNOVO
 */
public class UserDao {

    DBContext db = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    Connection connection = null;

    public UserDao() {
        db = new DBContext();
    }

    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        try {
            connection = db.getConnection();
            String sql = "SELECT [ID]\n"
                    + "      ,[displayname]\n"
                    + "  FROM [User]";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setID(rs.getInt("ID"));
                u.setDisplayname(rs.getString("displayname"));
                list.add(u);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return list;
    }

    public User Login(String username, String password) {

        try {
            connection = db.getConnection();
            String sql = "select u.id, u.username, u.password, u.[role] from [User] u where u.username = ? and u.password = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                User account = new User();
                account.setID(rs.getInt("id"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setAdmin(rs.getBoolean("role"));
                return account;
            }

        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    public User getUserById(int id) {
        try {
            connection = db.getConnection();
            String sql = "select u.id, u.typeOfAccount, u.username, u.displayname, u.dob, u.gender, u.[role], u.QuestionID,u.answer, u.avatar, u.password from [User] u where u.id = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                User account = new User();
                account.setID(rs.getInt("id"));
                account.setUsername(rs.getString("username"));
                account.setTypeOfAccount(rs.getInt("typeOfAccount"));
                account.setDisplayname(rs.getString("displayname"));
                account.setDob(rs.getDate("dob"));
                account.setGender(rs.getString("gender"));
                account.setAdmin(rs.getBoolean("role"));
                account.setQuestionID(rs.getInt("questionid"));
                account.setAnswer(rs.getString("answer"));
                account.setAvatar(rs.getBytes("avatar") == null ? null : Base64.getEncoder().encodeToString(rs.getBytes("avatar")));
                account.setPassword(rs.getString("password"));
                return account;
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    public void register(User a) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([typeOfAccount]\n"
                + "           ,[username]\n"
                + "           ,[password]\n"
                + "           ,[displayname]\n"
                + "           ,[dob]\n"
                + "           ,[gender]\n"
                + "           ,[QuestionID]\n"
                + "           ,[answer])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        stm = null;
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, a.getTypeOfAccount());
            stm.setString(2, a.getUsername());
            stm.setString(3, a.getPassword());
            stm.setString(4, a.getDisplayname());

            stm.setDate(5, a.getDob());
            stm.setString(6, a.getGender());
            stm.setInt(7, a.getQuestionID());
            stm.setString(8, a.getAnswer());

            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }

    //get username   
    public User getUsername(String username) {
        try {
            connection = db.getConnection();
            String sql = "select u.id, u.username, u.questionid, u.answer from [User] u where u.username = ? ";
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
            if (rs.next()) {
                User account = new User();
                account.setID(rs.getInt("id"));
                account.setUsername(rs.getString("username"));
                account.setQuestionID(rs.getInt("questionid"));
                account.setAnswer(rs.getString("answer"));
                return account;
            }

        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    //get user profile
    public ArrayList<User> getProfile(Integer id) {
        String sql = "select [displayname],[avatar],[dob],[gender] from [User] where ID = ?";
        ArrayList<User> display = new ArrayList<>();
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setDisplayname(rs.getString("displayname"));
                if (rs.getBytes("avatar") != null) {
                    user.setAvatar(Base64.getEncoder().encodeToString(rs.getBytes("avatar")));
                } else {
                    user.setAvatar(null);
                }
                user.setDob(rs.getDate("dob"));
                user.setGender(rs.getString("gender"));
                display.add(user);
            }

        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                }
            }
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
        return display;
    }

    public void upDateUserprofilePicture(String username, InputStream profile) {
        String sql = "Update [User] set avatar = ? where [username] = ?";
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setBlob(1, profile);
            stm.setString(2, username);
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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
    }

    public void updatebasicprofile(int id, User a, InputStream image) {
        String sql = "UPDATE [User]\n"
                + "   SET [password] = ?\n"
                + "      ,[displayname] = ?\n"
                + "      ,[avatar] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[gender] = ?\n"
                + " WHERE [User].ID = ?";
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, a.getPassword());
            stm.setString(2, a.getDisplayname());
            stm.setBlob(3, image);
            stm.setDate(4, a.getDob());
            stm.setString(5, a.getGender());
            stm.setInt(6, id);
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getID(String username) {
        int id = 2;
        String sql = "select ID from [User] where username = ?";
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            rs = stm.executeQuery();
        } catch (Exception ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return id;
    }

    public ArrayList<User> getUserGame(Integer id) {
        String sql = "select ug.UserID as 'UserID',u.displayname as 'UserDisplayname',g.ID as 'GameID',g.[name] as 'GameName' ,g.[image] as 'GameImage'  from user_game	ug \n"
                + "inner join game g on ug.GameID = g.ID\n"
                + "inner join [User] u on u.ID = ug.UserID\n"
                + "where UserID = ?";
        ArrayList<User> getUserGameList = new ArrayList<>();
        try {
            connection = db.getConnection();
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                User thisUser = new User();
                thisUser.setID(rs.getInt("UserID"));
                thisUser.setDisplayname(rs.getString("UserDisplayname"));
                Game g = new Game();
                g.setID(rs.getInt("GameID"));
                g.setName(rs.getString("GameName"));
                if (rs.getBytes("GameImage") != null) {
                    g.setImage(Base64.getEncoder().encodeToString(rs.getBytes("avatar")));
                } else {
                    g.setImage(null);
                }
                List<Game> myGame = new ArrayList<>();
                myGame.add(g);
                thisUser.setgameList(myGame);
                getUserGameList.add(thisUser);
            }

        } catch (Exception ex) {
            Logger.getLogger(GameDao.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
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
        return getUserGameList;
    }
}
