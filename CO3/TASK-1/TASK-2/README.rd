Q2 – The Quality of Decomposition in Sorting
7 Marks
Below is the complete assignment answer in simple language, including:
1. Aim and algorithm explanation
2. Pseudocode for Merge Sort and Quick Sort
3. Python implementation of both algorithms
4. Balanced and severely unbalanced Quick Sort experiments
5. Partition sizes and maximum recursion depth
6. Comparison tables and time complexity
7. Joint design question and conclusion
1. Aim
To implement and compare Merge Sort and Quick Sort using Divide-and-Conquer techniques and analyse how the quality of decomposition affects their performance.
2. Merge Sort
Explanation
Merge Sort is a Divide-and-Conquer algorithm.
- Divide the array into two equal or nearly equal halves.
- Continue dividing until each subarray contains one element.
- Merge the subarrays in sorted order.
- Repeat until the complete array is sorted.
Pseudocode
MERGESORT(A)

1. If length(A) <= 1:
       Return A

2. Find middle position.

3. Divide array into:
       Left half
       Right half

4. Left = MERGESORT(Left half)

5. Right = MERGESORT(Right half)

6. Return MERGE(Left, Right)
Python Implementation

def merge_sort(a):
    if len(a) <= 1:
        return a

    mid = len(a) // 2

    left = merge_sort(a[:mid])
    right = merge_sort(a[mid:])

    result = []
    i = 0
    j = 0

    while i < len(left) and j < len(right):
        if left[i] < right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1

    result += left[i:]
    result += right[j:]

    return result


a = [38, 27, 43, 3, 9, 82, 10]

print("Original array:", a)
print("Sorted array:", merge_sort(a))
Expected Output
Original array: [38, 27, 43, 3, 9, 82, 10]
Sorted array: [3, 9, 10, 27, 38, 43, 82]
3. Quick Sort
Explanation
Quick Sort is also a Divide-and-Conquer algorithm.
- Select one element as the pivot.
- Divide the array into two partitions.
- Smaller elements are placed on the left side.
- Larger elements are placed on the right side.
- Repeat the same process for both partitions.
Pivot strategy selected: Last element as pivot (Lomuto partition method).

This strategy is easy to implement and helps us study balanced and unbalanced partitions.
Pseudocode
QUICKSORT(A, low, high)

1. If low < high:

2. Select last element as pivot.

3. Partition the array around pivot.

4. Find pivot position.

5. QUICKSORT(A, low, pivot-1)

6. QUICKSORT(A, pivot+1, high)
Python Implementation

def quick_sort(a, low, high):
    if low < high:
        pivot = a[high]
        i = low - 1

        for j in range(low, high):
            if a[j] <= pivot:
                i += 1
                a[i], a[j] = a[j], a[i]

        a[i+1], a[high] = a[high], a[i+1]

        p = i + 1

        quick_sort(a, low, p - 1)
        quick_sort(a, p + 1, high)


a = [38, 27, 43, 3, 9, 82, 10]

print("Original array:", a)

quick_sort(a, 0, len(a) - 1)

print("Sorted array:", a)
Expected Output
Original array: [38, 27, 43, 3, 9, 82, 10]
Sorted array: [3, 9, 10, 27, 38, 43, 82]
4. Experimental Investigation – Student A
Student A must investigate how pivot selection affects Quick Sort.
A. Balanced partition condition
Use this input:
[4, 2, 6, 1, 3, 7, 5]


The last element 5 is selected as the pivot.
- Left partition: [4, 2, 1, 3]
- Right partition: [6, 7]
- The partition sizes are reasonably balanced.
- Recursion depth is relatively small.
B. Severely unbalanced partition condition
Use an already sorted array:
[1, 2, 3, 4, 5, 6, 7]


The last element is selected as the pivot.
- First pivot: 7
- Left partition: 6 elements
- Right partition: 0 elements
- The same imbalance continues in the next recursive calls.
- Recursion depth increases significantly.
C. Experimental observations
Condition	Input	First partition sizes
Balanced	[4,2,6,1,3,7,5]	4 and 2
Unbalanced	[1,2,3,4,5,6,7]	6 and 0

Student A explanation:
- A good pivot divides the array into nearly equal partitions.
- A poor pivot creates one large partition and one very small partition.
- Balanced partitions reduce recursion depth.
- Repeated unbalanced partitions increase execution time.
5. Experimental Implementation with Partition Sizes and Recursion Depth
This program records:
- Partition sizes.
- Maximum recursion depth.
- Sorted output.
- Number of partition operations.
def quick_sort(a, low, high, depth, stats):    stats["depth"] = max(stats["depth"], depth)    if low < high:        pivot = a[high]        i = low - 1        for j in range(low, high):            if a[j] <= pivot:                i += 1                a[i], a[j] = a[j], a[i]        a[i+1], a[high] = a[high], a[i+1]        p = i + 1        left_size = p - low        right_size = high - p        stats["partitions"].append(            (left_size, right_size)        )        quick_sort(a, low, p-1, depth+1, stats)        quick_sort(a, p+1, high, depth+1, stats)def test_quick_sort(data, name):    a = data.copy()    stats = {        "depth": 0,        "partitions": []    }    quick_sort(a, 0, len(a)-1, 1, stats)    print("\n", name)    print("Sorted array:", a)    print("Partition sizes:", stats["partitions"])    print("Maximum recursion depth:", stats["depth"])    print("Partition operations:", len(stats["partitions"]))balanced = [4, 2, 6, 1, 3, 7, 5]unbalanced = [1, 2, 3, 4, 5, 6, 7]test_quick_sort(balanced, "Balanced Input")test_quick_sort(unbalanced, "Unbalanced Input")



Expected Output
Balanced Input

Sorted array: [1, 2, 3, 4, 5, 6, 7]
Partition sizes: [(4, 2), (2, 1), (0, 1), (0, 1)]
Maximum recursion depth: 4
Partition operations: 4


Unbalanced Input

Sorted array: [1, 2, 3, 4, 5, 6, 7]
Partition sizes: [(6, 0), (5, 0), (4, 0),
(3, 0), (2, 0), (1, 0)]
Maximum recursion depth: 7
Partition operations: 6


6. Student B – Comparative Divide-and-Conquer Analysis
A. Merge Sort decomposition
- Merge Sort always divides the array into two nearly equal halves.
- Each division produces smaller subproblems.
- The recursion continues until one element remains.
- The sorted subarrays are combined using merging.
- Its recursion structure is predictable.
B. Quick Sort decomposition
- Quick Sort divides the array based on a selected pivot.
- Partition sizes depend on the pivot value.
- A good pivot produces balanced partitions.
- A poor pivot produces unbalanced partitions.
- Therefore, its recursion structure depends on input data and pivot selection.
C. Comparison between Merge Sort and Quick Sort
Feature	Merge Sort	Quick Sort
Technique	Divide and Conquer	Divide and Conquer
Division	Nearly equal halves	Based on pivot
Best time	O(n log n)	O(n log n)
Average time	O(n log n)	O(n log n)
Worst time	O(n log n)	O(n²)
Extra space	O(n)	O(log n) average recursion stack
Stability	Stable	Usually unstable
Decomposition	Predictable	Pivot dependent

D. Why is Merge Sort more predictable?
Merge Sort divides the array into nearly equal halves regardless of whether the input is sorted, reverse sorted, or random.

Quick Sort depends on pivot selection. If the pivot is the smallest or largest element repeatedly, it creates highly unbalanced partitions.
E. Recursion Tree Height
Merge Sort – Balanced recursion
n

n/2
n/2

n/4

n/4

n/4

n/4


Height: O(log n)


Quick Sort – Severely unbalanced recursion
n

n - 1

n - 2

n - 3

...

1

Height: O(n)


- Balanced recursion tree has logarithmic height.
- Unbalanced recursion tree has linear height.
- Greater recursion depth can increase execution time and stack usage.
F. Why can Quick Sort take O(n²)?
When the last element is always the largest or smallest element, the partitions contain n-1 and 0 elements.

The total work becomes:
\[
(n-1)+(n-2)+\cdots+1
\]

\[
T(n)=O(n^2)
\]

Therefore, repeated imbalance causes Quick Sort to perform poorly.

7. Joint Design Question
Question: If you were designing a sorting component for an application in which the characteristics of the input data are not known in advance, what information would you want before deciding between these two D&C strategies?

Answer:

Before selecting Merge Sort or Quick Sort, we need to consider the following information:
1. Input size: We should know how many elements need to be sorted.
2. Input order: We should check whether the data is already sorted, reverse sorted, or randomly arranged.
3. Memory availability: Merge Sort requires additional memory, whereas Quick Sort generally uses less extra memory.
4. Execution time: We should consider how quickly the application needs to sort the data.
5. Stability: If equal elements must maintain their original order, Merge Sort is preferable.
6. Pivot selection: For Quick Sort, we should consider how to select a good pivot to avoid unbalanced partitions.
7. Worst-case performance: Merge Sort provides predictable O(n log n) performance, while ordinary Quick Sort can take O(n²).
Final decision:
- Choose Merge Sort when predictable performance and stability are important.
- Choose Quick Sort when memory usage is important and good pivot selection can be used.
8. Time Complexity Analysis
Input size	Merge Sort	Quick Sort – Balanced	Quick Sort – Worst
10	O(n log n)	O(n log n)	O(n²)
100	O(n log n)	O(n log n)	O(n²)
1,000	O(n log n)	O(n log n)	O(n²)
10,000	O(n log n)	O(n log n)	O(n²)




O(1)
O(log n)
O(n)
O(n log n)
O(n²)
O(2ⁿ)

10203040506050100150200Input size nGrowth





\(O(1):\;\text{1},\quad O(\log_2 n):\;\text{4}\)
\(O(n):\;\text{16},\quad O(n\log_2 n):\;\text{64}\)
\(O(n^2):\;\text{256},\quad O(2^n):\;\text{65,536}\)

View
\(\text{All curves}\)\(O(1)\)\(O(\log_2 n)\)\(O(n)\)\(O(n\log_2 n)\)\(O(n^2)\)\(O(2^n)\)




\(n\)
48163264










Give feedback

9. Conclusion
- Merge Sort divides the array into nearly equal halves and provides predictable performance.
- Quick Sort uses a pivot to divide the array into partitions.
- Balanced partitions improve Quick Sort performance.
- Unbalanced partitions increase recursion depth and can lead to O(n²) time complexity.
- Pivot selection plays an important role in Quick Sort.
- Both algorithms are useful depending on input characteristics, memory availability, and application requirements.
10. Important Viva Questions
1. What is Divide and Conquer?

It is a technique that divides a problem into smaller subproblems, solves them, and combines their results.

2. What is a pivot?

A pivot is an element selected in Quick Sort to divide the array.

3. Which algorithm has predictable performance?

Merge Sort.

4. What is the worst-case complexity of Quick Sort?

O(n²).

5. Why does Quick Sort become slow?

Repeated unbalanced partitions increase the recursion depth.

6. Which algorithm requires extra memory for merging?

Merge Sort.

7. What is recursion depth?

It is the maximum number of nested recursive calls during algorithm execution.

8. Which pivot strategy is used in this assignment?

Last-element pivot using the Lomuto partition method.
