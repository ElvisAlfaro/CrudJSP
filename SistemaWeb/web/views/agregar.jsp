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
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Nuevo Registro</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <h1>Agregar item</h1>
                <form class="form-group" action="controlador" method="GET">
                    <input class="form-control" type="text" name="txtNombre" placeholder="Ingrese nombre" />
                    <br>
                    <input class="form-control" type="text" name="txtDireccion" placeholder="Ingrese direccion" />
                    <br>
                    <input class="btn btn-primary" type="submit" value="agregar" name="accion" />
                </form>
            </div> 
        </div>
               
    </body>
</html>
