package webproject.servlet;

import webproject.basedao.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "asas",urlPatterns = "/asas")
@SuppressWarnings("all")
public class asas extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");

        String ids = req.getParameter("ids");
        System.out.println("要删除的编号是："+ids);  // 1,3,4
        String account="123";
        UserDaoImpl str=new UserDaoImpl();
        int count=str.deleteUsers(ids,account);
        System.out.println(count);
        if (count>0){
            System.out.println("成功");
        }else {
            System.out.println("失败");
        }



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
