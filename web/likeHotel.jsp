<%-- 
    Document   : likeHotel
    Created on : Jan 25, 2023, 8:20:36 PM
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
            if(session.getAttribute("isTourist") != null)
            {
                if(session.getAttribute("isTourist").equals("yes"))
                    {
                       try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            String url = "jdbc:mysql://localhost:3307/mumbai";
                            String user = "root";
                            String pass = "root";
                            String hotelname = request.getParameter("hotel_name");
                            Connection con = DriverManager.getConnection(url,user,pass);
                            PreparedStatement pst = con.prepareStatement("UPDATE HOTEL SET RATINGS = RATINGS + 1  WHERE HOTELS = ?;");
                            pst.setString(1,hotelname);
           
                            int i = pst.executeUpdate();
           
                            if(i > 0){
           
           %>
           
                <jsp:include page="viewhotels.jsp" flush="true" > 
                    
                    
                    <jsp:param name="isStudent" value="yes" /> 
                </jsp:include>
                <script type="text/javascript">
                          alert("ThankYou ♡ Hotel liked successfully!");
                                            </script>
           
           <%
           
            }
            else{
            
%>


     <jsp:include page="viewhotels.jsp" flush="true" > 
                    <jsp:param name="isStudent" value="yes" /> 
                </jsp:include>
                <script type="text/javascript">
                          alert("An error occured make sure the Hotel you want to like exist!");
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
                          alert("Tourist Login needed!");
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