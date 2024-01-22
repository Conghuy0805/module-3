package com.example.ung_dung_quan_li_user.controller;

import com.example.ung_dung_quan_li_user.model.User;
import com.example.ung_dung_quan_li_user.service.IUserService;
import com.example.ung_dung_quan_li_user.service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private IUserService iUserService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUserForm(request, response);
                break;
            case "update":
                updateUserForm(request, response);
                break;
            case "delete":
                deleteUserForm(request, response);
                break;
            case "view":
                viewUserForm(request, response);
                break;
            case "sortByName":
                sortByNameUser(request, response);
                break;
            case "sortByEmail":
                sortByEmailUser(request, response);
                break;
            case "sortByCountry":
                sortByCountryUser(request, response);
                break;
            default:
                listUserForm(request, response);
                break;
        }
    }

    private void createUserForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher rd = request.getRequestDispatcher("/user/create.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateUserForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = iUserService.selectUser(id);
        request.setAttribute("user", user);
        RequestDispatcher rd = request.getRequestDispatcher("/user/update.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteUserForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iUserService.delete(id);
        try {
            response.sendRedirect("/users");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void viewUserForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = iUserService.selectUser(id);
        request.setAttribute("user", user);
        RequestDispatcher rd = request.getRequestDispatcher("/user/view.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void sortByNameUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = iUserService.selectAllUsers();
        iUserService.sortByName(users);
        request.setAttribute("users", users);
        RequestDispatcher rd = request.getRequestDispatcher("/user/list.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void sortByEmailUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = iUserService.selectAllUsers();
        iUserService.sortByEmail(users);
        request.setAttribute("users", users);
        RequestDispatcher rd = request.getRequestDispatcher("/user/list.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void sortByCountryUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = iUserService.selectAllUsers();
        iUserService.sortByCountry(users);
        request.setAttribute("users", users);
        RequestDispatcher rd = request.getRequestDispatcher("/user/list.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void listUserForm(HttpServletRequest request, HttpServletResponse response) {
        List<User> users = iUserService.selectAllUsers();
        request.setAttribute("users", users);
        RequestDispatcher rd = request.getRequestDispatcher("/user/list.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUser(request, response);
                break;
            case "update":
                updateUser(request, response);
                break;
            case "search":
                searchUser(request, response);
                break;
            default:
                break;
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        iUserService.insertUser(user);
        try {
            response.sendRedirect("/users");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        iUserService.update(user);
        try {
            response.sendRedirect("/users");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void searchUser(HttpServletRequest request, HttpServletResponse response) {
        String search = request.getParameter("search");
        List<User> users = iUserService.search(search);
        request.setAttribute("users", users);
        RequestDispatcher rd = request.getRequestDispatcher("/user/list.jsp");
        try {
            rd.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
