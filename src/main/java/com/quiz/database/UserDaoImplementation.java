package com.quiz.database;

import com.quiz.database.interfaces.UserDao;
import com.quiz.model.user.User;
import com.quiz.utilities.HashUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import javax.sql.DataSource;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImplementation implements UserDao {
    private final JdbcTemplate jdbcTemplate;

    public UserDaoImplementation(DataSource dataSource){
        jdbcTemplate = new JdbcTemplate(dataSource);
    }


    @Override
    public boolean registerUser(User user) throws NoSuchAlgorithmException {
        String loginName = user.getLoginName();
        String hashedPassword = user.hashPasswordAndGet();
        String firstName = user.getFirstName();
        String lastName = user.getLastName();

        if(getUser(loginName) != null){
            return false;
        } else {
            String regStr = "INSERT INTO users (loginName, hashedPassword, firstName, lastName)"
                    + " VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(regStr, loginName, hashedPassword, firstName, lastName);
            return true;
        }
    }

    @Override
    public User getUser(final String loginName) {
        String getStr = "SELECT * FROM users WHERE loginName = " + "'" + loginName + "'";
        return jdbcTemplate.query(getStr, new ResultSetExtractor<User>() {

            @Override
            public User extractData(ResultSet resultSet) throws SQLException, DataAccessException {
                if(resultSet.next()){
                    String hashedPassword = resultSet.getString(2);
                    String firstName = resultSet.getString(3);
                    String lastName = resultSet.getString(4);
                    return new User(loginName, hashedPassword, firstName, lastName);
                }
                return null;
            }
        });
    }

    @Override
    public boolean loginUser(String loginName, String password) throws NoSuchAlgorithmException {
        User currUser = getUser(loginName);
        if(currUser == null){
            return false;
        } else {
            String realHashedPassword = currUser.getPassword();
            byte[] hex = HashUtils.generateHash(password);
            String tryingHashedPassword = HashUtils.hexToString(hex);
            return tryingHashedPassword.equals(realHashedPassword);
        }
    }

    @Override
    public boolean deleteUser(String loginName){
        User delUser = getUser(loginName);
        if(delUser == null){
            return false;
        } else {
            String delete = "DELETE FROM users WHERE loginName =?";
            jdbcTemplate.update(delete, loginName);
            return  true;
        }
    }

    @Override
    public boolean addFriend(User user, User friend) {
        if(getUser(user.getLoginName())==null || getUser(friend.getLoginName()) == null){
            return false;
        } else {
            String username = user.getLoginName();
            String addFriend = friend.getLoginName();
            String regStr1 = "INSERT INTO friends (user1, user2)"
                    + " VALUES (?, ?)";
            jdbcTemplate.update(regStr1,username, addFriend);
            String regStr2 = "INSERT INTO friends (user1, user2)"
                    + " VALUES (?, ?)";
            jdbcTemplate.update(regStr2, addFriend,username);
            return true;
        }
    }

    @Override
    public boolean removeFriend(User user, User friend) {
        if(getUser(user.getLoginName())==null || getUser(friend.getLoginName()) == null){
            return false;
        } else {
            String username = user.getLoginName();
            String addFriend = friend.getLoginName();
            String regStr1 = "DELETE FROM friends WHERE user1 =? and user2 =?";
            jdbcTemplate.update(regStr1,username, addFriend);
            String regStr2 = "DELETE FROM friends WHERE user1 =? and user2 =?";
            jdbcTemplate.update(regStr2, addFriend,username);
            return true;
        }
    }

    @Override
    public boolean addAdmin(String loginName) {
        if(getUser(loginName) != null){
            String delete = "UPDATE users SET isAdmin = TRUE WHERE loginName =?";
            jdbcTemplate.update(delete, loginName);
            return  true;
        }
        return false;
    }

    @Override
    public boolean removeAdmin(String loginName) {
        if(getUser(loginName) != null){
            String delete = "UPDATE users SET isAdmin = FALSE WHERE loginName =?";
            jdbcTemplate.update(delete, loginName);
            return  true;
        }
        return false;
    }

    @Override
    public Boolean isAdmin(String loginName) {
        String getStr = "SELECT * FROM users WHERE loginName = " + "'" + loginName + "'";
        return jdbcTemplate.query(getStr, new ResultSetExtractor<Boolean>() {
            @Override
            public Boolean extractData(ResultSet resultSet) throws SQLException, DataAccessException {
                if(resultSet.next()){
                    if(resultSet.getBoolean(5)){
                        return true;
                    }
                    return false;
                }
                return false;
            }
        });
    }


}
