package webproject.servlet.order;

import com.alibaba.fastjson.JSON;
import webproject.entity.Order;
import webproject.service.OrderService;
import webproject.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "OrderAddress",urlPatterns = "/orderaddress")
public class OrderAddress extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name=request.getParameter("name");
        String address=request.getParameter("address");
        String ordernumbers=request.getParameter("ordernumbers");
        int id=Integer.parseInt(request.getParameter("id"));
        //账号
        HttpSession session=request.getSession();
        String userid=(String)session.getAttribute("account");

        PrintWriter out=response.getWriter();

        Order order=new Order();
        order.setAddressID(id);
        order.setUsername(name);
        order.setAddress(address);
        order.setUserid(userid);

        OrderService str=new OrderServiceImpl();
        int count=str.OrderAddress(order,ordernumbers);
        if (count>0){
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
        String json= JSON.toJSONString(count);
        out.print(json);
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
