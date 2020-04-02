package webproject.servlet;

import com.alibaba.fastjson.JSON;
import webproject.entity.Comm;
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
 * 商品类型查询
 */

@WebServlet(name = "selectCom",urlPatterns = "/selcom")
public class selectCom extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
       int size=Integer.parseInt(req.getParameter("size"));
       int type=Integer.parseInt(req.getParameter("type"));
       String name=req.getParameter("name");
        PrintWriter out=resp.getWriter();
        Comm com=new Comm();
        com.setComSize(size);
        com.setComtype(type);
        com.setComName(name);
        List<Comm>list=new ArrayList<>();
        UserService us=new UserServiceImpl();
        //类型判断
        if (size>0){
            list=us.SeleteClass(com);
        }else if (name!=""&&name!=null){    //模糊查询
            list=us.likeorder(com);
        }else{
            list=us.SeleteCom(com);         //默认查询手办
        }
        String json=null;
            json= JSON.toJSONString(list);
        out.print(json);
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
