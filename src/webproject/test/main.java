package webproject.test;

import webproject.basedao.impl.UserDaoImpl;
import webproject.entity.Comm;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("all")
//@test(name = "哈哈")
public class main {
    public static void main(String[] args) {


        //        Class clss=Students.class;
//        String a="啊";
//        switch (a){
//            case "啊":
//                System.out.println("aaaaaaaaaa");
//                break;
//
//        }

//        try {
//            Field field=clss.getDeclaredField("name");
//            test t=field.getAnnotation(test.class);
//            System.out.println(t.name());
//        }catch (SecurityException e){
//            e.printStackTrace();
//        }catch (NoSuchFieldException e){
//            e.printStackTrace();
//        }


        //注解在类上面
        //        test t=main.class.getAnnotation(test.class);
        //        System.out.println(t.name());

//        //获取到类
//        Class clss = Students.class;
//        try {
//            //获取类的方法
//            //参数1 表示药拿到的方法
//            //参数2 表示此方法的参数是什么类型
//            Method method = clss.getDeclaredMethod("show", String.class);
//            Object obj = clss.newInstance();
//            //执行方法
//            //obj 从底层
//            //args
//            method.invoke(obj, "12");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        //通过属性 直接获取到类
//        Class clss=Students.class;
//        try {
//         Field field=clss.getDeclaredField("age");
//
//         //创建一个对象
//         Object obj=clss.newInstance();
//         field.set(obj,20);
//
//         System.out.println(field.get(obj));
//
//
//        }catch (SecurityException e){
//            e.printStackTrace();
//        }catch (NoSuchFieldException e){
//            e.printStackTrace();
//        } catch (IllegalAccessException e) {
//            e.printStackTrace();
//        } catch (InstantiationException e) {
//            e.printStackTrace();
//        }


        //反射 第一步 获取类
//       try {
////          Class clss=Class.forName("webproject.servlet.asas");
//          Class clss=Class.forName("java.lang.String");
//          //输出类名
//          System.out.println(clss.getName());
//            System.out.println(clss.getPackage());
//
//            //通过对象 获取到对象相应的类的名称
////            String s="哈哈";
////            s.getClass().getName();
//
//            //第二步 获取到类中的方法
//           Method[] method=clss.getDeclaredMethods();
//
//           //第三步 循环遍历输出 此类中的
//           for (Method in:method) {
//            System.out.println(in);
//           }
//
//          //找不到类报错
//       }catch (ClassNotFoundException e){
//           e.printStackTrace();
//       }

    }
}
