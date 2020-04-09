package webproject.service.impl;

import webproject.basedao.CommDao;
import webproject.basedao.impl.CommDaoImpl;
import webproject.entity.Comm;
import webproject.service.CommService;

import java.util.ArrayList;
import java.util.List;

public class CommServiceImpl implements CommService {
            CommDao str=new CommDaoImpl();

    //修改库存
    @Override
    public int ComUP(int quantity,int volumes,int id) {
        int count=str.ComUP(quantity,volumes,id);
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

    //单个商品查询
    @Override
    public List<Comm> CommID(String comid) {
        List<Comm> list=new ArrayList<>();
        list=str.CommID(comid);
        return list;
    }

    //商品修改
    @Override
    public int ComListUP(Comm comm) {
        int count=str.ComListUP(comm);
        return count;
    }
}
