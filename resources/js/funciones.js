function cargarPaginaMenu(elementoCargar, paginaCargar, elementoInvoca) {
    $("#"+ elementoCargar).load(paginaCargar);
    $('#prod1').removeClass("active");
    $('#prod2').removeClass("active");
    $('#proy1').removeClass("active");
    $('#proy2').removeClass("active");
    $('#tabla1').removeClass("active");
    $('#tabla2').removeClass("active");
    $('#'+elementoInvoca).addClass("active")
}

function cerrarSesion() {
    window.location.href = "login.php";
}

function cerrarModal(modal) {
    $('#'+modal).modal('hide');
}