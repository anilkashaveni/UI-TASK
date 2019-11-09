<%@page language="java"  import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*,javax.sql.*,java.util.*"%>


<%

try{
Connection con=null;
Statement stmt=null;

Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr123");

String s1=request.getParameter("sid");
String s2=request.getParameter("sname");
String s3=request.getParameter("email");
String s4=request.getParameter("class");
String s5=request.getParameter("enrollyear");
String s6=request.getParameter("city");
String s7=request.getParameter("country");

 if(s1.equals(null)||s1.equals("")||s3.equals(null)||s3.equals("")
	||s4.equals(null)||s4.equals("")||s5.equals(null)||s5.equals("")||s6.equals(null)||s6.equals("")||s7.equals(null)||s7.equals("")){
response.sendRedirect("manage users.jsp?msg=please enter details");
return;	
}
   
 PreparedStatement ps=con.prepareStatement("update users set id='"+s1+"',email='"+s3+"',classes='"+s4+"',year='"+s5+"',city='"+s6+"',country='"+s7+"' where email='"+s3+"'");
 ps.executeUpdate();
 con.commit();
ps.close();
con.close();

response.sendRedirect("manage users.jsp?msg=details added");
}
catch(Exception eee)
{
System.out.println("cart:"+eee);
response.sendRedirect("manage users.jsp?remove=Remove");
}
%>