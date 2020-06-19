<%-- 
    Document   : formulario
    Created on : jun 15, 2020, 2:15:50 p.m.
    Author     : elviseveris
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.Persona"%>
<%@page import="modelDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Lista Items</title>
    </head>
    <body>
        <div class="container">
            <h1>Listar personas</h1>
            <a class="btn btn-success btn-lg" href="controlador?accion=nuevo">Agregar item</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Id</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Direccion</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <%
                    PersonaDAO personaDAO = new PersonaDAO();
                    List<Persona> personaList = personaDAO.listar();
                    Iterator<Persona> iteratorPersona = personaList.iterator();
                    Persona persona = null;
                    while (iteratorPersona.hasNext()) {
                        persona = iteratorPersona.next();
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= persona.getId()%></td>
                        <td class="text-center"><%= persona.getNombre()%></td>
                        <td class="text-center"><%= persona.getDireccion()%></td>
                        <td class="text-center">
                            <a class="btn btn-outline-warning btn-sm" href="controlador?accion=editar&id=<%= persona.getId()%>">Editar</a>
                            <a class="btn btn-outline-danger btn-sm" href="controlador?accion=eliminar&id=<%= persona.getId()%>">Eliminar</a>
                        </td>
                    </tr>
                <%}%>
                </tbody>
            </table>
 
        </div>
    </body>
</html>
