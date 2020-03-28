package webproject.mian.src.webProject.servlet;

import webProject.entity.User;
import webProject.service.UserService;
import webProject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
           req.setAttribute("name",Name);
           req.getRequestDispatcher("/loldemo/denlv.jsp").forward(req, resp);
       }else {
           System.out.println("注册失败！");
           resp.sendRedirect("http://localhost:6060/League_of_Legends_war_exploded/loldemo/index.jsp");
       }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
