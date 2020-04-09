package webproject.test;

import org.junit.Test;

public class main {
    @Test
    public void ss() {
        Object[] array = {1, 2, 6, 7};
        String name="";
        Object[] a ={3,name,5};
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i] + ",");
        }
        //增加长度复制数据
        Object[] add = new Object[array.length + a.length];
        System.out.println("长度"+add.length);
        for (int i = 0; i < add.length; i++) {
            if (array.length - 1 < i) {
                add[i] = "";
            } else {
                add[i] = array[i];
            }
        }
        System.out.println();
        for (int i = 0; i < add.length; i++) {
            System.out.print(add[i] + ",");
        }
        //插入数据
        System.out.println("插入数据");
        int number=0;
        for (int i = a.length-1; i>-1 ; i--) {
            if (a[i]!=null&&a[i]!=""){
                for (int j = add.length - 1; j >= 2; j--) {
                    add[j] = add[j - 1];
                }
                add[2] = a[i];
            }else {
                number++;
            }
        }
        if (number>0){
            Object[] adds = new Object[add.length -number];
            for (int i = 0; i < adds.length; i++) {
                    adds[i] = add[i];
            }
//            System.out.println();
//            for (int i = 0; i < adds.length; i++) {
//                System.out.print(adds[i] + "+");
//            }
        }else {
        System.out.println();
        for (int i = 0; i < add.length; i++) {
            System.out.print(add[i] + ",");
        }
        }
    }

    @Test
    public void ad() {

    }
}
