package webproject.mian.src.webProject.servlet;

import webProject.entity.address;
import webProject.service.UserService;
import webProject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class orderSele extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String spid = req.getParameter("id");
     List<address>list=new ArrayList<>();
        UserService use = new UserServiceImpl();
       address ads=new address();
       ads.setAccount(spid);
            list = use.Seleorder(ads);
            if (list.size()>0){
                System.out.println("查询成功122222222222222222222222222！");
                req.setAttribute("listord", list);
                req.getRequestDispatcher("/loldemo/order.jsp").forward(req, resp);
            }else{
                System.out.println("没有查询到值");
                req.getRequestDispatcher("/loldemo/order.jsp").forward(req, resp);
            }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
