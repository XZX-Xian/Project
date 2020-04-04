package webproject.servlet.order;


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
 * 订单表收货地址
 */
@WebServlet(name = "seleOrder", urlPatterns = "/seleord")
public class seleOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userid = (String) session.getAttribute("account");

        List<Address> list = new ArrayList<>();
        Address ads = new Address();
        ads.setAccount(userid);
        UserService use = new UserServiceImpl();
        list = use.Seleorder(ads);
        req.setAttribute("listord", list);
        if (list.size() > 0) {
            System.out.println("查询地址成功！");
            req.getRequestDispatcher("/loldemo/order.jsp").forward(req, resp);
        } else {
            System.out.println("没有查询到值");
            req.getRequestDispatcher("/loldemo/order.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
