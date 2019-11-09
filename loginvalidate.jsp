<%@page language="java"  import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*,javax.sql.*,java.util.*"%>
<%

try{
Connection con=null;
Statement stmt=null;
PreparedStatement ps=null;
ResultSet rs=null;

Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr123");

String userid=request.getParameter("email");
userid=userid.trim();
String password=request.getParameter("password");
password=password.trim();

if(userid.equals(null)||userid.equals("")||password.equals(null)||password.equals("")){
response.sendRedirect("home.html?msg=please enter details");
return;	
}

String username="",cpassword="";

ps=con.prepareStatement("select email,password from users where email=? and password=?");
ps.setString(1,userid);
ps.setString(2,password);
rs=ps.executeQuery(); 
while(rs.next())
{
	username=rs.getString("email");
	cpassword=rs.getString("password");
}

if(username.equals(userid)&&cpassword.equals(password)){
session.setAttribute("username",username);
System.out.println(username+" Has Logged In");
response.sendRedirect("manage users.jsp");
}	
else{	
response.sendRedirect("home.html?msg=please enter valid details");	
}	
ps.close();
con.close();
}
catch(Exception eee)
{
System.out.println("loginvalidate:"+eee);
response.sendRedirect("home.html");
}
%>
