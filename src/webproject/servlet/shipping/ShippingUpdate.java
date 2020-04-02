package webproject.servlet.shipping;

import webproject.entity.Address;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 修改收货地址
 */

@WebServlet(name = "ShippingUpdate",urlPatterns = "/Shiupdate")
public class ShippingUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out=resp.getWriter();

        int id=Integer.parseInt(req.getParameter("id"));

        //得到账号
        HttpSession session=req.getSession();
        String account=(String)session.getAttribute("account");


        String name=req.getParameter("name");
        String province=req.getParameter("province");
        String city=req.getParameter("city");
        String county=req.getParameter("county");
        String addre=req.getParameter("address");
        String phone=req.getParameter("mobile");
        String code=req.getParameter("zip");
        String state=req.getParameter("isDefault");

        Address address=new Address();
        address.setId(id);
        address.setAccount(account);
        address.setName(name);
        address.setProvince(province);
        address.setCity(city);
        address.setCounty(county);
        address.setAddress(addre);
        address.setPhone(phone);
        address.setCode(code);
        address.setState(state);

        System.out.println("收货地址修改");

        UserService str=new UserServiceImpl();
        int count=str.ShiUpdate(address);
        if (count>0){
            out.print("<script type=\"text/javascript\">   alert(\"修改成功\"); location.href = \"http://localhost:8080/Project_war_exploded/shiselete\"</script>");
        }else {
            out.print("<script type=\"text/javascript\">   alert(\"修改失败\"); location.href = \"http://localhost:8080/Project_war_exploded/shiselete\"</script>");
        }



    }
}
