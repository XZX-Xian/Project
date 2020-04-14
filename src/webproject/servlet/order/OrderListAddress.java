package webproject.servlet.order;

import webproject.entity.Order;
import webproject.service.OrderService;
import webproject.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 选择默认地址重新查询数据
 */
@WebServlet(name = "OrderListAddress",urlPatterns = "/orderlistaddress")
public class OrderListAddress extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String orders = request.getParameter("orders");
        String userid = request.getParameter("useid");

        //订单查询
        OrderService str=new OrderServiceImpl();
        List<Order> list1 = new ArrayList<>();
        list1=str.OrderList(orders,userid);
        request.setAttribute("list1", list1);
        request.getRequestDispatcher("/seleord").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
