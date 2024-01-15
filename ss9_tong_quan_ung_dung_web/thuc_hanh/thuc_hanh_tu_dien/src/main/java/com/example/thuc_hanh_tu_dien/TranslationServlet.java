package com.example.thuc_hanh_tu_dien;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "TranslationServlet", value = "/translate")
public class TranslationServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "xin chào");
        dictionary.put("how", "thế nào");
        dictionary.put("book", "quyển sách");
        dictionary.put("computer", "máy tính");

        String search = req.getParameter("txtSearch");
        PrintWriter writer = resp.getWriter();
        writer.println("<html>");

        String result = dictionary.get(search);
        if (result != null) {
            writer.println("Word: " + search +"<br>");
            writer.println("Result: " + result);
        } else {
            writer.println("Not found");
        }
        writer.println("</html>");
    }
}