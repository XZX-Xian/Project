package webproject.servlet;

import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 购物车选择批量删除商品
 */
@WebServlet(name = "dlshopuse",urlPatterns = "/dlusesp")
public class dlshopuse extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String shopid=req.getParameter("shopid");
        //得到账号
        HttpSession session=req.getSession();
        String account=(String)session.getAttribute("account");

        UserService use=new UserServiceImpl();
        int count=use.deleteUsers(shopid,account);
        System.out.println(shopid);
        if (count>0){
            System.out.println("购物车页面选中删除商品成功!");
            req.getRequestDispatcher("/seleshop").forward(req, resp);

        }else{
            System.out.println("购物车页面选中删除商品失败!");
        }
    }

}
