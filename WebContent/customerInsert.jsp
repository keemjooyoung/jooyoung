<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
String	driver	= "com.mysql.jdbc.Driver";
String	dbURL	= "jdbc:mysql://localhost/bookshopdb";
String	user	= "bookmaster";
String	pass	= "1111";

System.out.println("customerInsert.jsp Start.....");


String	sql		= "";
Connection	conn	= null;
Statement	stmt	= null;

String 	id		= request.getParameter("id");
String 	passwd	= request.getParameter("passwd");
String 	name	= request.getParameter("name");
String	tel		= request.getParameter("tel");
String	address	= request.getParameter("address");
System.out.println("customerInsert id=" + id + "/passwd=" + passwd + "/name=" + name + "/tel=" + tel + "/address=" + address);

try {
	Class.forName(driver);
	conn = DriverManager.getConnection(dbURL, user, pass);		
	//sql  = "insert into member(id, passwd, name, reg_date, tel, address) ";
	//sql += "values('" +id+ "', '" +passwd+"', '" +name+ "', now(), '" +tel+"', '" +address+"')";
	sql  = "insert into member(id, passwd, name, reg_date, tel, address) ";
	sql += "values('" +id+ "', '" +passwd+"', '" +name+ "', now(), '" +tel+"', '" +address+"')";
	   System.out.println("sql=" + sql);

	stmt = conn.createStatement();
	stmt.executeUpdate(sql);
	
} catch (ClassNotFoundException cne) {
	
} catch (SQLException se) {
	
}
%>




















