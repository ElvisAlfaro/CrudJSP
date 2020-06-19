package interfaces;

import java.util.List;
import model.Persona;

public interface CRUD {
    public List listar();
    public Persona list(int id);
    public boolean agregar(Persona persona);
    public boolean editar(Persona persona);
    public boolean eliminar(int id); 
    
}
