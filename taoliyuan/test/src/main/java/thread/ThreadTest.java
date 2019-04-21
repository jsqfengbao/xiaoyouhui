package thread;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * @Author：jinshuangqi
 * @Date: Created in 2018/12/21 16:19
 * @Modified By
 **/
public class ThreadTest {

    public void one(){
        for(int i = 1;i<=5;i++){
            final int index = i;
            try{
                Thread.sleep(1000);
            }catch (InterruptedException e){
                e.printStackTrace();
            }
            new Thread(new Runnable() {
                @Override
                public void run() {
                    System.out.println("第"+index+"个线程"+Thread.currentThread().getName());
                }
            }).start();
        }

    }
    public void two(){
        ExecutorService cacheThreadPool = Executors.newCachedThreadPool();
        for(int i = 1;i<=5;i++){
            final int index = i;
            try{
                Thread.sleep(1000);
            }catch (InterruptedException e){
                e.printStackTrace();
            }
            cacheThreadPool.execute(new Runnable() {
                @Override
                public void run() {
                    System.out.println("第"+index+"个线程"+Thread.currentThread().getName());
                }
            });
        }
    }
    public void three(){
        ExecutorService fixedThreadPool = Executors.newFixedThreadPool(3);
        for(int i =0 ;i<5;i++){
            final int index = i;
            try{
                Thread.sleep(1000);
            }catch(InterruptedException e){
                e.printStackTrace();
            }
            fixedThreadPool.execute(new Runnable() {
                @Override
                public void run() {
                    System.out.println("第"+index+"个线程"+Thread.currentThread().getName());
                }
            });
        }
    }
    public void four(){
        ScheduledExecutorService scheduledThreadPool = Executors.newScheduledThreadPool(3);
        scheduledThreadPool.scheduleAtFixedRate(new Runnable() {
            @Override
            public void run() {
                System.out.println("延迟1秒后每三秒执行一次！");
            }
        },1,3,TimeUnit.SECONDS);
    }
    public static void main(String[] args){
        ThreadTest t = new ThreadTest();
        long startTime = System.currentTimeMillis();
        t.four();
        long endTime = System.currentTimeMillis();
        System.out.println("间隔时间为:"+(endTime-startTime)+"秒");

    }
}
