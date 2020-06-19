<%-- 
    Document   : home
    Created on : jun 15, 2020, 10:00:25 a.m.
    Author     : elviseveris
--%>

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Registro</title>
    </head>
    <body>
        <div>
            <h1>Agregar item</h1>
            <form action="controlador" method="GET">
                <input type="text" name="txtNombre" placeholder="Ingrese nombre" />
                <input type="text" name="txtDireccion" placeholder="Ingrese direccion" />
                <input type="submit" value="agregar" name="accion" />
            </form>
        </div>        
    </body>
</html>
