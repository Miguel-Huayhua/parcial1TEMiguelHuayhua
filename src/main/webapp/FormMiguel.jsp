<%-- 
    Document   : FormMiguel
    Created on : 05-04-2022, 07:33:40 PM
    Author     : miguel
--%>

<%@page import="com.miguel.parcial1_miguelh.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta lang="es">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Productos</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    </head>
    <body>
        <%
            String descripcion = "";
            int cantidad = 0;
            float precio = 0;
            if (request.getAttribute("Producto") != null) {
                Producto p = (Producto) request.getAttribute("Producto");
                descripcion = p.getDescripcion();
                cantidad = p.getCantidad();
                precio = p.getPrecio();
            }

        %>
        <div class="container row">
            
            <form class="col-6 offset-3 d-flex flex-column" action="/parcial1_miguelh/" method="post">
            <label for="descripcion">Descripción: </label>
            <input value="<%=descripcion%>"  id="descripcion" name="descripcion"  />
            <label for="cantidad">Cantidad:</label>
            <input value ="<%=cantidad%>" type="number" id="cantidad" name="cantidad" />
            <label for="precio">Precio: </label>
            <input value="<%=precio%> " id="precio" name="precio" />
            <label for="categoria">Categoría:</label>
            <select name="categoria" id="categoria">
                <option  value = "gaseosa">Gaseosa</option>
                <option value = "galleta">Galleta</option>
                <option value = "limpieza">Alcohol</option>
                <option value = "limpieza">Limpieza</option>
            </select>
            <input type="submit" value="Agregar Producto"/>

        </form>
        </div>
    </body>
</html>
