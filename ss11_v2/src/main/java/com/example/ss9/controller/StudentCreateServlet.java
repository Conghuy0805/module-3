package com.example.ss9.controller;

import com.example.ss9.model.Student;
import com.example.ss9.service.IStudentService;
import com.example.ss9.service.impl.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "StudentCreateServlet", value = "/student/create")
public class StudentCreateServlet extends HttpServlet {
    private IStudentService iStudentService = new StudentService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.getRequestDispatcher("/student/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        Double point = Double.valueOf(request.getParameter("point"));
        String idCard = request.getParameter("idCard");
        Integer codeClass = Integer.valueOf(request.getParameter("codeClass"));
        Student student = new Student(id, name, point, idCard, codeClass);
        iStudentService.save(student);
        response.sendRedirect("/student");
    }
}
