/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package tk.camboata.catalogovirtual.connectionfactory;

import java.sql.*;
import org.postgresql.Driver;

/**
 *
 * @author deko
 */
public class connection {
///Disponibiliza conexao atraves do get.    


    private static final String CONN_URL = "jdbc:postgresql://localhost/CatalogoLivros";
    private static final String CONN_USR="sa_catalogolivros";
    private static final String CONN_PWD="saciperere";
    public connection() throws ClassNotFoundException{
            Class.forName("org.postgresql.Driver");
    }
    public Connection getCon() throws SQLException{
        return DriverManager.getConnection(CONN_URL,CONN_USR, CONN_PWD);
    }
}



