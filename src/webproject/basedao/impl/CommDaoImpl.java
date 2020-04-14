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
    public int ComUP(int quantity, int volumes, int id) {
        String sql = "UPDATE addcommodity SET AddQuantity=?,AddJilu=? WHERE AddId=?";
        Object[] params = {quantity, volumes, id};
        int count = super.executeUpdate(sql, params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //新增商品
    @Override
    public int ComAdd(Comm comm) {
        String sql = "INSERT INTO addcommodity(AddMoney,AddColour,AddSize,AddQuantity,AddName,Mouseove,Mouseoveout,AddCCTV,Addleixing)VALUES(?,?,?,?,?,?,?,?,?)";
        Object[] parqams = {comm.getComMoney(), comm.getComColor(), comm.getSize(), comm.getComQuantity(), comm.getComName(), comm.getComOve(), comm.getComOut(), comm.getComCCTV(), comm.getComtype()};
        int count = super.executeUpdate(sql, parqams);
        //手动关闭mysql
        super.closeAll();
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
                com.setLimit(rs.getInt(13));
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
        String sql = "DELETE FROM addcommodity WHERE AddId in(" + ids + ",?)";
        Object[] params = {ids};
        int count = super.executeUpdate(sql, params);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

    //单个商品查询
    @Override
    public List<Comm> CommID(String comid) {
        String sql = "SELECT * FROM addcommodity WHERE  AddId =?";
        Object[] params = {comid};
        List<Comm> list = new ArrayList<>();
        ResultSet rs = null;
        try {
            rs = super.exceuteQuery(sql, params);
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
                com.setLimit(rs.getInt(13));
                list.add(com);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //商品修改
    @Override
    public int ComListUP(Comm comm) {
        //判断是否要修改图片
        String mouser = "";
        if (comm.getComOve() != null) {
            mouser = mouser + "Mouseove=?,";
        }
        if (comm.getComOut() != null) {
            mouser = mouser + "Mouseoveout=?,";
        }
        if (comm.getComCCTV() != null) {
            mouser = mouser + "AddCCTV=?,";
        }
        int count = 0;
//        String sql = "UPDATE addcommodity SET AddMoney=?,AddColour=?,AddSize=?,AddQuantity=?,AddName=?," + mouser + "Addleixing=?,`limit`=? WHERE AddId=?";
//        Object[] parqams = {comm.getComMoney(), comm.getComColor(), comm.getSize(), comm.getComQuantity(), comm.getComName(), comm.getComtype(),comm.getLimit(),comm.getComID()};
//        Object[] parqam = {comm.getComOve(), comm.getComOut(), comm.getComCCTV()};
//        if (mouser != "") {
//            //增加长度
//            Object[] parqa = new Object[parqams.length + parqam.length];
//            //复制数据
//            for (int i = 0; i < parqa.length; i++) {
//                if (parqams.length - 1 < i) {
//                    parqa[i] = "";
//                } else {
//                    parqa[i] = parqams[i];
//                }
//            }
//            //插入数据
//            int number = 0;
//            for (int i = parqam.length - 1; i > -1; i--) {
//                //判断要插入的数据是否为空
//                if (parqam[i] != null && parqam[i] != "") {
//                    //插入的位置
//                    for (int j = parqa.length - 1; j >= 4; j--) {
//                        parqa[j] = parqa[j - 1];
//                    }
//                    //插入的值
//                    parqa[4] = parqam[i];
//                } else {
//                    number++;
//                }
//            }
//            //判断要插入的值是否有空值
//            if (number > 0) {
//                //将数组中的空值去掉
//                Object[] parq = new Object[parqa.length - number];
//                for (int i = 0; i < parq.length; i++) {
//                    parq[i] = parqa[i];
//                }
//                count = super.executeUpdate(sql, parq);
//            } else {
//                System.out.println(sql);
//                count = super.executeUpdate(sql, parqa);
//            }
//        } else {
//            System.out.println(sql);
//
//        }
        String sql = "UPDATE addcommodity SET AddMoney=?,AddColour=?,AddSize=?,AddQuantity=?,AddName=?,Addleixing=?,`limit`=? WHERE AddId=?";
        Object[] parqams = {comm.getComMoney(), comm.getComColor(), comm.getSize(), comm.getComQuantity(), comm.getComName(), comm.getComtype(),comm.getLimit(),comm.getComID()};
        count = super.executeUpdate(sql, parqams);
        //手动关闭mysql
        super.closeAll();
        return count;
    }

}
