<%-- 
    Document   : Logout
    Created on : Apr 20, 2017, 12:18:56 AM
    Author     : deko
--%>
<%
       
    	response.setContentType("text/html");
    	Cookie[] cookies = request.getCookies();
    	if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("user")) 
                    cookie.setValue("");
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);

    		if(cookie.getName().equals("JSESSIONID")){
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
    		}
            }
    	}
    	//invalidate the session if exists
    	session = request.getSession(false);
    	System.out.println("User="+session.getAttribute("user"));
    	if(session != null){
    		session.invalidate();
    	}
    	response.sendRedirect("index.jsp");

%>
