//package webproject.mian.src.webProject.basedao.impl;
//
//import webProject.basedao.BaseDao;
//import webProject.basedao.UserDao;
//import webProject.entity.Comm;
//import webProject.entity.Order;
//import webProject.entity.User;
//import webProject.entity.address;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
//public class UserDaoImpl extends BaseDao implements UserDao {
//
//    @Override
//    public int collectsele(Comm comm) {
//        String sql="SELECT count(1)FROM usercollect WHERE shopId=? and Userid=?";
//        Object[]obj={comm.getComID(),comm.getUserid()};
//        ResultSet rs=null;
//        int count=0;
//        try{
//            rs=super.exceuteQuery(sql,obj);
//            while (rs.next()){
//                count=rs.getInt(1);
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return count;
//
//    }
//
//
//
//
//    @Override
//    public int collectinse(Comm comm) {
//        String sql="INSERT INTO usercollect(shopID,Name,Money,Size,Ove,userid)VALUES(?,?,?,?,?,?)";
//        Object[]obj={comm.getComID(),comm.getComName(),comm.getComMoney(),comm.getComQuantity(),comm.getComOve(),comm.getUserid()};
//        int count=super.executeUpdate(sql,obj);
//        return count;
//    }
//
//    @Override
//    public List<Comm> likeorder(Comm comm) {
//        String sql="SELECT * FROM addcommodity WHERE  AddName LIKE  '%"+comm.getComName()+"%'";
//        List<Comm>list=new ArrayList<>();
//        ResultSet rs=null;
//        System.out.println("模糊SQL"+sql);
//        System.out.println(comm.getComName());
//        try{
//            rs=super.exceuteQuery(sql,null);
//            while (rs.next()){
//                Comm com = new Comm();
//                com.setComID(rs.getInt(1));
//                com.setComMoney(rs.getString(2));
//                com.setComColor(rs.getString(3));
//                com.setComSize(rs.getInt(4));
//                com.setComQuantity(rs.getInt(5));
//                com.setComName(rs.getString(6));
//                com.setComCount(rs.getInt(7));
//                com.setComAppCount(rs.getInt(8));
//                com.setComOve(rs.getString(9));
//                com.setComOut(rs.getString(10));
//                com.setComCCTV(rs.getString(11));
//                com.setComtype(rs.getInt(12));
//                list.add(com);
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    @Override
//    public int orderInse(Order ord) {
//        int random=(int)(Math.random()*1889999999);
//        String states="0";
//        String sql="INSERT INTO userorder(ordernumber,shopID,Name,Money,Size,Ove,userid,state)VALUES("+random+",?,?,?,?,?,?,"+states+")";
//        Object[] obj={ord.getShopID(),ord.getName(),ord.getMoney(),ord.getSize(),ord.getOve(),ord.getUserid()};
//        int count=super.executeUpdate(sql,obj);
//        return count;
//    }
//
//    @Override
//    public int addressUp(String ids, String userid) {
//        String sql="UPDATE user_address set state=\"\" where id in("+ids+") AND user_account=?";
//        Object[] obj={userid};
//        int count=super.executeUpdate(sql,obj);
//        return count;
//    }
//
//
//    @Override
//    public int orderaddressUp(int id, String userid) {
//       String sql="UPDATE user_address set state=\"默认地址\" where id=? AND user_account=?";
//        Object[] obj={id,userid};
//        int count=super.executeUpdate(sql,obj);
//        return count;
//    }
//
//    //地址
//    @Override
//    public List<address> Seleorder(address ads) {
//        String sql="SELECT *FROM user_address where user_account=?";
//        Object[] obj={ads.getAccount()};
//        List<address> list=new ArrayList<>();
//        ResultSet rs=null;
//        try{
//            rs=super.exceuteQuery(sql,obj);
//            while (rs.next()){
//                address adds=new address();
//                adds.setId(rs.getInt(1));
//                adds.setAccount(rs.getString(2));
//                adds.setName(rs.getString(3));
//                adds.setProvince(rs.getString(4));
//                adds.setCity(rs.getString(5));
//                adds.setCounty(rs.getString(6));
//                adds.setAddress(rs.getString(7));
//                adds.setPhone(rs.getString(8));
//                adds.setCode(rs.getString(9));
//                adds.setState(rs.getString(10));
//                list.add(adds);
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    //订单采购
//    @Override
//    public List<Comm> ddcg(String ids, String useid) {
//        String sql="SELECT * FROM shopping where Addid in("+ids+") and userid=?";
//        Object[] obj={useid};
//        List<Comm> list=new ArrayList<>();
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
//
//    @Override
//    public int shopupda(Comm comm) {
//        String sql="UPDATE shopping set Addsize=? where Addid=? AND userid=?";
//        Object[]obj={comm.getSize(),comm.getComID(),comm.getUserid()};
//        int count=super.executeUpdate(sql,obj);
//        return count;
//    }
//
//
//    @Override
//    public int shopsele(Comm comm) {
//        String sql="SELECT Addsize FROM shopping where userid=? and Addid=?";
//        Object[]obj={comm.getUserid(),comm.getComID()};
//        ResultSet rs=null;
//        int count=0;
//        try{
//            rs=super.exceuteQuery(sql,obj);
//            while (rs.next()){
//                count=rs.getInt(1);
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//      return count;
//    }
//
//    //购物车删除事件
//    @Override
//    public int deleshop(Comm comm) {
//        String sql="DELETE FROM shopping where Addid=?";
//        Object[]obj={comm.getComID()};
//        int count=super.executeUpdate(sql,obj);
//        return count;
//    }
//
//
//
//    @Override
//    public int deleteUsers(String ids, String useid) {
//        String sql="delete from shopping where Addid in("+ids+") and userid=?";
//        Object[] obj={useid};
//        System.out.println("用户id是"+useid); System.out.println(ids);
//        int count=super.executeUpdate(sql,obj);
//        return count;
//    }
//
//    @Override
//    public int shopinse(Comm comm) {
//        String sql="INSERT INTO shopping(Addid,AddName,AddMoney,Addsize,mouseove,userid)VALUES(?,?,?,?,?,?)";
//        List<Comm> list=new ArrayList<>();
//        Object[] obj={comm.getComID(),comm.getComName(),comm.getComMoney(),comm.getSize(),comm.getComOve(),comm.getUserid()};
//        int count=super.executeUpdate(sql,obj);
//        return count;
//    }
//
//    //通过ID 查询用户购物车
//    @Override
//    public List<Comm> shopdemo(Comm comm) {
//        String sql="SELECT  B.addid,C.AddQuantity,B.AddName,B.AddMoney,B.Addsize,b.mouseove FROM user as A\n" +
//                " INNER JOIN shopping as B ON A.account=B.userid \n" +
//                "INNER JOIN addcommodity C ON B.Addid=C.AddId\n" +
//                "WHERE A.account=?;";
//        List<Comm> list=new ArrayList<>();
//        Object[] obj={comm.getAccount()};
//        ResultSet rs=null;
//        try{
//            rs=super.exceuteQuery(sql,obj);
//            while (rs.next()){
//                Comm com=new Comm();
//                com.setComID(rs.getInt(1));
//                com.setComQuantity(rs.getInt(2));
//                com.setComName(rs.getString(3));
//                com.setComMoney(rs.getString(4));
//                com.setComSize(rs.getInt(5));
//                com.setComOve(rs.getString(6));
//                list.add(com);
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    @Override
//    public  List<Comm> recreationdemo() {
//        int random=(int)(Math.random()*38);
//      String sql="SELECT *FROM addcommodity where AddId="+random+"";
//        List<Comm>list=new ArrayList<>();
//      ResultSet rs=null;
//
//      try{
//          rs=super.exceuteQuery(sql,null);
//          while (rs.next()){
//            Comm com=new Comm();
//              com.setComID(rs.getInt(1));
//              com.setComMoney(rs.getString(2));
//              com.setComColor(rs.getString(3));
//              com.setComSize(rs.getInt(4));
//              com.setComQuantity(rs.getInt(5));
//              com.setComName(rs.getString(6));
//              com.setComCount(rs.getInt(7));
//              com.setComAppCount(rs.getInt(8));
//              com.setComOve(rs.getString(9));
//              com.setComOut(rs.getString(10));
//              com.setComCCTV(rs.getString(11));
//              com.setComtype(rs.getInt(12));
//              list.add(com);
//          }
//      }catch (Exception e){
//          e.printStackTrace();
//      }
//        return list;
//    }
//
//    //两表联查  条件判断查询的商品资料
//    @Override
//    public List<Comm> Seletedemo(Comm comm) {
//        String sql="SELECT * FROM addcommodity as A INNER JOIN addgoods as B ON A.Addid=B.AddId WHERE A.AddID=?";
//        Object[]obj={comm.getComID()};
//        ResultSet rs=null;
//        List<Comm>list=new ArrayList<>();
//        try{
//            rs=super.exceuteQuery(sql,obj);
//            while (rs.next()){
//                Comm com=new Comm();
//                com.setComID(rs.getInt(1));
//                com.setComMoney(rs.getString(2));
//                com.setComColor(rs.getString(3));
//                com.setComSize(rs.getInt(4));
//                com.setComQuantity(rs.getInt(5));
//                com.setComName(rs.getString(6));
//                com.setComCount(rs.getInt(7));
//                com.setComAppCount(rs.getInt(8));
//                com.setComOve(rs.getString(9));
//                com.setComOut(rs.getString(10));
//                com.setComCCTV(rs.getString(11));
//                com.setComtype(rs.getInt(12));
//                com.setId(rs.getInt(13));
//                com.setBrand(rs.getString(14));
//                com.setProduct(rs.getString(15));
//                com.setModell(rs.getString(16));
//                com.setState(rs.getString(17));
//                list.add(com);
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    //忘记密码
//    @Override
//    public int Updateuser(User user) {
//        String sql="update user SET pwd=? where account=? and phone= ?";
//        Object []obj={user.getPwd(),user.getAccount(),user.getPhone()};
//        int count=super.executeUpdate(sql,obj);
//        return count;
//    }
//
//    //两表联查
//    @Override
//    public List<Comm> Selectdemo() {
//        String sql="SELECT * FROM addcommodity as A INNER JOIN addgoods as B ON A.Addid=B.AddId";
//        List<Comm>list=new ArrayList<>();
//            ResultSet rs=null;
//            try{
//                rs=super.exceuteQuery(sql,null);
//                while (rs.next()){
//                    Comm com=new Comm();
//                    com.setComID(rs.getInt(1));
//                    com.setComMoney(rs.getString(2));
//                    com.setComColor(rs.getString(3));
//                    com.setComSize(rs.getInt(4));
//                    com.setComQuantity(rs.getInt(5));
//                    com.setComName(rs.getString(6));
//                    com.setComCount(rs.getInt(7));
//                    com.setComAppCount(rs.getInt(8));
//                    com.setComOve(rs.getString(9));
//                    com.setComOut(rs.getString(10));
//                    com.setComCCTV(rs.getString(11));
//                    com.setComtype(rs.getInt(12));
//                    com.setBrand(rs.getString(13));
//                    com.setModell(rs.getString(14));
//                    com.setState(rs.getString(15));
//                    com.setProduct(rs.getString(16));
//                    list.add(com);
//                }
//            }catch (Exception e){
//                e.printStackTrace();
//            }
//
//        return list;
//    }
//
//    //登录电话
//    @Override
//    public boolean userdhdl(int phone,String pwd) {
//        boolean flag=false;
//            String sql="SELECT * FROM user WHERE phone="+phone+" and pwd="+pwd+"";
//            ResultSet rs=null;
//            try{
//                rs=super.exceuteQuery(sql,null);
//                if (rs.next()) {
//                    flag=true;
//                }
//            }catch (Exception e){
//                e.printStackTrace();
//            }
//
//        return flag;
//    }
//
//    //登录用户
//    @Override
//    public boolean userdl(String account,String pwd) {
//        boolean flag=false;
//            String sql="SELECT * FROM user WHERE account="+account+" and pwd="+pwd+"";
//            ResultSet rs=null;
//            try{
//                rs=super.exceuteQuery(sql,null);
//                if (rs.next()) {
//                    flag=true;
//                }
//            }catch (Exception e){
//                e.printStackTrace();
//            }
//
//        return flag;
//    }
//
//    //用户注册
//    @Override
//    public int AddUser(User user) {
//        String sql = "INSERT `user`(account,pwd,phone) VALUES (?,?,?)";
//        Object[] params = {user.getAccount(), user.getPwd(), user.getPhone()};
//        int count = super.executeUpdate(sql, params);
//        return count;
//    }
//
//    //用户登录或退出 修改用户状态
//    @Override
//    public int UpdateUser(User user) {
//        String sql = "UPDATE `user` SET state=? WHERE userAccount=? AND userPwd=?";
//        Object[] params = {user.getState(), user.getAccount(), user.getPwd()};
//        int count = super.executeUpdate(sql, params);
//        return count;
//    }
//
//    @Override
//    public List<User> Seleuser() {
//        String sql="SELECT * FROM user";
//        ResultSet rs=null;
//        List<User>list=new ArrayList<>();
//        try{
//            rs=super.exceuteQuery(sql,null);
//            while (rs.next()) {
//                User user1 = new User();
//                user1.setAccount(rs.getString(1));
//                user1.setPwd(rs.getString(2));
//                user1.setName(rs.getString(3));
//                user1.setSex(rs.getString(4));
//                user1.setBirthday(rs.getString(5));
//                user1.setPhone(rs.getString(6));
//                user1.setEmail(rs.getString(7));
//                user1.setAddress(rs.getString(8));
//                user1.setState(rs.getInt(9));
//                list.add(user1);
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    //查询用户信息
//    @Override
//    public List<User> Selete(User user) {
//        String sql = "SELECT * FROM `user` WHERE userAccount=?";
//        Object[] params = {user.getName()};
//        ResultSet rs = null;
//        List<User> list = new ArrayList<User>();
//        try {
//            rs = super.exceuteQuery(sql, params);
//            while (rs.next()) {
//                User user1 = new User();
//                user.setAccount(rs.getString(1));
//                user.setPwd(rs.getString(2));
//                user.setName(rs.getString(3));
//                user.setSex(rs.getString(4));
//                user.setBirthday(rs.getString(5));
//                user.setPhone(rs.getString(6));
//                user.setEmail(rs.getString(7));
//                user.setAddress(rs.getString(8));
//                user.setState(rs.getInt(9));
//                list.add(user);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    //查询出用户的姓名
//    @Override
//    public String SeleteName(User user) {
//        String sql = "SELECT userName FROM `user` WHERE userAccount=?";
//        Object[] params = {user.getName()};
//        ResultSet rs = null;
//        String name = "";
//        try {
//            rs = super.exceuteQuery(sql, params);
//            while (rs.next()) {
//                name = rs.getString(1);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return name;
//    }
//
//
//    //查询商品
//    @Override
//    public List<Comm> SeleCom(Comm comm) {
//        String sql = "SELECT * FROM addcommodity where Addleixing=?";
//        Object []obj={comm.getComtype()};
//        ResultSet rs = null;
//        List<Comm> list = new ArrayList<Comm>();
//        try {
//            rs = super.exceuteQuery(sql, obj);
//            while (rs.next()) {
//                Comm com = new Comm();
//                com.setComID(rs.getInt(1));
//                com.setComMoney(rs.getString(2));
//                com.setComColor(rs.getString(3));
//                com.setComSize(rs.getInt(4));
//                com.setComQuantity(rs.getInt(5));
//                com.setComName(rs.getString(6));
//                com.setComCount(rs.getInt(7));
//                com.setComAppCount(rs.getInt(8));
//                com.setComOve(rs.getString(9));
//                com.setComOut(rs.getString(10));
//                com.setComCCTV(rs.getString(11));
//                com.setComtype(rs.getInt(12));
//                list.add(com);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//
//    //类型查询商品
//    @Override
//    public List<Comm> SeleteCom(Comm comm) {
//        String sql = "SELECT * FROM addcommodity WHERE Addleixing=1";
//        ResultSet rs = null;
//        List<Comm> list = new ArrayList<Comm>();
//        try {
//            rs = super.exceuteQuery(sql, null);
//            while (rs.next()) {
//                Comm com = new Comm();
//                com.setComID(rs.getInt(1));
//                com.setComMoney(rs.getString(2));
//                com.setComColor(rs.getString(3));
//                com.setComSize(rs.getInt(4));
//                com.setComQuantity(rs.getInt(5));
//                com.setComName(rs.getString(6));
//                com.setComCount(rs.getInt(7));
//                com.setComAppCount(rs.getInt(8));
//                com.setComOve(rs.getString(9));
//                com.setComOut(rs.getString(10));
//                com.setComCCTV(rs.getString(11));
//                com.setComtype(rs.getInt(12));
//                list.add(com);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    //通过类型和大小查询商品
//    @Override
//    public List<Comm> SeleteClass(Comm comm) {
//        String sql="SELECT * FROM addcommodity where AddSize=? AND Addleixing=?";
//        Object[] params={comm.getComSize(),comm.getComtype()};
//        ResultSet rs=null;
//        List<Comm> list = new ArrayList<Comm>();
//        try{
//            rs=super.exceuteQuery(sql,params);
//        while (rs.next()){
//            Comm com = new Comm();
//            com.setComID(rs.getInt(1));
//            com.setComMoney(rs.getString(2));
//            com.setComColor(rs.getString(3));
//            com.setComSize(rs.getInt(4));
//            com.setComQuantity(rs.getInt(5));
//            com.setComName(rs.getString(6));
//            com.setComCount(rs.getInt(7));
//            com.setComAppCount(rs.getInt(8));
//            com.setComOve(rs.getString(9));
//            com.setComOut(rs.getString(10));
//            com.setComCCTV(rs.getString(11));
//            com.setComtype(rs.getInt(12));
//            list.add(com);
//        }
//
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    @Override
//    public List<Comm> Seletehyh(int type,int count,int curr) {
//        String sql="select* from addcommodity where Addleixing=? LIMIT ?,?";
//       Object []obj={type,count,curr};
//        List<Comm> com=new ArrayList<>();
//        ResultSet rs=null;
//        try{
//            rs=super.exceuteQuery(sql,obj);
//            while (rs.next()){
//                Comm comm=new Comm();
//                comm.setComID(rs.getInt(1));
//                comm.setComMoney(rs.getString(2));
//                comm.setComColor(rs.getString(3));
//                comm.setComSize(rs.getInt(4));
//                comm.setComQuantity(rs.getInt(5));
//                comm.setComName(rs.getString(6));
//                comm.setComCount(rs.getInt(7));
//                comm.setComAppCount(rs.getInt(8));
//                comm.setComOve(rs.getString(9));
//                comm.setComOut(rs.getString(10));
//                comm.setComCCTV(rs.getString(11));
//                comm.setComtype(rs.getInt(12));
//                com.add(comm);
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return com;
//    }
//
//    //查询类型个数
//    @Override
//    public int sele(int type) {
//        String sql="select count(*) from addcommodity where Addleixing=?";
//        Object[]obj={type};
//        ResultSet rs=null;
//        int count=0;
//        try {
//            rs=super.exceuteQuery(sql,obj);
//            rs.next();
//            count=rs.getInt(1);
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return count;
//    }
//
//
//}
