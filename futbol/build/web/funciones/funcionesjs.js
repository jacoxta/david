
/*FUNCION QUE SIRVE PARA ENVIAR EL ALBITRO A ELMINIAR */
function eliminar(codigo)
{
    resp=confirm("desea eliminar el registro");
    if (resp==true)
        {
            window.location="eli_albitro.jsp?id="+codigo+"&eliminar=1";
        }
}

function actualizar(codigo)
{
    window.location="act_albitro.jsp?id="+codigo+"&modificar=1";    
}
function buscar()
{  
  codigo= document.getElementById("valor").value;//slecciona el valor de la caja de texto #
  window.location="index.jsp?id="+codigo;    
}

