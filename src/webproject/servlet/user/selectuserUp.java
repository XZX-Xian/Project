package webproject.servlet.user;

import webproject.entity.User;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户注册
 */

@WebServlet(name = "selectuserUp",urlPatterns = "/seluerUp")
public class selectuserUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String Name=req.getParameter("userName");
            String Pwd=req.getParameter("userPwd");
            String Phone=req.getParameter("userPhone");

            User usr=new User();
            usr.setAccount(Name);
            usr.setPwd(Pwd);
            usr.setPhone(Phone);

        UserService us=new UserServiceImpl();
       int count=us.AddUser(usr);
       if (count>0){
           System.out.println("注册成功！");
           resp.sendRedirect("http://localhost:8080/Project_war_exploded/loldemo/home.jsp");
       }else {
           System.out.println("注册失败！");
           resp.sendRedirect("http://localhost:8080/Project_war_exploded/loldemo/denlv.jsp");
       }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
