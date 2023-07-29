<%-- 
    Document   : deletestudent
    Created on : Jan 25, 2023, 2:40:33 AM
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
            if(session.getAttribute("isAdmin") != null)
            {
                if(session.getAttribute("isAdmin").equals("yes"))
                    {
                       try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            String url = "jdbc:mysql://localhost:3307/mumbai";
                            String user = "root";
                            String pass = "root";
                            String collegename = request.getParameter("college_name");
                            Connection con = DriverManager.getConnection(url,user,pass);
                            PreparedStatement pst = con.prepareStatement("DELETE FROM COLLEGE WHERE COLLEGE_NAME = ?;");
                            pst.setString(1,collegename);
           
                            int i = pst.executeUpdate();
           
                            if(i > 0){
           
           %>
           
                <jsp:include page="view_colleges.jsp" flush="true" > 
                    
                    
                    <jsp:param name="isStudent" value="yes" /> 
                </jsp:include>
                <script type="text/javascript">
                          alert("Record deleted successfully!");
                                            </script>
           
           <%
           
            }
            else{
            
%>


     <jsp:include page="view_colleges.jsp" flush="true" > 
                    <jsp:param name="isStudent" value="yes" /> 
                </jsp:include>
                <script type="text/javascript">
                          alert("An error occured make sure the entry exist!");
                                            </script>

<%
            }
           
           
            }
                catch(Exception e){
System.out.println(e);
                
            }
            }
        
             else
             {
                response.sendRedirect("index.jsp");
             }
        }
        else{
              %>
              
                 <jsp:include page="index.jsp" flush="true" > 
                    <jsp:param name="isStudent" value="yes" /> 
                </jsp:include>
                <script type="text/javascript">
                          alert("Admin Login needed!");
                                            </script>
                                            
        <%
            }
}
catch(Exception e){
System.out.println(e);
}
        %>
        <h1>Hello World!</h1>
    </body>
</html>
