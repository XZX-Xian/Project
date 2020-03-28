package webproject.mian.src.webProject.servlet;

import webProject.entity.Comm;
import webProject.service.UserService;
import webProject.service.UserServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PipedWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class collectinse extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String money = req.getParameter("money");
        int sizes = Integer.parseInt(req.getParameter("size"));
        String ove = req.getParameter("ove");
        String userid = req.getParameter("userid");
        PrintWriter out=resp.getWriter();

        UserService user=new UserServiceImpl();

        Comm com=new Comm();
        com.setComID(id);
        com.setComName(name);
        com.setComMoney(money);
        com.setComQuantity(sizes);
        com.setComOve(ove);
        com.setUserid(userid);
        HttpSession session = req.getSession();
        int sumdemo=user.collectsele(com);

        if (sumdemo!=1){
            int count=user.collectinse(com);
            if (count>0){
                System.out.println("收藏商品成功Servlet");
                session.setAttribute("scpd",true);
                String demo=req.getHeader("Referer");
                resp.sendRedirect(demo);
               }else{
                System.out.println("收藏商品失败Servlet");
            }
        }else{
            String demo=req.getHeader("Referer");
            session.setAttribute("scpd","yes");
            resp.sendRedirect(demo);
            }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
