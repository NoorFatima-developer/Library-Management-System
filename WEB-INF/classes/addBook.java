import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.annotation.*;

@WebServlet(value="/addBook")
public class addBook extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		//response.setContentType("text/html");

		PrintWriter out=response.getWriter();
		String bookID=request.getParameter("bookid");
		String bookname=request.getParameter("bookname");
		String author=request.getParameter("author");
		String edition=request.getParameter("edition");
			 
		out.println("<html>");
        out.println("<head><title>saveinfo</title></head>");
		out.println("<body bgcolor=\"#f1f1\">");
		
		if(bookID.equals("")||bookname.equals("")||author.equals("")||edition.equals(""))
		{      
		RequestDispatcher rd=request.getRequestDispatcher("addBook.jsp");
        out.println("<h3>Please fill all the fields </h3>");        
		rd.forward(request,response);
        }

		else
		{
			try
		 	{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/class_test";
			Connection con=DriverManager.getConnection(url, "root", "root");
			Statement st=con.createStatement();
			String query = "INSERT INTO bookinfo(bookID,bookname,author,edition)VALUES('"+ bookID + "','" +bookname+ "','"+author+"','"+edition+"')";
			System.out.println(query);

			int rs = st.executeUpdate( query );

			if(rs==1)
			{
			out.println("<body style='background-color:#a4a0a0;'>");
			out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>"); 	 
			out.println("<h3>Registration confirmation message</h3>"); 
			out.println("<br><center>Book has been entered successfully!!!</center>");
			out.println("<hr><br><center>Do you want to add new book???</center>");
			out.println("<center><a href='addBook.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>Yes</BUTTON><a href='home.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>No</BUTTON></a></strong></strong></center>");
                 
			}

    	  	else
    	  	{
    	  		out.println("<h3>Book not saved.</h3>");
    	  		RequestDispatcher rd=request.getRequestDispatcher("addBook.jsp");
      	        rd.forward(request,response);
    	    }

    	    //request.getRequestDispatcher("addBook.html").forward(request, response);
    	    out.println("</body></html>");
            out.close();
            st.close();
            con.close();

            }catch(Exception e)
    		{
    			out.println("<body style='background-color:#a4a0a0;'>");
			    out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			    out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>");
     		    out.println("<h3>Error : "+e);
     		    out.println("<center><a href='addBook.jsp'><button style='padding:10px 20px;background-color:blue;'><strong>Enter Again</BUTTON></a></strong></strong></center>");
    		}		
    	}
    }
}