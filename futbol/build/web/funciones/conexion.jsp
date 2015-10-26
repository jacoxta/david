<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  errorPage="" %>
<%
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
%>
