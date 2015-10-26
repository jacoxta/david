package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.*;

public final class listar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/./funciones/conexion.jsp");
    _jspx_dependants.add("/./funciones/funcionesjs.js");
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

      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n");
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
      out.write("\n");
      out.write("\n");
      out.write("function eliminar(codigo)\n");
      out.write("{\n");
      out.write("resp=confirm(\"desea eliminar el registro\")\n");
      out.write("if (resp==true)\n");
      out.write("{\n");
      out.write("\twindow.location=\"eli_albitro.jsp?curId=\"+codigo+\"&eliminar=1\";\n");
      out.write("}\n");
      out.write("}");
      out.write('\n');
 ResultSet rs=null; 
      out.write("\n");
      out.write("\n");
      out.write("<body >\n");
      out.write("\n");
      out.write("\n");
      out.write("    <table id=\"Tabla_01\" width=\"1024\" height=\"464\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n");
      out.write("        <tr>\n");
      out.write("            <td rowspan=\"2\">\n");
      out.write("            </td>\n");
      out.write("            <td >\n");
      out.write("\n");
      out.write("                ");


                    //String curId=request.getParameter("curId");
                    String curId = "1";
                    try {
                        rs = comando.executeQuery("select * from arbritro where idarbritro='" + curId + "'");
                        if (rs.wasNull()) {
                            out.println("<script>alert('No Encontrado');</script>");
                        } else {
                
      out.write("\n");
      out.write("                    <center>                        \n");
      out.write("                    <table border=0><tr><td align=center>Codigo Rol</td><td align=center>Nombre Rol</td><td align=center>Descripcion</td><td align=center>Opciones</td></tr>\n");
      out.write("                        \n");
      out.write("                        ");
  while (rs.next()) 
                            {
                                out.println("<tr><td align=center>" + rs.getString(1) + "</td>");
                                out.println("<td align=center>" + rs.getString(2) + "</td>");
                                out.println("<td align=center>" + rs.getString(3) + "</td>");
                                out.println("<td align=justify>" + rs.getString(4) + "</td></tr>");
                                out.println("<td align=justify><a href=# onclick=eliminar('" + rs.getString(1) + "')>eliminar</a></td></tr>");
                                out.println("<td align=justify><a href=# onclick=actualizar('" + rs.getString(1) + "')>actualizar</a></td></tr>");
                            };
                         
      out.write("\n");
      out.write("                         </table>                        \n");
      out.write("                        <!--imprimo dos funciones en un mismo evento-->\n");
      out.write("                ");
}
                    } catch (SQLException e) {
                        out.println(e);
                    };

                try {
                        //cambiar la consulta 
                        rs = comando.executeQuery("select * from arbritro ");
                        if (rs.wasNull()) {
                            out.println("<script>alert('No Encontrado');</script>");
                        } else
                
      out.write("                \n");
      out.write("                    \n");
      out.write("                <center><table border=0><tr><td align=center>Codigo Rol</td><td align=center>Nombre Rol</td><td align=center>Descripcion</td><td align=center>Opciones</td></tr>\n");
      out.write("                        ");
                               
                        while (rs.next()) 
                        {                       
                            out.println("<tr><td><a href=modificarCursos.jsp?curId=" + rs.getString(1) + "&modificar=1>" + rs.getString(1) + "</a></td>");
                            out.println("<td align=center>" + rs.getString(2) + "</td>");
                            out.println("<td align=center>" + rs.getString(3) + "</td>");
                            out.println("<td align=justify>"+rs.getString(4)+"</td>");					                                
                            out.println("<td align=justify><a href=# onclick=eliminar('" + rs.getString(1) + "')>eliminar</a></td></tr>");
                            out.println("<td align=justify><a href=# onclick=actualizar('" + rs.getString(1) + "')>actualizar</a></td></tr>");
                        };                                             
                        
      out.write("\n");
      out.write("                </table>\n");
      out.write("                \n");
      out.write("                ");
 }catch (SQLException e){ out.println(e);};  
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                \n");
      out.write("                    <center><br>\n");
      out.write("\n");
      out.write("                        <form name=\"cursos\" method=\"post\" action=\"buscarCursos.jsp\">\n");
      out.write("\n");
      out.write("                            <label>Curso Id</label><input type=\"text\" name=\"curId\" />\n");
      out.write("                            <input type=\"submit\" name=\"buscar\" value=\"buscar\"  onMousemove=\"valida_envia()\" />                  \n");
      out.write("                            \n");
      out.write("                        </form>\n");
      out.write("                        <center><a href=\"ingresoCursos.jsp\">Registrar Nuevo albitro</a></center>\n");
      out.write("\n");
      out.write("                \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                <!-- fin del  formulario de ingreso de informacion -->\n");
      out.write("            </td>\n");
      out.write("            <td rowspan=\"2\">\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("    </table>\n");
      out.write("\n");
      out.write("</div>\n");
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
