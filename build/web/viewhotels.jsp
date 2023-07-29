<%-- 
    Document   : viewhotels
    Created on : Jan 25, 2023, 12:56:58 PM
    Author     : AbdulRasool
--%>

<%@page import= "java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
                <style>
            table{
                margin-top:25px;
                border:solid 1px black;
                width: 70%;
                border-collapse: collapse;
	        overflow: hidden;
	        box-shadow: 0 0 20px rgba(0,0,0,0.1);
                border-radius: 10px;
                margin-bottom: 25px;
            }
            
            th{
                background-color: #bf3d42;
                color:black;
                
            }
            
            .deleteinput{
    padding-bottom: 5px;
    margin-bottom: 15px;;
    margin-left: 0px;
    margin-top: 10px;
    width: 20%;
    border: solid 2px black;
    border-radius: 5px;
}
            
            
            
            
         th,td {
	padding: 15px;
        border:solid 1px black;
}

th {
	text-align: left;
}

#tablehead, #tabledata{
     border:solid 1px black;
}

.anchorr , .anchor2{
  width: 270px;
  font-size: 18px;
  font-family: sans-serif;
  text-decoration: none;
  background-color: white;
  margin-bottom: 50px;
  padding: 10px 10px;
  color: #333;
  border: 2px solid #333;
  letter-spacing: 2px;
  text-align: center;
  transition: all .35s;
}

.anchorr3{
      width: 270px;
  font-size: 18px;
  font-family: sans-serif;
  text-decoration: none;
  margin-bottom: 50px;
  padding: 10px 10px;
  color: #333;
  border: 2px solid #333;
  letter-spacing: 2px;
  text-align: center;
  transition: all .35s;
}

.anchorr3:hover{
  color: white;
  background-color: black;
  
}

.delete{
    position:absolute;
    top:90%;
    left:30%;
}

.like{
    margin-left: 30%;
}

.head{
    margin-left: -8%;
}

.anchorr:hover , .anchor2:hover{
  color:black; ;
  background-color: #bf3d42;
  
}





            </style>
        
    </head>
    <body>
            <jsp:include page="header.html" flush="true" > 
                    <jsp:param name="key" value="value" /> 
            </jsp:include>
        
    <center><h1 style="font-family: TimesNewRoman; margin-top: 15px;">List of Hotels available in Mumbai</h1></center>
    

    
<%
           Class.forName("com.mysql.cj.jdbc.Driver");
           String url = "jdbc:mysql://localhost:3307/mumbai";
           String user = "root";
           String pass = "root";
           
           Connection con = DriverManager.getConnection(url,user,pass);
           String query = "SELECT * FROM hotel;";
           Statement st = con.createStatement();
          ResultSet rs = st.executeQuery(query);      
         
                        %>
                        <div class="delete">                        
                        <form action="deleteHotel.jsp">
                             <input class="anchorr3" type="text" placeholder="Enter Hotel: " name="hotel_name">
                        <input type ="submit" class="anchor2" value = "Delete an entry!" >
                        </form>
                        </div>   
                        <br>
       
    <center> <table>
			<tr>
				<th id="tablehead">Hotels</th>
				<th id="tablehead">Location</th>
				<th id="tablehead">Email</th>
				<th id="tablehead">Contact</th>
				<th id="tablehead">Ratings</th>
			</tr>

                        <%
                             while(rs.next()){
                                String column1 = rs.getString(1);
                                String column2 = rs.getString(2);
                                String column3 = rs.getString(3);
                                String column4 = rs.getString(4);
                                int column5 = rs.getInt(5);

                            %>
                        
			<tr>
				<td id="tabledata"> <%= column1%></td>
				<td id="tabledata" > <%= column2%></td>
				<td id="tabledata" > <%= column3%></td>
				<td id="tabledata" > <%= column4%></td>
				<td id="tabledata" > <%= column5%></td>
			</tr>
                        
                        <%
                            }
                        %>
                   
	</table>
                                 </center>

                                                
                                  <div class="like">                        
                                      <h1 class="head">  Like the Hotel you found the Best ♥ </h1>
                        <form name="form2" action="likeHotel.jsp">
                             <input  class="anchorr3" type="text" placeholder="Enter Hotel name: " name="hotel_name">
                             <input  type ="submit" class="anchor2 like2" value = "Like!"  >
                        </form>
                        </div>   
        
        
    <jsp:include page="footer.html" flush="true" > 
                    <jsp:param name="key2" value="value2" /> 
    </jsp:include>
    </body>
</html>
