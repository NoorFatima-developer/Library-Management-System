import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.annotation.*;

@WebServlet(value="/issueBook")
public class issueBook extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		//response.setContentType("text/html");

		PrintWriter out=response.getWriter();
		String stname=request.getParameter("studentname");
		String stemail=request.getParameter("studentemail");
		String stphone=request.getParameter("studentphone");
		String bookID=request.getParameter("bookid");
		String bookname=request.getParameter("bookname");
		System.out.println(stname);
		System.out.println(stemail);
		System.out.println(stphone);
		System.out.println(bookID);
		System.out.println(bookname);			 
        out.println("<head><title>issueBook</title></head>");
		out.println("<body bgcolor=\"#f1f1\">");
		
		if(stname.equals("")||stemail.equals("")||stphone.equals("")||bookID.equals("")||bookname.equals(""))
		{      
		RequestDispatcher rd=request.getRequestDispatcher("issueBook.jsp");
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

			// found book in library
			String query1 = "select * from bookinfo where bookID="+bookID+"";
			ResultSet rs1 = st.executeQuery(query1);
            

            if(rs1.next())             //if library have book
            {
            	System.out.println("if library have book");
				out.println("<body style='background-color:#a4a0a0;'>");
			    out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			    out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>");

			    int bookStatus = rs1.getInt("bookstatus");
                //String bookStatus ="1";
                System.out.println(bookStatus);

			    //confirm librarian is a member
			    String query2 = "select * from usersinfo where email='"+stemail+"'";
			    ResultSet rs2 = st.executeQuery(query2);
			  if(rs2.next())
			  {
			  	System.out.println("confirm librarian");
			   
			    
			    //if(bookStatus.equals("0"))    //book available but issued already
			    if (bookStatus==0)
			    {
			    	System.out.println("issued already");
			    	out.println("<center><h3>Sorry, this book is issued already.</h3><p>We may have shortage of books. Kindly visit later.</p></center>");
 			        out.println("<br><center>Do you want to issue another books???</center>");
			        out.println("<center><a href='issueBook.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>Yes</BUTTON><a href='home.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>No</BUTTON></a></strong></strong></center>");
                   
			    }
			    //else if(bookStatus.equals("1"))       // book available and not issued
			    else if (bookStatus==1)
			    {
			    	System.out.println("not issued");
                    java.util.Date issuedt = new java.sql.Date(System.currentTimeMillis());

			    	String query3 = "INSERT INTO issueBooks(studentname,studentemail,studentphone,bookID,bookname,issuedate)VALUES('"+ stname + "','" +stemail+ "','"+stphone+"','"+bookID+"','"+bookname+"','"+issuedt+"')";
			        int rs3 = st.executeUpdate( query3 );

                    // change book status in DB
			        String query4 = "update bookinfo set bookstatus='0' where  bookID='"+bookID+"'";
			        int rs4 = st.executeUpdate( query4 );

			        if(rs3>0 && rs4>0) 
			        {
			        	out.println("<hr><center><h3>Book issued successfully</h3></center>");
			            out.println("<br><center>Do you want to issue more books???</center>");
			            out.println("<center><a href='issueBook.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>Yes</BUTTON><a href='home.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>No</BUTTON></a></strong></strong></center>");
			      
			        }

			        else   // if changes not done successfully in DB
			        {
			        	out.println("<hr><center><h3>Book not issued successfully</h3></center>");
			            out.println("<br><center>Do you want to issue again???</center>");
			            out.println("<center><a href='issueBook.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>Yes</BUTTON><a href='home.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>No</BUTTON></a></strong></strong></center>");
			        }
			    }


			  }

			  else
			  {
			    //librarian is not member
			    System.out.println("librarian is not member");
    		    out.println("<center>Sorry you are not member of LMS.First Signup then borrow books.</center>");
    		    out.println("<center>Thank You!!!</center>");     		    			  
       		    out.println("<hr><br><center>Do you want to issue book from another account ???</center>");
			    out.println("<center><a href='issueBook.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>Yes</BUTTON><a href='home.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>No</BUTTON></a></strong></strong></center>");                

			  }

     		}

     		else   // library dont have book
     		{
     			System.out.println("library dont have book");
    			out.println("<body style='background-color:#a4a0a0;'>");
			    out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			    out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>");
     		    out.println("<center>Book not found<center>");
       		    out.println("<hr><br><center>Do you want to issue another book ???</center>");
			    out.println("<center><a href='issueBook.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>Yes</BUTTON><a href='home.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>No</BUTTON></a></strong></strong></center>");
     		}
    	    out.println("</body></html>");
            out.close();
            st.close();
            con.close();

         }catch(Exception e)
    		{
    			System.out.println("exception");
     		    out.println("<h3>Error : "+e);
     		    out.println("<center><a href='issueBook.jsp'><button style='padding:10px 20px;background-color:blue;'><strong>Enter Again</BUTTON></a></strong></strong></center>");
    		}   		    
		}	
    }				
}
