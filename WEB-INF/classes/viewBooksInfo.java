import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.annotation.*;

@WebServlet(value="/viewBooksInfo")
public class viewBooksInfo extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		//response.setContentType("text/html");

		PrintWriter out=response.getWriter();

		out.println("<html>");
        out.println("<head><title>viewbooksinfo</title></head>");
		out.println("<body bgcolor=\"#f1f1\">");
		try
		 {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1/class_test";
			Connection con=DriverManager.getConnection(url, "root", "root");
			Statement st=con.createStatement();
			String query = "select * from bookinfo";
			System.out.println(query);

			ResultSet rs = st.executeQuery(query);

            if(rs.next())
            {
				out.println("<body style='background-color:#a4a0a0;'>");
			    out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			    out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>"); 	
                out.println("<table class='table table-bordered table-striped'>");
     		    out.println("<tr><th>bookID</th><th>BookName</th><th>Author</th><th>Edition</th>");
  
                while(rs.next())
            	{
			    String bookName = rs.getString("bookname");
			    String bookid = rs.getString("bookID");
			    String author = rs.getString("author");
			    String edition = rs.getString("edition");

     		    out.println("<tr><td>"+bookid+"</td><td>"+bookName+"</td><td>"+author+"</td><td>"+edition+"");
     		    }

		        out.println("</table>");      		    
		    }
			
			else
			{
    			out.println("<body style='background-color:#a4a0a0;'>");
			    out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			    out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>");
     		    out.println("Books not found");
     		    out.println("<center><a href='home.html'><button style='padding:10px 20px;background-color:skyblue;'><strong>Go Back</BUTTON></a></strong></strong></center>");
			}

    	    out.println("</body></html>");
    	    response.sendRedirect("viewBooksInfo");
            out.close();
            st.close();
            con.close();



        }catch(Exception e)
         {
         	out.println("<body style='background-color:#a4a0a0;'>");
			out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>");
     		out.println("<h3>Error : "+e);
     		out.println("<center><a href='home.html'><button style='padding:10px 20px;background-color:blue;'><strong>Enter Again</BUTTON></a></strong></strong></center>");
    	 }			
		
     }
}