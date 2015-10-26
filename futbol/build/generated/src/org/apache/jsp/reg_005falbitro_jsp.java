package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.sql.*;

public final class reg_005falbitro_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 Integer curId = null;
    String curNombre = null;
    String curValor = null;
    ResultSet rs = null;
    String curDescripcion = null;
    String curEstado = null;

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

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
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
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <title>Registrar </title>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    ");
	//String curId=request.getParameter("curId");
        //ingresar nueva informacion
        if (request.getParameter("ingresoCursos") != null) {
            /////////request.getParameter trae informacion de la caja 		
            //curId = request.getParameter("curId");
            curId=Integer.parseInt(request.getParameter("curId"));
            //perNombre=Integer.parseInt(request.getParameter("perNombre"));
            curNombre = request.getParameter("curNombre");
            curValor = request.getParameter("curValor");
            curDescripcion = request.getParameter("curDescripcion");
            curEstado = request.getParameter("curEstado");

            try {
                int n = comando.executeUpdate("insert into albitro  values('" + curId + "','" + curNombre + "','" + curValor + "','2015/10/10')");
                out.println("<script>alert('Registro Adicionado');</script>");
                //response.sendRedirect("./imprimir.jsp?curId="+curId+"&curNombre="+curNombre+"&curValor="+curValor+"&curDescripcion="+curDescripcion);  
            } catch (SQLException e) {
                out.println(e);
            };
        }

    
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <h3 align=\"center\">REGISTRO DE  ALBITROS</h3>       \n");
      out.write("\n");
      out.write("                    <form name=\"cursos\" method=\"post\" action=\"reg_albitro.jsp\" >\n");
      out.write("                        <hr width=\"60%\" />\n");
      out.write("                        <table>\n");
      out.write("                            <tr><td>ID </td><td><input type=\"text\" name=\"curId\" value=\"\" maxlength='3'/></td></tr>\n");
      out.write("                            <tr><td>NOMBRE</td><td><input type=\"text\" name=\"curNombre\" value=\"\" maxlength='35' /></td></tr>\n");
      out.write("                            <tr><td>APELLIDO</td><td><textarea name=\"curValor\" cols=\"28\" rows=\"5\" onclick=\"value = ''\" maxlength='300' ></textarea>\n");
      out.write("                                    <!--input type=\"text\" name=\"curValor\" value=\"\"  maxlength='10'/-->\n");
      out.write("                                </td></tr>\n");
      out.write("\n");
      out.write("                        </table>\n");
      out.write("                        <input name=\"ingresoCursos\" type=\"submit\" onMousemove=\"valida_envia()\"  value=\"Enviar\"  />\n");
      out.write("                        <input type=\"button\" value='Listar Roles'  onclick=\"parent.location = 'index.jsp'\" >\t\n");
      out.write("                            <a href=\"index.jsp\">Listar</a>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </body>\n");
      out.write("                    </html>");
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
