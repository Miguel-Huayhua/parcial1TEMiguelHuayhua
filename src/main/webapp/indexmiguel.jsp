<%-- 
    Document   : indexmiguel
    Created on : 05-04-2022, 07:08:29 PM
    Author     : miguel
--%>
<%@page import="java.util.Iterator"%>
<%@page import="com.miguel.parcial1_miguelh.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta lang="es">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    </head>
    <body>
        <div class ="container row" >
            <h1>PRIMER PARCIAL TEM-742</h1>
            <h2>Nombre: Miguel Huayhua Condori</h2>
            <h3>Carnet: 9190304</h3>
            <h4>PRODUCTOS</h4>
            <a href="HandleForm">Nuevo Producto</a>
            <table class="col-6 offset-3 border border-dark border-2 rounded-3">
                <thead class="bg-light">
                <th>Id</th>
                <th>Descripción</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Categoría</th>
                <th>Editar</th>
                <th>Eliminar</th> 
                </thead>
                <tbody>
                    <%
                        ArrayList<Producto> lista = (ArrayList< Producto>) request.getSession().getAttribute("datos");
                        Iterator<Producto> it = lista.iterator();

                        while (it.hasNext()) {
                            Producto dato = it.next();

                    %>
                    <tr class="bg-light">
                        <td><%=dato.getId()%> </td>   
                        <td><%=dato.getDescripcion()%> </td>      
                        <td><%=dato.getCantidad()%> </td>      
                        <td><%=dato.getPrecio()%> </td>      
                        <td><%=dato.getCategoria()%> </td>      
                        <td><a class="btn btn-info" href="/parcial1_miguelh/HandleForm?edit=true&id=<%=dato.getId()%>">Editar</a></td>      
                        <td><a class="btn btn-danger" href="/parcial1_miguelh?id=<%=dato.getId()%>">Eliminar</a></td>      
                    </tr>
                    <%}
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
