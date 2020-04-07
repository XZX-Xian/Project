package webproject.basedao;

import webproject.entity.Admin;

import java.util.List;

/**
 * 管理员
 */
public interface AdminDao {

    //管理员账号查询
    List<Admin> AdminChar(String account);

    //新增管理员
    int AdminAdd(Admin admin);

    //删除管理员
    int AdminDel(String account);

    //修改管理员
    int AdminUP(Admin admin);

    //查询全部管理员
    List<Admin> AdminList(String account);

    //模糊查询管理员
    List<Admin> AdminDimList(String account);

    //管理员登录
    int AdminLogin(String account,String pwd);

}
