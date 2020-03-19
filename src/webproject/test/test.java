package webproject.test;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
//表示此注解 应用在类上面
//@Target({ElementType.TYPE})
@Target({ElementType.FIELD})
//程序运行后还存在
@Retention(RetentionPolicy.RUNTIME)
public @interface test {
    String name(); //属性

}
