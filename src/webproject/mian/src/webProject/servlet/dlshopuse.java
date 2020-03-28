package webproject.mian.src.webProject.servlet;

import webProject.service.UserService;
import webProject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class dlshopuse extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String shopid=req.getParameter("shopid");
        String userid=req.getParameter("useid");

        UserService use=new UserServiceImpl();
        int count=use.deleteUsers(shopid,userid);
        System.out.println(shopid);
        if (count>0){
            System.out.println("购物车页面选中删除商品成功!");
            req.getRequestDispatcher("/seleshop?id="+userid+"").forward(req, resp);

        }else{
            System.out.println("购物车页面选中删除商品失败!");
        }
    }

}
