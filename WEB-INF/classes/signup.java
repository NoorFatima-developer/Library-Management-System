import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.annotation.*;

@WebServlet(value="/signup")
public class signup extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		//response.setContentType("text/html");

		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String city=request.getParameter("city");
		String usertype=request.getParameter("usertype");
			 
		out.println("<html>");
        out.println("<head><title>saveinfo</title></head>");
		out.println("<body bgcolor=\"#f1f1\">");
		
		if(username.equals("")||password.equals("")||email.equals("")||phone.equals("")||city.equals("")||usertype.equals(""))
		{      
			RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
	        out.println("<h3>Please fill all the fields </h3>");        
			rd.forward(request,response);
	    }

        if(!(usertype.equals("admin")) && (!(usertype.equals("student"))))
		{      
			out.println("<body style='background-color:#a4a0a0;'>");
			out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>");
	        out.println("<center><h3>Please fill usertype correctly</h3></center>"); 
	        out.println("<center><a href='signup.jsp'><button style='padding:20px 35px;background-color:skyblue;'><strong>Enter Again</BUTTON></a></strong></strong></center>");   		
        }
		
		else
		{
			try
		 	{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/class_test";
			Connection con=DriverManager.getConnection(url, "root", "root");
			Statement st=con.createStatement();
			String query = "INSERT INTO usersinfo(username,password,email,city,phone,usertype)VALUES('"+ username + "','" +password+ "','"+email+"','"+city+"','"+phone+"','"+usertype+"')";

			//System.out.println(query);

			int rs = st.executeUpdate( query );

			if(rs==1)
			{
			out.println("<body style='background-color:#a4a0a0;'>");
			out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>"); 	 
			out.println("<h4>Registration confirmation message</h4>"); 
			out.println("<hr>Account has been registered successfully!!!");
			out.println("<hr><br><center>Do you want to make another account???</center>");
			out.println("<center><a href='signup.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>Yes</BUTTON><a href='home.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>No</BUTTON></a></strong></strong></center>");               
			}
			
			else
			{	
			out.println("<body style='background-color:#a4a0a0;'>");
			out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>");	
     		out.println("<h1>Record could not be inserted.</h1>"); 	
     		out.println("<center><a href='signup.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>Enter Again</BUTTON></a></strong></strong></center>");

			}

    	out.println("</body></html>");
        st.close();
        con.close();

            }catch(Exception e)
    		{
    		out.println("<body style='background-color:#a4a0a0;'>");
			out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>");
     		out.println("<h3>Error : "+e);
     		out.println("<center><a href='signup.jsp'><button style='padding:20px 35px;background-color:skyblue;'><strong>Enter Again</BUTTON></a></strong></strong></center>");
    		}		
    	}
    }
}