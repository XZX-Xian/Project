package webproject.service;

import webproject.entity.Comm;

import java.util.List;

public interface CommService {

    //修改商品库存
    int ComUP(int quantity,int volumes, int id);

    //新增商品
    int ComAdd(Comm comm);

    //商品查询
    List<Comm> CommLike(String name);

    //商品删除
    int ComDel(String ids);

    //单个商品查询
    List<Comm> CommID(String comid);

    //商品修改
    int ComListUP(Comm comm);
}
