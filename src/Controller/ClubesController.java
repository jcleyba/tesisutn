/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ServicioClubes;
import DAO.ServicioTorneos;
import Model.Club;
import Model.Torneo;
import java.awt.image.RenderedImage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author juanleyba
 */
public class ClubesController {
    public List<Club> listarClubesActivos()
    {
        ArrayList<Club> listaClubes = new ArrayList();
        ServicioClubes sc = new ServicioClubes();
        listaClubes = (ArrayList<Club>) sc.getClubesActivos();
        return listaClubes;
    }
    public List<Club> listarClubes()
    {
        ArrayList<Club> listaClubes = new ArrayList();
        ServicioClubes sc = new ServicioClubes();
        listaClubes = (ArrayList<Club>) sc.getClubes();
        return listaClubes;
    }
    
    public Club clubPorId(int id)
    {
        Club club = new Club();
        ServicioClubes sc = new ServicioClubes();
        club = sc.getClubById(id);
        return club;
    }
    
    public void addClub (String nombre, String logo, String direccio, String telefono, String email)
    {
        ServicioClubes sc = new ServicioClubes();
        Club club = new Club();
        club.setNombre(nombre);
        club.setLogo(logo);
        club.setDireccion(direccio);
        club.setTelefono(telefono);
        club.setEmail(email);
        sc.addClub(club);
    }
    
    public void uploadImage(String path, FileItem archivo)
    {
        try{
 
            String fileName = archivo.getName();
            File localFile = new File(path+fileName);
            archivo.write(localFile);
            
        } catch (Exception ex) {
            Logger.getLogger(ClubesController.class.getName()).log(Level.SEVERE, null, ex);
        }       
    }
    
    public String getFileName(Part part)
    {
        final String partHeader = part.getHeader("content-disposition");
        for(String content : part.getHeader("content-disposition").split(";")){
            if(content.trim().startsWith("filename")){
                return content.substring(content.indexOf("=")+1).trim().replace("\"", "");
            }
        }
        return null;
    }
    
    public void activarClub(int idClub)
    {
        ServicioClubes sc = new ServicioClubes();
        sc.activarClub(idClub);
    }
   
    public void desactivarClub(int idClub)
    {
        ServicioClubes sc = new ServicioClubes();
        sc.desactivarClub(idClub);
    }
    
    public void actualizarClub(int idclub, String nombre, String logo, String direccion, String telefono, String email)
    {
        ServicioClubes sc = new ServicioClubes();
        Club club = new Club(idclub,nombre,logo,direccion,telefono,email);
        sc.updateClub(club);
    }
}
