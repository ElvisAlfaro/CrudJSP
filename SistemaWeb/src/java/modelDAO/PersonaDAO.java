package modelDAO;

import interfaces.CRUD;
import java.util.List;
import model.Persona;
import config.ConexionSQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PersonaDAO implements CRUD{
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    private Persona persona;

    public PersonaDAO() {
            connection = (new ConexionSQL()).getConnection();
    }
    
    @Override
    public List listar() {
        List<Persona> personas = new ArrayList<>();
        String query = "select * from persona";
        try {
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                Persona per = new Persona();
                per.setId(resultSet.getInt("id"));
                per.setNombre(resultSet.getString("nombre"));
                per.setDireccion(resultSet.getString( "direccion"));
                
                personas.add(per);
            }
        } catch (Exception e) {
        }
        return personas;
    }

    @Override
    public Persona list(int id) {
        String queString = "select * from persona where id="+id;
        try {
            preparedStatement = connection.prepareStatement(queString);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {          
                persona = new Persona();
                persona.setId(resultSet.getInt("id"));
                persona.setNombre(resultSet.getString("nombre"));
                persona.setDireccion(resultSet.getString("direccion")); 
            }
        } catch (Exception e) {
        }
        return persona;
    }

    @Override
    public boolean agregar(Persona persona) {
        String sqlString = "insert into persona(nombre, direccion) values ('"+persona.getNombre()+"', '"+persona.getDireccion()+"')";
        try {
            preparedStatement = connection.prepareStatement(sqlString);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al agregar: " + ex.getMessage());
        }
        
        return false;
    }

    @Override
    public boolean editar(Persona persona) {
        String sqlString = "update persona set nombre='"+persona.getNombre()+"', direccion='"+persona.getDireccion()+
                    "' where id="+persona.getId();
        try {
            preparedStatement = connection.prepareStatement(sqlString);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error al actualizar: "+ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
