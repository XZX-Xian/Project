package webproject.basedao;

import webproject.entity.Order;

import java.util.List;

/**
 * 订单数据访问层
 */
public interface OrderDao {

        //用户订单查询
        List<Order> OrderList(String account);

        //订单查询
        List<Order> OrderList();

        //提交的订单查询
        List<Order> OrderList(String shopid,String userid);


}
