package webproject.mian.src.webProject.servlet;

import webProject.service.UserService;
import webProject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "orderaddressup",urlPatterns = "/oraddup")
public class orderaddressup extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String ids=req.getParameter("ids");
            int id=Integer.parseInt(req.getParameter("id"));
            String userid=req.getParameter("userid");
        UserService use=new UserServiceImpl();
        int count=use.orderaddressUp(id,userid);
        if (count>0){
            System.out.println("默认地址修改成功！servlet");
            req.getRequestDispatcher("/addup?id="+ids+"&userid="+userid+"").forward(req, resp);
        }else{
            System.out.println("默认地址修改失败！servlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
