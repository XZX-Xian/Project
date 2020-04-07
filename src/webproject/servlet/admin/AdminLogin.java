package webproject.servlet.admin;

import webproject.service.AdminService;
import webproject.service.impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdminLogin",urlPatterns = "/adminlogin")
public class AdminLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String account=request.getParameter("account");
        String pwd=request.getParameter("pwd");
        AdminService str=new AdminServiceImpl();
        int count=str.AdminLogin(account,pwd);
        if (count>0){
            HttpSession session=request.getSession();
            session.setAttribute("admin",account);
            response.sendRedirect("http://localhost:8080/Project_war_exploded/backstage/backstage.jsp");
        }else {
            //获取登陆页面所设定的访问路径
            String preUrl = request.getHeader("Referer");
            //重定向到指定页面
            response.sendRedirect(preUrl);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
