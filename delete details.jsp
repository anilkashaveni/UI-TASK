<%@page language="java"  import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*,javax.sql.*,java.util.*"%>


<%

try{
Connection con=null;
Statement stmt=null;

Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr123");

String pid=request.getParameter("email");

    
 PreparedStatement ps=con.prepareStatement("delete from users where email= '"+pid+"'");
 ps.executeUpdate();
 con.commit();
ps.close();
con.close();

response.sendRedirect("manage users.jsp?msg=details deleted");
}
catch(Exception eee)
{
System.out.println("cart:"+eee);
response.sendRedirect("manage users.jsp?remove=Remove");
}
%>