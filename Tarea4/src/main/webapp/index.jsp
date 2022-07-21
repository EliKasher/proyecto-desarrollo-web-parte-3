<%@ page import="com.example.tarea4.model.DB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="css/style5.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/fecha.js"></script>

    <title>Galería de Fotos</title>
</head>
<body>
    <h1>Galería de Fotos</h1>
    <br>
    <div class="gallery" role="main">
        <div class="fotos" role="button">
        <%
            try {
                final DB db = new DB("cc500226_db", "root", "");
                ResultSet data = db.getFoto();
                int capa = 1;
                int contador = 0;

                while (data.next()) {
                    if(contador >=4) {
                        out.println("<br><br>");
                        contador = 0;
                    }
                    out.println("<img data-modal='capa" + capa + "' class='detalles' id='detalles" + capa + "' src='media/" + data.getString(2) + "' alt='foto actividad " + data.getString(1) + "' height='120px' width='120px'>");
                    capa++;
                    contador++;
                }
            } catch (Exception e){
                out.println(e);
            }
        %>
        </div>
        <div class="oculto" role="contentinfo">
            <%

              try{
                  final DB db = new DB("cc500226_db", "root", "");
                  ResultSet dataFoto = db.getFoto();
                  int capa = 1;
                  while(dataFoto.next()) {
                      out.println("<div role='main' id='capa" + capa + "' class='capa'>");
                      out.println("<div role='navigation'>" +
                              "<div class='buttons' role='button'>" +
                              "<input id='cerrar" + capa +"' class='cerrar' type='button' name='boton' value='Cerrar'>" +
                              "</div>" +
                              "<br>");
                      out.println("<h5 class='card-title'>Foto Actividad</h5><br>" +
                              "<img id = '" + dataFoto.getString(1) + "' class='image' src = 'media/"+ dataFoto.getString(2) +"' alt = 'foto actividad " +
                              dataFoto.getString(1) + "' height = '600px' width = '800px'>");
                      out.println("<form class='evaluacion' + + action='' method='post'>"+
                              "<div role='form' class='form-check form-check-inline' hidden>" +
                              "<input class='form-check-input' type='text' name='id' value="+ dataFoto.getString(1) + "></div>" +
                              "<div role='form' class='form-check form-check-inline' hidden>" +
                              "<input type='text' name='fecha' value='' onload='return fechaInicio()'></div>" +
                              "<div role='form' class='form-check form-check-inline'>" +
                              "<label for='comentario'>Comentario:</label><br>"+
                              "<textarea id='comentario' name='comentario' rows='10' cols='50'></textarea>" +
                              "</div>" +
                              "<br>" +
                              "<div role='form' class='form-check form-check-inline'>" +
                              "<input class='form-check-input' type='radio' name='nota' id='nota1' value=1>" +
                              "<label class='form-check-label' for='nota1'>1</label>" +
                              "</div>" +
                              "<div role='form' class='form-check form-check-inline'>" +
                              "<input class='form-check-input' type='radio' name='nota' id='nota2' value=2>" +
                              "<label class='form-check-label' for='nota2'>2</label>" +
                              "</div>" +
                              "<div role='form' class='form-check form-check-inline'>" +
                              "<input class='form-check-input' type='radio' name='nota' id='nota3' value=3>" +
                              "<label class='form-check-label' for='nota3'>3</label>" +
                              "</div>" +
                              "<div role='form' class='form-check form-check-inline'>" +
                              "<input class='form-check-input' type='radio' name='nota' id='nota4' value=4>" +
                              "<label class='form-check-label' for='nota4'>4</label>" +
                              "</div>" +
                              "<div role='form' class='form-check form-check-inline'>" +
                              "<input class='form-check-input' type='radio' name='nota' id='nota5' value=5>" +
                              "<label class='form-check-label' for='nota5'>5</label>" +
                              "</div>" +
                              "<div role='form' class='form-check form-check-inline'>" +
                              "<input class='form-check-input' type='radio' name='nota' id='nota6' value=6>" +
                              "<label class='form-check-label' for='nota6'>6</label>" +
                              "</div>" +
                              "<div role='form' class='form-check form-check-inline'>" +
                              "<input class='form-check-input' type='radio' name='nota' id='nota7' value=7>" +
                              "<label class='form-check-label' for='nota7'>7</label>" +
                              "</div>" +
                              "<br>" +
                              "<button type='submit' class='btn-primary'>Comentar y Evaluar</button>" +
                              "</form>"+
                              "<div role='contentinfo' class='puntaje'>" +
                              "</div>" +
                              "<div role='contentinfo' class='listado-comentarios'>" +
                              "</div>" +
                              "</div>" +
                              "</div>");
                      capa++;
                  }
              } catch(Exception e){
                  out.println(e);
              }
            %>
        </div>
        <script src="js/zoom.js"></script>
        <script src="js/ajax.js"></script>
        <script>fechaActual()</script>
    </div>
</body>
</html>