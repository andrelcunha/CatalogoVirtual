/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tk.camboata.catalogovirtual.DAO;

/**
 *
 * @author deko
 */
import tk.camboata.catalogovirtual.connectionfactory.connection;
import tk.camboata.catalogovirtual.domain.EditoraDom;
import java.sql.*;
import java.util.ArrayList;


public class EditoraDAO {
    
    public void salvaEditora(EditoraDom editora) throws SQLException, ClassNotFoundException{   
        String sqlstr = String.format("INSERT INTO public.editora(" +
        " nome, cidade)" +
        " VALUES ( '%s', '%s');",editora.getNome(),editora.getCidade());
        ExecutaInsert(sqlstr);
    }
    
    
    public EditoraDom[] listaEditora() throws SQLException, ClassNotFoundException{
        String sqlstr = "SELECT * FROM public.editora";
        ResultSet rs = ExecutaSelect(sqlstr);
        ArrayList <EditoraDom> array = new ArrayList<>();
        while(rs.next()){
            EditoraDom tmp = new EditoraDom();
            tmp.setId(rs.getInt("id"));
            tmp.setNome(rs.getString("nome"));
            tmp.setCidade(rs.getString("cidade"));
            array.add(tmp);
        }
        EditoraDom[] editoras_encontradas = (EditoraDom[]) array.toArray(new EditoraDom[array.size()]);
        return editoras_encontradas;
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

