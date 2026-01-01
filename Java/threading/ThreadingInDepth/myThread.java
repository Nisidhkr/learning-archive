public class myThread extends Thread{
    public myThread(String name){
        super(name ); // set thread name
    }
     @Override
        public void run(){
            System.out.println("thread is running");
            for(int i = 0 ; i < 5 ; i++){
                // try{
                //     Thread.sleep(5000); // sleep for 5 seconds
                // }catch(InterruptedException e){
                //     throw new RuntimeException(e);
                // }
                // System.out.println(i);

               // soundBeep.beep(1000); // beep for 1 second
               System.out.println(Thread.currentThread().getName()+" - Priority: "+Thread.currentThread().getPriority()+" count: "+i);
               try{
                     Thread.sleep(2000); // sleep for 1 second  
               }
               catch(InterruptedException e){
                     throw new RuntimeException(e);
               }            
            }   
        }
    public static void main(String[] args)  throws InterruptedException {
       myThread  t = new myThread("newly created thread");
       t.start();                                      
       t.join(); // main thread will wait for this thread to complete
       System.out.println("main thread is running");
    }
}
