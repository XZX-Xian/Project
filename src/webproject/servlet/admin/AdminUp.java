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

@WebServlet(name = "AdminUp",urlPatterns = "/adminup")
public class AdminUp extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String account=request.getParameter("username");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        String pwd=request.getParameter("pass");
        Admin admin=new Admin();
        admin.setAccount(account);
        admin.setPhone(phone);
        admin.setEmail(email);
        admin.setPwd(pwd);
        AdminService str=new AdminServiceImpl();
        int count=str.AdminUP(admin);
        if (count>0){
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
        //重定向到指定页面
        PrintWriter out=response.getWriter();
//        location.href=\"http://localhost:8080/Project_war_exploded/backstage/html/admin-edit.jsp?account="+account+"\";
        out.print("<script type=\"text/javascript\">" +
                "// 获得frame索引\n" +
                "                var index = parent.layer.getFrameIndex(window.name);\n" +
                "     /* alert(index);*///提示弹窗\n" +
//                "window.opener.reload();" +
//                "                        layer.msg('修改成功', {icon: 1, time: 2000});//关闭当前frame\n" +
//                "window.parent.location.href=\"http://localhost:8080/Project_war_exploded/backstage/html/admin-edit.jsp?account="+account+"\";                " +
                "parent.layer.close(index);" +
                "window.close()</script>" +
                "");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
