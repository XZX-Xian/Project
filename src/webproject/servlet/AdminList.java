package webproject.servlet;

import com.alibaba.fastjson.JSON;
import webproject.entity.Admin;
import webproject.entity.User;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

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
 * 模糊查询管理员
 */
@WebServlet(name = "AdminList",urlPatterns = "/adminlist")
public class AdminList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        String name=request.getParameter("name");

        UserService str = new UserServiceImpl();
        List<Admin> list = new ArrayList<>();
        list = str.AdminDimList(name);
        String json=null;
        json= JSON.toJSONString(list);

        System.out.println(json);

        out.print(json);
        out.close();


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}