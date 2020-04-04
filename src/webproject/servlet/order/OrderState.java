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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * 订单状态查询
 */
@WebServlet(name = "OrderState",urlPatterns = "/orderstate")
public class OrderState extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        int state=Integer.parseInt(request.getParameter("state"));
        System.out.println(state);
        List<Order> list = new ArrayList<>();
        OrderService str=new OrderServiceImpl();

        list=str.OrderState(state);
        String json=null;

        json= JSON.toJSONString(list);
        out.print(json);
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
