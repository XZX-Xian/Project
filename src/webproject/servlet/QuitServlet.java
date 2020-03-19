//package webproject.servlet;
//
//import webproject.entity.User;
//import webproject.service.UserService;
//import webproject.service.impl.UserServiceImpl;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//@WebServlet(name = "QuitServlet",urlPatterns = "/webquit")
//public class QuitServlet extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html;charset=utf-8");
//        String account=req.getParameter("user");
//        String pwd=req.getParameter("qwd");
//        PrintWriter out=resp.getWriter();
//
//        User user=new User();
//        user.setAccount(account);
//        user.setPwd(pwd);
//        user.setState(0);
//
//        UserService str=new UserServiceImpl();
//        int count=str.UpdateUser(user);
//        if (count>0){
//            out.print("<script>location.href='loldemo/dome.jsp'</script>");
//        }else{
//            out.print("<script>location.href='loldemo/dome.jsp'</script>");
//        }
//
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        doGet(req, resp);
//    }
//}
