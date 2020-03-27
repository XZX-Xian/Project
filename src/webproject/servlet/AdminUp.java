package webproject.servlet;

import webproject.entity.Admin;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminUp",urlPatterns = "/adminup")
public class AdminUp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String account=request.getParameter("username");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        String pwd=request.getParameter("pass");
        Admin admin=new Admin();
        admin.setAccount(account);
        admin.setPhone(phone);
        admin.setEmail(email);
        admin.setPwd(pwd);
        UserService str=new UserServiceImpl();
        int count=str.AdminUP(admin);
        if (count>0){
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
        //重定向到指定页面
        response.sendRedirect("backstage/htm/admin-list.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
