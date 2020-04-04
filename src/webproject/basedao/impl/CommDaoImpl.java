package webproject.basedao.impl;

import webproject.basedao.BaseDao;
import webproject.basedao.CommDao;
import webproject.entity.Comm;

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

    //新增商品
    @Override
    public  int ComAdd(Comm comm){
        String sql="INSERT INTO addcommodityy(AddMoney,AddColour,AddSize,AddQuantity,AddName,AddJilu,AddPingjia,Mouseove,Mouseoveout,Addleixing)VALUES(?,?,?,?,?,?,?,?,?,?)";
        int ccc=0;
        try {
            ccc=super.executeUpdate(sql,null);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ccc;
    }
}
