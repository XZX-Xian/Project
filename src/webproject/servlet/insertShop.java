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

@WebServlet(name = "insertShop",urlPatterns = "/inseshop")
public class insertShop extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String money = req.getParameter("money");
        int size = Integer.parseInt(req.getParameter("size"));
        String ove = req.getParameter("ove");
        //获得账号
        HttpSession session = req.getSession();
        String userid = (String) session.getAttribute("account");

        UserService use = new UserServiceImpl();
        Comm com = new Comm();
        com.setComID(id);
        com.setComName(name);
        com.setComMoney(money);
        com.setSize(size);
        com.setComOve(ove);
        com.setUserid(userid);

        int sumdemo = use.shopsele(com);
        if (sumdemo > 0) {
            System.out.println("数据库内包含并且，商品详情页选中的数是:" + com.getSize());
            System.out.println("数据库里面的值：" + sumdemo);
            int sum = (com.getSize()) + (sumdemo);
            req.getRequestDispatcher("/shopud?userid=" + userid + "&shopid=" + id + "&sum=" + sum + "").forward(req, resp);
        } else {
            System.out.println("数据库没有包含包含并且，商品详情页选中的数是::" + com.getSize());
            System.out.println("里面没有此商品");
            int count = use.shopinse(com);
            if (count > 0) {
                System.out.println("添加到购物车成功！");
                resp.sendRedirect("http://localhost:8080/Project_war_exploded/seleshop");
//                req.getRequestDispatcher("http://localhost:8080/Project_war_exploded/seleshop").forward(req, resp);
            } else {
                System.out.println("添加到购物车失败！");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
