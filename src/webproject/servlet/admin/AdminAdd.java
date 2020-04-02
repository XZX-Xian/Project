package webproject.servlet.admin;

import webproject.entity.Admin;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AdminAdd",urlPatterns = "/adminadd")
public class AdminAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

        String account=request.getParameter("username");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        String pwd=request.getParameter("pass");
//获取当前系统时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        Date date = new Date();
        String dateTime = df.format(date); // Formats a Date into a date/time string.
        System.out.println(dateTime);  // 2019-07-03 10:14:14

        Admin admin=new Admin();
        admin.setAccount(account);
        admin.setPhone(phone);
        admin.setEmail(email);
        admin.setPwd(pwd);
        admin.setDate(dateTime);

        UserService str=new UserServiceImpl();
        int count=str.AdminAdd(admin);
        if (count>0){
            System.out.println("新增成功");
        }else {
            System.out.println("新增失败");
        }
        //重定向到指定页面
        response.sendRedirect("backstage/htm/admin-list.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
