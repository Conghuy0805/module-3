package com.example.product_discount_calculator;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "ProductDiscountServlet", urlPatterns = "/display-discount")
public class ProductDiscountServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String describe = req.getParameter("describe");
        float price = Float.parseFloat(req.getParameter("price"));
        float discount_rate = Float.parseFloat(req.getParameter("discount_rate"));
        float discount_amount = (float) (price * discount_rate * 0.01);
        float discount_price = price - discount_amount;

        PrintWriter writer = resp.getWriter();
        writer.println("<html>");
        writer.println("<h1> Product Description: " + describe + "</h1>");
        writer.println("<h1> List Price: " + price + "</h1>");
        writer.println("<h1> Discount Percent: " + discount_rate + "</h1>");
        writer.println("<h1>  Discount Amount: " + discount_amount + "</h1>");
        writer.println("<h1> Discount Price: " + discount_price + "</h1>");
        writer.println("</html>");
    }
}