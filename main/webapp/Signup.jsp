<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TodO SignUp</title>
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
<body class="w-screen h-screen bg-gradient-to-tr from-slate-900 via-slate-500 to-slate-900 flex flex-col justify-center items-center">
	<div class="w-4/5 bg-slate-800 rounded-2xl drop-shadow-2xl flex justify-center align-center">
	<form method="post" class="bg-slate-900 p-10 w-3/5 rounded-l-xl">
		<div class="p-4 m-2 hover:border-solid hover:border-l-4 hover:border-slate-800 group ease-in-out duration-300">
			<label class="text-slate-400 mt-6 ease-in-out duration-500">Username:</label><br>
			<input type="text" name="uname" class="w-full outline-none border-solid border-b-2 border-slate-800 bg-slate-800 group-hover:bg-slate-700 rounded-md p-2 ease-in-out duration-300 text-slate-300 font-regular"/><br>
		</div>
		<div class="p-4 m-2 hover:border-solid hover:border-l-4 hover:border-slate-800 group ease-in-out duration-300">
			<label class="text-slate-400 mt-6 ease-in-out duration-500">Email:</label><br>
			<input type="email" name="email" class="w-full outline-none border-solid border-b-2 border-slate-800 bg-slate-800 group-hover:bg-slate-700 rounded-md p-2 ease-in-out duration-300 text-slate-300 font-regular"/><br>
		</div>
		<div class="p-4 m-2 hover:border-solid hover:border-l-4 hover:border-slate-800 group ease-in-out duration-300">
			<label class="text-slate-400 mt-6 ease-in-out duration-500">Contact:</label><br>
			<input type="text" name="telephone" class="w-full outline-none border-solid border-b-2 border-slate-800 bg-slate-800 group-hover:bg-slate-700 rounded-md p-2 ease-in-out duration-300 text-slate-300 font-regular"/><br>
		</div>
		<div class="flex items-center">
			<div class="p-4 w-1/2 m-2 hover:border-solid hover:border-b-4 hover:border-slate-800 group ease-in-out duration-300">
				<label class="text-slate-400 mt-6 ease-in-out duration-500">Password:</label><br>
				<input type="password" name="pswd1" class="w-full outline-none border-solid border-b-2 border-slate-800 bg-slate-800 group-hover:bg-slate-700 rounded-md p-2 ease-in-out duration-300 text-slate-300 font-regular"/><br>
			</div>
			<div class="p-4 w-1/2 m-2 hover:border-solid hover:border-b-4 hover:border-slate-800 group ease-in-out duration-300">
				<label class="text-slate-400 mt-6 ease-in-out duration-500">Confirm Password:</label><br>
				<input type="password" name="paswd2" class="w-full outline-none border-solid border-b-2 border-slate-800 bg-slate-800 group-hover:bg-slate-700 rounded-md p-2 ease-in-out duration-300 text-slate-300 font-regular"/><br>
			</div>
		</div>
		<button type="submit" name="addUser" class="rounded bg-gradient-to-r from-indigo-800 to-slate-800 flex justify-around align-center py-4 px-8 text-slate-400 ml-6">
			<span class="material-symbols-outlined">
				add_task
			</span>
			Create Account
		</button>
	</form>
	<div class=" w-2/5 rounded-r-xl flex flex-col justify-center items-center p-8">
	<h1 class="text-5xl text-indigo-500">Holla :)</h1>
	<p class="text-slate-200 font-thin text-xl text-center my-4 mt-12">
		Until you value yourself, you will not value your time. Until you value your time, you will not do anything with it
	</p>
	
	<img src="asset/signup.svg" alt="Sign in image" class="w-2/5 my-8"/>
	
	<p class="text-slate-200 font-thin text-xl text-center my-4 mt-12">
		If you are alread member <a href="login.jsp" class="text-indigo-500 font-bold">Sign in</a>
	</p>
	</div>
	</div>
	
</body>
</html>
<%
	if(request.getParameter("addUser")!=null){
	
String Id=null;
String user=request.getParameter("uname");
String email=request.getParameter("email");
String tel=request.getParameter("telephone");
String pass=request.getParameter("pswd1");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
	PreparedStatement ps = conn.prepareStatement("INSERT INTO user VALUES(?,?,?,?,?)");
	ps.setString(1,Id );
	ps.setString(2, user);
	ps.setString(3, email);
	ps.setString(4, pass);
	ps.setString(5, tel);
	
	int setCount = ps.executeUpdate();
	if(setCount > 0){
		out.print("Your Account have Created Successfull!!");
response.sendRedirect("login.jsp");
	}
	else{
		out.print("failed");
		
	}
}
catch(Exception e){
	out.print(e);
}
}
%>