// start with a window size of 1 and keep expanding the window until the sum of the elements in the window is less than or equal to k. If the sum exceeds k, shrink the window from the left until the sum is less than or equal to k again. Keep track of the maximum length of the window during this process.
// window will point to left and right ends of the current window
// r expands the window to the right, l shrinks the window from the left

// whenever the false condition is met, we will shrink the window from the left until the condition is satisfied again. This way, we can efficiently find the longest subarray with a sum less than or equal to k.