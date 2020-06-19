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
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Editar item</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <h1>Agregar item</h1>
                <%
                    PersonaDAO personaDAO = new PersonaDAO();
                    int id = Integer.parseInt(request.getAttribute("idPersona").toString());
                    Persona persona = personaDAO.list(id);
                %>
                <form action="controlador" method="GET">
                    <input type="hidden" name="id" value="<%= persona.getId()%>" />
                    <input class="form-control" type="text" name="txtNombre" placeholder="Ingrese nombre" value="<%= persona.getNombre()%>"/>
                    <br>
                    <input class="form-control" type="text" name="txtDireccion" placeholder="Ingrese direccion" value="<%= persona.getDireccion()%>" />
                    <br>
                    <input class="btn btn-outline-primary"  type="submit" value="actualizar" name="accion" />
                </form>
            </div>  
        </div>
    </body>
</html>
