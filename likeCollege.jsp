<%-- 
    Document   : likeCollege
    Created on : Jan 25, 2023, 7:08:59 PM
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
            if(session.getAttribute("isStudent") != null)
            {
                if(session.getAttribute("isStudent").equals("yes"))
                    {
                       try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            String url = "jdbc:mysql://localhost:3307/mumbai";
                            String user = "root";
                            String pass = "root";
                            String collegename = request.getParameter("college_name");
                            Connection con = DriverManager.getConnection(url,user,pass);
                            PreparedStatement pst = con.prepareStatement("UPDATE COLLEGE SET RATINGS = RATINGS + 1  WHERE COLLEGE_NAME = ?;");
                            pst.setString(1,collegename);
           
                            int i = pst.executeUpdate();
           
                            if(i > 0){
           
           %>
           
                <jsp:include page="view_colleges.jsp" flush="true" > 
                    
                    
                    <jsp:param name="isStudent" value="yes" /> 
                </jsp:include>
                <script type="text/javascript">
                          alert("ThankYou ♡ College liked successfully!");
                                            </script>
           
           <%
           
            }
            else{
            
%>


     <jsp:include page="view_colleges.jsp" flush="true" > 
                    <jsp:param name="isStudent" value="yes" /> 
                </jsp:include>
                <script type="text/javascript">
                          alert("An error occured make sure the College you want to like exist!");
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
                          alert("Student Login needed!");
                                            </script>
                                            
        <%
            }
}
catch(Exception e){
System.out.println(e);
}
        %>
    </body>
</html>

