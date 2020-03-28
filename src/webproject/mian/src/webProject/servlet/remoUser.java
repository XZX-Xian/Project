package webproject.mian.src.webProject.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "remoUser",urlPatterns = "/remouser")
public class remoUser extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out=resp.getWriter();
/*注销*/
        HttpSession session=req.getSession();
        session.removeAttribute("account");
        session.setAttribute("pds",false);
        out.print("");
        String demo=req.getHeader("Referer");
        resp.sendRedirect(demo);
        out.close();

    }

}
