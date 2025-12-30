public class threadLifecycle extends Thread {

    @Override
    public void run(){
        System.out.println("RUNNING");
        try{
            Thread.sleep(5000);
        }
        catch(InterruptedException e){
            System.out.println("the error is"+e);
        }
    }
   
    public static void main(String[] args) throws InterruptedException {
        threadLifecycle t1 = new threadLifecycle();
        System.out.println(t1.getState());
        System.out.println(t1.getId ());
        t1.start();
        System.out.println(t1.getState());
        Thread.sleep(500);
        System.out.println(t1.getState());
        t1.join();
        System.out.println(t1.getId());
        System.out.println(t1.getState());



    }
}
