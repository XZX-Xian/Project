package webproject.basedao;

import java.sql.*;

public class BaseDao {
//    加载属性文件中的数据库配置参数
    private  String driver = "com.mysql.jdbc.Driver";
    private  String url = "jdbc:mysql://localhost:3306/web?useUnicode=true&characterEncoding=utf-8";
    private  String user = "root";
    private  String  password="";

     Connection con;
     PreparedStatement pstmt = null;
     ResultSet rs = null;
    // 建立连接数据
    public Connection getConnection() {
        if (con == null) {
            try {
                Class.forName(driver);
                con = DriverManager.getConnection(url, user, password);
//                Context ctx=new InitialContext();
//                DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/news");
//                con=ds.getConnection();

//            } catch (ClassNotFoundException e) {
//                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return con;
    }
    //关闭数据
    public void closeAll() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 曾、删、改
     * @param sql
     * @param params
     * @return
     */
    protected int executeUpdate(String sql,Object[] params){
        int result=0;
        con=this.getConnection();
        pstmt=null;
        try {
            pstmt =con.prepareStatement(sql);
            for (int i=0;i<params.length;i++){
                pstmt.setObject(i+1,params[i]);
            }
            result = pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            closeAll();
        }
        return result;
    }
    /**
     * 查询操作
     *
     * @param sql
     * @param param
     * @return
     */
    protected ResultSet exceuteQuery(String sql, Object[] param) {
        con = this.getConnection();
        try {
            pstmt = con.prepareStatement(sql);
            if (param != null) {
                for (int i = 0; i < param.length; i++) {
                    pstmt.setObject(i + 1, param[i]);
                }
            }
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
}
