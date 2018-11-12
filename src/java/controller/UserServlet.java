/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UserDao;
import java.io.IOException;
import java.sql.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import tools.MD5;

/**
 *
 * @author User
 */
public class UserServlet extends HttpServlet {

    UserDao userDao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String url = "index.jsp";
        String name = "";
        User user = new User();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":
//                    user.setHoten(request.getParameter("hoten"));
//                    user.setNgaysinh(Date.valueOf(request.getParameter("ngaysinh")));
//                    user.setSdt(request.getParameter("sdt"));
                String email = request.getParameter("email");
                Pattern regex = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
                Matcher matcher = regex.matcher(email);
                String uname = request.getParameter("uname");
                String password = request.getParameter("pass");
                String cfpassword = request.getParameter("copass");
                User getUser = new User();
                if (email.equals("") || email == null) {
                    request.setAttribute("error", "Email không được để null");
                    request.setAttribute("uname", uname);

                    RequestDispatcher rq = request.getRequestDispatcher(url);
                    rq.forward(request, response);
                }
                if (!matcher.matches()) {
                    request.setAttribute("error", "Email không đúng biểu mẫu");
                    request.setAttribute("uname", uname);

                    RequestDispatcher rq = request.getRequestDispatcher(url);
                    rq.forward(request, response);
                }

                if (uname.equals("") || uname == null) {
                    request.setAttribute("error", "UserName không được để null");
                    request.setAttribute("email", email);
                    RequestDispatcher rq = request.getRequestDispatcher(url);
                    rq.forward(request, response);
                }
                Pattern regexUname = Pattern.compile("[$&+,:;=?@#|'<>.-^*()%!]");
                Matcher matcherUname = regexUname.matcher(uname);
                if (matcherUname.find()) {
                    request.setAttribute("error", "Username không được chứa ký tự đặc biệt ");
                    request.setAttribute("uname", uname);

                    RequestDispatcher rq = request.getRequestDispatcher(url);
                    rq.forward(request, response);
                }
                if (password.equals("") || password == null) {
                    request.setAttribute("error", "Pass không được để null");
                    request.setAttribute("email", email);
                    request.setAttribute("uname", uname);
                    RequestDispatcher rq = request.getRequestDispatcher(url);
                    rq.forward(request, response);
                }
                Pattern regexPass = Pattern.compile("[$&+,:;=?@#|'<>.-^*()%!]");
                Matcher matcherPass = regexPass.matcher(password);
                if (matcherPass.find()) {
                    request.setAttribute("error", "Password không được chứa ký tự đặc biệt ");
                    request.setAttribute("uname", uname);

                    RequestDispatcher rq = request.getRequestDispatcher(url);
                    rq.forward(request, response);
                }
                if (!cfpassword.equals(password)) {
                    request.setAttribute("error", "Confirm password is wrong");
                    request.setAttribute("email", email);
                    request.setAttribute("uname", uname);
                    RequestDispatcher rq = request.getRequestDispatcher(url);
                    rq.forward(request, response);
                }

                if (!email.equals("") && email != null && !password.equals("") && password != null && !uname.equals("") && uname != null && !matcherPass.find() && cfpassword.equals(password)) {
                    String pass = MD5.encryption(request.getParameter("pass"));
                    getUser = userDao.login(email, pass);
                    if (getUser != null) {
                        request.setAttribute("error", "Tài khoản đã tồn tại");
                        request.setAttribute("email", email);
                        request.setAttribute("uname", uname);
                        RequestDispatcher rq = request.getRequestDispatcher(url);
                        rq.forward(request, response);
                    } else {
                        user.setEmail(email);
                        user.setUsername(uname);

                        user.setPassword(pass);
                        user.setAdmin(2);
                        userDao.inseartUser(user);
                        session.setAttribute("user", user);
                        RequestDispatcher rq = request.getRequestDispatcher(url);
                        rq.forward(request, response);
                        break;
                    }
                }
            case "login":
                user = userDao.login(request.getParameter("login-email"), MD5.encryption(request.getParameter("login-pass")));
                if (user != null) {
                    session.setAttribute("user", user);
                    response.sendRedirect(url);
                } else {
                    request.setAttribute("error", "Wrong email or password");
                    response.sendRedirect(url);
                }
                break;
            case "logout":
                session.setAttribute("user", null);
                response.sendRedirect("index.jsp");
//                case "update":
//                    user.setUserID(userDao.sizeUser());
//                    user.setHoten(request.getParameter("hoten"));
//                    user.setNgaysinh(Date.valueOf(request.getParameter("ngaysinh")));
//                    user.setEmail(request.getParameter("email"));
//                    user.setSdt(request.getParameter("sdt"));
//                    userDao.updateUser(user); 
//                    session.setAttribute("user",user);
//                    url = "/index.jsp";
//                    break;
        }
    }

}
