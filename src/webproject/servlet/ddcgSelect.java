package webproject.servlet;


import webproject.entity.Comm;
import webproject.entity.Order;
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
 * 传到订单页面的商品
 */
@WebServlet(name = "ddcgSelect",urlPatterns = "/ddcgsel")
public class ddcgSelect extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String shopid=req.getParameter("shopid");
        String userid=req.getParameter("useid");
//        HttpSession session=req.getSession();
//        String userid=(String)session.getAttribute("account");

//        System.out.println(shopid);
//        System.out.println(userid);
        List<Comm> list = new ArrayList<>();
        UserService use = new UserServiceImpl();
        list = use.ddcg(shopid,userid);

        for (int i = 0; i < list.size(); i++) {
//            System.out.println("servlet内值："+list.get(i).getComID());
//            System.out.println("servlet内值："+list.get(i).getComName());
            Order ord=new Order();
            ord.setShopID(list.get(i).getComID());
            ord.setName(list.get(i).getComName());
            ord.setMoney(list.get(i).getComMoney());
            ord.setSize(list.get(i).getComSize());
            ord.setOve(list.get(i).getComOve());
            ord.setUserid(userid);
            UserService user=new UserServiceImpl();
            user.orderInse(ord);
    }
        if (list.size()>0){
            req.setAttribute("list1", list);
            System.out.println("新增到商品表成功！");
//            resp.sendRedirect("/seleord");
            req.getRequestDispatcher("/seleord").forward(req, resp);
          }else{
            System.out.println("没有查询到值阿订单页面");
//            resp.sendRedirect("/seleshop");
            req.getRequestDispatcher("/seleshop").forward(req, resp);
        }
    }


}
