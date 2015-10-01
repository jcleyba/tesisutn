/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Usuario;
import com.mysql.jdbc.*;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 *
 * @author juanleyba
 */

public class ServicioBase {
    protected Connection con;
    
    protected void abrirConexion()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:8889/golftime", "root", "root");
            //con = (Connection)DriverManager.getConnection("jdbc:mysql://sql37.hostinger.com.ar:3306/u573899416_utn", "u573899416_utn", "facil123");

        }
        catch(Exception e)
        {
            System.out.println("Error al establecer la conexión. Causa: " + e.getMessage());
        }
    }
    
    protected void cerrarConexion()
    {
        try
        {
            if(con != null)
            {
                con.close();
            }
        }
        catch(Exception e)
        {
            System.out.println("Error al cerrar la conexión. Causa: " + e.getMessage());
        }
        
    }
    
    
}
