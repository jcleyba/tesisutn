package Controller;

import DAO.ServicioJugadores;
import Model.Usuario;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by juancruzleyba on 10/28/15.
 */
@WebServlet(name = "ServletRecuperoPass", urlPatterns = {"/recuperoPass"})
public class ServletRecuperoPass extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        ServicioJugadores ser = new ServicioJugadores();
        String username = request.getParameter("txtUsername");
        Usuario user = ser.passwordPorUsuario(username);


        if(user != null)
        {
            String toAddress = user.getEmail();
            String subject = "Recupero usuario Golftime";
            String message = "Estimado usuario de Golftime:\nSu contraseña  es: " + user.getPassword()+"\n\nPor razones de seguridad elimine este correo electrónico o modifique su contraseña al ingresar nuevamente al sistema. \n\n Equipo de Golftime";


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
            out.println("<script>alert('Su nombre de usuario no es correcto por favor vuelva a ingresarlo');window.location.href='/recuperoUsuario.jsp'</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }
}
