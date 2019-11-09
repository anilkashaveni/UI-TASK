<%@page language="java"  import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*,javax.sql.*,java.util.*"%>
<%
try{
	PreparedStatement pstmt=null;
    ResultSet rs=null;
    Connection conn=null;

Class.forName("oracle.jdbc.driver.OracleDriver");

conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr123");

         String s1=request.getParameter("fname");
		 String s2=request.getParameter("mname");
		 String s3=request.getParameter("lname");
         String s4=request.getParameter("email");
		 String s5=request.getParameter("mobile");
         String s6=request.getParameter("password");
		 String s7=request.getParameter("conpassword");
		
			
         
if(s1.equals(null)||s1.equals("")||s3.equals(null)||s3.equals("")
	||s4.equals(null)||s4.equals("")||s6.equals(null)||s6.equals("")||s7.equals(null)||s7.equals("")){
response.sendRedirect("register.html?msg=please enter details");
return;	
}

String sql="select email from users where email=?";
String uname="";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,s4);
rs=pstmt.executeQuery();
while(rs.next()){
uname=rs.getString("email");		
}

if(s4.equalsIgnoreCase(uname)){
	System.out.println(uname+"already exists");	
response.sendRedirect("register.html?msg=Email-Id already exists");	
}else{
   if(s6.equals(s7)){
   PreparedStatement ps=conn.prepareStatement("insert into users(fname,mname,lname,email,mobile,password)values(?,?,?,?,?,?)");        	
       ps.setString(1,s1);
       ps.setString(2,s2);
	   ps.setString(3,s3);
	   ps.setString(4,s4);
	   ps.setString(5,s5);
	   ps.setString(6,s6);
       ps.executeUpdate();
	   conn.commit();
		conn.close();
		response.sendRedirect("home.html?msg=Registration Success");
   }

else{
	response.sendRedirect("register.html?msg=please enter correct details");	

}
}
}
catch(Exception e)
{
System.out.println("registervalidate:"+e);
response.sendRedirect("home.html");
}
%>