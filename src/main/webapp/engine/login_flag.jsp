<%-- 
    Document   : login_flag
    Created on : Apr 20, 2017, 2:30:21 PM
    Author     : luiscunha
--%>
<%@page import="java.util.Enumeration"%>

<%
    String login_ok="";
    Enumeration e = session.getAttributeNames();
    while(e.hasMoreElements()){
        String temp=(String)e.nextElement();
        if (temp.equals("login_ok"))
            login_ok=session.getAttribute("login_ok").toString();
            session.removeAttribute("login_ok");
    }
%>