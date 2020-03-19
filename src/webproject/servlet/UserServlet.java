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
//
//@WebServlet(name = "UserServlet",urlPatterns = "/webuser")
//public class UserServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html;charset=utf-8");
//        PrintWriter out=resp.getWriter();
//        String account=req.getParameter("name");
//        String pwd=req.getParameter("pwd");
//
//        User user=new User();
//        user.setAccount(account);
//        user.setPwd(pwd);
//        user.setState(1);
//
//        UserService str=new UserServiceImpl();
//        int count=str.UpdateUser(user);
//        if (count>0){
//            UserService str1=new UserServiceImpl();
//            String userName=str1.SeleteName(user);
//            out.print(" <script type=\"text/javascript\">alert(\"成功！\");location.href=\"loldemo/dome.jsp?username="+userName+"&useraccount="+user.getAccount()+"\"</script>");
//        }else {
//            out.print("<script>alert('密码或账号错误!') ;location.href='loldemo/dome.jsp'</script>");
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        doGet(req, resp);
//    }
//}
