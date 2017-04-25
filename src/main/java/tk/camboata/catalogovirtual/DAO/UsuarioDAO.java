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
import tk.camboata.catalogovirtual.domain.UsuarioDom;
import java.sql.*;


public class UsuarioDAO {
    public void SalvaUsuario(UsuarioDom usuario) throws SQLException, ClassNotFoundException{
        String sqlstr = String.format("INSERT INTO public.usuario(" +
        "nome, senha) VALUES ( '%s', '%s');",usuario.getNome(),usuario.getSenha());
        ExecutaInsert(sqlstr);
    }
    public boolean ConsultaUsuario(String usuario,String senha) throws SQLException, ClassNotFoundException{
        String sqlstr = String.format("SELECT COUNT(*) FROM public.usuario WHERE nome='%s' AND senha='%s'",usuario,senha);
        String s="";
        ResultSet rs = ExecutaSelect(sqlstr);
        try{
            while(rs.next())
            {
                       s = rs.getString(1);
            }
            rs.close();  
        }
        catch(SQLException e)
        {
        }
        return Integer.parseInt(s)==1;
    }

    private ResultSet ExecutaSelect(String sqlstr) throws SQLException, ClassNotFoundException {
            
                Connection con = new connection().getCon();
                Statement st = con.createStatement();
                return st.executeQuery(sqlstr);
            
    }
    private int ExecutaInsert(String sqlstr) throws SQLException, ClassNotFoundException {
            
                Connection con = new connection().getCon();
                Statement st = con.prepareCall(sqlstr, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                return st.executeUpdate(sqlstr);
    }
}

