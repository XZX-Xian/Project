package webproject.service.impl;

import webproject.basedao.UserDao;
import webproject.basedao.impl.UserDaoImpl;
import webproject.entity.*;
import webproject.service.UserService;

import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserDao str=new UserDaoImpl();



    //判断商品是否被用户收藏
    @Override
    public int collectsele(Comm comm) {
        int count=str.collectsele(comm);
        if (count>0){
            System.out.println("收藏过此商品");
        }else {
            System.out.println("没收藏过");
        }
        return count;
    }

    //收藏商品
    @Override
    public int collectinse(Comm comm) {
        int count=str.collectinse(comm);
        if (count>0){
            System.out.println("收藏商品成功！！impl");
        }else{
            System.out.println("收藏商品失败！impl");
        }
        return count;
    }

    //查询收藏商品
    @Override
    public List<Collect> CollSele(String account) {
        List<Collect> list=new ArrayList<>();
        list=str.CollSele(account);
        for (int i=0;i<list.size();i++){
            System.out.println(list.get(i).getAccount());
            System.out.println(list.get(i).getName());
        }
        return list;
    }

    //商品模糊查询
    @Override
    public List<Comm> likeorder(Comm comm) {
        List<Comm>list=new ArrayList<>();
        list=str.likeorder(comm);
        for (int i = 0; i <list.size() ; i++) {
            System.out.println("模糊查询："+list.get(i).getComID());
            System.out.println("模糊查询："+list.get(i).getComName());
        }
        return list;
    }
    //新增订单
    @Override
    public int orderInse(Order ord) {
        int count=str.orderInse(ord);
        if (count>0){
            System.out.println("新增订单商品成功！");
        }else{
            System.out.println("新增订单商品失败！");
        }
        return count;
    }
    //地址的状态清空
    @Override
    public int addressUp(String ids, String userid) {
        int count=str.addressUp(ids,userid);
        System.out.println(userid);
        if (count>0){
            System.out.println("默认地址以外清空成功！");
        }else{
            System.out.println("默认地址以外清空失败！");
        }
        return count;
    }
    //选中的id为默地址
    @Override
    public int orderaddressUp(int id, String userid) {
        int count=str.orderaddressUp(id,userid);
        System.out.println(userid);
        if (count>0){
            System.out.println("默认地址设置成功！impl");
        }else{
            System.out.println("默认地址设置失败！impl");
        }
        return count;
    }

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
//        for (int i = 0; i <list.size() ; i++) {
//            System.out.println(list.get(i).getComID());
//            System.out.println(list.get(i).getComName());
//        }
        return list;
    }

    //选中删除
    @Override
    public int deleteUsers(String ids, String useid) {
        int count=str.deleteUsers(ids,useid);
//        if (count>0){
//            System.out.println("选中删除成功！");
//        }else {
//            System.out.println("选中删除失败！");
//        }
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
//        for (int i = 0; i <list.size() ; i++) {
//            System.out.println(list.get(i).getComOve());
//            System.out.println(list.get(i).getComName());
//        }
        return list;
    }

    //娱乐活动商品
    @Override
    public List<Comm> recreationdemo() {
        List<Comm> list=new ArrayList();
        list=str.recreationdemo();
//        for (int i = 0; i <list.size() ; i++) {
//            System.out.println(list.get(i).getComID());
//            System.out.println(list.get(i).getComSize());
//        }
        return list;
    }

    //查询全部商品
    @Override
    public List<Comm>Seletedemo(Comm comm) {
        List<Comm> list=new ArrayList<Comm>();
        list=str.Seletedemo(comm);
//        for (int i = 0; i <list.size() ; i++) {
//            System.out.println(list.get(i).getComName());
//            System.out.println(list.get(i).getComID());
//        }
        return list;
    }

    //手机号修改密码
    @Override
    public int Updateuser(User user) {
        int count=str.Updateuser(user);
        System.out.println(count);
        return count;
    }

    //删除用户
    @Override
    public int DelUser(String account) {
        int count=str.DelUser(account);
        return count;
    }

    //选中删除用户
    @Override
    public int DelUserAll(String IdAll) {
        int count=str.DelUserAll(IdAll);
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

    @Override
    public List<User> Seleuser() {
        return null;
    }

    @Override
    public int UpdateUser(User user) {
        return 0;
    }

    //查询全部用户
    @Override
    public List<User> Seleuser(String name) {
        List<User> list=new ArrayList<User>();
        list=str.Seleuser(name);
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
