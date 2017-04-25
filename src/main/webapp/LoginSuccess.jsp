<%-- 
    Document   : LoginSuccess
    Created on : Apr 20, 2017, 12:07:42 AM
    Author     : deko
--%>
 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
//allow access only if session exists
String user = null;
if(session.getAttribute("user") == null){
	response.sendRedirect("login.jsp");
}else user = (String) session.getAttribute("user");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
    for(Cookie cookie : cookies){
            if(cookie.getName().equals("user")) 
                userName = cookie.getValue();
            if(cookie.getName().equals("JSESSIONID")) 
                sessionID = cookie.getValue();
    }
}
%>
<h3>Hi <%=userName %>, Login successful. Your Session ID=<%=sessionID %></h3>
<br>
User=<%=user %>
<br>
<a href="<%=response.encodeURL("CheckoutPage.jsp") %>">Checkout Page</a>
<form action="<%=response.encodeURL("Logout.jsp") %>" method="post">
<input type="submit" value="Logout" >
</form>
<table>
<%
   
if(cookies !=null){
    for(Cookie cookie : cookies){
            out.println("<tr>");
            out.println("<td>"+cookie.getName()+"</td>");
            out.println("<td>"+cookie.getValue()+"</td>");
            out.println("</tr>");
    }
}
%>
</table>    
</body>
</html>
