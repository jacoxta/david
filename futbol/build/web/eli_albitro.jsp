<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  errorPage="" %>
<%@ include file ="./funciones/conexion.jsp" %>
<!--%@ include file="./funciones/funciones.jsp" %-->
<head>
    <script type="text/javascript" src="./funciones/validaciones.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
</head>
<body onload="timeMsg()">
<%	
    String id=request.getParameter("id");
    ResultSet rs=null;
    try{
	if (request.getParameter("eliminar")!=null)
	{			
                        if(id!=null && id!="");
                        String cad_bus="select * from albitro where idalbitro='" + id + "'";
                        rs=comando.executeQuery(cad_bus);
                        if(rs.next())				
                        {	comando.executeUpdate("delete from albitro where idalbitro='" + id + "'");						
                                out.println("<script>alert('Registro eliminado con exito');</script>");																		      
                        }else
                        {
                                out.println("<script>alert('Registro no encontrado');</script>");
                        }
					
			}
			
		}catch(SQLException e) {out.println(e);};
		
	
%>
<!-- esta funcion no se uso pero sirve-->
<script type="text/javascript">

function timeMsg()
{var t=setTimeout("alertMsg()",5000);}

function alertMsg()
{parent.location.href="index.jsp" }

</script>
</body>
</html>