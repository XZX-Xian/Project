package webproject.servlet;

import webproject.entity.User;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
/**
 * 个人信息 用户查询
 */

@WebServlet(name = "UserQuery",urlPatterns = "/userquery")
public class UserQuery extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");

        HttpSession session=req.getSession();
        String id=(String)session.getAttribute("account");

        UserService user=new UserServiceImpl();
        List<User> list=new ArrayList<User>();
            list=user.Selete(id);
        //转发
        req.setAttribute("list",list);
        req.getRequestDispatcher("loldemo/user.jsp").forward(req,resp);
    }
}
