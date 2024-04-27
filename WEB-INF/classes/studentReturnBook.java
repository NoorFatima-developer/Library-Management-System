import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.annotation.*;

@WebServlet(value="/studentReturnBook")
public class studentReturnBook extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		//response.setContentType("text/html");

		PrintWriter out=response.getWriter();
		String stname=request.getParameter("studentname");
		String stemail=request.getParameter("studentemail");
		String bookID=request.getParameter("bookid");
			 
		out.println("<html>");
        out.println("<head><title>returnBook</title></head>");
		
		if(stname.equals("")||stemail.equals("")||bookID.equals(""))
		{      
		RequestDispatcher rd=request.getRequestDispatcher("studentReturnBook.jsp");
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

			String query = "select * from issueBooks where bookID='"+bookID+"'";
			ResultSet rs = st.executeQuery(query);

            if(rs.next())             //if book is issued from this library
            {
            	System.out.println("book is issued from this lib");
				out.println("<body style='background-color:#a4a0a0;'>");
			    out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			    out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>");

                //found book in bookInfo DB
			    String querry="select * from bookinfo where bookID='"+bookID+"'";
			    ResultSet reset=st.executeQuery(querry);

			    if(reset.next())
			    {
			    	System.out.println("found book");
			  	    
			  	    String query2="select * from issuebooks where bookID='"+bookID+"'";
			        ResultSet rs2=st.executeQuery(query2);

                    if(rs2.next())
                    {
				    	java.util.Date issuedt = rs2.getDate("issuedate");
			            java.util.Date currentdt = new java.sql.Date(System.currentTimeMillis());

		                // convert time into milisec of specific date
		                //returns the number of milliseconds since January 1, 1970, 
			            long l1 = currentdt.getTime();
			            long l2 = issuedt.getTime();

			            long diff = l1 - l2;
			            long day = diff/86400000;
			
			            long extraDays = 0;
			            long fine = 0;
		                extraDays = day - 3;

		                System.out.println(issuedt);
		                System.out.println(currentdt);
		                System.out.println(l1);
		                System.out.println(l2);
		                System.out.println(diff);
		                System.out.println(day);
		                System.out.println(extraDays);


			            if(extraDays >= 1)
			            {
			            	fine = extraDays * 50;
			            	out.println("<hr><center><h3>You have to pay fine of Rs: " + fine + " because you return book after " +extraDays+ " days.</h3></center>");
			            }
			            else if(extraDays<1)
			            {
			            	out.println("<hr><center><h3>No Fine</h3></center>");
			            }
                    }

			    	//change bookstatus in bookinfo DB
			        String querrry = "update bookinfo set bookstatus='1' where  bookID='"+bookID+"'";
			        int rset = st.executeUpdate( querrry );	

                    // delete book from issued books
			        String querryy="delete from issueBooks where bookID='"+bookID+"'";
			        int results=st.executeUpdate(querryy);

                    // if changes done successfully
			        if(rset>0 && results >0)
			        {
			        	out.println("<br><center><h3>Book returned successfully</h3></center>");
			        }
			        //if changes donot done properly
			        else
			        {
			        	out.println("<hr><center><h3>Book not returned successfully</h3></center>");
			            out.println("<br><center>Do you want to try it again???</center>");
			            out.println("<center><a href='studentReturnBook.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>Yes</BUTTON><a href='studentHome.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>No</BUTTON></a></strong></strong></center>");

			        }		    	

			    }
			}
			// if book is not issued from this library
			else
			{
				out.println("<body style='background-color:#a4a0a0;'>");
			    out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			    out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>");
     		    out.println("<center>Book is not issued from this library!!!</center>");
			}
           
       		out.println("<hr><br><center>Do you want to return another book???</center>");
			out.println("<center><a href='studentReturnBook.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>Yes</BUTTON><a href='studentHome.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>No</BUTTON></a></strong></strong></center>");                

    	    out.println("</body></html>");
            out.close();
            st.close();
            con.close();

         }catch(Exception e)
    		{
    		    out.println("<h3>Exception : "+e);
     		    out.println("<center><a href='studentReturnBook.jsp'><button style='padding:10px 20px;background-color:blue;'><strong>Enter Again</BUTTON></a></strong></strong></center>");
    		}   		    
		}		
    }				
}

   