package com.example.ss9.service;

import com.example.ss9.dto.StudentDTO;
import com.example.ss9.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();

    void save(Student student);

    Student findById(Integer code);

    void update(Student studentUpdate);

    void deleteByCode(Integer codeDelete);

    //    DTO
    List<StudentDTO> findAllDTO();


}
