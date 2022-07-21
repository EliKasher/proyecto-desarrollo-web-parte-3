
$(document).ready(function (){
    $.get("galeria-handler", function (responseText) {
        let response = JSON.parse(responseText);
        let id_foto = []

        for(let i in response) {
            id_foto.push(response[i][3]);

        }

        $.each(id_foto, function (i) {
            showEval(i);
        })
    })
})

function showEval(id){
    $.get("galeria-handler",{
            id_foto:id
        },
        function (responseText){
            let response = JSON.parse(responseText);

            let fechas = [];
            let comentarios = [];
            let notas = [];

            let sum = 0;
            let total = 0;

            for(let i in response) {
                fechas.push(response[i][0]);
                comentarios.push(response[i][1]);
                notas.push(response[i][2]);
            }

            $.each(notas, function (i){
                sum += notas[i];
                total = 1 + parseInt(i);
            })
            $(".puntaje").html("Valoración media " + (sum/total).toFixed(1))

            $.each(comentarios, function (q){
                let commentary = comentarios[q];
                let fecha = fechas[q];
                $(".listado-comentarios").html("<p id=' " + id + "'>" + commentary + " " + fecha + "</p>")
            })
        })
}

$(".evaluacion").submit(function (event) {
    event.preventDefault();
    let val = $(this).find("input[name=nota]:checked").val();
    let comen = $(this).find("input[name=comentario]").val();
    let id_foto = $(this).find("input[name=id]").val();
    let date = $(this).find("input[name=fecha]").val();

    $.post("galeria-handler", {
        nota: val,
        comentario: comen,
        fecha: date,
    }, function (responseText) {
        console.log("Guardado exitoso");
        showEval(id_foto);
    })
})
