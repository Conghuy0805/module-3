package com.example.ss9.repository.impl;

import com.example.ss9.model.Classroom;
import com.example.ss9.repository.BaseRepository;
import com.example.ss9.repository.IClassroomRepository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClassroomRepository implements IClassroomRepository {

    @Override
    public List<Classroom> findAll() {
        List<Classroom> classrooms = new ArrayList<>();
        Classroom classroom;
        try {
            Statement statement = BaseRepository.getConnectionJavaToDB().createStatement();
            ResultSet resultSet = statement.executeQuery("select code_class, name_class from classrooms");
            while (resultSet.next()) {
                classroom = new Classroom();
                classroom.setCodeClass(resultSet.getInt("code_class"));
                classroom.setNameClass(resultSet.getString("name_class"));

                classrooms.add(classroom);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi kết nối DB");
        }

        return classrooms;
    }
}
