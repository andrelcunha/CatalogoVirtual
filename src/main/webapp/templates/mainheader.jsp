<%-- 
    Document   : mainheader
    Created on : Apr 16, 2017, 3:07:38 AM
    Author     : deko
--%>

<div class="container-fluid banner_ banner_big">
    <%@include file="header.jsp" %>
    <div class="row">
        <div class="col-sm-3">
        </div>
        <div class="col-sm-6">
            <div >
                <form action="index.jsp" method="GET">
                    <div class="input-group">
                        <input type="text" class="form-control" 
                               placeholder="Buscar" name="buscar" id="buscar">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-sm-3"></div>
    </div>
</div>
