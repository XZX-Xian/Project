package webproject.servlet.order;


import webproject.entity.Comm;
import webproject.entity.Order;
import webproject.service.OrderService;
import webproject.service.UserService;
import webproject.service.impl.OrderServiceImpl;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 传到订单页面的商品
 */
@WebServlet(name = "ddcgSelect", urlPatterns = "/ddcgsel")
public class ddcgSelect extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String shopid = req.getParameter("shopid");
        //用户
        String userid = req.getParameter("useid");
//        HttpSession session=req.getSession();
//        String userid=(String)session.getAttribute("account");

        List<Comm> list = new ArrayList<>();
        UserService use = new UserServiceImpl();
        list = use.ddcg(shopid, userid);
        String ordernumber="";
        for (int i = 0; i < list.size(); i++) {
            Order ord = new Order();
            int random=(int)(Math.random()*1889999999);
            ordernumber=ordernumber+random;
            ord.setOrdernumber(random);
            ord.setShopID(list.get(i).getComID());
            ord.setName(list.get(i).getComName());
            ord.setMoney(list.get(i).getComMoney());
            ord.setSize(list.get(i).getComSize());
            ord.setOve(list.get(i).getComOve());
            //获取当前系统时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            Date date = new Date();
            String dateTime = df.format(date);

            ord.setUserid(userid);
            ord.setDate(dateTime);
            //新增订单
            UserService user = new UserServiceImpl();
            int count=user.orderInse(ord);
                ordernumber=ordernumber+",";
        }
        //删除最后一个字符
        ordernumber = ordernumber.substring(0, ordernumber.length() -1);

        if (list.size() > 0) {
            //订单查询
            OrderService str=new OrderServiceImpl();
            List<Order> list1 = new ArrayList<>();
            list1=str.OrderList(ordernumber,userid);
            req.setAttribute("list1", list1);
            System.out.println("新增到商品表成功！");
            //生成订单表成功——购物车信息删除
            int count = use.deleteUsers(shopid, userid);
            if (count > 0) {
                req.getRequestDispatcher("/seleord").forward(req, resp);
            }
        } else {
            System.out.println("没有查询到值阿订单页面");
            req.getRequestDispatcher("/seleshop").forward(req, resp);
        }
    }


}
