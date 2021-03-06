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
 * 新增商品
 */
@WebServlet(name = "CommAdd",urlPatterns = "/comadd")
public class CommAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    @SuppressWarnings("rawtypes")
    public static String filename = null;
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        factory.setSizeThreshold(1024 * 1024);
        List items = null;
        List<String> lists=new ArrayList<>();
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        Iterator iter = items.iterator();
        //判断数据
        int of=0;
        while(iter.hasNext()){
            FileItem item = (FileItem) iter.next();
            if(!item.isFormField()){
                // 设置字符
                request.setCharacterEncoding("UTF-8");
                response.setCharacterEncoding("UTF-8");
                String fieldName = item.getFieldName(); // 文件域中name属性的值
//                System.out.println("name"+fieldName);
                String filename = item.getName(); // 文件的全路径，绝对路径名加文件名
                System.out.println("名字"+filename);
//                value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
                // 根据时间戳创建头像文件
//                filename  = System.currentTimeMillis() + ".png";
//                System.out.println("图片信息"+filename);
//                System.out.println(request.getContextPath());
                /*File f = new File(getServletContext().getRealPath("upload"));*/
                of++;

                if (of>2){
                    filename="/commo/"+filename;
                }else {
                    filename = "/commodity/" + filename;
                }
                lists.add(filename);
                // 获得图片的存放路径
				String folderPath = "E:/idealU/Project/web/image";
//				// D:/uploadImgs
//				// C:/Users/86185/Desktop/S2项目/后台/superuser/WebRoot/images/w2
//				// 判断文件夹是否存在
				File foder = new File(folderPath);
				if (!foder.exists()) {
					foder.mkdirs();
				}
                filename = filename.substring(filename.lastIndexOf("\\") + 1);
                //输入和输出流
				InputStream is = item.getInputStream();
				FileOutputStream fos = new FileOutputStream(new File(folderPath + "/" + filename));
                System.out.println("数据"+filename);
                // 写入数据
				byte[] buffer = new byte[1024];
				int len = 0;
				while ((len = (is.read(buffer))) > -1) {
					fos.write(buffer, 0, len);
				}
				//关闭输入输出流
				fos.close();
				is.close();
				System.out.println("图片成功上传到" + folderPath + "/" + filename);
//                File f=null;
//                f= new File("E://idealU//Project//web//image");
//                if (!f.exists()) {
//                    f.mkdir();
//                }
//                String imgsrc = f+ filename;
//                System.out.println("图片"+imgsrc);
                // 复制文件
//                InputStream is = item.getInputStream();
//                FileOutputStream fos = new FileOutputStream(imgsrc);
//                byte b[] = new byte[1024 * 1024];
//                int length = 0;
//                while (-1 != (length = is.read(b))) {
//                    fos.write(b, 0, length);
//                }
//                fos.flush();
//                fos.close();
            }else {
//                System.out.println("name"+item.getFieldName());
                String value = item.getString();
                value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
//                System.out.println("值"+value);
                lists.add(value);
            }
        }

        Comm comm=new Comm();
        comm.setComMoney(lists.get(0));
        comm.setComColor(lists.get(1));
        comm.setSize(Integer.parseInt(lists.get(2)));
        comm.setComQuantity(Integer.parseInt(lists.get(3)));
        comm.setComName(lists.get(4));
        comm.setComOve(lists.get(5));
        comm.setComOut(lists.get(6));
        comm.setComCCTV(lists.get(7));
        comm.setComtype(Integer.parseInt(lists.get(8)));

        CommService str=new CommServiceImpl();
        int count=str.ComAdd(comm);
        if (count>0){
            System.out.println("新增成功");
        }else {
            System.out.println("新增失败");
        }
        //获取登陆页面所设定的访问路径
//        String preUrl = request.getHeader("Referer");
        //重定向到指定页面
//        response.sendRedirect("backstage/htm/comm-list.jsp");
        PrintWriter out=response.getWriter();
//        location.href="http://localhost:8080/Project_war_exploded/backstage/html/comm-add.jsp";
        out.print("<script type=\"text/javascript\">// 获得frame索引\n" +
                "                var index = parent.layer.getFrameIndex(window.name);\n" +
                "               //提示弹窗\n" +
                "                parent.layer.close(index);" +
                "window.close();</script>");
    }
}
