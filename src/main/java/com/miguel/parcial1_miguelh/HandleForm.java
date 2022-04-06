package com.miguel.parcial1_miguelh;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//author Miguel Huayhua Condori

@WebServlet(name = "HandleForm", urlPatterns = {"/HandleForm"})
public class HandleForm extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("edit") != null) {
            ArrayList<Producto> lista = (ArrayList<Producto>) request.getSession().getAttribute("datos");
            for (Producto val : lista) {
                if (val.getId() == Integer.parseInt(request.getParameter("id"))) {
                    lista.remove(val);
                    request.setAttribute("Producto", val);
                    break;
                }
            }
        }
        request.getRequestDispatcher("FormMiguel.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
