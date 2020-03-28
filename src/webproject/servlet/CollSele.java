package webproject.servlet;

import webproject.entity.Collect;
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
 * 查询收藏商品
 */
@WebServlet(name = "CollSele",urlPatterns = "/collsele")
public class CollSele extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        String account=(String)session.getAttribute("account");
        UserService str=new UserServiceImpl();
        List<Collect> list=new ArrayList<>();
        list=str.CollSele(account);
        request.setAttribute("list",list);
        request.getRequestDispatcher("http://localhost:8080/Project_war_exploded/loldemo/collect.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
