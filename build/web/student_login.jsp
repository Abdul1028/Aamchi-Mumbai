<%-- 
    Document   : student_login
    Created on : Jan 24, 2023, 11:51:11 PM
    Author     : AbdulRasool
--%>

<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <%
        
          
          String u = "a";
          String p = "a";
          try{
          String username = request.getParameter("student_user");
          String password = request.getParameter("student_pass");
               Class.forName("com.mysql.cj.jdbc.Driver");
               String url = "jdbc:mysql://localhost:3307/mumbai";
               String user = "root";
               String pass = "root";
               
               
           Connection con = DriverManager.getConnection(url,user,pass);
           String query = "SELECT uname,password FROM USERS WHERE EMAIL = ?;";
           System.out.println(username);
           System.out.println(query);
           
           PreparedStatement pst = con.prepareStatement("SELECT role,password FROM USERS WHERE EMAIL = ?;");
           pst.setString(1,username);
           ResultSet rst = pst.executeQuery();
  
            
           boolean flag = rst.next();
           
           if(flag == true){
            u = rst.getString(1);
            p =rst.getString(2);
            
            
            if(u.equals("Student") && p.equals(password)){
                session.setAttribute("isStudent","yes");
                
                %>
                <jsp:include page="index.jsp" flush="true" > 
                    <jsp:param name="isStudent" value="yes" /> 
                </jsp:include>
                
                   <script type="text/javascript">
                          alert("Logged in as a Student!");
                                            </script>
             
                <%
            }
            
            else{
                System.out.println("No");

%>
       <jsp:include page="student_section.html" flush="true" > 
                    <jsp:param name="isStudent" value="yes" /> 
                </jsp:include> 

<script type="text/javascript">
                          alert("Invalid Password!");
                                            </script>

<%
       
            }
            
            }
            
            else{
            

%>

       <jsp:include page="index.jsp" flush="true" > 
                    <jsp:param name="isStudent" value="yes" /> 
       </jsp:include>

<script type="text/javascript">
                          alert("Please signup as Student first!");
                                            </script>
<%
            }
            
            }
            
            
            catch(Exception e){
                System.out.println(e);
            } 

        %>
         <h1><%= u%></h1>
          <h1><%= p%></h1>
         
         
    </body>
</html>
