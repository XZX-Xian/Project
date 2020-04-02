package webproject.servlet.shipping;

import webproject.entity.Address;
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
 * 查询收货地址
 */
@WebServlet(name = "ShippingSelete",urlPatterns = "/shiselete")
public class ShippingSelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        //得到账号
        HttpSession session=req.getSession();
        String account=(String)session.getAttribute("account");

        UserService str=new UserServiceImpl();
        List<Address> list=new ArrayList<Address>();
        list=str.ShiSelete(account);
        //转发
        req.setAttribute("list",list);
        req.getRequestDispatcher("loldemo/shipping.jsp").forward(req,resp);
    }
}
