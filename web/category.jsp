<%-- 
    Document   : category.jsp
    Created on : Oct 17, 2018, 3:16:38 PM
    Author     : User
--%>

<%@page import="model.Category"%>
<%@page import="DAO.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            CategoryDAO cateDAO = new CategoryDAO();
        %>
        
        <% for(Category c : cateDAO.getListCategory()){%>
        
        <h1><%= c.getCateID() %></h1>
        <h3><%= c.getCateName() %></h3>
        
        <% } %>
    </body>
</html>
