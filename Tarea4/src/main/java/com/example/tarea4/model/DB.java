package com.example.tarea4.model;

import java.sql.*;

public class DB {
    private Connection conn;

    public DB(String db, String user, String pass) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        this.conn = DriverManager.getConnection("jdbc:mysql://localhost/cc500226_db?" +
                "user=root&password=");
    }

    public ResultSet getFoto() throws SQLException {
        String query = "SELECT * FROM foto ORDER BY id DESC";
        PreparedStatement stat = conn.prepareStatement(query);
        ResultSet rs = stat.executeQuery();
        return rs;
    }

    public ResultSet getEval(int id_foto) throws SQLException {
        String query = "SELECT id, fecha, comentario, nota " +
                "FROM comentario_foto  WHERE foto_actividad = ? " +
                "ORDER BY id DESC";
        PreparedStatement stat = conn.prepareStatement(query);
        stat.setInt(1,id_foto);
        ResultSet rs = stat.executeQuery();
        return rs;
    }

    public void insertEval(String fecha, String comentario, String nota, int foto_actividad) throws SQLException {
        PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO comentario_foto (fecha, comentario, nota, foto_actividad)" +
                        "VALUES (?, ?, ?, ?)"

        );
        ps.setString(1, fecha);
        ps.setString(2, comentario);
        ps.setString(3, nota);
        ps.setInt(4, foto_actividad);
        ps.executeUpdate();
        this.close();
    }

    public void close() throws SQLException {
        this.conn.close();
    }
}
