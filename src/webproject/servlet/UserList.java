package webproject.servlet;

import com.alibaba.fastjson.JSON;
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
import java.util.ArrayList;
import java.util.List;

/**
 * 查询全部用户
 */
@WebServlet(name = "UserList",urlPatterns = "/userlist")
public class UserList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out=resp.getWriter();
        String name=req.getParameter("name");

        UserService str = new UserServiceImpl();
        List<User> list = new ArrayList<>();
        list = str.Seleuser(name);
        String json=null;
        json= JSON.toJSONString(list);

        out.print(json);
        out.close();
    }
}
