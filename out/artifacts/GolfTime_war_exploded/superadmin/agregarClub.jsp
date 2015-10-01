<%-- 
    Document   : agregarClub
    Created on : 01-sep-2015, 22:47:31
    Author     : juanleyba
--%>


<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="Model.Club"%>
<%@page import="Controller.ClubesController"%>
<%@ page contentType="text/html;charset=UTF-8" %>
 
<%
    ClubesController cc = new ClubesController();
    String nombre = "";
    String logo = "";
    String direccion = "";
    String telefono = "";
    String email = "";
    String path = request.getServletContext().getRealPath("")+"/images/";
    
    
    DiskFileItemFactory factory = new DiskFileItemFactory();
    factory.setSizeThreshold(10000000);
    ServletFileUpload upload = new ServletFileUpload(factory);
    upload.setSizeMax(1000000000);
    List archivosList = upload.parseRequest(request);
    Iterator i = archivosList.iterator();
   
    while(i.hasNext()){
        FileItem f1 = (FileItem)i.next();
        if(!f1.isFormField()) {
            logo = f1.getName();
            cc.uploadImage(path,f1);        
        }
        else
        {
            if(f1.getFieldName().equals("txtNombreClub"))
            {
                nombre = new String(f1.getString().getBytes("ISO-8859-1"),"UTF-8");              
            }
            else if(f1.getFieldName().equals("txtDireccion"))
            {
                direccion = new String(f1.getString().getBytes("ISO-8859-1"),"UTF-8");
            }
            else if(f1.getFieldName().equals("txtTelefono"))
            {
                telefono = new String(f1.getString().getBytes("ISO-8859-1"),"UTF-8");
            }
            else 
            {
                email = new String(f1.getString().getBytes("ISO-8859-1"),"UTF-8");
            }
        }    
       
    }
     cc.addClub(nombre,logo,direccion,telefono,email);
    
     response.sendRedirect("index.jsp");
    
    
%>