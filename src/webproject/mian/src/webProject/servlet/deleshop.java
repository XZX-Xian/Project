package webproject.mian.src.webProject.servlet;

import webProject.entity.Comm;
import webProject.service.UserService;
import webProject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


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
        super.doGet(req, resp);
    }
}
