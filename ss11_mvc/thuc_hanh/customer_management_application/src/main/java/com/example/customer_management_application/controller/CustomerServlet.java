package com.example.customer_management_application.controller;

import com.example.customer_management_application.model.Customer;
import com.example.customer_management_application.service.CustomerService;
import com.example.customer_management_application.service.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private final ICustomerService iCustomerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                break;
            case "view":
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = iCustomerService.findById(id);
        RequestDispatcher rd;
        if (customer == null) {
            rd = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            rd = request.getRequestDispatcher("customer/edit.jsp");
        }
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher rd = request.getRequestDispatcher("customer/create.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customers = iCustomerService.findAll();
        request.setAttribute("customers", customers);
        RequestDispatcher rd = request.getRequestDispatcher("customer/list.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "eidt":
                updateCustomer(request, response);
                break;
            case "delete":
                break;
            case "view":
                break;
            default:
                break;
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = iCustomerService.findById(id);
        RequestDispatcher rd;
        if (customer == null) {
            rd = request.getRequestDispatcher("error-404.jsp");
        } else {
            customer.setName(name);
            customer.setEmail(email);
            customer.setAddress(address);
            iCustomerService.update(id, customer);
            request.setAttribute("customer", customer);
            request.setAttribute("message", "Customer information was updated");
            rd = request.getRequestDispatcher("customer/edit.jsp");
        }
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int id = (int) (Math.random() * 1000);
        Customer customer = new Customer(id, name, email, address);
        iCustomerService.save(customer);
        RequestDispatcher rd = request.getRequestDispatcher("customer/create.jsp");
        request.setAttribute("message", "New customer was created");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}