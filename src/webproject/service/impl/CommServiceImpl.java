package webproject.service.impl;

import webproject.basedao.BaseDao;
import webproject.basedao.CommDao;
import webproject.basedao.UserDao;
import webproject.basedao.impl.CommDaoImpl;
import webproject.basedao.impl.UserDaoImpl;
import webproject.service.CommService;

public class CommServiceImpl extends BaseDao implements CommService {
            CommDao str=new CommDaoImpl();

    //修改库存
    @Override
    public int ComUP(int quantity,int id) {
        int count=str.ComUP(quantity,id);
        return count;
    }
}
