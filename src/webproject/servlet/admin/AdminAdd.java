package webproject.servlet.admin;

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
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 管理员新增
 */
@WebServlet(name = "AdminAdd",urlPatterns = "/adminadd")
public class AdminAdd extends HttpServlet {
    @Override
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

        Admin admin=new Admin();
        admin.setAccount(account);
        admin.setPhone(phone);
        admin.setEmail(email);
        admin.setPwd(pwd);
        admin.setDate(dateTime);

        AdminService str=new AdminServiceImpl();
        int count=str.AdminAdd(admin);
        if (count>0){
            System.out.println("新增成功");
        }else {
            System.out.println("新增失败");
        }
        PrintWriter out=response.getWriter();
//        location.href="http://localhost:8080/Project_war_exploded/backstage/html/admin-list.jsp"
        out.print("<script type=\"text/javascript\">// 获得frame索引\n" +
                "                var index = parent.layer.getFrameIndex(window.name);\n" +
                "               //提示弹窗\n" +
                "                parent.layer.close(index);" +
                "window.close();</script>");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
