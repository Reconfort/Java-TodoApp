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
	String ed=request.getParameter("ed");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
	PreparedStatement ps = conn.prepareStatement("SELECT * FROM todo_list where id=?");
	ps.setString(1, ed);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){%>
		<div>
		<h1>Welcome</h1>
		<a href="login.jsp">Logout</a>
		<div>
		<h3>Add todo on List</h3>
		<form method="post">
		<input type="text" name="todo-title" value="<%=rs.getString("Title") %>" /><br>
		<input type="text" name="description" value="<%=rs.getString("Description") %>"/><br>
		<input type="date" name="todo-date" value="<%=rs.getString("Time") %>"/><br>
		<%
		}
		%>
		<select name="category">
		<%
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
			PreparedStatement pes = conn.prepareStatement("SELECT * FROM category");
			ResultSet res=pes.executeQuery();
			while(rs.next()){
			%>
				<option><%= res.getString("title")%></option>

			<%
			}}
			catch(Exception e){
			out.print(e);
			}%>
		</select><br>
		<input type="submit" value="Add task" name="addTask"/>
		</form>
	
		<%
		String title=request.getParameter("todo-title");
		String desc=request.getParameter("description");
		String tododate=request.getParameter("todo-date");
		String cat=request.getParameter("category");
		if(title!=null && desc!=null &&tododate!=null){
        	
        	try{
        		Class.forName("com.mysql.cj.jdbc.Driver");
        		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
        		PreparedStatement pss=con.prepareStatement("update todo_list set Title=?,Description=?,Time=? where id=?");
        		pss.setString(1, title);
        		pss.setString(2, desc);
        		pss.setString(3, tododate);
        		pss.setString(4, ed);
        		int y=pss.executeUpdate();
        		if(y!=0){
        			response.sendRedirect("Index.jsp");
        		}
        		else{
        			out.print("failed");
        		}
        	}
		catch(Exception e){
			e.printStackTrace();
		}
		}
		
		%>
	
	
	

</body>
</html>