package webproject.servlet.order;

import webproject.entity.Address;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *订单
 */
@WebServlet(name = "orderSele",urlPatterns = "/ddcgsele")
public class orderSele extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String spid = req.getParameter("id");
     List<Address>list=new ArrayList<>();
        UserService use = new UserServiceImpl();
       Address ads=new Address();
       ads.setAccount(spid);
            list = use.Seleorder(ads);
            if (list.size()>0){
                req.setAttribute("listord", list);
                req.getRequestDispatcher("/loldemo/order.jsp").forward(req, resp);
            }else{
                System.out.println("没有查询到值");
                req.getRequestDispatcher("/loldemo/order.jsp").forward(req, resp);
            }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
