package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.*;

public final class act_005falbitro_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 String curNombre=null;
    String modificar=null;
    String curDescripcion=null;
    ResultSet rs=null;
    String curValor=null;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/./funciones/conexion.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');

		Connection cn=null;
		Statement comando=null;
		String bd="futbol";
		String usuario="root";
		String password="root";
		//String strCn="jdbc:postgresql://localhost/"+bd+"?user="+usuario+"&password="+password; //postgres
		String strCn="jdbc:mysql://localhost/"+bd+"?user="+usuario+"&password="+password;                
		try{
			//Class.forName("org.postgresql.Driver").newInstance();//postgres
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			cn=DriverManager.getConnection(strCn);
			comando=cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		} catch(java.lang.ClassNotFoundException e)
                    {out.println(e);} 
                  catch(SQLException e) 
                    {out.println(e);};

      out.write('\n');
      out.write('\n');
      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("<head>\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<script type=\"text/javascript\" src=\"./funciones/validaciones.js\"></script>\n");
      out.write("<title>Documento sin título</title>\n");
      out.write("</head>\n");
      out.write("\n");




	String curId=request.getParameter("id");
	//actualizar informacion		
	//variable que proviene de modificar.jsp
	if (request.getParameter("modificar")!=null)
	{
		try 
		{ 	//buscamos si el curId existe
			rs=comando.executeQuery("select * arbitro where id='"+curId+"'");
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
			curNombre=request.getParameter("curNombre");
			curValor=request.getParameter("curValor");
			curDescripcion=request.getParameter("curDescripcion");
			int n=comando.executeUpdate("update admon_roles set nombre='"+curNombre+"',descripcion='"+curValor+"' where id='"+ curId +"'");
			out.println("<script>alert('Registro modificado');</script>");																	  
		}catch(SQLException e) {out.println(e);};
	}
		//cierro conexiones
		try
		{
		rs.close(); comando.close();cn.close();	
		}
		catch(SQLException e) {out.println(e);}catch(Exception e) {}
	
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<table  width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td rowspan=\"2\">\n");
      out.write("\t\t</td>\n");
      out.write("\t\t<td >\n");
      out.write("\t\t<!-- formulario de ingreso de informacion -->\n");
      out.write("\t\t\t<center><h3>JULIAN RODRIGUEZ</h3> \n");
      out.write("\t\t\t<h3>MODIFICAR CURSOS</h3>\n");
      out.write("\t\t<form name=\"clientes\" method=\"post\" action=\"modificarCursos.jsp\">\n");
      out.write("\t\t\t<table>\n");
      out.write("\t\n");
      out.write("\t\t\t\t<tr><td>codigo curso</td><td><input type=\"text\" name=\"curId\" value=\"");
      out.print(curId);
      out.write("\" /></td></tr>\n");
      out.write("\t\t\t\t<tr><td>curNombre</td><td><input type=\"text\" name=\"curNombre\" value=\"");
      out.print(curNombre);
      out.write("\"/></td></tr>\n");
      out.write("\t\t\t\t<tr><td>Descripción del Curso </td><td><textarea name=\"curValor\" cols=\"17\" rows=\"7\"  maxlength=\"300\"> ");
      out.print(curValor);
      out.write(" </textarea></td></tr>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\t");
 	if (modificar==null){ 
      out.write("\n");
      out.write("\t\t\t\t<tr><td colspan=\"2\"><center><input type=\"submit\" name=\"ingresar\" value=\"Ingresar\" /></td></tr>\n");
      out.write("\t\t\t\t\t");
 }else {
      out.write("\n");
      out.write("\t\t\t\t<tr><td colspan=\"2\"><center><input type=\"submit\" name=\"modi\" value=\"Modificar\" /><input type=\"button\" value='Atras'  onclick=\"volverPagina()\"; ></td></tr>\n");
      out.write("\n");
      out.write("\t\t\t\t\t");
 }
      out.write("\n");
      out.write("\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</form>\n");
      out.write("\t\t\n");
      out.write("\t\t<!-- fin del  formulario de ingreso de informacion -->\n");
      out.write("\t\t</td>\n");
      out.write("\t\t<td rowspan=\"2\">\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("\t<tr>\n");
      out.write("\t\t<td>\n");
      out.write("\t\t</td>\n");
      out.write("\t</tr>\n");
      out.write("</table>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
