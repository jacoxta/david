<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" session = "true" %>
<!DOCTYPE html>
<%@ include file="./funciones/conexion.jsp" %>
<%! Integer curId = null;
    String curNombre = null;
    String curValor = null;
    ResultSet rs = null;
    String curDescripcion = null;
    String curEstado = null;
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Registrar </title>
    </head>

    <%	//String curId=request.getParameter("curId");
        //ingresar nueva informacion
        if (request.getParameter("ingresoCursos") != null) 
        {            		            
            curId=Integer.parseInt(request.getParameter("curId"));           
            curNombre = request.getParameter("curNombre");
            curValor = request.getParameter("curValor"); 
            try 
            {
                int n = comando.executeUpdate("insert into albitro  values('" + curId + "','" + curNombre + "','" + curValor + "','2015/10/10')");
                //si la consulta tuvo exito me envia un uno 1, entonces si n==1 quiere decir que si inserto bien
                if(n==1)
                {
                out.println("<script>alert('Registro Adicionado:');</script>");                
                }
                
            } catch (SQLException e) {
                out.println(e);
            };
        }

    %>
    <body>
        <h3 align="center">REGISTRO DE  ALBITROS</h3>       

    <form name="cursos" method="post" action="reg_albitro.jsp" >
        <hr width="60%" />
        <table>
            <tr><td>ID </td>
            <td><input type="text" name="curId" value="" maxlength='3'/></td></tr>
            
            <tr><td>NOMBRE</td>
            <td><input type="text" name="curNombre" value="" maxlength='35' /></td></tr>
            
            <tr><td>APELLIDO</td>
            <td><textarea name="curValor" cols="28" rows="5" onclick="value = ''" maxlength='300' ></textarea> 
                
            </td></tr>
        </table>
        <input type="submit" name="ingresoCursos"  value="Enviar"/>
        <input type="button" value='Listar Roles'  onclick="parent.location = 'index.jsp'" >	
</form>
</body>
</html>