package webproject.servlet.comm;

import webproject.entity.Comm;
import webproject.service.CommService;
import webproject.service.UserService;
import webproject.service.impl.CommServiceImpl;
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
 * 加入购物车
 */
@WebServlet(name = "insertShop",urlPatterns = "/inseshop")
public class insertShop extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String money = req.getParameter("money");
        int size = Integer.parseInt(req.getParameter("size"));
        int inventory = Integer.parseInt(req.getParameter("inventory"));
        String ove = req.getParameter("ove");
        //获得账号
        HttpSession session = req.getSession();
        String userid = (String) session.getAttribute("account");
        int volume=Integer.parseInt(req.getParameter("volume"));


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
            int sum = (com.getSize()) + (sumdemo);
            //库存数
            int inve=inventory-size;
            //交易量
            int volumes=volume+size;
            CommService str=new CommServiceImpl();
            int con=str.ComUP(inve,volumes,id);
            if (con>0){
                req.getRequestDispatcher("/shopud?userid=" + userid + "&shopid=" + id + "&sum=" + sum + "").forward(req, resp);
            }else {
                System.out.println("库存修改失败");
            }

        } else {
            System.out.println("数据库没有包含包含并且，商品详情页选中的数是::" + com.getSize());
            int count = use.shopinse(com);
            if (count > 0) {
                System.out.println("添加到购物车成功！");
                //库存数
                int inve=inventory-size;
                //交易量
                int volumes=volume+size;
                CommService str=new CommServiceImpl();
                int con=str.ComUP(inve,volumes,id);
                if (con>0){
                    resp.sendRedirect("http://localhost:8080/Project_war_exploded/seleshop");
                }else {
                    System.out.println("库存修改失败");
                }

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
