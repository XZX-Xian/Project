package webproject.servlet.order;

import webproject.service.OrderService;
import webproject.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 修改订单状态
 */
@WebServlet(name = "OrderUP",urlPatterns = "/orderup")
public class OrderUP extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String ordernumber=request.getParameter("ordernumber");
        String name=request.getParameter("name");
        String money=request.getParameter("money");
        String ids=request.getParameter("ids");

        PrintWriter out=response.getWriter();
        OrderService str=new OrderServiceImpl();



        out.print("");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
