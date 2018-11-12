<%@page import="DAO.PostDao"%>
<%@page import="model.User"%>
<%
    String idPost = request.getParameter("param1");
    User user = new User();
    user = (User) session.getAttribute("user");
    System.out.println("hehe");
    PostDao.likePost(user, idPost);
%>