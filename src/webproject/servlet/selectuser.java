package webproject.servlet;

import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.Style;
import java.io.IOException;
import java.io.PipedWriter;
import java.io.PrintWriter;

/**
 * 用户登录
 */
@WebServlet(name = "selectuser",urlPatterns = "/seluer")
@SuppressWarnings("all")
public class selectuser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");

        String account=req.getParameter("username");
        String pwd=req.getParameter("userpwd");

        HttpSession session = req.getSession();
        //获取登陆页面所设定的访问路径
        String preUrl = req.getHeader("Referer");

        UserService usr=new UserServiceImpl();
        boolean flag;
        flag=usr.userdl(account,pwd);
        if (flag){
            System.out.println("登录成功！"+preUrl);
            session.setAttribute("account",account);
        }else{
            //设置页面状态
            session.setAttribute("pd",!flag);
            System.out.println("登录失败！");
        }
        //重定向到指定页面
        resp.sendRedirect(preUrl);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req, resp);

    }
}
