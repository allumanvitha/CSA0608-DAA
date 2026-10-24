**1. Linear Search**
Linear search checks registration numbers one by one from the beginning of the list.
- Best case: The target registration number is the first element. Only one comparison is required, so \(C(n)=1\). The time complexity is \(O(1)\).
- Average case: The target is equally likely to be at any position in the list. For a successful search, the average number of comparisons is
\[
C(n)=\frac{1+2+\cdots+n}{n}=\frac{n+1}{2}
\]
Therefore, the average time complexity is \(O(n)\).
- Worst case: The target is the last element or is absent. The algorithm checks all \(n\) elements, so \(C(n)=n\), giving \(O(n)\).
Reason: Linear search does not eliminate any elements during searching. As the dataset grows, the number of comparisons may increase proportionally to \(n\).
**2. Binary Search**
Binary search repeatedly divides a sorted list into two halves.
- Best case: The target is exactly the middle element. Only one comparison is required, giving \(O(1)\).
- Average case: The target is located at different possible positions in the sorted list. The algorithm eliminates approximately half the remaining elements after each comparison. The number of comparisons grows logarithmically, giving \(O(\log n)\).
- Worst case: The target is absent or is found only after repeatedly narrowing the search interval to the final level. The maximum number of comparisons is approximately
\[
C(n)=\lfloor\log_2 n\rfloor+1
\]
Therefore, the worst-case time complexity is \(O(\log n)\).
Reason: Binary search discards half of the remaining search space after each comparison. Thus, even when the dataset becomes large, the number of additional comparisons increases slowly.
Note: Sorting is required before searching if the registration numbers are not already sorted. This preprocessing cost should be considered separately.
**3. Hash Table Search**
Hash table search uses a hash function to identify the bucket where a registration number should be stored. Assume separate chaining is used to handle collisions.
- Best case: The target is the first item in its bucket, and no collision needs to be checked. The algorithm performs one key comparison, giving \(O(1)\).
- Average case: The hash function distributes registration numbers evenly across buckets, with a reasonable load factor. Only a small number of keys need to be checked, so the expected search time is \(O(1)\).
- Worst case: Many or all registration numbers map to the same bucket. The algorithm may compare the target against all \(n\) keys, giving \(C(n)=n\) and \(O(n)\).
Reason: Hash table performance depends on the quality of the hash function and the number of collisions. Good distribution provides fast access, whereas frequent collisions increase the number of comparisons.
Building the hash table requires approximately \(O(n)\) time on average, but this cost can be shared across repeated searches.
**4. Overall Comparison**
Algorithm	Best case	Average case	Worst case
Linear Search	\(O(1)\)	\(O(n)\)	\(O(n)\)
Binary Search	\(O(1)\)	\(O(\log n)\)	\(O(\log n)\)
Hash Table Search	\(O(1)\)	\(O(1)\) expected	\(O(n)\)
**Conclusion**
Linear search performs well when the target is near the beginning, but its performance decreases as more elements must be checked. Binary search provides consistently efficient searching when the data is sorted. Hash table search is generally fastest for repeated lookups when collisions are limited, although poor key distribution can increase its running time to linear complexity.
