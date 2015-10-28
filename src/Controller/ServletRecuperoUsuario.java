package Controller;

import DAO.ServicioJugadores;
import Model.Usuario;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * Created by juancruzleyba on 10/28/15.
 */
@WebServlet(name = "ServletRecuperoUsuario", urlPatterns = {"/recuperoUsuario"})
public class ServletRecuperoUsuario extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        ServicioJugadores ser = new ServicioJugadores();
        String mail = request.getParameter("txtEmail");
        Usuario user = ser.usuarioPorEmail(mail);


        if(user != null)
        {
            String toAddress = user.getEmail();
            String subject = "Recupero usuario Golftime";
            String message = "Estimado usuario de Golftime, su nombre de usuario es: " + user.getUsername();


            EmailUtility composer = new EmailUtility();

            try
            {
                composer.sendEmail(toAddress, subject, message);
            } catch (Exception e) {
                System.out.print("Error: " + e);
            }

            RequestDispatcher rd = request.getRequestDispatcher("/recuperoExitoso.jsp");
            rd.forward(request, response);
        }
        else
        {
            out.println("<script>alert('Su email no es correcto por favor vuelva a ingresarlo');window.location.href='/recuperoUsuario.jsp'</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
