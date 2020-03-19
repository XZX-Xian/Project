package webproject.test;

import webproject.basedao.impl.UserDaoImpl;
import webproject.entity.Comm;

import java.util.ArrayList;
import java.util.List;

public class asd {
    public static void main(String[] args) {

        UserDaoImpl str=new UserDaoImpl();
        String name="星";
        Comm comm=new Comm();
        comm.setComName(name);
        List<Comm> list = new ArrayList<>();
        list=str.secom(comm);
        for (int i=0;i<list.size();i++){
            System.out.println(list.get(i).getComName());
        }

//        String ids="1,0";
//        String account="123";
//        UserDaoImpl str=new UserDaoImpl();
//        int count=str.deleteUsers(ids,account);
//        if (count>0){
//            System.out.println("成功");
//        }else {
//            System.out.println("失败");
//        }

//        int cou=str.CommID(29,"123");
//        System.out.println(cou);

    }
}
