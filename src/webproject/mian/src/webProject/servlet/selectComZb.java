package webproject.mian.src.webProject.servlet;

import com.alibaba.fastjson.JSON;
import webProject.entity.Comm;
import webProject.service.UserService;
import webProject.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class selectComZb extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
       int size=Integer.parseInt(req.getParameter("size"));
       int type=Integer.parseInt(req.getParameter("type"));
        PrintWriter out=resp.getWriter();
        Comm com=new Comm();
        com.setComSize(size);
        com.setComtype(type);

        List<Comm>list=new ArrayList<>();


        UserService us=new UserServiceImpl();


        if (size>0){
            list=us.SeleteClass(com);
        }else {
            list=us.SeleCom(com);
        }

        String json=null;

//        json=JSONArray.toJSONString(list);
            json=JSON.toJSONString(list);
        System.out.println(json);
        out.print(json);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
