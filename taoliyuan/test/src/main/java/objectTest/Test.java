package objectTest;

import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.lang.reflect.Constructor;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/20 17:51
 * @Modified By
 **/
public class Test{

    //1、使用new关键字
    public static  void one(){
        Student s1 = new Student();
        s1.sayHello();
    }

    //2、使用newInstance方法
    public static void two() throws Exception{
        Student s2 = (Student)Class.forName("Student").newInstance();
        s2.sayHello();
    }
    //3、使用newInstance方法
    public static void three() throws Exception{
        Student s3 = Student.class.newInstance();
        s3.sayHello();
    }

    //4、使用Constructor类的newInstance方法
    public static void four() throws Exception{
        Constructor<Student> constructor = Student.class.getConstructor();
        Student s4 = constructor.newInstance();
        s4.sayHello();
    }

    //5、使用clone方法
    public static void five()  throws Exception{
        Constructor<Student> constructor = Student.class.getConstructor();
        Student s4 = constructor.newInstance();
        Student s5 = (Student)s4.clone();
        s5.sayHello();
    }

    public static void six() throws Exception{

    }
    public static void main(String[] args) throws Exception{
//        one();
//        two();
//        three();
//        four();
        five();
    }
}
