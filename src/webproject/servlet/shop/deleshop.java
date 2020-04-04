package webproject.servlet.shop;

import webproject.entity.Comm;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 */
@WebServlet(name = "deleshop",urlPatterns = "/dlshop")
public class deleshop extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int shopid=Integer.parseInt(req.getParameter("shopid"));
        String userid=req.getParameter("userid");
        Comm comm=new Comm();
        comm.setComID(shopid);
        UserService use=new UserServiceImpl();
        int count=use.deleshop(comm);
        if (count>0){
            System.out.println("购物车页面删除商品成功!");
            req.getRequestDispatcher("/seleshop?id="+userid+"").forward(req, resp);

        }else{
            System.out.println("购物车页面删除商品失败!");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
