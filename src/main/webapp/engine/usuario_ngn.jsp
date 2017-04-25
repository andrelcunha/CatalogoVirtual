<%-- 
    Document   : usuario_ngn
    Created on : Apr 16, 2017, 8:37:14 PM
    Author     : deko
--%>
<%@page import="tk.camboata.catalogovirtual.DAO.UsuarioDAO"%>
<%@page import="tk.camboata.catalogovirtual.domain.UsuarioDom" %>

<%
UsuarioDAO usr_dao = new UsuarioDAO();
UsuarioDom usuario  = new UsuarioDom();
usuario.setNome("");
usuario.setSenha("");
while(request.getParameterNames().hasMoreElements()){
    String tmp=request.getParameterNames().nextElement().toString();
    if(tmp.contentEquals("nome"))
        usuario.setNome(request.getParameter("nome"));
    if(tmp.contentEquals("nome"))
        usuario.setSenha(request.getParameter("senha"));
}
if(!((usuario.getNome().equals(""))&&(usuario.getSenha().equals(""))))
usr_dao.SalvaUsuario(usuario);
%>

