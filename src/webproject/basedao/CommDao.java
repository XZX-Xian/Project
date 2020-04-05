package webproject.basedao;

import webproject.entity.Comm;

import java.util.List;

public interface CommDao {

    //修改商品库存
    int ComUP(int quantity,int id);

    //新增商品
    int ComAdd(Comm comm);

    //商品查询
    List<Comm> CommLike(String name);

    //商品删除
    int ComDel(String ids);
}
