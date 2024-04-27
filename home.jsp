 <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

	String user_type =(String)session.getAttribute("key");
	System.out.println(user_type);

	if(user_type==null)
	{
		request.setAttribute("msg","login first");
		RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	    rd.forward(request,response);
	}
	else if(user_type.equals("student"))
	{
		request.setAttribute("msg","login as admin first");
		RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
	    rd.forward(request,response);
	}
%>

<html>
<head><title>Home</title></head>
<body style="background-color:#a4a0a0;">


<h1 style="text-align:left;"><font size="300" face="italic"><image src="logo1.jpg" width="300" height="250" style="float left">
<em><strong>Library Management System(LMS) </strong></em></font></h1>

<hr>
<u><h1 style="text-align:center;"><font size="300" face="italic">
<em><strong> ..........Welcome to Library Management System.......... </strong></em></font></h1></u>

<!--Buttons-->

	<form name="home" action="home.jsp" method="post">
	<button style="padding:10px 20px;float:left;background-color:none;"><strong>HOME</strong></button>
	</form>

	<form name="add admin" action="signup.jsp" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>Add User</strong></button>
	</form>


	<form name="add student" action="signup.jsp" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>Add Librarian</strong></button>
	</form>

	<form name="addbook" action="addBook.jsp" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>Add Book</strong></button>
	</form>

	<form name="deleteBook" action="deleteBook.jsp" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>Delete Book</strong></button>
	</form>

	<form name="updateBook" action="updateBook.jsp" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>Update Book</strong></button>
	</form>

	<form name="searchBook" action="searchBook.jsp" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>Search Book</strong></button>
	</form>

	<form name="issueBook" action="issueBook.jsp" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>Issue Book</strong></button>
	</form>

	<form name="returnBook" action="returnBook.jsp" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>Return Book</strong></button>
	</form>

	<form name="viewBooksInfo" action="viewBooksInfo.jsp" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>ViewBooksInfo</strong></button>
	</form>

	<form name="fine policy" action="finePolicy.jsp" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>Fine Policy</strong></button>
	</form>

	<form name="borrowedBooks" action="borrowedBooks.jsp" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>Borrowed Books</strong></button>
	</form>

	<form name="madeby" action="made.html" method="post">
	<button style="padding:10px 20px;float: left;background-color:none;"><strong>MadeBy</strong></button>
	</form>

	<form name="logout" action="logout" method="post">
	<button style="padding:10px 20px;float: left;background-color:skyblue;"><strong>Logout</strong></button>
	</form>

<hr>
<br>
<br>
<br>
<br>
<hr>


<img src="lib2.jpg" style="float:right;width:500px;height:400px;">
<img src="lib1.jpg" style="float:left;width:500px;height:400px;">
<h4><p><center>A library is a curated collection of sources of information and similar resources, selected by experts and made accessible to a defined community for reference or borrowing. It provides physical or digital access to material, and may be a physical location or a virtual space, or both. A library's collection can include books, periodicals, newspapers, manuscripts, films, maps, prints, documents, microform, CDs, cassettes, videotapes, DVDs, Blu-ray Discs, e-books, audiobooks, databases, and other formats. 


</body>
</html>
