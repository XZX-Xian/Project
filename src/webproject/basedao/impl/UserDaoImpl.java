package webproject.basedao.impl;

import webproject.basedao.BaseDao;
import webproject.basedao.UserDao;
import webproject.entity.*;

import javax.jws.soap.SOAPBinding;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//压制警告
@SuppressWarnings("all")
public class UserDaoImpl extends BaseDao implements UserDao {

    //判断商品是否被用户收藏
    @Override
    public int collectsele(Comm comm) {
        String sql="SELECT count(1) FROM usercollect WHERE shopId=? and Userid=?";
        Object[]obj={comm.getComID(),comm.getUserid()};
        ResultSet rs=null;
        int count=0;
        try{
            rs=super.exceuteQuery(sql,obj);
            while (rs.next()){
                count=rs.getInt(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return count;

    }

    //收藏商品
    @Override
    public int collectinse(Comm comm) {
        String sql="INSERT INTO usercollect(shopID,Name,Money,Size,Ove,userid)VALUES(?,?,?,?,?,?)";
        Object[]obj={comm.getComID(),comm.getComName(),comm.getComMoney(),comm.getComQuantity(),comm.getComOve(),comm.getUserid()};
        int count=super.executeUpdate(sql,obj);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //查询收藏商品
    @Override
    public List<Collect> CollSele(String account) {
        String sql="SELECT * FROM usercollect WHERE Userid=?";
        Object[] params={account};
        ResultSet rs=null;
        List<Collect> list=new ArrayList<>();
        try {
            rs=super.exceuteQuery(sql,params);
            while (rs.next()){
                Collect coll=new Collect();
                coll.setShopid(rs.getInt(1));
                coll.setName(rs.getString(2));
                coll.setMoney(rs.getString(3));
                coll.setSize(rs.getInt(4));
                coll.setOce(rs.getString(5));
                coll.setAccount(rs.getString(6));
                list.add(coll);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //模糊查询商品
    @Override
    public List<Comm> likeorder(Comm comm) {
        String sql="SELECT * FROM addcommodity WHERE  AddName LIKE  '%"+comm.getComName()+"%' AND AddQuantity<> 0";
        List<Comm>list=new ArrayList<>();
        ResultSet rs=null;
        try{
            rs=super.exceuteQuery(sql,null);
            while (rs.next()){
                Comm com = new Comm();
                com.setComID(rs.getInt(1));
                com.setComMoney(rs.getString(2));
                com.setComColor(rs.getString(3));
                com.setComSize(rs.getInt(4));
                com.setComQuantity(rs.getInt(5));
                com.setComName(rs.getString(6));
                com.setComCount(rs.getInt(7));
                com.setComAppCount(rs.getInt(8));
                com.setComOve(rs.getString(9));
                com.setComOut(rs.getString(10));
                com.setComCCTV(rs.getString(11));
                com.setComtype(rs.getInt(12));
                list.add(com);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
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

    //新增订单
    @Override
    public int orderInse(Order ord) {
        String states="0";
        String sql="INSERT INTO userorder(ordernumber,shopID,Name,Money,Size,Ove,userid,state,Date)VALUES(?,?,?,?,?,?,?,"+states+",?)";
        Object[] obj={ord.getOrdernumber(),ord.getShopID(),ord.getName(),ord.getMoney(),ord.getSize(),ord.getOve(),ord.getUserid(),ord.getDate()};
        int count=super.executeUpdate(sql,obj);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //地址的状态清空
    @Override
    public int addressUp(String ids, String userid) {
        String sql="UPDATE user_address set state=\"\" where id in("+ids+") AND user_account=?";
        Object[] obj={userid};
        int count=super.executeUpdate(sql,obj);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //选中的id为默地址
    @Override
    public int orderaddressUp(int id, String userid) {
        String sql="UPDATE user_address set state=\"默认地址\" where id=? AND user_account=?";
        Object[] obj={id,userid};
        int count=super.executeUpdate(sql,obj);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //通过ID 查询用户购物车
    @Override
    public List<Comm> shopdemo(String account) {
        String sql="SELECT  B.addid,C.AddQuantity,B.AddName,B.AddMoney,B.Addsize,B.mouseove \n" +
                "FROM user_data as A\n" +
                "INNER JOIN shopping as B ON A.user_account=B.userid\n" +
                "INNER JOIN addcommodity as C ON B.Addid=C.AddId\n" +
                "WHERE A.user_account=?;";
        List<Comm> list=new ArrayList<>();
        Object[] obj={account};
        ResultSet rs=null;
        try{
            rs=super.exceuteQuery(sql,obj);
            while (rs.next()){
                Comm com=new Comm();
                com.setComID(rs.getInt(1));
                com.setComQuantity(rs.getInt(2));
                com.setComName(rs.getString(3));
                com.setComMoney(rs.getString(4));
                com.setComSize(rs.getInt(5));
                com.setComOve(rs.getString(6));
                list.add(com);
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

    //查询收货地址
    @Override
    public List<Address> Seleorder(Address address) {
        String sql="SELECT * FROM user_address where user_account=?";
        Object[] obj={address.getAccount()};
        List<Address> list=new ArrayList<>();
        ResultSet rs=null;
        try{
            rs=super.exceuteQuery(sql,obj);
            while (rs.next()){
                Address adds=new Address();
                adds.setId(rs.getInt(1));
                adds.setAccount(rs.getString(2));
                adds.setName(rs.getString(3));
                adds.setProvince(rs.getString(4));
                adds.setCity(rs.getString(5));
                adds.setCounty(rs.getString(6));
                adds.setAddress(rs.getString(7));
                adds.setPhone(rs.getString(8));
                adds.setCode(rs.getString(9));
                adds.setState(rs.getString(10));
                list.add(adds);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //订单采购
    @Override
    public List<Comm> ddcg(String ids, String useid) {
        String sql="SELECT * FROM shopping where Addid in("+ids+") and userid=?";
        Object[] obj={useid};
        List<Comm> list=new ArrayList<>();
        ResultSet rs=null;
        try{
            rs=super.exceuteQuery(sql,obj);
            while (rs.next()){
                Comm com=new Comm();
                com.setComID(rs.getInt(1));
                com.setComName(rs.getString(2));
                com.setComMoney(rs.getString(3));
                com.setComSize(rs.getInt(4));
                com.setComOve(rs.getString(5));
                list.add(com);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //购物车多个删除
    public int deleteUsers(String ids,String account) {
        String sql="delete from shopping where Addid in("+ids+") AND userid=?";
        Object [] params={account};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //购物车和数据库商品的数量
    @Override
    public int shopupda(Comm comm) {
        String sql="UPDATE shopping set Addsize=? where Addid=? AND userid=?";
        Object[]obj={comm.getSize(),comm.getComID(),comm.getUserid()};
        int count=super.executeUpdate(sql,obj);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //购物车商品相同
    @Override
    public int shopsele(Comm comm) {
        String sql="SELECT Addsize FROM shopping where userid=? and Addid=?";
        Object[]obj={comm.getUserid(),comm.getComID()};
        ResultSet rs=null;
        int count=0;
        try{
            rs=super.exceuteQuery(sql,obj);
            while (rs.next()){
                count=rs.getInt(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return count;
    }

    //查询商品数量
    @Override
    public int CommID(int id,String account) {
        String sql="SELECT Addsize FROM shopping WHERE Addid=? AND userid=?";
        Object[] params={id,account};
        ResultSet rs=null;
        int count=0;
        try {
            rs=super.exceuteQuery(sql,params);
            while (rs.next()){
                count=rs.getInt(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return count;
    }

    //修改商品个数
    @Override
    public int CommUP(int size,int id, String account) {
        String sql="UPDATE FROM shopping SET Addsize=? WHERE Addid=? AND userid=?";
        Object[] params={size,id,account};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        if (count>0){
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
        return 0;
    }

    //购物车删除事件
    @Override
    public int deleshop(Comm comm) {
        String sql="DELETE FROM shopping where Addid=?";
        Object[]obj={comm.getComID()};
        int count=super.executeUpdate(sql,obj);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //添加到购物车
    @Override
    public int shopinse(Comm comm) {
        String sql="INSERT INTO shopping(Addid,AddName,AddMoney,Addsize,mouseove,userid)VALUES(?,?,?,?,?,?)";
        List<Comm> list=new ArrayList<>();
        Object[] obj={comm.getComID(),comm.getComName(),comm.getComMoney(),comm.getSize(),comm.getComOve(),comm.getUserid()};
        int count=super.executeUpdate(sql,obj);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //通过ID 查询用户购物车
//    @Override
//    public List<Comm> shopdemo(String account) {
//        String sql="SELECT B.addid,B.AddName,B.AddMoney,B.Addsize,b.mouseove FROM user_data as A INNER JOIN shopping as B ON A.user_account=B.userid WHERE A.user_account=?;";
//        List<Comm> list=new ArrayList<>();
//        Object[] obj={account};
//        ResultSet rs=null;
//        try{
//            rs=super.exceuteQuery(sql,obj);
//            while (rs.next()){
//                Comm com=new Comm();
//                com.setComID(rs.getInt(1));
//                com.setComName(rs.getString(2));
//                com.setComMoney(rs.getString(3));
//                com.setComSize(rs.getInt(4));
//                com.setComOve(rs.getString(5));
//                list.add(com);
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return list;
//    }

    //娱乐活动商品
    @Override
    public  List<Comm> recreationdemo() {
        int random=(int)(Math.random()*38);
        String sql="SELECT *FROM addcommodity where AddId="+random+"";
        List<Comm>list=new ArrayList<>();
        ResultSet rs=null;
        try{
            rs=super.exceuteQuery(sql,null);
            while (rs.next()){
                Comm com=new Comm();
                com.setComID(rs.getInt(1));
                com.setComMoney(rs.getString(2));
                com.setComColor(rs.getString(3));
                com.setComSize(rs.getInt(4));
                com.setComQuantity(rs.getInt(5));
                com.setComName(rs.getString(6));
                com.setComCount(rs.getInt(7));
                com.setComAppCount(rs.getInt(8));
                com.setComOve(rs.getString(9));
                com.setComOut(rs.getString(10));
                com.setComCCTV(rs.getString(11));
                com.setComtype(rs.getInt(12));
                list.add(com);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //两表联查  条件判断查询的商品资料
    @Override
    public List<Comm> Seletedemo(Comm comm) {
        String sql="SELECT * FROM addcommodity as A INNER JOIN addgoods as B ON A.Addid=B.AddId WHERE A.AddID=?";
        Object[]obj={comm.getComID()};
        ResultSet rs=null;
        List<Comm>list=new ArrayList<>();
        try{
            rs=super.exceuteQuery(sql,obj);
            while (rs.next()){
                Comm com=new Comm();
                com.setComID(rs.getInt(1));
                com.setComMoney(rs.getString(2));
                com.setComColor(rs.getString(3));
                com.setComSize(rs.getInt(4));
                com.setComQuantity(rs.getInt(5));
                com.setComName(rs.getString(6));
                com.setComCount(rs.getInt(7));
                com.setComAppCount(rs.getInt(8));
                com.setComOve(rs.getString(9));
                com.setComOut(rs.getString(10));
                com.setComCCTV(rs.getString(11));
                com.setComtype(rs.getInt(12));
                com.setId(rs.getInt(13));
                com.setBrand(rs.getString(14));
                com.setProduct(rs.getString(15));
                com.setModell(rs.getString(16));
                com.setState(rs.getString(17));
                list.add(com);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //忘记密码
    @Override
    public int Updateuser(User user) {
        String sql="update user SET pwd=? where account=? and phone= ?";
        Object []obj={user.getPwd(),user.getAccount(),user.getPhone()};
        int count=super.executeUpdate(sql,obj);
        return count;
    }

    //删除用户
    @Override
    public int DelUser(String account) {
        String sql="DELETE FROM user_data WHERE user_account=?";
        String sql1="DELETE FROM user_address WHERE user_account=?";
        String sql2="DELETE FROM shopping WHERE userid=?";
        Object[] params={account};
        int count1=super.executeUpdate(sql1,params);
        int count2=super.executeUpdate(sql2,params);
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //选中删除用户
    @Override
    public int DelUserAll(String IDAll) {
        String sql="DELETE FROM user_data WHERE user_account in("+IDAll+",?)";
        String sql1="DELETE FROM user_address WHERE user_account in("+IDAll+",?)";
        String sql2="DELETE FROM shopping WHERE userid in("+IDAll+",?)";
        Object[] params={IDAll};
        int count1=super.executeUpdate(sql1,params);
        int count2=super.executeUpdate(sql2,params);
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //用户注册
    @Override
    public int AddUser(User user) {
        String sql = "INSERT user_data(user_account,user_pwd,user_phone) VALUES (?,?,?)";
        Object[] params = {user.getAccount(), user.getPwd(), user.getPhone()};
        int count = super.executeUpdate(sql, params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //登录用户
    @Override
    public boolean userdl(String account,String pwd) {
        boolean flag=false;
        String sql="SELECT * FROM user_data WHERE user_account=? and user_pwd=?";
        Object[] params={account,pwd};
        ResultSet rs=null;
        try{
            rs=super.exceuteQuery(sql,params);
            if (rs.next()) {
                flag=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    //电话登录
    @Override
    public boolean userdhdl(int phone,String pwd) {
        boolean flag=false;
        String sql="SELECT * FROM user_data WHERE user_phone=? and user_pwd=?";
        Object[] params={phone,pwd};
        ResultSet rs=null;
        try{
            rs=super.exceuteQuery(sql,null);
            if (rs.next()) {
                flag=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    //两表联查
    @Override
    public List<Comm> Selectdemo() {
        String sql="SELECT * FROM addcommodity as A INNER JOIN addgoods as B ON A.Addid=B.AddId";
        List<Comm>list=new ArrayList<>();
        ResultSet rs=null;
        try{
            rs=super.exceuteQuery(sql,null);
            while (rs.next()){
                Comm com=new Comm();
                com.setComID(rs.getInt(1));
                com.setComMoney(rs.getString(2));
                com.setComColor(rs.getString(3));
                com.setComSize(rs.getInt(4));
                com.setComQuantity(rs.getInt(5));
                com.setComName(rs.getString(6));
                com.setComCount(rs.getInt(7));
                com.setComAppCount(rs.getInt(8));
                com.setComOve(rs.getString(9));
                com.setComOut(rs.getString(10));
                com.setComCCTV(rs.getString(11));
                com.setComtype(rs.getInt(12));
                com.setBrand(rs.getString(13));
                com.setModell(rs.getString(14));
                com.setState(rs.getString(15));
                com.setProduct(rs.getString(16));
                list.add(com);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //查询全部用户信息
    @Override
    public List<User> Seleuser(String name) {
        String sql="SELECT * FROM user_data WHERE user_account LIKE '%"+name+"%'";
        ResultSet rs = null;
        List<User> list = new ArrayList<User>();
        try {
            rs = super.exceuteQuery(sql, null);
            while (rs.next()) {
                User user = new User();
                user.setAccount(rs.getString(1));
                user.setPwd(rs.getString(2));
                user.setSex(rs.getString(3));
                user.setBirthday(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setEmail(rs.getString(6));
                user.setState(rs.getInt(7));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //查询用户信息
    @Override
    public List<User> Selete(String id) {
        String sql = "SELECT * FROM user_data WHERE user_account=?";
        Object[] params = {id};
        ResultSet rs = null;
        List<User> list = new ArrayList<User>();
        try {
            rs = super.exceuteQuery(sql, params);
            while (rs.next()) {
                User user = new User();
                user.setAccount(rs.getString(1));
                user.setPwd(rs.getString(2));
                user.setSex(rs.getString(3));
                user.setBirthday(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setEmail(rs.getString(6));
                user.setState(rs.getInt(7));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //查询出用户的姓名
    @Override
    public String SeleteName(User user) {
        String sql = "SELECT userName FROM `user` WHERE userAccount=?";
        Object[] params = {user.getAccount()};
        ResultSet rs = null;
        String name = "";
        try {
            rs = super.exceuteQuery(sql, params);
            while (rs.next()) {
                name = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    //修改用户信息
    @Override
    public int UserUpdate(User user) {
        String sql="UPDATE user_data SET user_sex=?,user_birthday=?,user_phone=?,user_email=?,user_region=? WHERE user_account=?";
        Object[] params={user.getSex(),user.getBirthday(),user.getPhone(),user.getEmail(),user.getState(),user.getAccount()};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //收货地址查询
    @Override
    public List<Address> ShiSelete(String account) {
        String sql="SELECT * FROM user_address WHERE user_account=?";
        Object[] params={account};
        List<Address> list=new ArrayList<Address>();
        ResultSet rs = null;
        try {
            rs=super.exceuteQuery(sql,params);
            while (rs.next()){
                Address address=new Address();
                address.setId(rs.getInt(1));
                address.setAccount(rs.getString(2));
                address.setName(rs.getString(3));
                address.setProvince(rs.getString(4));
                address.setCity(rs.getString(5));
                address.setCounty(rs.getString(6));
                address.setAddress(rs.getString(7));
                address.setPhone(rs.getString(8));
                address.setCode(rs.getString(9));
                address.setState(rs.getString(10));
                list.add(address);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //收货地址删除
    @Override
    public int ShiDelete(int id) {
        String sql="Delete FROM user_address WHERE id=?";
        Object[] params={id};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //查询单个收货地址
    @Override
    public Address ShiQuery(int id) {
        String sql="SELECT * FROM user_address WHERE id=?";
        Object[] params={id};
        ResultSet rs=null;
        Address address=new Address();
        try {
            rs=super.exceuteQuery(sql,params);
            while (rs.next()){
                address.setId(rs.getInt(1));
                address.setAccount(rs.getString(2));
                address.setName(rs.getString(3));
                address.setProvince(rs.getString(4));
                address.setCity(rs.getString(5));
                address.setCounty(rs.getString(6));
                address.setAddress(rs.getString(7));
                address.setPhone(rs.getString(8));
                address.setCode(rs.getString(9));
                address.setState(rs.getString(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return address;
    }

    //新增收货地址
    @Override
    public int ShiAdd(Address address) {
        String sql="INSERT user_address(user_account,Name,province,city,county,address,phone,code,state) VALUES (?,?,?,?,?,?,?,?,?)";
        Object[] params={address.getAccount(),address.getName(),address.getProvince(),address.getCity(),address.getCounty(),address.getAddress(),address.getPhone(),address.getCode(),address.getState()};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //修改收货地址
    @Override
    public int ShiUpdate(Address address) {
        String sql="UPDATE user_address SET Name=?,province=?,city=?,county=?,address=?,phone=?,code=?,state=? WHERE id=?";
        Object[] params={address.getName(),address.getProvince(),address.getCity(),address.getCounty(),address.getAddress(),address.getPhone(),address.getCode(),address.getState(),address.getId()};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //查询商品
    @Override
    public List<Comm> SeleteCom() {
        String sql = "SELECT * FROM addcommodity where Addleixing=1 AND AddQuantity<> 0";
        ResultSet rs = null;
        List<Comm> list = new ArrayList<Comm>();
        try {
            rs = super.exceuteQuery(sql, null);
            while (rs.next()) {
                Comm com = new Comm();
                com.setComID(rs.getInt(1));
                com.setComMoney(rs.getString(2));
                com.setComColor(rs.getString(3));
                com.setComSize(rs.getInt(4));
                com.setComQuantity(rs.getInt(5));
                com.setComName(rs.getString(6));
                com.setComCount(rs.getInt(7));
                com.setComAppCount(rs.getInt(8));
                com.setComOve(rs.getString(9));
                com.setComOut(rs.getString(10));
                com.setComCCTV(rs.getString(11));
                com.setComtype(rs.getInt(12));
                list.add(com);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //类型查询商品
    @Override
    public List<Comm> SeleteCom(Comm comm) {
        String sql = "SELECT * FROM addcommodity WHERE Addleixing=? AND AddQuantity<> 0";
        Object[] params = {comm.getComtype()};
        ResultSet rs = null;
        List<Comm> list = new ArrayList<Comm>();
        try {
            rs = super.exceuteQuery(sql, params);
            while (rs.next()) {
                Comm com = new Comm();
                com.setComID(rs.getInt(1));
                com.setComMoney(rs.getString(2));
                com.setComColor(rs.getString(3));
                com.setComSize(rs.getInt(4));
                com.setComQuantity(rs.getInt(5));
                com.setComName(rs.getString(6));
                com.setComCount(rs.getInt(7));
                com.setComAppCount(rs.getInt(8));
                com.setComOve(rs.getString(9));
                com.setComOut(rs.getString(10));
                com.setComCCTV(rs.getString(11));
                com.setComtype(rs.getInt(12));
                list.add(com);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //通过类型和大小查询商品
    @Override
    public List<Comm> SeleteClass(Comm comm) {
        String sql="SELECT * FROM addcommodity where AddSize=? AND Addleixing=? AND AddQuantity<>0";
        Object[] params={comm.getComSize(),comm.getComtype()};
        ResultSet rs=null;
        List<Comm> list = new ArrayList<Comm>();
        try{
            rs=super.exceuteQuery(sql,params);
        while (rs.next()){
            Comm com = new Comm();
            com.setComID(rs.getInt(1));
            com.setComMoney(rs.getString(2));
            com.setComColor(rs.getString(3));
            com.setComSize(rs.getInt(4));
            com.setComQuantity(rs.getInt(5));
            com.setComName(rs.getString(6));
            com.setComCount(rs.getInt(7));
            com.setComAppCount(rs.getInt(8));
            com.setComOve(rs.getString(9));
            com.setComOut(rs.getString(10));
            com.setComCCTV(rs.getString(11));
            com.setComtype(rs.getInt(12));
            list.add(com);
        }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //单击换一换切换
    @Override
    public List<Comm> Seletehyh(int type,int count,int curr) {
        String sql="select * from addcommodity where Addleixing=? LIMIT ?,?";
       Object []obj={type,count,curr};
        List<Comm> com=new ArrayList<>();
        ResultSet rs=null;
        try{
            rs=super.exceuteQuery(sql,obj);
            while (rs.next()){
                Comm comm=new Comm();
                comm.setComID(rs.getInt(1));
                comm.setComMoney(rs.getString(2));
                comm.setComColor(rs.getString(3));
                comm.setComSize(rs.getInt(4));
                comm.setComQuantity(rs.getInt(5));
                comm.setComName(rs.getString(6));
                comm.setComCount(rs.getInt(7));
                comm.setComAppCount(rs.getInt(8));
                comm.setComOve(rs.getString(9));
                comm.setComOut(rs.getString(10));
                comm.setComCCTV(rs.getString(11));
                comm.setComtype(rs.getInt(12));
                com.add(comm);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return com;
    }

    //查询类型个数
    @Override
    public int sele(int type) {
        String sql="select count(*) from addcommodity where Addleixing=?";
        Object[]obj={type};
        ResultSet rs=null;
        int count=0;
        try {
            rs=super.exceuteQuery(sql,obj);
            rs.next();
            count=rs.getInt(1);
        }catch (Exception e){
            e.printStackTrace();
        }
        return count;
    }

}
