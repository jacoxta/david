<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="./funciones/conexion.jsp" %>

<%! String curNombre=null;
    String modificar=null;
    String curDescripcion=null;
    ResultSet rs=null;
    String curValor=null;
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="./funciones/validaciones.js"></script>
<title>Documento sin título</title>
</head>

<%	String curId=request.getParameter("id");        
	//actualizar informacion		
	//variable que proviene de modificar.jsp
	if (request.getParameter("modificar")!=null)
	{
		try 
		{ 	//buscamos si el curId existe
			rs=comando.executeQuery("select * from albitro where idalbitro='" + curId + "'");
			if (rs.next())
			{
				rs.beforeFirst();
				while(rs.next()) 
				{
					//si existe extraemos la informacion del formulario
					curNombre=rs.getString(2);
					curValor=rs.getString(3);
					curDescripcion=rs.getString(4);
					modificar="1";
				} // fin while
			}else
				out.println("<script>alert('No Encontrado');</script>");	
			rs.close(); comando.close();cn.close();
		}catch(SQLException e) {out.println(e);};
	}
	if (request.getParameter("modi")!=null)
	{
		try 
		{ 	//actualizamos
                        curId=request.getParameter("curId");
			curNombre=request.getParameter("curNombre");
			curValor=request.getParameter("curValor");
			curDescripcion=request.getParameter("curDescripcion");
			int n=comando.executeUpdate("update albitro set nombre='"+curNombre+"',apellido='"+curValor+"' where idalbitro='"+ curId +"'");
			out.println("<script>alert('Registro modificado');</script>");																	  
		}catch(SQLException e) {out.println(e);};
	}
		//cierro conexiones
		try
		{
		rs.close(); comando.close();cn.close();	
		}
		catch(SQLException e) {out.println(e);}catch(Exception e) {}
	%>
<body>

    
    <h3>MODIFICAR ALBITROS</h3>
    <form name="clientes" method="post" action="act_albitro.jsp">
        <table>

            <tr>
                <td>codigo curso</td>
                <td><input type="text" name="curId" value="<%=curId%>" /></td>
            </tr>
            <tr>
                <td>curNombre</td>
                <td><input type="text" name="curNombre" value="<%=curNombre%>"/>
                </td>
            </tr>
            <tr>
                <td>Descripción del ALBITRO </td>
                <td><textarea name="curValor" cols="17" rows="7"  maxlength="300"> <%=curValor%> </textarea></td></tr>

            <% 	if (modificar == null) 
                { %>
                    <tr><td colspan="2"><center><input type="submit" name="ingresar" value="Ingresar" /></td></tr>
            <%  } else 
                {%>
                    <tr><td colspan="2"><center><input type="submit" name="modi" value="Modificar" />
                    <input type="button" value='Atras'  onclick="parent.location = 'index.jsp'"; ></td></tr>
            <%  }%>
</table>
</form>

</body>
</html>