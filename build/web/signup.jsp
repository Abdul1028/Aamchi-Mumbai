<%-- 
    Document   : signup
    Created on : Jan 24, 2023, 9:30:22 PM
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
         try{
            String name = request.getParameter("username");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String password = request.getParameter("password");
               
               Class.forName("com.mysql.cj.jdbc.Driver");
               String url = "jdbc:mysql://localhost:3307/mumbai";
               String user = "root";
               String pass = "root";
               
               
           Connection con = DriverManager.getConnection(url,user,pass);
           
         
               
            String query = "INSERT INTO users VALUES(?,?,?,?);";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1,name);
            pst.setString(2,email);
            pst.setString(3,role);
            pst.setString(4,password);
            pst.executeUpdate();
            }
            
            
            catch(Exception e){
                System.out.println(e);
            }
            
            %>
                      <script type="text/javascript">
                          alert("Signed in succesfull!");
                                            </script>
      <jsp:include page="index.jsp" flush="true" > 
           <jsp:param name="isSign" value="yes" /> 
       </jsp:include>
          
    </body>
</html>
