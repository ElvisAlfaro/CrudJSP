<%-- 
    Document   : receiver_data
    Created on : jun 15, 2020, 2:22:26 p.m.
    Author     : elviseveris
--%>

<%@page import="model.Persona"%>
<%@page import="modelDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar item</title>
    </head>
    <body>
        <div>
            <h1>Agregar item</h1>
            <%
                PersonaDAO personaDAO = new PersonaDAO();
                int id = Integer.parseInt(request.getAttribute("idPersona").toString());
                Persona persona = personaDAO.list(id);
            %>
            <form action="controlador" method="GET">
                <input type="hidden" name="id" value="<%= persona.getId()%>" />
                <input type="text" name="txtNombre" placeholder="Ingrese nombre" value="<%= persona.getNombre()%>"/>
                <input type="text" name="txtDireccion" placeholder="Ingrese direccion" value="<%= persona.getDireccion()%>" />
                <input type="submit" value="actualizar" name="accion" />
            </form>
        </div>  
    </body>
</html>
