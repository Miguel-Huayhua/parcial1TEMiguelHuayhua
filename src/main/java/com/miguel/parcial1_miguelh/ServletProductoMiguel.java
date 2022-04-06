package com.miguel.parcial1_miguelh;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//author Miguel Huayhua Condori

@WebServlet(name = "ServletProductoMiguel", urlPatterns = {"/"})
public class ServletProductoMiguel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getSession().getAttribute("datos") == null) {
            ArrayList<Producto> datos = new ArrayList<Producto>();
            request.getSession().setAttribute("datos", datos);
        }
        if (request.getParameter("id") != null) {
            ArrayList<Producto> lista = (ArrayList<Producto>) request.getSession().getAttribute("datos");
            for (Producto val : lista) {
                if (val.getId() == Integer.parseInt(request.getParameter("id"))) {
                    lista.remove(val);
                    break;
                }
            }
        }

        request.getRequestDispatcher("indexmiguel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Producto> lista = (ArrayList<Producto>) request.getSession().getAttribute("datos");
        Producto p = new Producto();
        String descripcion = request.getParameter("descripcion");
        float precio = Float.parseFloat(request.getParameter("precio"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        String categoria = request.getParameter("categoria");
        p.setCantidad(cantidad);
        p.setCategoria(categoria);
        p.setDescripcion(descripcion);
        p.setPrecio(precio);
        if (request.getSession().getAttribute("datos") == null) {
        } else {
            if (lista.isEmpty()) {
                int id = 0;
                p.setId(id);
            } else {
                int id = lista.get(lista.size() - 1).getId();
                id++;
                p.setId(id);
            }
        }
        lista.add(p);
        request.getRequestDispatcher("indexmiguel.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
