<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>


<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<style>
*{font-family: 'Poppins', sans-serif;}
</style>
</head>
<body class="w-screen h-screen bg-slate-800 flex flex-row justify-center items-center">
	<div class="h-screen w-1/6 bg-slate-900 fixed top-0 left-0 py-4 px-8 flex flex-col justify-between items-center">
		<h1 class="text-xl text-slate-400 font-bold">Hello :)</h1>
		<a href="login.jsp"><p class="text-blue-400">Logout</p></a>
	</div>
	<div class="bg-slate-800 h-screen w-4/6 p-4 flex flex-col">
		<form method="post" action="AddTast.jsp" class="w-full bg-slate-900 flex flex-col p-4 rounded-md border-solid border-b-2 border-slate-900 ease-in-out duration-1000 hover:border-slate-400 group">
			<div class ="flex gap-2 justify-between items-center">
				<input type="text" name="todo-title" placeholder="Title" class="text-2xl w-10/12 outline-none  border-slate-800 bg-slate-900 rounded-md p-2 ease-in-out duration-300 text-slate-300 font-regular"/><br>
				<input type="date" name="todo-date" placeholder="Date" class="text-md w-2/12 outline-none border-solid border-b-2 border-slate-800 bg-slate-800 group-hover:bg-slate-700 rounded-md p-2 ease-in-out duration-300 text-slate-300 font-regular"/><br>
			</div>
			<div class ="flex gap-2 justify-between items-center mt-3">
			<input type="text" name="description"  placeholder="Description" class="w-10/12 outline-none bg-slate-900 group-hover:bg-slate-700 rounded-md p-2 ease-in-out duration-300 text-slate-300 font-regular"/><br>
	<select name="category" class="w-2/12 outline-none border-solid border-b-2 border-slate-800 bg-slate-800 group-hover:bg-slate-700 rounded-md p-2 ease-in-out duration-300 text-slate-300 font-regular">
	<%
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM category");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			%>
		
			
			<option><%= rs.getString("title")%></option>
		
		<%
		}}
		catch(Exception e){
		out.print(e);
		}
	%>
	</select><br>
	</div>
	<button type="submit" name="addTask" class="rounded bg-gradient-to-r from-indigo-800 to-slate-800 flex justify-center align-center text-slate-200 px-6 py-2 mt-3">
		Add todo
	</button>
	</form>
	
	<h1 class="text-xl text-slate-300 m-4">Your Scheduled Task</h1>
	<%
	
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
	PreparedStatement ps = conn.prepareStatement("SELECT * FROM todo_list");
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
	String id=rs.getString("id");
	%>
		
		<div class="bg-transparent hover:bg-slate-900/80 flex gap-2 m-2 rounded-lg justify-center items-center p-4 ease-in-out duration-700 border-b-4 border-slate-900/50">
			<div class="bg-blue-400 w-20 h-full flex justify-center items-center rounded-lg">
				<%=rs.getString("id")%>
			</div>
			<div class="w-full text-slate-300">
			<div class="flex gap-3 justify-start items-center m-2">
				<p class="text-sm text-slate-400"><%=rs.getString("Time")%></p>
				<h1 class="text-xl"><%=rs.getString("Title")%></h1>
			</div>
			<div class="bg-slate-800/50 px-6 pt-4 py-2 rounded-lg">
				<h3><%=rs.getString("Description")%></h3>
				<p>-><%=rs.getString("Category")%></p>
			</div>
			</div>
			<div class="w-2/12">
				<a href="edit.jsp?ed=<%= id %>">edit</a>
				<a href="delete?del=<%= id %>">delete</a>
			</div>
		</div>
		<%
	}
}
	catch(Exception e){
		out.print(e);
	}

%>
	</div>
	<div class="bg-slate-900/50 p-4 h-screen w-1/6 fixed right-0">
		<div class="">
			<h3 class="text-slate-300 mb-8">Category</h3>
			<form method="post" action="addcategory.jsp" class="w-full bg-slate-900 flex flex-col p-4 rounded-md border-solid border-b-2 border-slate-900 ease-in-out duration-1000 hover:border-slate-400 group">
			<div class ="flex gap-2 justify-between items-center">
				<input type="text" name="todo-title" placeholder="Title" class="text-sm w-10/12 outline-none  border-slate-800 bg-slate-900 rounded-md p-2 ease-in-out duration-300 text-slate-300 font-regular"/><br>
				<input type="submit" value="+" name="addCategory" class="text-md w-2/12 outline-none border-solid border-b-2 border-slate-800 bg-slate-800 group-hover:bg-slate-700 rounded-md p-2 ease-in-out duration-300 text-slate-300 font-regular"/>
			</div>
			</form>
		</div>
	</div>
</body>

</html>





