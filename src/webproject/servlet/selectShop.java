package webproject.servlet;

import webproject.entity.Comm;
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
 * 购物车查询
 */
@WebServlet(name = "selectShop",urlPatterns = "/seleshop")
public class selectShop extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String spid =(String)session.getAttribute("account");
        List<Comm> list = new ArrayList<>();
        UserService use = new UserServiceImpl();
        Comm com = new Comm();
//        com.setComID(spid);
//        if (spid > 0) {
            list = use.shopdemo(spid);
//            for (int i = 0; i < list.size(); i++) {
//                System.out.println("xx"+list.get(i).getComQuantity());
//                System.out.println(list.get(i).getComName());
//            }
//            System.out.println("个数"+list.size());
            if (list.size()>0){
//                System.out.println("查询成功！");
//                req.setAttribute("listname", list.get(0).getComName());
//                req.setAttribute("listcomId", list.get(0).getComID());
//                req.setAttribute("listsize", list.get(0).getComSize());
//                req.setAttribute("listove", list.get(0).getComOve());
//                req.setAttribute("listmoney", list.get(0).getComMoney());
                req.setAttribute("list", list);
                req.getRequestDispatcher("loldemo/shopping.jsp").forward(req, resp);
            }else{
                System.out.println("没有查询到值");
                req.getRequestDispatcher("loldemo/shopping.jsp").forward(req, resp);
            }
//        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
