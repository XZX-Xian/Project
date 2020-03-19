package webproject.servlet;


import webproject.entity.Comm;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 购物车商品加减修改
 */
public class shopupda extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userid=req.getParameter("userid");
        int shopid=Integer.parseInt(req.getParameter("shopid"));
        int sum=Integer.parseInt(req.getParameter("sum"));
        UserService use=new UserServiceImpl();
        Comm comm=new Comm();
        comm.setSize(sum);
        comm.setComID(shopid);
        comm.setUserid(userid);

       int count=use.shopupda(comm);
        if (count>0){
            System.out.println("购物车修改数量成功！");
            req.getRequestDispatcher("/seleshop?id="+userid+"").forward(req, resp);
        }else{
            System.out.println("购物车修改失败了！");
            req.getRequestDispatcher("/loldemo/shopping.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doGet(req, resp);
    }
}
