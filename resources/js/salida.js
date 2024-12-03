$(document).ready(function(){
    $("#frmSalida").bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields:{
            txtFecha:{
                validators:{
                    notEmpty:{
                        message: 'El campo es obligatorio.'
                    }
                }
            }
        }
    }).on('success.form.bv', function(e) {
        e.preventDefault();
        guardarSalida();
    });
});

function guardarSalida() {

    $("#divBotones").html('<div align="center"><i class="fa fa-refresh fa-spin fa-5x"></i></div>');
    $.post("controller/SalidaController.php",
        {
            operacion: 'agregarSalida',
            TipoMov: $("#txtTipoMov").val(),
            fecha: $("#txtFecha").val(),
            observaciones: $("#txtNotas").val(),
            usuarioasignaid: $("#txtUsuario").val(),
            password:$("#txtPassword").val()
        }, function (data) {
            $("#divBotones").html(data);
            $("#txtTipoMov").attr("readonly");
            $("#txtFecha").attr("readonly");
            $("#txtNotas").attr("readonly");
            $("#txtUsuario").attr("readonly");
        });

}

function seleccion(id,producto) {
    $("#txtIdProducto").val(id);
    $("#txtProducto").val(producto);
    $("#SeleccionProducto").modal("hide");
}

function registrarDetalleSalida() {
    $.post( "controller/SalidaController.php",
        {   operacion:'agregarDetalleSalida',
            prodId:$("#txtIdProducto").val(),
            salidaId:$("#txtIdSalida").val(),
            cantidad:$("#txtCantidad").val()
        },function (data) {
            $("#divBotones").html(data);
        });
}