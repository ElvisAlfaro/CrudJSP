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
        <title>Lista Items</title>
    </head>
    <body>
        <div>
            <h1>Listar personas</h1>
            <a href="controlador?accion=nuevo">Agregar item</a>
            <table border="1" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Direccion</th>
                        <th>Acciones</th>
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
                        <td><%= persona.getId()%></td>
                        <td><%= persona.getNombre()%></td>
                        <td><%= persona.getDireccion()%></td>
                        <td>
                            <a href="controlador?accion=editar&id="<%=persona.getId()%>>Editar</a>
                            <a href="controlador?accion=eliminar">Eliminar</a>
                        </td>
                    </tr>
                <%}%>
                </tbody>
            </table>
 
        </div>
    </body>
</html>
