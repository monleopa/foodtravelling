<%-- 
    Document   : home.jsp
    Created on : Oct 30, 2018, 2:00:48 PM
    Author     : User
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%
            User user = new User();
            user = (User) session.getAttribute("user");
        %>
        <br><br><br><br>
        <center><h1><%= user.getUsername() %></h1></center>
        
        <div class="post">
            <div class="fix-detail-post"></div>
            <div class="detail-post">
                <jsp:include page="ListPostUpload.jsp"><jsp:param name="loadPost" value="<%=user.getUserID()%>"></jsp:param></jsp:include>
            </div>
            <div class="fix-detail-post"></div>
        </div>
    </body>
</html>
