package webproject.mian.src.webProject.servlet;

import webProject.service.UserService;
import webProject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "addressup",urlPatterns = "/addup")
public class addressup extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String id=req.getParameter("id");
            String userid=req.getParameter("userid");
        UserService use=new UserServiceImpl();
        int count=use.addressUp(id,userid);
        if (count>0){
            System.out.println("默认地址以外清空成功！servlet");
            String demo=req.getHeader("Referer");
            resp.sendRedirect(demo);
        }else{
            System.out.println("默认地址以外清空失败！servlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
