<%-- 
    Document   : cadastrarlivro
    Created on : Apr 14, 2017, 11:48:10 AM
    Author     : deko
--%>
<%@page import="tk.camboata.catalogovirtual.DAO.EditoraDAO"%>
<%@page import="tk.camboata.catalogovirtual.domain.EditoraDom"%>
<%
EditoraDAO ed_dao1 = new EditoraDAO();
EditoraDom[] ed_livros = ed_dao1.listaEditora();
String editora_opt = "";
for(int i=0;i<ed_livros.length;i++)
                    {
                        editora_opt+=String.format("<option value=\"%s\">"
                                + "%s</option>"
                                ,Integer.toString(ed_livros[i].getId())
                                ,ed_livros[i].getNome());
                    }
%>
        <h2>Cadastrar Livro</h2>
        <form action="engine/livro_ngn.jsp" method="POST" target="this" enctype="multipart/form-data">
            <label class="control-label" for="titulo">Título: </label>
            <input class="form-control"  type="text" name="titulo" id="titulo" placeholder="Digite o título...">
            <label class="control-label" for="autor">Autor: </label>
            <input class="form-control"  type="text" name="autor" id="autor" placeholder="Digite o autor...">
            <label class="control-label" for="Ano">Ano: </label>
            <input class="form-control"  type="text" name="ano" id="ano" placeholder="Ano" size="5">
            <label class="control-label" for="preco">Preço:</label>
            <input class="form-control"  type="text" name="preco" id="preco" placeholder="R$" size="50">
            <label class="control-label" for="foto">Foto: </label>
            <input class="form-control"  type="file" name="foto"  id="foto" size="7">
            <div class="form-group">
            <label class="control-label" for="editora">Editora:</label>
            <select name="editora">
                <%=editora_opt%>
            </select>
            <input class="btn btn-default" type="submit" value="Salvar">
            </div>
    </form>
