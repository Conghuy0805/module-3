package com.example.ss9.repository.impl;

import com.example.ss9.dto.StudentDTO;
import com.example.ss9.model.Student;
import com.example.ss9.repository.BaseRepository;
import com.example.ss9.repository.IStudentRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private static List<Student> students = new ArrayList<>();

    static {
        students.add(new Student(1, "haiTT", 7.0, "12312312", 1));
        students.add(new Student(2, "haiTT2", 3.0, "12312312", 2));
        students.add(new Student(3, "haiTT3", 6.0, "12312312", 1));
        students.add(new Student(4, "haiTT4", 8.0, "12312312", 3));
        students.add(new Student(5, "haiTT5", 5.0, "12312312", 1));
    }

    @Override
    public List<Student> findAll() {
        List<Student> students = new ArrayList<>();
        Student student;
        try {
            Statement statement = BaseRepository.getConnectionJavaToDB().createStatement();
            ResultSet resultSet = statement.executeQuery("select code, name_student, point, id_card, code_class from students");
            while (resultSet.next()) {
                student = new Student();
                student.setCode(resultSet.getInt("code"));
                student.setNameStudent(resultSet.getString("name_student"));
                student.setPoint(resultSet.getDouble("point"));
                student.setIdCard(resultSet.getString("id_card"));
                student.setCodeClass(resultSet.getInt("code_class"));
                students.add(student);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi kết nối DB");
        }

        return students;
    }

    @Override
    public List<StudentDTO> findAllDTO() {
        List<StudentDTO> students = new ArrayList<>();
        StudentDTO student;
        try {
            Statement statement = BaseRepository.getConnectionJavaToDB().createStatement();
            ResultSet resultSet = statement.executeQuery("select code, name_student, point, id_card, name_class from students join classrooms on students.code_class = classrooms.code_class");
            while (resultSet.next()) {
                student = new StudentDTO();
                student.setCode(resultSet.getInt("code"));
                student.setNameStudent(resultSet.getString("name_student"));
                student.setPoint(resultSet.getDouble("point"));
                student.setIdCard(resultSet.getString("id_card"));
                student.setNameClass(resultSet.getString("name_class"));
                students.add(student);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi kết nối DB");
        }

        return students;
    }

    @Override
    public void save(Student student) {
        try {
//            Statement statement = BaseRepository.getConnectionJavaToDB().createStatement();
//            statement.executeUpdate("insert into students value("+student.getCode()+","+student.getNameStudent()+")")
            PreparedStatement preparedStatement = BaseRepository.getConnectionJavaToDB()
                    .prepareStatement("insert into students(code, name_student, point, id_card, code_class) values (?,?,?,?,?)");
            preparedStatement.setInt(1, student.getCode());
            preparedStatement.setString(2, student.getNameStudent());
            preparedStatement.setDouble(3, student.getPoint());
            preparedStatement.setString(4, student.getIdCard());
            preparedStatement.setInt(5, student.getCodeClass());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi kết nối");
        }
    }

    @Override
    public Student findById(Integer code) {
        try {
            PreparedStatement statement = BaseRepository.getConnectionJavaToDB().prepareStatement("select code, name_student, point, id_card, code_class from students where code = ?");
            statement.setInt(1, code);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Student student = new Student();
                student.setCode(resultSet.getInt("code"));
                student.setNameStudent(resultSet.getString("name_student"));
                student.setPoint(resultSet.getDouble("point"));
                student.setIdCard(resultSet.getString("id_card"));
                student.setCodeClass(resultSet.getInt("code_class"));
                return student;
            }
        } catch (SQLException e) {
            System.out.println("Lỗi kết nối DB");
        }
        return null;
    }

    @Override
    public void update(Student studentUpdate) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseRepository.getConnectionJavaToDB()
                    .prepareStatement("update students set name_student = ?, point = ?, id_card = ?, code_class = ? where code = ?");
            preparedStatement.setString(1, studentUpdate.getNameStudent());
            preparedStatement.setDouble(2, studentUpdate.getPoint());
            preparedStatement.setString(3, studentUpdate.getIdCard());
            preparedStatement.setInt(4, studentUpdate.getCodeClass());
            preparedStatement.setInt(5, studentUpdate.getCode());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi kết nối");
        }
    }

    @Override
    public void deleteByCode(Integer codeDelete) {
        PreparedStatement statement = null;
        try {
            statement = BaseRepository.getConnectionJavaToDB().prepareStatement("delete from students where code = ?");
            statement.setInt(1, codeDelete);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Lỗi kết nối");
        }

    }
}
