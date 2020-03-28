package webproject.mian.src.webProject.test;

import webProject.basedao.UserDao;
import webProject.basedao.impl.UserDaoImpl;
import webProject.entity.Comm;
import webProject.entity.User;
import webProject.service.UserService;
import webProject.service.UserServiceImpl;

public class Main {
    public static void main(String[] args) {
        UserService str=new UserServiceImpl();
        Comm com=new Comm();
        UserDao used=new UserDaoImpl();
    /*  str.Seletehyh(11,0,2);*/
      User use=new User();
      com.setComID(8);
              com.setUserid("001");
      str.collectsele(com);
     /*   address ads=new address();
        str.orderaddressUp(3,"001");*/
     /*   com.setComName("之");
     str.likeorder(com);*/
     /* str.deleteUsers("2","001");*/
      /*  str.ddcg("38","001");*/


/*
      str.Seleuser();
*/

 /*     str.Selectdemo();*/
/*    str.Updateuser(use);*/
        /*  str.Seletedemo();*/
  /*      str.recreationdemo();*/


    }
}
