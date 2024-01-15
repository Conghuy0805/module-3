package com.example.hien_thi_danh_sach_khach_hang.controller;

import com.example.hien_thi_danh_sach_khach_hang.model.Customer;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "CustomerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {
    private static final List<Customer> listCustomer;

    static {
        listCustomer = new ArrayList<>();
        listCustomer.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "img1.jpg"));
        listCustomer.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "img2.jpg"));
        listCustomer.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "img3.jpg"));
        listCustomer.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "img4.jpg"));
        listCustomer.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "img5.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listCustomer", listCustomer);
        req.getRequestDispatcher("customer/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}