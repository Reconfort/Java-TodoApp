

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class delete extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter x=response.getWriter();
		String del=request.getParameter("del");
		String delete=del;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","");
			PreparedStatement ps=(PreparedStatement) conn.prepareStatement("DELETE FROM todo_list WHERE id=?");
			ps.setString(1, delete);
			int y=ps.executeUpdate();
			if(y!=0) {
				response.sendRedirect("Index.jsp");
			}
			else {
				x.print("failed");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}}
	
