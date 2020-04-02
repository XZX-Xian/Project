package webproject.service.impl;

import webproject.basedao.BaseDao;
import webproject.basedao.OrderDao;
import webproject.basedao.impl.OrderDaoImpl;
import webproject.entity.Order;
import webproject.service.OrderService;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * 订单
 */
public class OrderServiceImpl implements OrderService {
    OrderDao str = new OrderDaoImpl();

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

}
