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
import java.io.PrintWriter;

/**
 * 忘记密码通过手机号修改密码
 */
@WebServlet(name = "Upuser",urlPatterns = "/upuser")
public class Upuser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("Upname");
        String pwd=req.getParameter("Uppwd");
        String phone=req.getParameter("Updh");

        System.out.println("account"+name);
        System.out.println(pwd);
        System.out.println(phone);
        UserService us=new UserServiceImpl();

        User user=new User();
        user.setPwd(pwd);
        user.setAccount(name);
        user.setPhone(phone);
        int count=us.UpdateUser(user);
        System.out.println(count);
        PrintWriter out=resp.getWriter();
    if (count>0){
        System.out.println("修改成功！");
        resp.sendRedirect("http://localhost:8080/Project_war_exploded/loldemo/home.jsp");
    }else{
        System.out.println("修改失败！");
        out.print("<script type=\"text/javascript\"> location.href=\"http://localhost:8080/Project_war_exploded/loldemo/denlv.jsp\";alert('电话号码或账号错误')</script>");
    }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
