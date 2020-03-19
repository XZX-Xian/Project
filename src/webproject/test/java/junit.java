package webproject.test.java;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import webproject.basedao.impl.UserDaoImpl;


public class junit {

    @Test
    public void test(){
        System.out.println("第一个测试方法");
        try {
        Class cla=Class.forName("");
//            Member[] members=;

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Test
    public void dome(){

        String ids="1,0";
        String account="123";
        UserDaoImpl str=new UserDaoImpl();
        int count=str.deleteUsers(ids,account);
        System.out.println(count);
        System.out.println("第二个测试方法");
    }

    @Before
    public void Before(){
        System.out.println("测试方法执行之前");
    }

    @After
    public void After(){
        System.out.println("测试方法执行之后");
    }

}
