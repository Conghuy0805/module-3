package com.example.ss9.service.impl;

import com.example.ss9.model.Classroom;
import com.example.ss9.model.Student;
import com.example.ss9.repository.IClassroomRepository;
import com.example.ss9.repository.impl.ClassroomRepository;
import com.example.ss9.service.IClassroomService;

import java.util.List;

public class ClassroomService implements IClassroomService {
    private IClassroomRepository classroomRepository = new ClassroomRepository();

    @Override
    public List<Classroom> findAll() {
        return classroomRepository.findAll();
    }
}
