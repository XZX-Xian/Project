package webproject.mian.src.webProject.servlet;

import webProject.entity.Comm;
import webProject.entity.Order;
import webProject.service.UserService;
import webProject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ddcgSelect extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String shopid=req.getParameter("shopid");
        String userid=req.getParameter("useid");
        List<Comm> list = new ArrayList<>();
        UserService use = new UserServiceImpl();
        list = use.ddcg(shopid,userid);

        for (int i = 0; i < list.size(); i++) {
            System.out.println("servlet内值："+list.get(i).getComID());
            System.out.println("servlet内值："+list.get(i).getComName());
            Order ord=new Order();
            ord.setShopID(list.get(i).getComID());
            ord.setName(list.get(i).getComName());
            ord.setMoney(list.get(i).getComMoney());
            ord.setSize(list.get(i).getComSize());
            ord.setOve(list.get(i).getComOve());
            ord.setUserid(userid);
            UserService user=new UserServiceImpl();
            user.orderInse(ord);
    }   if (list.size()>0){
            System.out.println("查询成功！xxxxxx");
            req.setAttribute("list1", list);
            System.out.println("新增到商品表成功！");
            req.getRequestDispatcher("/seleord?id="+userid+"").forward(req, resp);
          }else{
            System.out.println("没有查询到值阿订单页面");
            req.getRequestDispatcher("/loldemo/shopping.jsp").forward(req, resp);
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);

    }
}
