$(document).ready(function(){
    $("#frmEntrada").bootstrapValidator({
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
        guardarEntrada();
    });
});

function guardarEntrada() {
    $("#divBotones").html('<div align="center"><i class="fa fa-refresh fa-spin fa-5x"></i></div>');
    $.post( "controller/EntradaController.php",
        {   operacion:'agregarEntrada',
            TipoMov:$("#txtTipoMov").val(),
            fecha:$("#txtFecha").val(),
            observaciones:$("#txtNotas").val()
        },function (data) {
            $("#divBotones").html(data);
            $("#txtTipoMov").attr("readonly");
            $("#txtFecha").attr("readonly");
            $("#txtNotas").attr("readonly");
        });
}

function seleccion(id,producto) {
    $("#txtIdProducto").val(id);
    $("#txtProducto").val(producto);
    $("#SeleccionProducto").modal("hide");
}

function registrarDetalle() {
    $.post( "controller/EntradaController.php",
        {   operacion:'agregarDetalleEntrada',
            cantidad:$("#txtCantidad").val(),
            precio:$("#txtPrecio").val(),
            prodId:$("#txtIdProducto").val(),
            entradaId:$("#txtIdEntrada").val()
        },function (data) {
            $("#divBotones").html(data);
        });
}