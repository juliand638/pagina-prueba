var canvas = document.getElementById("miCanvas");
function descargar(){
    var filename = prompt("Guardar como...","Nombre del archivo");
    if (canvas.msToBlob){ //para internet explorer
        var blob = canvas.msToBlob();
        window.navigator.msSaveBlob(blob, filename + ".jpg" );// la extensión de preferencia pon jpg o png
    } else {
        link = document.getElementById("download");
        //Otros navegadores: Google chrome, Firefox etc...
        link.href = canvas.toDataURL("PRACTICA 2 HTML/media/imagenes/dbs.jpg");// Extensión .png ("image/png") --- Extension .jpg ("image/jpeg")
        link.download = filename;
    }
}






function validarFormulario(evObject) {
        
    evObject.preventDefault();
    
    var todoCorrecto = true;
    
    var formulario = document.formularioContacto;
    
    for (var i=0; i<formulario.length; i++) {
    
    if(formulario[i].type =='text') {
    
    if (formulario[i].value == null || formulario[i].value.length == 0 || /^\s*$/.test(formulario[i].value)){
    
   
    alert (formulario[i].name+" ES OBLIGATORIO DEBE INGRESARLO");
   
    todoCorrecto=false;}
    }
    }
     if (todoCorrecto ==true) {formulario.submit();}
    }























    function validar(form){
    
        if(form.mail.value==""){
        alert ("EL CAMPO E-MAIL ES OBLIGATORIO DEBE INGRESARLO");
        form.mail.focus();return false;
        }
        if(form.password.value == "") {
        alert ("EL CAMPO PASSWORD ES OBLIGATORIO");
        form.password.focus();return false;
        }
        if(form.password2.value == "") {
        alert ("EL CAMPO RECTIFICAR CONTRASEÑA ES OBLIGATORIO");
        form.password2.focus();return false;
        }
        if(form.password.value != form.password2.value){
        alert ("Las 2 contraseñas no coniciden");
        form.password.focus();return false;
        }
    
        
        if(form.pais.value == "") {
        alert ("EL NOMBRE ES OBLIGATORIO");
        form.pais.focus();return false;
        }   
        return true;
       
        }
        function myfunction(txt){
            alert(txt)
          }
    
