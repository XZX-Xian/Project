package webproject.basedao.impl;

import webproject.basedao.BaseDao;
import webproject.basedao.OrderDao;
import webproject.entity.Order;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * 订单
 */
@SuppressWarnings("all")
public class OrderDaoImpl extends BaseDao implements OrderDao {

    //订单模糊查询
    @Override
    public List<Order> OrderLike(String ordernumber) {
        String sql="SELECT * FROM userorder WHERE ordernumber like '%"+ordernumber+"%'";
        List<Order> list=new ArrayList<>();
        ResultSet rs = null;
        try {
            rs=super.exceuteQuery(sql,null);
            while (rs.next()){
                Order order=new Order();
                order.setOrdernumber(rs.getInt(1));
                order.setShopID(rs.getInt(2));
                order.setName(rs.getString(3));
                order.setUsername(rs.getString(4));
                order.setMoney(rs.getString(5));
                order.setSize(rs.getInt(6));
                order.setOve(rs.getString(7));
                order.setUserid(rs.getString(8));
                order.setState(rs.getInt(9));
                order.setAddress(rs.getString(10));
                order.setAddressID(rs.getInt(11));
                order.setDate(rs.getString(12));
                list.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //订单状态查询
    @Override
    public List<Order> OrderState(int state) {
        String sql="SELECT * FROM userorder WHERE state LIKE '%"+state+"%'";
        System.out.println(sql);
        List<Order> list=new ArrayList<>();
        ResultSet rs = null;
        try {
            rs=super.exceuteQuery(sql,null);
            while (rs.next()){
                Order order=new Order();
                order.setOrdernumber(rs.getInt(1));
                order.setShopID(rs.getInt(2));
                order.setName(rs.getString(3));
                order.setUsername(rs.getString(4));
                order.setMoney(rs.getString(5));
                order.setSize(rs.getInt(6));
                order.setOve(rs.getString(7));
                order.setUserid(rs.getString(8));
                order.setState(rs.getInt(9));
                order.setAddress(rs.getString(10));
                order.setAddressID(rs.getInt(11));
                order.setDate(rs.getString(12));
                list.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //用户订单查询
    @Override
    public List<Order> OrderList(String account) {
        String sql="SELECT * FROM userorder WHERE Userid=?";
        Object[] params={account};
        List<Order> list=new ArrayList<>();
        ResultSet rs = null;
        try {
            rs=super.exceuteQuery(sql,params);
            while (rs.next()){
                Order order=new Order();
                order.setOrdernumber(rs.getInt(1));
                order.setShopID(rs.getInt(2));
                order.setName(rs.getString(3));
                order.setUsername(rs.getString(4));
                order.setMoney(rs.getString(5));
                order.setSize(rs.getInt(6));
                order.setOve(rs.getString(7));
                order.setUserid(rs.getString(8));
                order.setState(rs.getInt(9));
                order.setAddress(rs.getString(10));
                order.setAddressID(rs.getInt(11));
                order.setDate(rs.getString(12));
                list.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //订单查询
    @Override
    public List<Order> OrderList() {
        String sql="SELECT * FROM userorder";
        List<Order> list=new ArrayList<>();
        ResultSet rs = null;
        try {
            rs=super.exceuteQuery(sql,null);
            while (rs.next()){
                Order order=new Order();
                order.setOrdernumber(rs.getInt(1));
                order.setShopID(rs.getInt(2));
                order.setName(rs.getString(3));
                order.setUsername(rs.getString(4));
                order.setMoney(rs.getString(5));
                order.setSize(rs.getInt(6));
                order.setOve(rs.getString(7));
                order.setUserid(rs.getString(8));
                order.setState(rs.getInt(9));
                order.setAddress(rs.getString(10));
                order.setAddressID(rs.getInt(11));
                order.setDate(rs.getString(12));
                list.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //提交的订单查询
    @Override
    public List<Order> OrderList(String shopid, String userid) {
        String sql="SELECT * FROM userorder WHERE ordernumber in("+shopid+") AND Userid=?";
        Object[] params={userid};
        List<Order> list=new ArrayList<>();
        ResultSet rs = null;
        try {
            rs=super.exceuteQuery(sql,params);
            while (rs.next()){
                Order order=new Order();
                order.setOrdernumber(rs.getInt(1));
                order.setShopID(rs.getInt(2));
                order.setName(rs.getString(3));
                order.setUsername(rs.getString(4));
                order.setMoney(rs.getString(5));
                order.setSize(rs.getInt(6));
                order.setOve(rs.getString(7));
                order.setUserid(rs.getString(8));
                order.setState(rs.getInt(9));
                order.setAddress(rs.getString(10));
                order.setAddressID(rs.getInt(11));
                order.setDate(rs.getString(12));
                list.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //订单补充收货地址
    @Override
    public int OrderAddress(Order order,String orders) {
        String sql="UPDATE userorder SET User_name=?,address=?,addressID=?,state=1 WHERE ordernumber in("+orders+") AND Userid=?;";
        Object[] params={order.getUsername(),order.getAddress(),order.getAddressID(),order.getUserid()};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //删除订单
    @Override
    public int OrderDel(String ordernumber) {
        String sql="DELETE FROM userorder WHERE ordernumber in("+ordernumber+",?)";
        Object[] params={ordernumber};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

}
