package webproject.servlet;

import webproject.entity.Comm;
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
 * 手办查询
 */
@WebServlet(name = "CommSelete",urlPatterns = "/comselete")
public class CommSelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");

        Comm com = new Comm();
        UserService str = new UserServiceImpl();
        List<Comm> list = new ArrayList<Comm>();
        list = str.SeleteCom();

        HttpSession session=req.getSession();
        req.setAttribute("list", list);
        req.getRequestDispatcher("loldemo/home.jsp").forward(req,resp);
    }
}
