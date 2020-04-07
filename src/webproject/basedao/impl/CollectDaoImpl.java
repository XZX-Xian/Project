package webproject.basedao.impl;

import webproject.basedao.BaseDao;
import webproject.basedao.CollectDao;

public class CollectDaoImpl extends BaseDao implements CollectDao {

    //收藏删除
    @Override
    public int CollectDel(String ids, String account) {
        String sql="DELETE FROM usercollect WHERE shopID in("+ids+") AND Userid=?";
        Object[] params={account};
        int count=super.executeUpdate(sql,params);
        return count;
    }
}
