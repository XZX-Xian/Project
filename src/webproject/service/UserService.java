package webproject.service;

import webproject.entity.*;

import java.util.List;

public interface UserService {
    //判断商品是否被用户收藏
    int collectsele(Comm comm);

    //收藏商品
    int collectinse(Comm comm);

    //查询收藏商品
    List<Collect> CollSele(String account);
    //商品模糊查询
    List<Comm> likeorder(Comm comm);

    //新增订单
    int orderInse(Order ord);

    //地址的状态清空
    int addressUp(String ids, String userid);

    //选中的id为默地址
    int orderaddressUp(int id, String userid);

    //地址
    List<Address> Seleorder(Address ads);

    //订单采购
    List<Comm> ddcg(String ids, String useid);

    //选中删除
    int deleteUsers(String ids, String useid);

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
    int AdminLogin(String account, String pwd);

    //购物车和数据库商品的数量
    int shopupda(Comm comm);

    //购物车商品相同
    int shopsele(Comm comm);

    //购物车删除功能
    int deleshop(Comm comm);

    //添加到购物车
    int shopinse(Comm comm);

    //查询用户购物车
    List<Comm> shopdemo(String account);

    //娱乐活动商品
    List<Comm> recreationdemo();

    //查询全部商品
    List<Comm> Seletedemo(Comm comm);

    //忘记密码
    int Updateuser(User user);
    //删除用户
    int DelUser(String account);

    //选中删除用户
    int DelUserAll(String IdAll);
    //查询全部用户
    List<User> Seleuser(String name);

    //注册用户
    int AddUser(User user);

    //两表联查
    List<Comm> Selectdemo();

    //查询全部用户
    List<User> Seleuser();

    //用户登录修改状态
    int UpdateUser(User user);

    //查询用户信息
    List<User> Selete(String id);

    //查询用户名
    String SeleteName(User user);

    //修改用户信息
    int UserUpdate(User user);

    //收货地址查询
    List<Address> ShiSelete(String account);

    //收货地址删除
    int ShiDelete(int id);

    //查询单个收货地址
    Address ShiQuery(int id);

    //新增收货地址
    int ShiAdd(Address address);

    //修改收货地址
    int ShiUpdate(Address address);

    //查询前6条商品
    List<Comm> SeleteCom();

    //类型查收商品
    List<Comm> SeleteCom(Comm com);

    //通过类型和大小查询商品
    List<Comm> SeleteClass(Comm comm);

    //单击换一换切换
    List<Comm> Seletehyh(int type, int count, int curr);

    //查询类型个数
    int sele(int type);

    //用户登录
    boolean userdl(String account, String pwd);

    //手机登录
    boolean userdhdl(int phone, String pwd);
}
