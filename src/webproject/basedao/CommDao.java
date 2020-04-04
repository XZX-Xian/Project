package webproject.basedao;

import webproject.entity.Comm;

public interface CommDao {

    //修改商品库存
    int ComUP(int quantity,int id);

    //新增商品
    int ComAdd(Comm comm);
}
