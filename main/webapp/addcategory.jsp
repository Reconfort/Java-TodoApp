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
if(request.getParameter("addCategory")!=null){
String Id=null;
String CatTitle=request.getParameter("cat-title");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
	PreparedStatement ps = conn.prepareStatement("INSERT INTO category VALUES(?,?)");
	ps.setString(1,Id );	
	ps.setString(2, CatTitle);
	
	int setCount = ps.executeUpdate();
	if(setCount > 0){
		out.print("<script>alert('Category Created')</script>");
		//response.sendRedirect("Index.jsp");
	}
	else{
		out.print("Failed");
		
	}
}
catch(Exception e){
	out.print(e);
}
}


%>




</body>
</html>