package webproject.servlet;

import webproject.entity.User;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Upuser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("Upname");
        String pwd=req.getParameter("Uppwd");
        String phone=req.getParameter("Updh");

        UserService us=new UserServiceImpl();

        User user=new User();
        user.setPwd(pwd);
        user.setAccount(name);
        user.setPhone(phone);
        int count=us.UpdateUser(user);
    if (count>0){
        System.out.println("修改成功！");
        req.getRequestDispatcher("/loldemo/home.jsp").forward(req, resp);
    }else{
        System.out.println("登录失败！");
        resp.sendRedirect("http://localhost:6060/League_of_Legends_war_exploded/loldemo/index.jsp");
    }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
