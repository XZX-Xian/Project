package webproject.service.impl;

import webproject.basedao.OrderDao;
import webproject.basedao.impl.OrderDaoImpl;
import webproject.entity.Order;
import webproject.service.OrderService;

import java.util.ArrayList;
import java.util.List;

/**
 * 订单
 */
public class OrderServiceImpl implements OrderService {
    OrderDao str = new OrderDaoImpl();

    //订单模糊查询
    @Override
    public List<Order> OrderLike(String ordernumber) {
        List<Order> list = new ArrayList<>();
        list = str.OrderLike(ordernumber);
        return list;
    }

    //订单状态查询
    @Override
    public List<Order> OrderState(int state) {
        List<Order> list = new ArrayList<>();
        list = str.OrderState(state);
        return list;
    }

    //用户订单查询
    @Override
    public List<Order> OrderList(String account) {
        List<Order> list = new ArrayList<>();
        list = str.OrderList(account);
        return list;
    }

    //订单查询
    @Override
    public List<Order> OrderList() {
        List<Order> list = new ArrayList<>();
        list = str.OrderList();
        return list;
    }

    //提交的订单查询
    @Override
    public List<Order> OrderList(String shopid, String userid) {
        List<Order> list = new ArrayList<>();
        list = str.OrderList(shopid,userid);
        return list;
    }

    //订单补充收货地址
    @Override
    public int OrderAddress(Order order, String orders) {
        int count=str.OrderAddress(order,orders);
        return count;
    }

    //删除订单
    @Override
    public int OrderDel(String ordernumber) {
        int count=str.OrderDel(ordernumber);
        return count;
    }

}
