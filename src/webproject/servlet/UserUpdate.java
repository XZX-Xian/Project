package webproject.servlet;

import webproject.entity.User;
import webproject.service.UserService;
import webproject.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UserUpdate", urlPatterns = "/userupdate")
/**
 * 个人信息 用户修改
 */
public class UserUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter out=resp.getWriter();

        String account = req.getParameter("account");
        int region = Integer.parseInt(req.getParameter("region"));
        String birthday = req.getParameter("birthday");
        String sex = req.getParameter("sex");
        String userInfo = req.getParameter("userInfo");
        String email = req.getParameter("email");

        User user = new User();
        user.setAccount(account);
        user.setState(region);
        user.setBirthday(birthday);
        user.setSex(sex);
        user.setPhone(userInfo);
        user.setEmail(email);

        UserService str = new UserServiceImpl();
        int count = str.UserUpdate(user);
        if (count > 0) {
            out.print("<script type=\"text/javascript\"> location.href = \"http://localhost:8080/Project_war_exploded/userquery?id="+user.getAccount()+"\";</script>");
        }


    }
}
