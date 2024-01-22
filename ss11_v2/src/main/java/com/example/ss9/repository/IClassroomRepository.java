package com.example.ss9.repository;

import com.example.ss9.model.Classroom;

import java.util.List;

public interface IClassroomRepository {

    public List<Classroom> findAll();
}
