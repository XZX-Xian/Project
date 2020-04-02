package webproject.servlet.shipping;

import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 删除收货地址
 */
@WebServlet(name = "ShippingDelate",urlPatterns = "/shidelete")
public class ShippingDelate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out=resp.getWriter();

        int id=Integer.parseInt(req.getParameter("id"));

        //得到账号
        HttpSession session=req.getSession();
        String account=(String)session.getAttribute("account");

        UserService str=new UserServiceImpl();
        int count=str.ShiDelete(id);
        if (count>0){
            resp.sendRedirect("http://localhost:8080/Project_war_exploded/shiselete");
        }
    }
}
