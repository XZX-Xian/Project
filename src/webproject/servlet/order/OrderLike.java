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
 * 订单模糊查询
 */
@WebServlet(name = "OrderLike",urlPatterns = "/orderlike")
public class OrderLike extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String ordernumber=request.getParameter("ordernumber");

        List<Order> list = new ArrayList<>();
        OrderService str=new OrderServiceImpl();

        list=str.OrderLike(ordernumber);
        String json=null;

        json= JSON.toJSONString(list);
        out.print(json);
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
