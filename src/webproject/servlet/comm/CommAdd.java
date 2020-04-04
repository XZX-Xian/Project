package webproject.servlet.comm;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 新增商品
 */
@WebServlet(name = "CommAdd",urlPatterns = "/comadd")
public class CommAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

        PrintWriter out = response.getWriter();
        String AddMoney=request.getParameter("AddMoney");
        String AddColour=request.getParameter("AddColour");
        String AddSize=request.getParameter("AddSize");
        int AddQuantity=Integer.parseInt(request.getParameter("AddQuantity"));
        String AddName=request.getParameter("AddName");
        int AddJilu=Integer.parseInt(request.getParameter("AddJilu"));
        int AddPingjia=Integer.parseInt(request.getParameter("AddPingjia"));
        String Mouseove=request.getParameter("Mouseove");

        String Mouseoveout=request.getParameter("Mouseoveout");
        int Addleixing=Integer.parseInt(request.getParameter("Addleixing"));

        int count=0;
        if (count>0){
            out.print("<script type='text/javascript'>alert('新增成功');location.href='http://localhost:8080/Project_war_exploded/backstage/html/admin-add.jsp';</script>");
        }else{
            response.sendRedirect("http://localhost:8080/Project_war_exploded/backstage/html/admin-add.jsp");
        }
    }
}
