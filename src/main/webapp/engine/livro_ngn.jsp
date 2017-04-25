<%-- 
    Document   : livro_ngn
    Created on : Apr 16, 2017, 8:36:18 PM
    Author     : deko
--%>

<%@page import="tk.camboata.catalogovirtual.DAO.LivroDAO"%>
<%@page import="tk.camboata.catalogovirtual.domain.LivroDom" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
boolean flag_tituloOK =false;
boolean flag_autorOK=false;
boolean flag_anoOK=false;
boolean flag_precoOK=false;
boolean flag_editoraOK=false;
String tmp=".";
LivroDom livro = new LivroDom();
LivroDAO livro_dao = new LivroDAO();
String fotoNum = livro_dao.getNextFoto();
String foto="";
int maxFileSize = 5000 * 1024; //max size 5mb
int maxMemSize = 5000 * 1024;
ServletContext context = pageContext.getServletContext();
String filePath = context.getInitParameter("file-upload");
File file;
// Verify the content type
String contentType = request.getContentType();
if ((contentType.indexOf("multipart/form-data") >= 0)) {
    DiskFileItemFactory factory = new DiskFileItemFactory();
    // maximum size that will be stored in memory
    factory.setSizeThreshold(maxMemSize);
    // Location to save data that is larger than maxMemSize.
    factory.setRepository(new File(""));

    // Create a new file upload handler
    ServletFileUpload upload = new ServletFileUpload(factory);
    // maximum file size to be uploaded.
    upload.setSizeMax( maxFileSize );
    try{ 
        // Parse the request to get file items.
        List fileItems = upload.parseRequest(request);
        // Process the uploaded file items
        Iterator i = fileItems.iterator();
        while ( i.hasNext () ) 
        {
            FileItem item = (FileItem)i.next();
            if(item.isFormField ()){ //Form data
                
                if (item.getFieldName().equals("titulo")){
                    livro.setTitulo(item.getString());
                tmp+=" "+item.getFieldName()+" = "+item.getString()+"\n";
                }else if (item.getFieldName().equals("autor")){
                    livro.setAutor(item.getString());
                    tmp+=" "+item.getFieldName()+" = "+item.getString()+"\n";

                }else if (item.getFieldName().equals("ano")){
                    livro.setAno(Integer.parseInt(item.getString()));
                    tmp+=" "+item.getFieldName()+" = "+item.getString()+"\n";

                }else if (item.getFieldName().equals("preco")){
                    if(item.getString().contains(","));
                    livro.setPreco(Double.parseDouble(item.getString(). replace(",",".")));
                    tmp+=" "+item.getFieldName()+" = "+item.getString()+"\n";
    
                }else if (item.getFieldName().equals("editora")){
                    livro.setIdEditora(Integer.parseInt(item.getString()));
                    tmp+=" "+item.getFieldName()+" = "+item.getString()+"\n";

                }
            }
            else //file
            {
                // Get the uploaded file parameters
                String fileName = item.getName();
                String fileExt=fileName.substring(fileName.lastIndexOf("."));
                //boolean isInMemory = fi.isInMemory();
                //long sizeInBytes = fi.getSize();
                // Write the file

                if( fileName.lastIndexOf("\\") >= 0 ){
                    file = new File( filePath + 
                    fileName.substring(fileName.lastIndexOf("\\"))) ;
                }else{
                    file = new File( filePath + 
                    fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                }
                // This bit is doing the renaming
                foto=fotoNum+fileExt;
                File outputFile = new File(filePath, foto); 
                item.write( outputFile ) ;
                livro.setFoto(foto);
            }
        }
        livro_dao.salvaLivro(livro);
    }catch(Exception ex) {
      System.out.println(ex);
    }
}
%>
<html>
    <head>
    </head>
    <body>
        <%=tmp%>
        <p>Teste</p>
        <p><%=livro.getTitulo()%></p>
        <p><%=livro.getAutor()%></p>
        <p><%=livro.getAno()%></p>
        <p><%=livro.getPreco()%></p>
        <p><%=livro.getFoto()%></p>
        <p><%=livro.getIdEditora()%></p>

    </body>
</html>
