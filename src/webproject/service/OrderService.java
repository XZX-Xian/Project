package webproject.service;

import webproject.entity.Order;

import java.util.List;

/**
 * 订单数据访问层
 */
public interface OrderService {

        //订单模糊查询
        List<Order> OrderLike(String ordernumber);

        //订单状态查询
        List<Order> OrderState(int state);

        //用户订单查询
        List<Order> OrderList(String account);

        //订单查询
        List<Order> OrderList();

        //提交的订单查询
        List<Order> OrderList(String shopid,String userid);

        //订单补充收货地址
        int OrderAddress(Order order,String orders);

        //订单删除
        int OrderDel(String ordernumber);
}
