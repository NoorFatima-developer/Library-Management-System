import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.annotation.*;

@WebServlet(value="/login")
public class login extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html");

		PrintWriter out=response.getWriter();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");

		out.println("<html>");
        out.println("<head><title>saveinfo</title></head>");
		out.println("<body bgcolor=\"#f1f1\">");
		
		if(username.equals("")||password.equals("")||email.equals(""))
		{      
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
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

				//String query = "INSERT INTO usersinfo(username,password,email,city,phone,usertype)VALUES('"+ fname + "','" +password+ "','"+email+"','"+city+"','"+phone+"','"+usertype+"')";
            	String query="Select * from usersinfo where (username='"+username+"' and password='"+password+"' and email='"+email+"')";
				System.out.println(query);
				ResultSet rs = st.executeQuery(query);

		        if(rs.next())
		        {
		        	out.println("<h1>Record found</h1>");
     	    		//String name = rs.getParameter("name");
              
                    // create session   
        		    HttpSession session= request.getSession();
        		    
                    //set usertype in session
                    String user_type = rs.getString("usertype");
                    session.setAttribute("key",user_type);  // key , value

                    // set email in session management
                    String emaiil = rs.getString("email");
                    session.setAttribute("emailID",emaiil);  // key , value

    	    		if(user_type.equals("admin"))
    	    		{
            		RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
    	    		rd.forward(request,response);
    	    	    }
    	    	    if(user_type.equals("student"))
    	    		{
            		RequestDispatcher rd=request.getRequestDispatcher("studentHome.jsp");
    	    		rd.forward(request,response);
    	    	    }
                    else
                    {
                    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                    rd.forward(request,response);
                    }                    
    	  		}
    	  		else
    	  		{
    	  			out.println("<body style='background-color:#a4a0a0;'>");
			        out.println("<h1 style='text-align:left;'><font size='300' face='italic'><image src='logo1.jpg' width='300' height='250' style='float left'>");
			        out.println("<em><strong>Library Management System(LMS) </strong></em></font></h1><hr>");
                    out.println("<center><h3>Invalid username or password or email </h3></center>");
                    out.println("<center><a href='login.jsp'><button style='padding:10px 20px;background-color:skyblue;'><strong>Enter Again</BUTTON></a></strong></strong></center>");	
                    out.println("<h3><p>if you dont have any account then please make your account first through admin</p></h3>");
    	  			//RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
    	            //rd.include(request,response);       	            
    	        }

    	        //request.getRequestDispatcher("login.jsp").include(request, response);
		

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
     		out.println("<center><a href='login.html'><button style='padding:20px 35px;background-color:skyblue;'><strong>Enter Again</BUTTON></a></strong></strong></center>");
    		}		
    	}
    }
}