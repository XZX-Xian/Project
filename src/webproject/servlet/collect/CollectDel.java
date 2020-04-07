package webproject.servlet.collect;

import com.alibaba.fastjson.JSON;
import webproject.service.CollectService;
import webproject.service.CommService;
import webproject.service.impl.CollectServiceImpl;
import webproject.service.impl.CommServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CollectDel",urlPatterns = "/collectdel")
public class CollectDel extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String ids=request.getParameter("ids");
        HttpSession session=request.getSession();
        String account=(String) session.getAttribute("account");
        System.out.println(ids);
        CollectService str=new CollectServiceImpl();
        int count=str.CollectDel(ids,account);
        if (count>0){
            System.out.println("删除成功");
        }else {
            System.out.println("删除失败");
        }
//        PrintWriter out=response.getWriter();
//        String json=null;
//        json= JSON.toJSONString(count);
//        out.print(json);
//        out.close();

//        //重定向
        response.sendRedirect("http://localhost:8080/Project_war_exploded/collsele");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
