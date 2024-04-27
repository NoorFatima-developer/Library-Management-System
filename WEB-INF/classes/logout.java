
//sabke attributes remove kro
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;
import javax.servlet.annotation.*; 
@WebServlet(value="/logout")

public class logout extends HttpServlet 
{
//Process the HTTP Get request
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   {
     response.setContentType("text/html");

     // get PrintWriter object
      PrintWriter out = response.getWriter();
	  HttpSession session=request.getSession();
	  session.removeAttribute("user_type");
	  session.invalidate();
	  response.sendRedirect("login.jsp");
	}
}