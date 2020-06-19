package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Persona;
import modelDAO.PersonaDAO;

public class Controlador extends HttpServlet {
    private PersonaDAO personaDAO = new PersonaDAO();
    private Persona persona = new Persona();
    
    private String listar = "views/listar.jsp";
    private String agregar = "views/agregar.jsp";
    private String editar = "views/editar.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet homeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet homeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("listar")) {
            acceso = listar;
        }
        else if (accion.equalsIgnoreCase("nuevo")) {
            acceso = agregar;
        }
        else if (accion.equalsIgnoreCase("agregar")) {
            persona.setNombre(request.getParameter("txtNombre"));
            persona.setDireccion(request.getParameter("txtDireccion"));
            
            personaDAO.agregar(persona);
            
            acceso = listar;
        }
        else if (accion.equalsIgnoreCase("editar")) {
            request.setAttribute("idPersona", request.getParameter("id"));
            acceso = editar;
        }
        else if (accion.equalsIgnoreCase("actualizar")) {
            persona.setId(Integer.parseInt(request.getParameter("id")));
            persona.setNombre(request.getParameter("txtNombre"));
            persona.setDireccion(request.getParameter("txtDireccion"));
            
            personaDAO.editar(persona);
            
            acceso = listar;
        }
        else if (accion.equalsIgnoreCase("eliminar")) {
            acceso = editar;
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(acceso);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
