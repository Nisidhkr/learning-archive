public class Test {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        name name = new name(); // when used thread class & this is also the new state
        // name.start();   // In Runnable State
       
        Thread t = new Thread(name); // when used runnable interface
        t.start();
       
        System.out.println(Thread.currentThread().getName());  // Print the name of the main thread
        for(int i=0;i<100;i++){
            System.out.println("Main Thread Name: " + Thread.currentThread().getName());
        }
    }
}
 