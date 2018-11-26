<%-- 
    Document   : DetailUpload
    Created on : Nov 6, 2018, 2:30:06 PM
    Author     : User
--%>

<%@page import="model.Comment"%>
<%@page import="DAO.CommentDao"%>
<%@page import="model.User"%>
<%@page import="DAO.PostDao"%>
<%@page import="model.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/post.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/comment.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <% 
            User user = new User();
            if(session.getAttribute("user") != null)
            {
                user = (User) session.getAttribute("user");        
                Post post = new Post();
                String postID = "";

                if(request.getParameter("postID") != null){
                    postID = request.getParameter("postID");
                    post = PostDao.getPost(postID);
                }
        %>
        <br><br><br><br>
        <div class="post">
            <div class="fix-detail-post"></div>
            <div class="detail-post">  
                <div class="upload">
                    <div class="postusername"><b><%= post.getPostUserName() %></b></div>

                    <div class="upload-nalo">
                        <div class="upload-name"><b><%=post.getPostName()%></b></div>
                        <div class="upload-location"><%=post.getPostLocation()%></div>
                    </div>  <br>

                    <div class="upload-content">
                        <%= post.getPostContent()%>
                    </div>    

                    <center>
                        <img src="PostImages/<%=post.getPostFileName() %>" width="500px" height="500px">
                    </center>
                    <center>
                        <hr>
                        <div style="width: 100%;">
                            <div class="fix-btn"></div>
                        <%
                            user = (User) session.getAttribute("user");
                            if(PostDao.checkLiked(user, post.getPostID())){
                        %>
                            <button type="submit" class="btn" onclick="return liked(<%=post.getPostID()%>)" value="0" id="<%="btn"+post.getPostID()%>">
                                <img id="<%="img"+post.getPostID()%>" src="img/love.png" width="15px" height="15px"> Like (<%=PostDao.countlikePost(post.getPostID()) %>)
                            </button>
                        <%}else{%>
                            <button type="submit" class="btn" onclick="return liked(<%=post.getPostID()%>)" value="1" id="<%="btn"+post.getPostID()%>">
                                <img id="<%="img"+post.getPostID()%>" src="img/love.png" width="15px" height="15px" style="background-color: #fb5e33;"> Like (<%=PostDao.countlikePost(post.getPostID())%>)
                            </button>
                        <%}%>
                            <button class="btn" style="margin: 0;">
                                <img src="img/message.png" width="15px" height="15px"> Comment (<%=PostDao.countCommentPost(post.getPostID())%>)
                            </button>
                            <div class="fix-btn"></div>
                        </div>
                        <hr> <br>
                    </center>
                    <%
                        for(Comment cmt : CommentDao.getListComment(post.getPostID())){
                    %>
                    <center>
                        <% 
                            int a = cmt.getCommentContent().length();
                            int h;
                            int b;
                            if(a%55 == 0){
                                b = a/55;
                            }
                            else{
                                b = a/55+1;
                            }
                            h = b*15;
                        %>
                        <div class="zone-comment" style="height: <%=h%>px;">
                            <div class="username-comment">
                                <b><%= cmt.getUserCommentName() %></b>
                            </div>
                            <div class="content-comment">
                                <%= cmt.getCommentContent() %>
                            </div>
                        </div>
                    </center> <br>

                    <% } %>

                    <center>
                        <div class="form-comment">
                            <form action="CommentServlet" method="POST" class="form-comments">
                                <div class="user-comment"><b><%=user.getUsername()%></b></div>
                                <div class="input-comment">
                                    <input type="text" name="content_comment" placeholder="  Write a comment..." class="add-comment">
                                    <input type="hidden" value="<%=post.getPostID()%>" name="postID">
                                </div>
                            </form>
                        </div>
                    </center>
                </div>
            </div>  
            <div class="fix-detail-post"></div>
        </div>
        <%
            } else {
        %>        
        <jsp:include page="signup.jsp"></jsp:include>
        <% } %>
    </body>
</html>

<script type="text/javascript">
    function liked(a){
        var btnLike = "btn"+a;
        var imgLike = "img"+a;
        var checkLike = document.getElementById(btnLike).value;
        if(checkLike == 0)
        {
            document.getElementById(imgLike).style.backgroundColor = "#fb5e33";
            document.getElementById(btnLike).value = 1;
            var http = new XMLHttpRequest();
            http.open("POST", "http://localhost:8080/DemoWeb/sublike.jsp", true);
            http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            var params = "param1=" + a;
            http.send(params);
            http.onload;
        }
        else
        {
            document.getElementById(imgLike).style.backgroundColor = "white";
            document.getElementById(btnLike).value = 0;
            var http = new XMLHttpRequest();
            http.open("POST", "http://localhost:8080/DemoWeb/dislike.jsp", true);
            http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            var params = "param1=" + a;
            http.send(params);
            http.onload;
        }
    }
</script>
