<%@page import="com.cp.download.DownLoadFileStream"%>
<%@page import="com.cp.basefunc.ResultsetToJSON"%>
<%@page import="com.cp.exhibition.SelectCpImgVideo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.cp.newspub.SelectNews"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.cp.JDBC.SelectOperation"%>
<%@page import="java.sql.ResultSet"%>


<%
 String uuid = request.getParameter("uuid");
 if(uuid==null){
	out.write("0");
	return;
}

 ResultSet rs = SelectNews.selectNewsInfo(uuid);
 try{
	 while(rs!=null){
		 rs.next();
		 String content = rs.getString("content");
		 out.write(content);
		 String title = rs.getString("title");
		 String abstractt = rs.getString("abstract");
		 String showTime = rs.getString("showTime");	 
	 } 
 }catch(SQLException e){
//	 e.printStackTrace(); 
 }
 


%>