package webproject.servlet.shipping;

import com.alibaba.fastjson.JSON;
import webproject.entity.Address;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * ajax查询单个收货地址
 */
@WebServlet(name = "ShippingQuery",urlPatterns = "/shiquery")
public class ShippingQuery extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out=resp.getWriter();
        int id=Integer.parseInt(req.getParameter("id"));
        UserService str=new UserServiceImpl();
        Address address=new Address();
        address=str.ShiQuery(id);

        String json= JSON.toJSONString(address);

//        System.out.println("收货地址修改后的数据"+json);
        out.print(json);
        out.close();
    }
}
