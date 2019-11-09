<%@page language="java"  import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*,javax.sql.*,java.util.*"%>

<%
String user1=(String)session.getAttribute("username");
if(user1==null||user1.equals("")||user1.equalsIgnoreCase(null))
{
	response.sendRedirect("loginuser.jsp?msg=please login first");
}
else{%>

<script type="text/javascript">
 function validateform(){  
var name=document.myform.sid.value;   
if (name==null || name==""){  
  alert("please enter student id");
  name.focus();  
  return false;  
}
var s1=document.myform.sname.value;
if (s1==null || s1==""){  
  alert("please enter student name");
  s1.focus();
  return false;
  }
  var s2=document.myform.email.value;
if (s2==null || s2==""){  
  alert("please enter email");
  s2.focus();
  return false;
  }
  var s3=document.myform.class.value;
if (s3==null || s3==""){  
  alert("please enter class");
  s3.focus();
  return false;
  }
  var s4=document.myform.enrollyear.value;
if (s4==null || s4==""){  
  alert("please enter enrollment year");
  s4.focus();
  return false;
  }
  var s5=document.myform.city.value;
if (s5==null || s5==""){  
  alert("please enter city");
  s5.focus();
  return false;
  }
  var s6=document.myform.country.value;
if (s6==null || s6==""){  
  alert("please enter country");
  s6.focus();
  return false;
  }
}
</script>
<style>
body {
    background-color: 
 background-size:cover;
	}
	section{
  width: 80%;
  background-color: #f1f1f1;
  height: 550px;
}

	</style>

<br>
<br>
<br>
<br>

<center>
 <body>
 <section>
 <br>
 <br>
<center>

        <%
           
    try{
        
 PreparedStatement pstmt=null;
    ResultSet rs=null;
	PreparedStatement pstmt1=null;
    ResultSet rs1=null;
    Connection conn=null;

Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr123");

String sql= "select id,fname||mname||lname,email,classes,year,city,country from users";
pstmt=conn.prepareStatement(sql);
 rs=pstmt.executeQuery();

%>
     <center> 
	 <form name="myform" action="add details.jsp" method="post" onsubmit="return validateform()">
	 <table style="margin-right:5px;margin-top:10px;width:80%" border=0 cellSpacing=0 cellPadding=1>
                

<tr STYLE="background-color: skyblue;">    
<th style="width:5%" align="left">ID</th>
<th style="width:20%" align="left">Name</th>
<th style="width:30%" align="left">Email</th>
<th style="width:10%" align="left">Class</th>
<th style="width:10%" align="left">Year</th>
<th style="width:10%" align="left">City</th>
<th style="width:10%" align="left">Country</th> 
<th style="width:8%"></th>  
<th style="width:8%"></th>    
</tr>
<%
       
   while(rs.next()){
	   String s1 = rs.getString(1);
		 String s2 = rs.getString(2);
		  String s3 = rs.getString(3);
		   String s4 = rs.getString(4);
		    String s5 = rs.getString(5);
			 String s6 = rs.getString(6);
			  String s7 = rs.getString(7);
    
            %><tr>
<td style="width:5%"><%=s1%></td>
<td style="width:20%"><%=s2%></td>
<td style="width:30%"><%=s3%></td>
<td style="width:10%"><%=s4%></td>
<td style="width:10%"><%=s5%></td>
<td style="width:10%"><%=s6%></td>
<td style="width:10%"><%=s7%></td> 
<td style="width:8%"><a href="edit details.jsp" ><input type="button" value="Edit" name="edit"></a></td>  
<td style="width:8%"><a href="delete details.jsp?email=<%=s3%>"><input type="button" value="Delete" name="delete"></a></td>
               </tr>

         <%}%>
		 </table></center>
<%

String s1=request.getParameter("email");
String sql1= "select id,fname||mname||lname,email,classes,year,city,country from users where email='"+s1+"'";
pstmt1=conn.prepareStatement(sql1);
 rs1=pstmt1.executeQuery();
    while(rs1.next()){
		String s11 = rs1.getString(1);
		 String s2 = rs1.getString(2);
		  String s3 = rs1.getString(3);
		   String s4 = rs1.getString(4);
		    String s5 = rs1.getString(5);
			 String s6 = rs1.getString(6);
			  String s7 = rs1.getString(7);
			  %>
 <table  style="margin-right:410px;margin-top:30px" width=400 border=0 cellSpacing=0 cellPadding=1>
 <tr>
<td align=left width=192 height=42><font size=3 color="black">Student ID</td>
<td align=right width=127 height=42>
<input size=30 type=text maxlength=10 name="sid" value="<%=s11%>">
</font>
</td>
</tr>
<tr>
<td  align=left width=192 height=42><font size=3 color="black">Student Name</td>
<td align=right width=127 height=42>
<input size=30 type=text maxlength=30 name="sname" value="<%=s2%>">
</font>
</td>
</tr>
<tr>
<td  align=left width=192 height=42><font size=3 color="black">Email</td>
<td align=right width=127 height=42>
<input size=30 type=text maxlength=30 name="email" value="<%=s3%>">
</font>
</td>
</tr>
<tr>
<td  align=left width=192 height=42><font size=3 color="black">Class</td>
<td align=right width=127 height=42>
<input size=30 type=text maxlength=10 name="class" value="<%=s4%>">
</font>
</td>
</tr>
<tr>
<td  align=left width=192 height=42><font size=3 color="black">Enrollement Year</td>
<td align=right width=127 height=42>
<input size=30 type=text maxlength=10 name="enrollyear" value="<%=s5%>">
</font>
</td>
</tr>			
<tr>
<td  align=left width=192 height=42><font size=3 color="black">City</td>
<td align=right width=127 height=42>
<input size=30 type=text maxlength=20  name="city" value="<%=s6%>">
</td>
</tr>
<tr>
<td  align=left width=192 height=42><font size=3 color="black">Country</td>
<td align=right width=127 height=42>
<input size=30 type=text maxlength=20  name="country" value="<%=s7%>">
</td>
	</tr>  <%}%>             
<tr>
<td  align=middle width=200 colSpan=2 height=50>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type=submit value=" Save" name="Save"> &nbsp;&nbsp;
<input type="reset"  value=" Clear" name="Clear"> 
</td>
</tr>

</table>

</form>
</section>
</body>
</center>
<%}
catch(Exception e)
{
System.out.println("registervalidate:"+e);
response.sendRedirect("home.html");
}
%>


<%}%>