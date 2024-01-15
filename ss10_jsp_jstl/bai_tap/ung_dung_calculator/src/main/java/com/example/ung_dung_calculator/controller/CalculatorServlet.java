package com.example.ung_dung_calculator.controller;

import com.example.ung_dung_calculator.model.Calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double first = Double.parseDouble(request.getParameter("first"));
        double aDouble = Double.parseDouble(request.getParameter("second"));
        String operator = request.getParameter("operator");
        request.setAttribute("first", first);
        request.setAttribute("aDouble", aDouble);
        try {
            double result = Calculator.calculate(first, aDouble, operator);
            request.setAttribute("result", result);
        } catch (ArithmeticException | IllegalArgumentException e) {
            String errorMessage = "Error: " + e.getMessage();
            request.setAttribute("errorMessage", errorMessage);
        }
        RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
        rd.forward(request, response);
    }
}