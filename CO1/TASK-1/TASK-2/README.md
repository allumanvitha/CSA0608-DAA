**1. Linear Search**
- Basic operation: Comparison of the target registration number with an array element (A[i] == target).
- Where it occurs: Inside the for loop.
- Why appropriate: Each comparison determines whether the required registration number has been found.
- Effect of input size (\(n\)): As the number of registration numbers increases, the number of comparisons increases. In the worst case, it performs \(n\) comparisons.
**2. Binary Search**
- Basic operation: Comparison of the target with the middle element (A[mid] == target).
- Where it occurs: Inside the while loop or recursive function.
- Why appropriate: This comparison determines whether to search the left half, right half, or stop.
- Effect of input size (\(n\)): Each comparison eliminates approximately half of the remaining elements. Therefore, the number of comparisons grows logarithmically, approximately \(\log_2 n\).
**3. Hash Table Search**
- Basic operation: Comparison of the target registration number with a key stored in the selected hash-table bucket (item == target).
- Where it occurs: Inside the loop that checks the bucket's elements.
- Why appropriate: The comparison confirms whether the target is present at the selected location.
- Effect of input size (\(n\)): With a good hash function and few collisions, the average number of comparisons remains approximately constant, \(O(1)\). If many keys collide, comparisons may increase to \(O(n)\).
**Summary Table**
Algorithm	Basic operation	Average number of operations
Linear Search	Target–element comparison	\(O(n)\)
Binary Search	Target–middle element comparison	\(O(\log n)\)
Hash Table Search	Target–key comparison	\(O(1)\)
**Conclusion:** The basic operation helps measure algorithm efficiency. Linear search performs more comparisons as the dataset grows, binary search reduces the search space by half, and hash table search usually provides constant-time lookup when collisions are limited.
