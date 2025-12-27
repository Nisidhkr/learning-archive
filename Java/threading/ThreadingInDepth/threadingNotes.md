**CPU**: The CPU is the brain of a computer. It executes instructions from programs and performs arithmetic, logic, control, and input/output operations.

**Core**: A core is one processor inside a CPU. Modern CPUs have many cores, so they can do many tasks at the same time.

**Program**: A program is a set of instructions that tells a computer what to do.

**Process**: A process is a running program. When you start a program, the operating system creates a process for it.

**Thread**: A thread is the smallest unit of work in a process. One process can have many threads that share resources but run separately.

**Multitasking**: Multitasking means running many programs at once. On single-core CPUs, the system switches between tasks quickly. On multi-core CPUs, tasks run at the same time on different cores.

**Multithreading**: Multithreading means running many threads in one process. It makes things faster by splitting work into smaller threads that run together.

**Time Slicing**: The CPU divides time into small pieces. The operating system gives each process or thread a small piece of time. This makes sure no single task uses all the CPU time.

**Context Switching**: Context switching happens when the operating system saves what one thread is doing and starts another thread. This lets many threads share the CPU.

**Java Multithreading**: Java can run many threads in one program to use the CPU better. Java has the `Thread` class and `Runnable` interface in the `java.lang` package.

On single-core CPUs, the JVM switches between threads quickly. On multi-core CPUs, threads run at the same time on different cores. Every Java program starts with one main thread that runs the `main()` method.

**Creating Threads**: Make a new class that implements `Runnable`. Override the `run()` method with your thread code. Create a `Thread` object and pass your class to it. Call `start()` to run the thread.



# thread Lifecycle
The lifecycle of a tread in Java consist of several states, which a tread cam move through during its execution.

**New**: A tread is in this state when it is created but not yet started.

**Runnable**: After the start method is called, the tread becomes rummable.It's ready to run and is wating for CPU time.

**Running**: The tread is in this state when it is executing.

**Blocked/Wating**: A trhead is in this state when it is wating for a resource or for another thread to perform an action.

**Terminated**: A tread is in this state when it has finished executing.