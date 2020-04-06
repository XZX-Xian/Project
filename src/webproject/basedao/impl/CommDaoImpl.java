package webproject.basedao.impl;

import webproject.basedao.BaseDao;
import webproject.basedao.CommDao;
import webproject.entity.Comm;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * 商品
 */
@SuppressWarnings("all")
public class CommDaoImpl extends BaseDao implements CommDao {

    //修改库存
    @Override
    public int ComUP(int quantity, int id) {
        String sql = "UPDATE addcommodity SET AddQuantity=? WHERE AddId=?";
        Object[] params = {quantity, id};
        int count = super.executeUpdate(sql, params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //新增商品
    @Override
    public int ComAdd(Comm comm) {
        String sql = "INSERT INTO addcommodity(AddMoney,AddColour,AddSize,AddQuantity,AddName,Mouseove,Mouseoveout,AddCCTV,Addleixing)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        Object[] parqams={comm.getComMoney(),comm.getComColor(),comm.getSize(),comm.getComQuantity(),comm.getComName(),comm.getComOve(),comm.getComOut(),comm.getComCCTV(),comm.getComtype()};
        int count = super.executeUpdate(sql, parqams);
        return count;
    }

    //商品查询
    @Override
    public List<Comm> CommLike(String name) {
        String sql = "SELECT * FROM addcommodity WHERE  AddName LIKE  '%" + name + "%'";
        List<Comm> list = new ArrayList<>();
        ResultSet rs = null;
        try {
            rs = super.exceuteQuery(sql, null);
            while (rs.next()) {
                Comm com = new Comm();
                com.setComID(rs.getInt(1));
                com.setComMoney(rs.getString(2));
                com.setComColor(rs.getString(3));
                com.setComSize(rs.getInt(4));
                com.setComQuantity(rs.getInt(5));
                com.setComName(rs.getString(6));
                com.setComCount(rs.getInt(7));
                com.setComAppCount(rs.getInt(8));
                com.setComOve(rs.getString(9));
                com.setComOut(rs.getString(10));
                com.setComCCTV(rs.getString(11));
                com.setComtype(rs.getInt(12));
                list.add(com);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //商品删除
    @Override
    public int ComDel(String ids) {
        String sql="DELETE FROM addcommodity WHERE AddId in("+ids+",?)";
        System.out.println(sql);
        Object[] params={ids};
        int count=super.executeUpdate(sql,params);
        return count;
    }


}
