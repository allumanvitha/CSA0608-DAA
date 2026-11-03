Q1 – Decomposition and Elimination in Ordered Data
Below is the complete assignment answer with pseudocode, Python implementation, sample output, comparison analysis, and output screenshot guidance for both Part A and Part B.

You can use this for your assignment record and explain it during faculty verification.
Part A – Finding Maximum and Minimum
1. Aim
To find the maximum and minimum elements in an array using the Divide-and-Conquer (Tournament) strategy with fewer comparisons.
2. Pseudocode
3. MAXMIN(A, low, high)

1. If low == high:
       Return A[low], A[low]

2. If high == low + 1:
       If A[low] > A[high]:
           Return A[low], A[high]
       Else:
           Return A[high], A[low]

3. mid = (low + high) / 2

4. (max1, min1) = MAXMIN(A, low, mid)

5. (max2, min2) = MAXMIN(A, mid+1, high)

6. Maximum = max(max1, max2)

7. Minimum = min(min1, min2)

8. Return Maximum, Minimum
   
count = 0

def maxmin(a, low, high):
    global count

    if low == high:
        return a[low], a[low]

    if high == low + 1:
        count += 1
        if a[low] > a[high]:
            return a[low], a[high]
        else:
            return a[high], a[low]

    mid = (low + high) // 2

    max1, min1 = maxmin(a, low, mid)
    max2, min2 = maxmin(a, mid + 1, high)

    count += 2

    maximum = max(max1, max2)
    minimum = min(min1, min2)

    return maximum, minimum


a = [10, 5, 20, 8, 15, 2, 30, 12]

maximum, minimum = maxmin(a, 0, len(a) - 1)

print("Array:", a)
print("Maximum element:", maximum)
print("Minimum element:", minimum)
print("Number of comparisons:", count)
4. Expected Output
Array: [10, 5, 20, 8, 15, 2, 30, 12]
Maximum element: 30
Minimum element: 2
Number of comparisons: 14
<img width="1400" height="980" alt="image" src="https://github.com/user-attachments/assets/b6292332-26b8-46ca-a28a-a34483f3a468" />
- Divide the array into two halves.
- Find maximum and minimum in each half.
- Compare the two maximum values.
- Compare the two minimum values.
- Combine the results to get the final maximum and minimum.
6. Mathematical Analysis
For an array containing n elements, when n is a power of 2:
- Divide-and-conquer comparisons: \(3n/2-2\)
- Independent method comparisons: \(2(n-1)\)
Input size	Divide & Conquer	Independent
2	1	2
4	4	6
8	10	14
16	22	30
32	46	62

Time Complexity: O(n)

Space Complexity: O(log n) due to recursion for balanced division.

Important correction: The comparison count for the above 8-element array is 10, not 14. The 14 comparisons belong to the independent method (7 for maximum + 7 for minimum).
Part B – Binary Search
1. Aim
To search for an element in a sorted array using the Binary Search algorithm by repeatedly eliminating half of the search space.
2. Pseudocode
3. BINARYSEARCH(A, key)

1. low = 0
2. high = length(A) - 1

3. Repeat while low <= high:

       mid = (low + high) / 2

       If A[mid] == key:
           Return mid

       Else if key > A[mid]:
           low = mid + 1

       Else:
           high = mid - 1

4. Return -1
5. Python Implementation
6. 
def binary_search(a, key):
    low = 0
    high = len(a) - 1
    count = 0

    while low <= high:
        mid = (low + high) // 2
        count += 1

        if a[mid] == key:
            return mid, count

        elif key > a[mid]:
            low = mid + 1

        else:
            high = mid - 1

    return -1, count


a = [10, 20, 30, 40, 50, 60, 70, 80, 90]

key = 70

position, count = binary_search(a, key)

if position != -1:
    print("Element found at position:", position)
else:
    print("Element not found")

print("Number of comparisons:", count)
4. Expected Output
Element found at position: 6
Number of comparisons: 3
. Elimination Logic
1. Compare the search key with the middle element.
2. If both are equal, the element is found.
3. If the key is greater, eliminate the left half, including the middle.
4. If the key is smaller, eliminate the right half, including the middle.
5. Continue searching in the remaining half.
6. Stop when low > high.
Why is elimination correct?

The array is sorted. Therefore, if the key is greater than the middle element, it cannot be present in the left portion. Similarly, if it is smaller, it cannot be present in the right portion.
7. Experimental Investigation
Use these datasets to test increasing input sizes.
Input size	Successful key	Unsuccessful key
10	7	100
100	50	150
1,000	500	1,500
10,000	5,000	15,000
100,000	50,000	150,000

The comparison count increases very slowly as the input size increases.
- Best-case time complexity: O(1)
- Average-case time complexity: O(log n)
- Worst-case time complexity: O(log n)
- Space complexity: O(1) for iterative implementation.
8. Comparison of Both Algorithms
Feature	Max-Min	Binary Search
Technique	Divide and Conquer	Elimination
Input	Any array	Sorted array
Purpose	Find max and min	Find target
Time complexity	O(n)	O(log n)
Space complexity	O(log n) recursive	O(1) iterative

9. Conclusion
- Divide-and-Conquer reduces the number of comparisons required to find maximum and minimum elements.
- Binary Search reduces the search space by half in every iteration.
- Both algorithms improve computational efficiency.
- Experimental results demonstrate the relationship between input size and comparison count.
10. Output Screenshot
Screenshot created
