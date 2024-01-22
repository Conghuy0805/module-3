package com.example.ung_dung_quan_li_user.repository;

import com.example.ung_dung_quan_li_user.model.User;

import java.util.List;

public interface IUserRepository {
    void insertUser(User user);

    User selectUser(int id);

    List<User> selectAllUsers();

    void delete(int id);

    void update(User user);


    List<User> search(String value);

    void sortByName(List<User> list);

    void sortByEmail(List<User> list);

    void sortByCountry(List<User> list);
}
