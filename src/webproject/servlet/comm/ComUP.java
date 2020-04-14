package webproject.servlet.comm;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import webproject.entity.Comm;
import webproject.service.CommService;
import webproject.service.impl.CommServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/**
 * 商品修改
 */
@WebServlet(name = "ComUP",urlPatterns = "/comup")
public class ComUP extends HttpServlet {
    @SuppressWarnings("rawtypes")
    public static String filename = null;
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
//        DiskFileItemFactory factory = new DiskFileItemFactory();
//        ServletFileUpload upload = new ServletFileUpload(factory);
//
//        factory.setSizeThreshold(1024 * 1024);
//        List items = null;
//        List<String> lists=new ArrayList<>();
//        HashMap<String,Object> map=new HashMap<>();
//        try {
//            items = upload.parseRequest(request);
//        } catch (FileUploadException e) {
//            e.printStackTrace();
//        }
//        Iterator iter = items.iterator();
//        //判断数据
//        int of=0;
//        while(iter.hasNext()){
//            FileItem item = (FileItem) iter.next();
//            System.out.println("name"+item.getFieldName());
//            if(!item.isFormField()){
////                System.out.println("name"+item.getFieldName());
////                String value = item.getString();
////                value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
//                // 根据时间戳创建头像文件
//                filename  = System.currentTimeMillis() + ".png";
//                System.out.println("图片信息:"+filename);
////                System.out.println(request.getContextPath());
//                /*File f = new File(getServletContext().getRealPath("upload"));*/
//                of++;
//                File f=null;
////                System.out.println("个数"+of);
//
//                if (of>2){
//                    filename="/commo/"+filename;
//                }else {
//                    filename = "/commodity/" + filename;
//                }
//                lists.add(filename);
////                map.put(item.getFieldName(),filename);
////                System.out.println(filename);
//                f= new File("E://idealU//Project//web//image");
//                if (!f.exists()) {
//                    f.mkdir();
//                }
//                String imgsrc = f+ filename;
////                System.out.println("图片"+imgsrc);
//                // 复制文件
//                InputStream is = item.getInputStream();
//                System.out.println(is.toString());
//                FileOutputStream fos = new FileOutputStream(imgsrc);
//                byte b[] = new byte[1024 * 1024];
//                int length = 0;
//                while (-1 != (length = is.read(b))) {
//                    fos.write(b, 0, length);
//                }
//                fos.flush();
//                fos.close();
//            }else {
////                System.out.println("name"+item.getFieldName());
//                String value = item.getString();
//                value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
//                System.out.println("值"+value);
//                lists.add(value);
////                map.put(item.getFieldName(),value);
//            }
//        }
        Comm comm=new Comm();
//        comm.setComID(Integer.parseInt(lists.get(0)));
//        comm.setComMoney(lists.get(1));
//        comm.setComColor(lists.get(2));
//        comm.setSize(Integer.parseInt(lists.get(3)));
//        comm.setComQuantity(Integer.parseInt(lists.get(4)));
//        comm.setComName(lists.get(5));
//        comm.setComOve(lists.get(6));
//        comm.setComOut(lists.get(7));
//        comm.setComCCTV(lists.get(8));
//        comm.setComtype(Integer.parseInt(lists.get(6)));
//        comm.setLimit(Integer.parseInt(lists.get(7)));

//        int comid=Integer.parseInt(request.getParameter("comid"));
        String comid=request.getParameter("comid");
        String AddMoney=request.getParameter("AddMoney");
        String Color=request.getParameter("Color");
        String Size=request.getParameter("Size");
        String AddQuantity=request.getParameter("AddQuantity");
        String AddName=request.getParameter("AddName");
        String type=request.getParameter("type");
        String limit=request.getParameter("limit");


        comm.setComID(Integer.parseInt(comid));
        comm.setComMoney(AddMoney);
        comm.setComColor(Color);
        comm.setSize(Integer.parseInt(Size));
        comm.setComQuantity(Integer.parseInt(AddQuantity));
        comm.setComName(AddName);
//        comm.setComOve(lists.get(6));
//        comm.setComOut(lists.get(7));
//        comm.setComCCTV(lists.get(8));
        comm.setComtype(Integer.parseInt(type));
        comm.setLimit(Integer.parseInt(limit));

        CommService str=new CommServiceImpl();
        int count=str.ComListUP(comm);
        if (count>0){
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
        //获取登陆页面所设定的访问路径
//        String preUrl = request.getHeader("Referer");
        //重定向到指定页面
//        response.sendRedirect("backstage/htm/comm-list.jsp");
        PrintWriter out=response.getWriter();
//        location.href=\"http://localhost:8080/Project_war_exploded/backstage/html/comm-edit.jsp?comid="+comm.getComID()+"\";
        out.print("<script type=\"text/javascript\">// 获得frame索引\n" +
                "                var index = parent.layer.getFrameIndex(window.name);\n" +
                "           //提示弹窗\n" +
                "parent.layer.close(index);" +
                "window.close()</script>" +
                "</script>");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
