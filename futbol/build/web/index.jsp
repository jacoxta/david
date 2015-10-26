<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" session = "true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file ="./funciones/conexion.jsp" %>
<script type="text/javascript" src="./funciones/funcionesjs.js"></script>
<% ResultSet rs=null; %>


<body >
    <table id="Tabla_01" width="1024" height="464" border="0" cellpadding="0" cellspacing="0">
        <tr>
<td rowspan="2">
</td>
<td >
    <%  String curId=request.getParameter("id");
        //String curId = "1";
       
        
        try 
        {      
        
            if(curId!=null)
            {
                rs = comando.executeQuery("select * from albitro where idalbitro='" + curId + "'");            
            }else
            {
                rs = comando.executeQuery("select * from albitro ");
            }       
            if (rs.wasNull()) 
            { out.println("<script>alert('No Encontrado');</script>");
            } 
            else 
            {
    %>
                <center>                        
                <table border=0><tr><td align=center>Codigo Rol</td><td align=center>Nombre Rol</td><td align=center>Descripcion</td><td align=center>Opciones</td></tr>
                <% 
                    while (rs.next()) 
                    {
                        out.println("<tr><td align=center>" + rs.getString(1) + "</td>");
                        out.println("<td align=center>" + rs.getString(2) + "</td>");
                        out.println("<td align=center>" + rs.getString(3) + "</td>");
                        out.println("<td align=justify>" + rs.getString(4) + "</td>");
                        out.println("<td align=justify><a href=# onclick=eliminar('" + rs.getString(1) + "')>eliminar</a></td>");
                        out.println("<td align=justify><a href=# onclick=actualizar('" + rs.getString(1) + "')>actualizar</a></td></tr>");
                    };
                        
                 %>
                 </table>                                                
    <%  }
        } catch (SQLException e) 
          {out.println(e);};
    %>                     
                    <label>id albitro</label>
                    <input type="text" id="valor" />
                    <input type="button" onclick="buscar()" value="Buscar"/>
                    
                    <center><a href="reg_albitro.jsp">Registrar Nuevo albitro</a></center>                
            </td>
            <td rowspan="2">
            </td>
        </tr>
        
    </table>
</div>
</body>
</html>