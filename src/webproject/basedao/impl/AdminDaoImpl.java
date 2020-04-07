package webproject.basedao.impl;

import webproject.basedao.AdminDao;
import webproject.basedao.BaseDao;
import webproject.entity.Admin;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDaoImpl extends BaseDao implements AdminDao {

    //管理员账号查询
    @Override
    public List<Admin> AdminChar(String account) {
        String sql="SELECT * FROM admin_data WHERE account=?";
        Object[] params={account};
        List<Admin> list=new ArrayList<>();
        ResultSet rs=null;
        try {
            rs=super.exceuteQuery(sql,params);
            while (rs.next()){
                Admin admin=new Admin();
                admin.setAccount(rs.getString(1));
                admin.setPwd(rs.getString(2));
                admin.setPhone(rs.getString(3));
                admin.setEmail(rs.getString(4));
                admin.setRole(rs.getString(5));
                admin.setDate(rs.getString(6));
                list.add(admin);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //修改管理员
    @Override
    public int AdminUP(Admin admin) {
        String sql="UPDATE admin_data SET pwd=?,phone=?,email=? WHERE  account=?";
        Object[] params={admin.getPwd(),admin.getPhone(),admin.getEmail(),admin.getAccount()};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //查询全部管理员
    @Override
    public List<Admin> AdminList(String account) {
        String sql="SELECT * FROM admin_data WHERE account <> '"+account+"'";
        List<Admin> list=new ArrayList<>();
        ResultSet rs=null;
        try {
            rs=super.exceuteQuery(sql,null);
            while (rs.next()){
                Admin admin=new Admin();
                admin.setAccount(rs.getString(1));
                admin.setPwd(rs.getString(2));
                admin.setPhone(rs.getString(3));
                admin.setEmail(rs.getString(4));
                admin.setRole(rs.getString(5));
                admin.setDate(rs.getString(6));
                list.add(admin);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //模糊查询全部管理员
    @Override
    public List<Admin> AdminDimList(String account) {
        String sql="SELECT * FROM admin_data WHERE account LIKE '%"+account+"%'";
        List<Admin> list=new ArrayList<>();
        ResultSet rs=null;
        try {
            rs=super.exceuteQuery(sql,null);
            while (rs.next()){
                Admin admin=new Admin();
                admin.setAccount(rs.getString(1));
                admin.setPwd(rs.getString(2));
                admin.setPhone(rs.getString(3));
                admin.setEmail(rs.getString(4));
                admin.setRole(rs.getString(5));
                admin.setDate(rs.getString(6));
                list.add(admin);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //管理员登录
    @Override
    public int AdminLogin(String account, String pwd) {
        String sql="SELECT COUNT(1) FROM admin_data WHERE account=? AND pwd=?";
        Object[] params={account,pwd};
        int count=0;
        ResultSet rs=null;
        try {
            rs=super.exceuteQuery(sql,params);
            rs.next();
            count=rs.getInt(1);
        }catch (Exception e){
            e.printStackTrace();
        }
        return count;
    }

    //新增管理员
    @Override
    public int AdminAdd(Admin admin) {
        String sql="INSERT INTO admin_data(account,pwd,phone,email,time)VALUES(?,?,?,?,?)";
        Object[] params={admin.getAccount(),admin.getPwd(),admin.getPhone(),admin.getEmail(),admin.getDate()};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //删除管理员
    @Override
    public int AdminDel(String account) {
        String sql="DELETE FROM admin_data WHERE account in ("+account+",?)";
        Object[] params={account};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }
}
