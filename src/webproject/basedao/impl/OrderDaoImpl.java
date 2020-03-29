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
public class OrderDaoImpl extends BaseDao implements OrderDao {

    //订单查询
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
                order.setMoney(rs.getString(4));
                order.setSize(rs.getInt(5));
                order.setOve(rs.getString(6));
                order.setUserid(rs.getString(7));
                order.setState(rs.getString(8));
                list.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

}
