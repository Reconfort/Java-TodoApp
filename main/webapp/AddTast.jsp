<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=null;
String title=request.getParameter("todo-title");
String desc=request.getParameter("description");
String tododate=request.getParameter("todo-date");
String cat=request.getParameter("category");

try{
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
	PreparedStatement ps = conn.prepareStatement("INSERT INTO todo_list VALUES(?,?,?,?,?)");
	ps.setString(1,id );
	ps.setString(2,title);
	ps.setString(3,desc);
	ps.setString(4,tododate );
	ps.setString(5,cat );
	
	
	int setCount = ps.executeUpdate();
	if(setCount > 0){
		//out.print("<script>alert('data inserted well')</script>");
		response.sendRedirect("Index.jsp");
	}
	else{
		out.print("Failed");
		
	}
	
	
}
catch(Exception e){
	e.printStackTrace();
}


%>





</body>
</html>