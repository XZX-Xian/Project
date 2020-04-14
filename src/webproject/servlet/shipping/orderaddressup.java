package webproject.servlet.shipping;

import com.alibaba.fastjson.JSON;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "orderaddressup",urlPatterns = "/oraddup")
public class orderaddressup extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int id=Integer.parseInt(req.getParameter("id"));
            String userid=req.getParameter("userid");
        String orders = req.getParameter("orders");

        System.out.println(id);
        System.out.println(userid);
        System.out.println(orders);
        UserService use=new UserServiceImpl();
        int count=use.orderaddressUp(id,userid);
        if (count>0){
            UserService str=new UserServiceImpl();
            String ids=id+"";
            int counts=str.addressUp(ids,userid);
            if (counts>0){
                System.out.println("默认地址修改成功！servlet");
                req.getRequestDispatcher("/orderlistaddress?orders="+orders+"&useid="+userid).forward(req, resp);
//                resp.sendRedirect("/orderlistaddress?orders="+orders+"&useid="+userid);
            }
        }else{
            System.out.println("默认地址修改失败！servlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
