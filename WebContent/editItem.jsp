<%@page import="com.cp.account.SelectAccount"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.cp.account.EditAccount"%>
<%@page import="com.cp.exhibition.EditCpImage"%>
<%@page import="com.cp.newspub.EditNews"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int id = Integer.valueOf(request.getParameter("id"));
    String type = request.getParameter("type");
   
    boolean result = false;
    switch (type){
    case "news" :
    	  String content = request.getParameter("content");
    	  result = EditNews.editNews(id, content);
    	  break;
    case "cpimg" :
    	  String discription = request.getParameter("description");
    	  result = EditCpImage.editCpImage(id, discription);
    	  break;
    case "server" :
    case "remote" :	 
    	  String passwd = request.getParameter("passwd");
          ResultSet rs = SelectAccount.selectAccount(id);
          rs.next();
          String passwdInDataBase = rs.getString("passwd");
          if(passwd == passwdInDataBase){
        	  String renewpasswd = request.getParameter("renewpasswd");
        	  result = EditAccount.editAccount(id, renewpasswd);   
          }
    	  break;
    default:
    	result = false;
    
    }

    if(result){
    	out.write("1"); 
    }else{
    	out.write("0");
    }

%>