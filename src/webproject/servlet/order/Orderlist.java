package webproject.servlet.order;

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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Orderlist",urlPatterns = "/orderlist")
public class Orderlist extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //获得账号
        HttpSession session=request.getSession();
        String account=(String)session.getAttribute("account");
        OrderService str=new OrderServiceImpl();
        List<Order> list = new ArrayList<>();
        list=str.OrderList(account);
        request.setAttribute("list",list);
        request.getRequestDispatcher("loldemo/orderlist.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
