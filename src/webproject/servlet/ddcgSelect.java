package webproject.servlet;


import webproject.entity.Comm;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 传到订单页面的商品
 */


public class ddcgSelect extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String shopid=req.getParameter("shopid");
        String userid=req.getParameter("useid");
        List<Comm> list = new ArrayList<>();
        UserService use = new UserServiceImpl();
            list = use.ddcg(shopid,userid);
            for (int i = 0; i < list.size(); i++) {
                System.out.println("servlet内值："+list.get(i).getComID());
                System.out.println("servlet内值："+list.get(i).getComName());
            }
            if (list.size()>0){
                System.out.println("查询成功！");
                req.setAttribute("list1", list);
                req.getRequestDispatcher("/loldemo/order.jsp").forward(req, resp);
            }else{
                System.out.println("没有查询到值阿订单页面");
                req.getRequestDispatcher("/loldemo/shopping.jsp").forward(req, resp);
            }
        }


}
