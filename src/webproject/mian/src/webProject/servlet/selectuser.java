package webproject.mian.src.webProject.servlet;

import webProject.entity.User;
import webProject.service.UserService;
import webProject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class selectuser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        String name=req.getParameter("username");
        String pwd=req.getParameter("userpwd");
        UserService usr=new UserServiceImpl();
        HttpSession session = req.getSession();
        User us=new User();
        us.setAccount(name);
        boolean flag;
        flag=usr.userdl(name,pwd);
        if (flag){
            System.out.println("登录成功！");
            session.setAttribute("account", name);
           String demo=req.getHeader("Referer");
           resp.sendRedirect(demo);
        }else{
            System.out.println("登录失败！");
            session.removeAttribute("account");
            session.setAttribute("pd",true);
            String demo=req.getHeader("Referer");
            resp.sendRedirect(demo);
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

    }
}
