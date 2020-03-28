package webproject.mian.src.webProject.service;

import webProject.entity.Comm;
import webProject.entity.Order;
import webProject.entity.User;
import webProject.entity.address;

import java.util.List;

public interface UserService {
    //判断商品是否被用户收藏
   int collectsele(Comm comm);
    //收藏商品
    int  collectinse(Comm comm);
    //商品模糊查询
    List<Comm> likeorder(Comm comm);
    //新增订单
    int orderInse(Order ord);
    //地址的状态清空
    int addressUp(String ids, String userid);
    //选中的id为默地址
    int orderaddressUp(int id, String userid);
    //地址
    List<address> Seleorder(address ads);
    //订单采购
    List<Comm> ddcg(String ids, String useid);
    //选中删除
    int deleteUsers(String ids, String useid);
    //购物车和数据库商品的数量
    int shopupda(Comm comm);
    //购物车商品相同
    int  shopsele(Comm comm);
    //购物车删除功能
    int deleshop(Comm comm);
    //添加到购物车
    int shopinse(Comm comm);
    //查询用户购物车
    List<Comm> shopdemo(Comm comm);
    //娱乐活动商品
    List<Comm> recreationdemo();
    //查询全部商品
    List<Comm>Seletedemo(Comm comm);
    //忘记密码
    int Updateuser(User user);
    //注册用户
    int AddUser(User user);
    //两表联查
    List<Comm>Selectdemo();
    //用户登录
    boolean userdl(String account, String pwd);
    //电话登录
    boolean userdhdl(int phone, String pwd);

    //查询全部用户
    List<User> Seleuser();

    //用户登录修改状态
    int UpdateUser(User user);

    //查询用户信息
    List<User> Selete(User user);

    //查询用户名
    String SeleteName(User user);

    //查询前6条商品
    List<Comm> SeleCom(Comm comm);

    //类型查收商品
    List<Comm> SeleteCom(Comm com);

    //通过类型和大小查询商品
    List<Comm> SeleteClass(Comm comm);

    //单击换一换切换
    List<Comm> Seletehyh(int type, int count, int curr);

    //查询类型个数
    int sele(int type);
}
