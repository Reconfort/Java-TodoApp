package com.group5.login;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.xdevapi.Statement;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter x=response.getWriter();
		
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pswd");
		try {
			Connection con=null;
			Statement stmt=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
			stmt=(Statement) con.createStatement();
			ps=(PreparedStatement) con.prepareStatement("SELECT * FROM user");
			rs=(ResultSet) ps.executeQuery();
			while(rs.next()) {
				String user1=rs.getString("Username");
				String pass1=rs.getString("Password");
				if(uname.equals(user1)&& pass.equals(pass1)) {
					HttpSession session=request.getSession();
					session.setAttribute("username",uname);
					response.sendRedirect("Index.jsp");
					
				}
				else
				{
					
					x.print("login failed");
					RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
					rd.include(request, response);
				}
				}
			
		}
	
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
		
		
		
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
				doPost(request, response);
	}
	}


