package webproject.service.impl;

import webproject.basedao.CollectDao;
import webproject.basedao.impl.CollectDaoImpl;
import webproject.service.CollectService;

public class CollectServiceImpl implements CollectService {
    CollectDao str=new CollectDaoImpl();
    //收藏删除
    @Override
    public int CollectDel(String ids, String account) {
        int count=str.CollectDel(ids,account);
        return count;
    }
}
