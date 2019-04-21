package objectTest;
/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/20 17:51
 * @Modified By
 **/
public class Student implements Cloneable{

    public void sayHello(){
        System.out.println("hello!");
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
