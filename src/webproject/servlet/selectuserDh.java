package webproject.servlet;

import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class selectuserDh extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String pwd=req.getParameter("userpwd");
        int dh=Integer.parseInt(req.getParameter("userdh"));
        UserService usr=new UserServiceImpl();
            boolean flag=usr.userdhdl(dh,pwd);
            if (flag){
                System.out.println("电话登录成功！");
                req.getRequestDispatcher("webproject/loldemo/home.jsp").forward(req, resp);
            }else{
                System.out.println("电话登录失败！");
                resp.sendRedirect("http://localhost:8080/Project_war_exploded/loldemo/index.jsp");
            }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req, resp);

    }
}
