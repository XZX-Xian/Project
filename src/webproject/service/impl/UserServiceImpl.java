package webproject.service.impl;

import webproject.basedao.UserDao;
import webproject.basedao.impl.UserDaoImpl;
import webproject.entity.Address;
import webproject.entity.Comm;
import webproject.entity.User;
import webproject.service.UserService;

import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserDao str=new UserDaoImpl();

    //查询收货地址
    @Override
    public List<Address> Seleorder(Address ads) {
        List<Address>list=new ArrayList<>();
        list=str.Seleorder(ads);
        return list;
    }

    //订单采购
    @Override
    public List<Comm> ddcg(String ids, String useid) {
        List<Comm> list=new ArrayList();
        list=str.ddcg(ids,useid);
        for (int i = 0; i <list.size() ; i++) {
            System.out.println(list.get(i).getComID());
            System.out.println(list.get(i).getComName());
        }
        return list;
    }

    //选中删除
    @Override
    public int deleteUsers(String ids, String useid) {
        int count=str.deleteUsers(ids,useid);
        System.out.println("业务逻辑ID"+useid);
        if (count>0){
            System.out.println("选中删除成功！");
        }else {
            System.out.println("选中删除失败！");
        }
        return count;
    }

    //购物车和数据库商品的数量
    @Override
    public int shopupda(Comm comm) {
        int count=str.shopupda(comm);
        if (count>0){
            System.out.println("数据库修改商品成功！");
        }else {
            System.out.println("数据库修改商品失败！");
        }
        return count;
    }

    //购物车商品相同
    @Override
    public int shopsele(Comm comm) {
        int count=str.shopsele(comm);
        if (count>0){
            System.out.println("数据库有此商品");
        }else {
            System.out.println("数据库没有此商品");
        }
        return count;
    }

    //购物车删除功能
    @Override
    public int deleshop(Comm comm) {
        int count=str.deleshop(comm);
        if (count>0){
            System.out.println("删除成功！");
        }else {
            System.out.println("删除成功！");
        }
        return count;
    }

    //添加到购物车
    @Override
    public int shopinse(Comm comm) {
        int count=str.shopinse(comm);
        if (count>0){
            System.out.println("添加购物车成功！");
        }else {
            System.out.println("添加购物车成功！");
        }
        return count;
    }

    //查询用户购物车
    @Override
    public List<Comm> shopdemo(String account) {
        List<Comm> list=new ArrayList<Comm>();
        list=str.shopdemo(account);
        for (int i = 0; i <list.size() ; i++) {
            System.out.println(list.get(i).getComOve());
            System.out.println(list.get(i).getComName());

        }
        return list;
    }

    //娱乐活动商品
    @Override
    public List<Comm> recreationdemo() {
        List<Comm> list=new ArrayList();
        list=str.recreationdemo();
        for (int i = 0; i <list.size() ; i++) {
            System.out.println(list.get(i).getComID());
            System.out.println(list.get(i).getComSize());
        }
        return list;
    }

    //查询全部商品
    @Override
    public List<Comm>Seletedemo(Comm comm) {
        List<Comm> list=new ArrayList<Comm>();
        list=str.Seletedemo(comm);
        for (int i = 0; i <list.size() ; i++) {
            System.out.println(list.get(i).getComName());
            System.out.println(list.get(i).getComID());
        }
        return list;
    }

    //删除用户
    @Override
    public int DelUser(String account) {
        int count=str.DelUser(account);
        return count;
    }

    //注册用户
    @Override
    public int AddUser(User user) {
        int count=str.AddUser(user);
        if (count>0){
            System.out.println("注册成功！");
        }else {
            System.out.println("注册失败！");
        }
        return count;
    }

    //两表联查
    @Override
    public List<Comm> Selectdemo() {
        List<Comm>list=new ArrayList<>();
        list=str.Selectdemo();
        for (int i = 0; i <list.size() ; i++) {
            System.out.println(list.get(i).getComName());
            System.out.println(list.get(i).getProduct());
        }
        return list;
    }

    //查询全部用户
    @Override
    public List<User> Seleuser() {
        List<User> list=new ArrayList<User>();
        list=str.Seleuser();
//        for (int i = 0; i <list.size() ; i++) {
//            System.out.println(list.get(i).getAccount());
//            System.out.println(list.get(i).getPwd());
//        }
        return list;
    }

    //查询用户信息
    @Override
    public List<User> Selete(String id) {
        List<User> list=new ArrayList<User>();
        list=str.Selete(id);
        return list;
    }

    //查询用户名
    @Override
    public String SeleteName(User user) {
       String name=str.SeleteName(user);
        return name;
    }

    //修改用户信息
    @Override
    public int UserUpdate(User user) {
        int count=str.UserUpdate(user);
        return count;
    }

    //收货地址查询
    @Override
    public List<Address> ShiSelete(String account) {
        List<Address> list=new ArrayList<Address>();
       list=str.ShiSelete(account);
        return list;
    }

    //收货地址删除
    @Override
    public int ShiDelete(int id) {
       int count=str.ShiDelete(id);
        return count;
    }

    //查询单个收货地址
    @Override
    public Address ShiQuery(int id) {
        Address address=new Address();
        address=str.ShiQuery(id);
        return address;
    }

    //新增收货地址
    @Override
    public int ShiAdd(Address address) {
        int count=str.ShiAdd(address);
        return count;
    }

    //修改收货地址
    @Override
    public int ShiUpdate(Address address) {
        int count=str.ShiUpdate(address);
        return count;
    }

    //查询商品
    @Override
    public List<Comm> SeleteCom() {
        List<Comm> list=new ArrayList<Comm>();
        list=str.SeleteCom();
//        for (int i = 0; i <list.size() ; i++) {
//            System.out.println(list.get(i).getComID());
//            System.out.println(list.get(i).getComOve());
//            System.out.println(list.get(i).getComOut());
//        }
        return list;
    }

    //类型查询商品
    @Override
    public List<Comm> SeleteCom(Comm com) {
        List<Comm> list=new ArrayList<Comm>();
        list=str.SeleteCom(com);
        return list;
    }

    //通过类型和大小查询商品
    @Override
    public List<Comm> SeleteClass(Comm comm) {
        List<Comm> list=new ArrayList<Comm>();
        list=str.SeleteClass(comm);
        for (int i = 0; i <list.size() ; i++) {
            System.out.println(list.get(i).getComName());
            System.out.println(list.get(i).getComSize());
            System.out.println(list.get(i).getComMoney());
            System.out.println(list.get(i).getComOve());
            System.out.println(list.get(i).getComOut());

        }
        return list;
    }

    //单击换一换切换
    @Override
    public List<Comm> Seletehyh(int type,int count, int curr) {
        List<Comm>list=new ArrayList<>();
        list=str.Seletehyh(type,count,curr);
//        for (int i = 0; i <list.size() ; i++) {
//            System.out.println(list.get(i).getComName());
//            System.out.println(list.get(i).getComSize());
//            System.out.println(list.get(i).getComMoney());
//            System.out.println(list.get(i).getComOve());
//
//        }
        return list;
    }

    //查询类型个数
    @Override
    public int sele(int type) {
        int count=str.sele(type);
        return count;
    }

    //用户登录
    @Override
    public boolean userdl(String account, String pwd) {
        boolean flag=str.userdl(account,pwd);
        if (flag){
            System.out.println("登录成功！");
        }
        else{
            System.out.println("登录失败！");
        }
        return flag;
    }

    //手机登录
    @Override
    public boolean userdhdl(int phone, String pwd) {
        boolean flag=str.userdhdl(phone,pwd);
        if (flag){
            System.out.println("登录成功！");
        }
        else{
            System.out.println("登录失败！");
        }
        return flag;
    }
}
