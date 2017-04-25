<%-- 
    Document   : vertmenu
    Created on : Apr 16, 2017, 3:11:43 PM
    Author     : deko
--%>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-pills nav-stacked">
              <li class="active"><a href="#home">Home</a></li>
              <li><a data-toggle="pill" href="#livro">Livro</a></li>
              <li><a data-toggle="pill" href="#editora">Editora</a></li>
              <li><a data-toggle="pill" href="#usuario">Usuário</a></li>
            </ul>
        </div>
        <div class="col-md-4">
            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <%@include file="/home_admin.jsp" %>
                </div>
                <div id="livro" class="tab-pane fade ">
                    <%@include file="/livro.jsp" %>
                </div>
                <div id="editora" class="tab-pane fade">
                    <%@include file="/editora.jsp" %>
                </div>
                <div id="usuario" class="tab-pane fade">
                    <%@include file="/usuario.jsp" %>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div id="side_frame" >
                <p id="result_frame"></p>
            </div>
        </div>
        <div class="col-md-4">
            <div id="side_border" >
                <p></p>
            </div>
        </div>
    </div>
</div>    