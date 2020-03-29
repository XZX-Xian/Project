package webproject.service;

import webproject.entity.Order;

import java.util.List;

/**
 * 订单数据访问层
 */
public interface OrderService {
        //订单查询
        List<Order> OrderList(String account);
}
