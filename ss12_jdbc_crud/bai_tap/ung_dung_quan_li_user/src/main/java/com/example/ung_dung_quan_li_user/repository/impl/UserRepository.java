package com.example.ung_dung_quan_li_user.repository.impl;

import com.example.ung_dung_quan_li_user.model.User;
import com.example.ung_dung_quan_li_user.repository.BaseRepository;
import com.example.ung_dung_quan_li_user.repository.IUserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class UserRepository implements IUserRepository {
    private BaseRepository baseRepository = new BaseRepository();

    @Override
    public void insertUser(User user) {
        try {
            String sql = "insert into users(name, email, country) values(?,?,?)";
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(sql);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException exception) {
            System.out.println("Loi ket noi");
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        String sql = "select name, email, country from users where id =?";
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(name, email, country);
            }
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "select * from users";
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                User user = new User(id, name, email, country);
                users.add(user);
            }
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    @Override
    public void delete(int id) {
        String sql = "delete from users where id=?";
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(User user) {
        String sql = "update users set name = ?, email = ?, country = ? where id=?";
        try {
            PreparedStatement preparedStatement = baseRepository.getConnection().prepareStatement(sql);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> search(String value) {
        List<User> userList = new ArrayList<>();
        for (User user : selectAllUsers()) {
            if (user.getName().toLowerCase().contains(value.toLowerCase()) || user.getEmail().toLowerCase().contains(value.toLowerCase()) || user.getCountry().toLowerCase().contains(value.toLowerCase())) {
                userList.add(user);
            }
        }
        return userList;
    }

    @Override
    public void sortByName(List<User> list) {
        list.sort(new Comparator<User>() {
            @Override
            public int compare(User o1, User o2) {
                return o1.getName().toLowerCase().compareTo(o2.getName().toLowerCase());
            }
        });
    }

    @Override
    public void sortByEmail(List<User> list) {
        list.sort(new Comparator<User>() {
            @Override
            public int compare(User o1, User o2) {
                return o1.getEmail().toLowerCase().compareTo(o2.getEmail().toLowerCase());
            }
        });
    }

    @Override
    public void sortByCountry(List<User> list) {
        list.sort(new Comparator<User>() {
            @Override
            public int compare(User o1, User o2) {
                return o1.getCountry().toLowerCase().compareTo(o2.getCountry().toLowerCase());
            }
        });
    }
}
