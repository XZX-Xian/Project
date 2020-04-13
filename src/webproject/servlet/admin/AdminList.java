package webproject.servlet.admin;

import com.alibaba.fastjson.JSON;
import webproject.entity.Admin;
import webproject.service.AdminService;
import webproject.service.impl.AdminServiceImpl;

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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        String name=request.getParameter("name");

        AdminService str=new AdminServiceImpl();
        List<Admin> list = new ArrayList<>();
        list = str.AdminDimList(name);
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
