package webproject.service.impl;

import webproject.basedao.BaseDao;
import webproject.basedao.CommDao;
import webproject.basedao.UserDao;
import webproject.basedao.impl.CommDaoImpl;
import webproject.basedao.impl.UserDaoImpl;
import webproject.entity.Comm;
import webproject.service.CommService;

import java.util.ArrayList;
import java.util.List;

public class CommServiceImpl extends BaseDao implements CommService {
            CommDao str=new CommDaoImpl();

    //修改库存
    @Override
    public int ComUP(int quantity,int id) {
        int count=str.ComUP(quantity,id);
        return count;
    }

    //商品新增
    @Override
    public int ComAdd(Comm comm) {
        int count=str.ComAdd(comm);
        return count;
    }

    //商品查询
    @Override
    public List<Comm> CommLike(String name) {
        List<Comm> list = new ArrayList<>();
        list=str.CommLike(name);
        return list;
    }

    //商品查询
    @Override
    public int ComDel(String ids) {
        int count=str.ComDel(ids);
        return count;
    }
}
