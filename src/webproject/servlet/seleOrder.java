package webproject.servlet;


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
@WebServlet(name = "seleOrder",urlPatterns = "/seleord")
public class seleOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            String userid=req.getParameter("userid");

       HttpSession session=req.getSession();
       String userid=(String)session.getAttribute("account");

        List<Address> list=new ArrayList<>();
        Address ads=new Address();
        ads.setAccount(userid);
        System.out.println(ads.getAccount());
        UserService use=new UserServiceImpl();
            list=use.Seleorder(ads);
            for (int i = 0; i < list.size(); i++) {
                System.out.println(list.get(i).getId());
                System.out.println(list.get(i).getName());
            }
            if (list.size()>0){
                System.out.println("查询地址成功！");
          /*      req.setAttribute("listid", list.get(0).getId());
                req.setAttribute("listAccount",list.get(0).getAccount());
                req.setAttribute("listName", list.get(0).getName());
                req.setAttribute("listprovice", list.get(0).getProvince());
                req.setAttribute("listcity", list.get(0).getCity());
                req.setAttribute("listcounty", list.get(0).getCounty());
                req.setAttribute("listaddress", list.get(0).getAddress());
                req.setAttribute("listphone", list.get(0).getPhone());
                req.setAttribute("listcode", list.get(0).getCode());
                req.setAttribute("liststate", list.get(0).getState());*/

                req.setAttribute("listord",list);
                req.getRequestDispatcher("/loldemo/order.jsp").forward(req, resp);
                String demo=req.getHeader("Referer");
                resp.sendRedirect(demo);
            }else{
                System.out.println("没有查询到值");
                req.getRequestDispatcher("/loldemo/shopping.jsp").forward(req, resp);
            }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     doGet(req, resp);
    }
}
