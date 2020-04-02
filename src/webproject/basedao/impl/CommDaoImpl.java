package webproject.basedao.impl;

import webproject.basedao.BaseDao;
import webproject.basedao.CommDao;

public class CommDaoImpl extends BaseDao implements CommDao {

    //修改库存
    @Override
    public int ComUP(int quantity,int id) {
        String sql="UPDATE addcommodity SET AddQuantity=? WHERE AddId=?";
        Object[] params={quantity,id};
        int count=super.executeUpdate(sql,params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }
}
