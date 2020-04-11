package webproject.servlet;

import webproject.entity.Comm;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "selectHome",urlPatterns = "/selehome")
public class selectHome extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            int name=Integer.parseInt(req.getParameter("name"));
        UserService us=new UserServiceImpl();
        Comm com=new Comm();
        List<Comm>list=new ArrayList<>();
        com.setComID(name);
        list=us.Seletedemo(com);

    /*    测试是否能查询到*/
//          for (int i = 0; i <list.size() ; i++) {
//            System.out.println(list.get(i).getComSize());
//            System.out.println(list.get(i).getComID());
//            System.out.println(list.get(i).getModell());
//            System.out.println(list.get(i).getBrand());
//            System.out.println(list.get(i).getProduct());
//            System.out.println(list.get(i).getState());
//        }
        if (name>0){
            System.out.println("查询成功！");
            req.setAttribute("listname",list.get(0).getComName());
            req.setAttribute("listcomId",list.get(0).getComID());
            req.setAttribute("listsize",list.get(0).getComSize());
            req.setAttribute("listquantity",list.get(0).getComQuantity());
            req.setAttribute("listout",list.get(0).getComOut());
            req.setAttribute("listove",list.get(0).getComOve());
            req.setAttribute("listtype",list.get(0).getComtype());
            req.setAttribute("listmoney",list.get(0).getComMoney());
            req.setAttribute("listproduct",list.get(0).getProduct());
            req.setAttribute("listid",list.get(0).getId());
            req.setAttribute("listbrand",list.get(0).getBrand());
            req.setAttribute("listappcount",list.get(0).getComAppCount());
            req.setAttribute("listcctv",list.get(0).getComCCTV());
            req.setAttribute("listcolor",list.get(0).getComColor());
            req.setAttribute("listcount",list.get(0).getComCount());
            req.setAttribute("listquantity",list.get(0).getComQuantity());
            req.setAttribute("listmodell",list.get(0).getModell());
            req.setAttribute("liststate",list.get(0).getState());
            req.getRequestDispatcher("loldemo/particulars.jsp").forward(req, resp);
        }else{
            System.out.println("查询失败！");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
