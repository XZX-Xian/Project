package webproject.servlet;

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
 * 选中删除用户
 */
@WebServlet(name = "UserDelAll",urlPatterns = "/userdelall")
public class UserDelAll extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String IdAll=request.getParameter("account");
        System.out.println("值"+IdAll);
        UserService str=new UserServiceImpl();
        int count=str.DelUserAll(IdAll);
        //获取登陆页面所设定的访问路径
        String preUrl = request.getHeader("Referer");
        //重定向到指定页面
        response.sendRedirect(preUrl);

//        PrintWriter out=response.getWriter();
//        out.print(count);
//        out.flush();
//        out.close();
    }
}
