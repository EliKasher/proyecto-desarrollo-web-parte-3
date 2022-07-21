package com.example.tarea4.controller;

import com.example.tarea4.model.DB;
import org.json.JSONObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "galeria", value = "/galeria-handler")
public class GaleriaHandler extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject json = null;
        try {
            DB ddbb = new DB("cc500226_db", "root", "");
            ResultSet rs = ddbb.getEval(Integer.parseInt(request.getParameter("id_foto")));
            ResultSet rs2 = ddbb.getFoto();

            json = new JSONObject();

            while (rs.next()) {
                json.put("fecha", rs.getInt(2));
                json.put("comentario", rs.getInt(3));
                json.put("nota", rs.getInt(4));
            }
            while (rs2.next()) {
                json.put("ids", rs2.getInt(1));
            }

            String message = json.toString();
            PrintWriter out = response.getWriter();
            out.println(message);
            ddbb.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String fecha = request.getParameter("fecha");
        String comentario = request.getParameter("comentario");
        String nota = request.getParameter("nota");
        String foto_actividad = request.getParameter("id_foto");

        try {
            DB ddbb = new DB("cc500226_db", "root", "");
            ddbb.insertEval(fecha, comentario, nota, Integer.parseInt(foto_actividad));
            ddbb.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
