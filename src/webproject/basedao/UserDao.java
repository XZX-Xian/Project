package webproject.basedao;

import webproject.entity.Address;
import webproject.entity.Comm;
import webproject.entity.User;

import java.util.List;

public interface UserDao {

    //查询收货地址
    List<Address> Seleorder(Address ads);

    //订单采购
    List<Comm> ddcg(String ids,String useid);

    //查询商品个数
    int CommID(int id,String account);

    //修改商品个数
    int CommUP(int size,int id,String account);

    //放购物车选中删除
    int deleteUsers(String ids,String useid);

    //购物车和数据库商品的数量
    int shopupda(Comm comm);

    //购物车商品相同
    int shopsele(Comm comm);

    //购物车删除功能
    int deleshop(Comm comm);

    //添加到购物车
    int shopinse(Comm comm);

    //购物车查询
    List<Comm> shopdemo(String account);

    //娱乐活动商品
    List<Comm> recreationdemo();

    //两表联查  条件判断查询的商品资料
    List<Comm>Seletedemo(Comm comm);

    //删除用户
    int DelUser(String account);

    //注册用户
    int AddUser(User user);

    //两表联查
    List<Comm>Selectdemo();

    //查询全部用户
    List<User> Seleuser();

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
    boolean userdl(String account,String pwd);
    //手机登录
    boolean userdhdl(int phone,String pwd);

}
