package webproject.servlet;

import com.alibaba.fastjson.JSON;
import webproject.entity.Comm;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class selectHyh extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
         int leix=Integer.parseInt(req.getParameter("leix"));
        int cs=Integer.parseInt( req.getParameter("cs"));
        int qis=Integer.parseInt(req.getParameter("qis"));
        PrintWriter out=resp.getWriter();

        List<Comm> list=new ArrayList<>();
        UserService us=new UserServiceImpl();

        int count=us.sele(leix);
        System.out.println("个数"+cs);
        System.out.println("类型个数"+count);
        if (cs>=count){
            cs=0;
            list=us.Seletehyh(leix,cs,qis);

        }else {
            list=us.Seletehyh(leix,cs,qis);

        }


        String json=null;
        json= JSON.toJSONString(list);

        out.print(json);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
