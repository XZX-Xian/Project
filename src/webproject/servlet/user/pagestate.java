package webproject.servlet.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "pagestate",urlPatterns = "/pagestate")
public class pagestate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        //获取登陆页面所设定的访问路径
        String preUrl = req.getHeader("Referer");
        //页面当前状态
        Boolean pd=false;
        session.setAttribute("pd",pd);
        //重定向到指定页面
        resp.sendRedirect(preUrl);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
