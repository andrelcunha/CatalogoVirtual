/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tk.camboata.catalogovirtual.DAO;

import tk.camboata.catalogovirtual.connectionfactory.connection;
import tk.camboata.catalogovirtual.domain.LivroDom;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author deko
 */
public class LivroDAO {
    
    public void salvaLivro(LivroDom livro) throws SQLException, 
            ClassNotFoundException{
        String sqlstr = String.format("INSERT INTO public.livro" +
        " SET titulo='%s', autor='%s', ano='%d', preco='%.2f, foto='%s', \"idEditora\"='%d';",
                livro.getTitulo(),
                livro.getAutor(),
                livro.getAno(),
                livro.getPreco(),
                livro.getFoto(),
                livro.getIdEditora()
        );
        System.out.println("DAO.LivroDAO.satualizaLivro()= "+sqlstr); 
        ExecutaInsert(sqlstr);
    }
    public void atualizaLivro(LivroDom livro) throws SQLException, 
            ClassNotFoundException{
        String sqlstr = String.format("UPDATE public.livro(" +
        "titulo, autor, ano, preco, foto, \"idEditora\" )"
                + " VALUES ( '%s', '%s',%d,%.2f,'%s',%d);",
                livro.getTitulo(),
                livro.getAutor(),
                livro.getAno(),
                livro.getPreco(),
                livro.getFoto(),
                livro.getIdEditora()
        );
        //System.out.println("DAO.LivroDAO.salvaLivro()= "+sqlstr); 
        ExecutaInsert(sqlstr);
    }
    public LivroDom[] ConsultaLivroTitulo(LivroDom livro) throws SQLException, 
            ClassNotFoundException{
        String sqlstr = "SELECT * FROM public.livro ";
        if (livro.getTitulo()!="")
            sqlstr += String.format("WHERE titulo LIKE '%%%s%%'", livro.getTitulo());
        sqlstr += ";";
        ResultSet rs = ExecutaSelect(sqlstr);
        ArrayList<LivroDom> array = new ArrayList<>();
        while(rs.next()){
            
            LivroDom tmp = new LivroDom();
            tmp.setId(rs.getInt("id"));
            tmp.setTitulo(rs.getString("titulo"));
            tmp.setAutor(rs.getString("autor"));
            tmp.setAno(rs.getInt("ano"));
            tmp.setPreco(rs.getDouble("preco"));
            tmp.setFoto(rs.getString("foto"));
            tmp.setIdEditora(rs.getInt("idEditora"));
            array.add(tmp);
        }
        LivroDom[] livros_encontrados = array.toArray(new LivroDom[array.size()]);
        return livros_encontrados;
    }
    public LivroDom[] ConsultaLivroTodos() throws SQLException, 
            ClassNotFoundException{
        String sqlstr = "SELECT * FROM public.livro;";
        ResultSet rs = ExecutaSelect(sqlstr);
        ArrayList<LivroDom> array = new ArrayList<>();
        while(rs.next()){
            
            LivroDom tmp = new LivroDom();
            tmp.setId(rs.getInt("id"));
            tmp.setTitulo(rs.getString("titulo"));
            tmp.setAutor(rs.getString("autor"));
            tmp.setAno(rs.getInt("ano"));
            tmp.setPreco(rs.getDouble("preco"));
            tmp.setFoto(rs.getString("foto"));
            tmp.setIdEditora(rs.getInt("idEditora"));
            array.add(tmp);
        }
        LivroDom[] livros_encontrados = array.toArray(new LivroDom[array.size()]);
        return livros_encontrados;
    }
    public String getNextFoto() throws SQLException, ClassNotFoundException{
        String sFoto=null;
        String sqlstr = String.format("SELECT id from livro " +
                                    "order by id desc limit 1;");
        ResultSet rs = ExecutaSelect(sqlstr);
        while(rs.next()){
            sFoto=String.format("%06d",rs.getInt(1)+1);
        }
        return sFoto;
    }
    private ResultSet ExecutaSelect(String sqlstr) throws SQLException, ClassNotFoundException {
            
                Connection con = new connection().getCon();
                Statement st = con.createStatement();
                return st.executeQuery(sqlstr);
            
    }
    private int ExecutaInsert(String sqlstr) throws SQLException, ClassNotFoundException {
            
                Connection con = new connection().getCon();
                Statement st = con.createStatement();
                return st.executeUpdate(sqlstr);
    }
}

