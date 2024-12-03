$(document).ready(function(){
    $("#frmProducto").bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields:{
            txtnombre:{
                validators:{
                    notEmpty:{
                        message: 'El campo es obligatorio.'
                    }
                }
            },
            txtdescripcion: {
                validators: {
                    notEmpty: {
                        message: 'El campo es obligatorio.'
                    }
                }
            },
            minimo: {
                validators: {
                    notEmpty: {
                        message: 'El campo es obligatorio.'
                    },
                    digits:{
                        message: 'El campo solo acepta números.'
                    }
                }
            },
            maximo: {
                validators: {
                    notEmpty: {
                        message: 'El campo es obligatorio.'
                    },
                    digits:{
                        message: 'El campo solo acepta números.'
                    }
                }
            }
        }
    }).on('success.form.bv', function(e) {
        e.preventDefault();
        guardarProducto();
    });
});

function guardarProducto() {
    $("#divBotones").html('<div align="center"><i class="fa fa-refresh fa-spin fa-5x"></i></div>');
    $.post( "controller/ProductoController.php",
        {   operacion:'agregarProducto',
            txtnombre:$("#txtnombre").val(),
            txtdescripcion:$("#txtdescripcion").val(),
            minimo:$("#minimo").val(),
            maximo:$("#maximo").val()
        },function (data) {
            if(data.success == true){
                alert("Producto registrado satisfactoriamente.");
                cargarPaginaMenu('pagina','views/producto.php','prod1');
            }else{
                alert("Ha ocurrido un error. Comunicate con el encargado.")
            }
        },"json");
}
