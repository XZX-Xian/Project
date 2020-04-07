package webproject.service.impl;

import webproject.basedao.AdminDao;
import webproject.basedao.impl.AdminDaoImpl;
import webproject.entity.Admin;
import webproject.service.AdminService;

import java.util.ArrayList;
import java.util.List;

public class AdminServiceImpl implements AdminService {
    AdminDao str=new AdminDaoImpl();
    //管理员账号查询
    @Override
    public List<Admin> AdminChar(String account) {
        List<Admin> list=new ArrayList<>();
        list=str.AdminChar(account);
        return list;
    }

    //新增管理员
    @Override
    public int AdminAdd(Admin admin) {
        int count=str.AdminAdd(admin);
        return count;
    }

    //删除管理员
    @Override
    public int AdminDel(String account) {
        int count=str.AdminDel(account);
        return count;
    }

    //修改管理员
    @Override
    public int AdminUP(Admin admin) {
        int count=str.AdminUP(admin);
        return count;
    }

    //查询管理员
    @Override
    public List<Admin> AdminList(String account) {
        List<Admin> list=new ArrayList<>();
        list=str.AdminList(account);
        return list;
    }

    //模糊查询管理员
    @Override
    public List<Admin> AdminDimList(String account) {
        List<Admin> list=new ArrayList<>();
        list=str.AdminDimList(account);
        return list;
    }

    //管理员登录
    @Override
    public int AdminLogin(String account, String pwd) {
        int count=str.AdminLogin(account,pwd);
        return count;
    }
}
