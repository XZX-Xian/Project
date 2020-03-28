package webproject.mian.src.webProject.service;

import webProject.basedao.UserDao;
import webProject.basedao.impl.UserDaoImpl;
import webProject.entity.Comm;
import webProject.entity.Order;
import webProject.entity.User;
import webProject.entity.address;


import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserDao str=new UserDaoImpl();

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

    @Override
    public int orderInse(Order ord) {
        int count=str.orderInse(ord);
        if (count>0){
            System.out.println("新增订单商品成功！！impl");
        }else{
            System.out.println("新增订单商品失败！impl");
        }
        return count;
    }

    @Override
    public int addressUp(String ids, String userid) {
        int count=str.addressUp(ids,userid);
        System.out.println(userid);
        if (count>0){
            System.out.println("默认地址以外清空成功！impl");
        }else{
            System.out.println("默认地址以外清空失败！impl");
        }
        return count;
    }

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

    @Override
    public List<address> Seleorder(address ads) {
        List<address>list=new ArrayList<>();
        list=str.Seleorder(ads);
        for (int i = 0; i <list.size() ; i++) {
            System.out.println(list.get(i).getAccount());
            System.out.println(list.get(i).getName());
        }
        return list;
    }

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

    @Override
    public int deleshop(Comm comm) {
        int count=str.deleshop(comm);
        if (count>0){
            System.out.println("删除成功！");
        }else {
            System.out.println("删除失败！");
        }
        return count;
    }

    @Override
    public int shopinse(Comm comm) {
            int count=str.shopinse(comm);
            if (count>0){
                System.out.println("添加购物车成功！");
            }else {
                System.out.println("添加购物车失败！");
            }
            return count;
    }

    //查询用户购物车
    @Override
    public List<Comm> shopdemo(Comm comm) {
        List<Comm> list=new ArrayList<Comm>();
        list=str.shopdemo(comm);
        for (int i = 0; i <list.size() ; i++) {
            System.out.println(list.get(i).getComOve());
            System.out.println(list.get(i).getComName());

        }
        return list;
    }


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

    //忘记密码
    @Override
    public int Updateuser(User user) {
        int count=str.Updateuser(user);
        if (count>0){
            System.out.println("修改成功！");
        }else {
            System.out.println("修改失败！");
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

    //用户登录
    @Override
    public boolean userdhdl(int phone,String pwd) {
        boolean flag=str.userdhdl(phone,pwd);
        if (flag){
            System.out.println("登录成功！");
        }
        else{
            System.out.println("登录失败！");
        }
        return flag;
    }
    //用户登录
    @Override
    public boolean userdl(String account,String pwd) {
        boolean flag=str.userdl(account,pwd);
        if (flag){
            System.out.println("登录成功！");
        }
        else{
            System.out.println("登录失败！");
        }
        return flag;
    }

    //查询全部用户
    @Override
    public List<User> Seleuser() {
        List<User> list=new ArrayList<User>();
        list=str.Seleuser();
        for (int i = 0; i <list.size() ; i++) {
            System.out.println(list.get(i).getAccount());
            System.out.println(list.get(i).getPwd());
        }
        return list;
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

    //用户登录修改状态
    @Override
    public int UpdateUser(User user) {
        int count=str.UpdateUser(user);
        if (count>0){
            System.out.println("登录成功！");
        }else {
            System.out.println("登录失败！");
        }
        return 0;
    }

    //查询用户信息
    @Override
    public List<User> Selete(User user) {
        List<User> list=new ArrayList<User>();
        list=str.Selete(user);
        return list;
    }

    //查询用户名
    @Override
    public String SeleteName(User user) {
       String name=str.SeleteName(user);
        return name;
    }

    //查询商品
    @Override
    public List<Comm> SeleCom(Comm comm) {
        List<Comm> list=new ArrayList<Comm>();
        list=str.SeleCom(comm);
        for (int i = 0; i <list.size() ; i++) {
            System.out.println(list.get(i).getComID());
            System.out.println(list.get(i).getComOve());
            System.out.println(list.get(i).getComOut());
        }
        return list;
    }

    //类型查询商品
    @Override
    public List<Comm> SeleteCom(Comm com) {
        List<Comm> list=new ArrayList<Comm>();
        list=str.SeleteCom(com);
        return list;
    }

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
}
