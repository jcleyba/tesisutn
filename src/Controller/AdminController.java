/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ServicioAdministrador;
import DAO.ServicioJugadores;
import Model.Administrador;
import Model.Jugador;
import Model.Usuario;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author juanleyba
 */
public class AdminController {
    public List<Jugador> obtenerJugadoresPorClub(Administrador admin)
    {
        List<Jugador> lista = new ArrayList();
        ServicioJugadores sj = new ServicioJugadores();
        ServicioAdministrador sa = new ServicioAdministrador();
        int idClub = sa.getAdminClub(admin.getIdUsuarioAdmin());
        lista = sj.getJugadoresPorClub(idClub);
        return lista;
    }
    
    public int getAdminClubId(Administrador admin)
    {
        int id = 0;
        ServicioAdministrador sa = new ServicioAdministrador();
        id = sa.getAdminClub(admin.getIdUsuarioAdmin());           
        return id;
    }
}
