**1. Linear Search**
Basic operation: Comparing the target registration number with each array element.
**Step 1: Best case**
If the target is the first element, only one comparison is required.
\[
T(n)=1
\]
Therefore, best-case complexity is \(O(1)\).
**Step 2: Worst case**
If the target is the last element or is not present, all \(n\) elements are checked.
\[
C(n)=n
\]
Assuming each comparison takes constant time \(c\),
\[
T(n)=c n+d
\]
where \(c\) is the time per comparison and \(d\) is the fixed overhead.
Therefore, worst-case complexity is \(O(n)\).
**Step 3: Preprocessing cost**
Linear search does not require sorting or restructuring.
\[
T_{\text{total}}(n)=T_{\text{preprocessing}}+T_{\text{search}}
\]
\[
T_{\text{total}}(n)=0+O(n)=O(n)
\]
**2. Binary Search**
Basic operation: Comparing the target with the middle element of the sorted array.
**Step 1:** Reduction in search space
After each comparison, approximately half of the elements remain.
\[
n,\frac{n}{2},\frac{n}{4},\frac{n}{8},\ldots
\]
After \(k\) comparisons, the remaining search space is approximately
\[
\frac{n}{2^k}
\]
The search stops when approximately one element remains:
\[
\frac{n}{2^k}=1
\]
\[
n=2^k
\]
Taking logarithms to base 2,
\[
k=\log_2 n
\]
**Step 2: **Time-complexity function
If each comparison takes constant time \(c\),
\[
T(n)=c\log_2 n+d
\]
Therefore, the worst-case searching complexity is \(O(\log n)\).
**Step 3: Preprocessing cost**
Binary search requires the registration numbers to be sorted. Using an efficient comparison-based sorting algorithm:
\[
T_{\text{sort}}(n)=O(n\log n)
\]
Hence,
\[
T_{\text{total}}(n)=T_{\text{sort}}(n)+T_{\text{search}}(n)
\]

\[
=O(n\log n)+O(\log n)
\]

\[
\boxed{T_{\text{total}}(n)=O(n\log n)}
\]

If the dataset is already sorted, the searching cost alone is \(O(\log n)\).
**3. Hash Table Search**
Basic operation: Comparing the target registration number with keys stored in the selected hash-table bucket.
Step 1: Preprocessing cost
Each registration number is inserted into the hash table. Assuming a good hash function and suitable table size, the average insertion cost is constant.
\[
T_{\text{build}}(n)=c n+d
\]
Therefore, average hash-table construction takes \(O(n)\) time.
Step 2: Searching cost
With few collisions, the target can usually be found with a constant number of comparisons.
\[
C(n)\approx 1
\]

Thus, average searching time is
\[
T_{\text{search}}(n)=c+d
\]

Therefore, average searching complexity is \(O(1)\).

In the worst case, if all registration numbers fall into the same bucket, up to \(n\) comparisons may be needed:
\[
C(n)=n
\]

Hence, worst-case searching complexity is \(O(n)\).

Step 3: Total cost

For average-case construction and one search,
\[
T_{\text{total}}(n)=T_{\text{build}}(n)+T_{\text{search}}(n)
\]

\[
=O(n)+O(1)
\]

\[
\boxed{T_{\text{total}}(n)=O(n)}
\]
If the hash table is already built and reused for many searches, each search takes average \(O(1)\) time.
**4. Comparison of Mathematical Results**
Algorithm	Search operation count	Preprocessing	Overall cost for one search
Linear Search	\(n\) worst case	None	\(O(n)\)
Binary Search	\(\log_2 n\) worst case	Sorting: \(O(n\log n)\)	\(O(n\log n)\)
Hash Table	Approximately constant on average	Building: \(O(n)\)	\(O(n)\)
O(1)
O(log n)
O(n)
O(n log n)
O(n²)
O(2ⁿ)
10203040506050100150200Input size nOps
\(n=16:\quad (1,\log_2n,n)=(1,4,16)\)
\((n\log_2n,n^2)=(64,256)\)
\(2^n=65,536\)
\(n\)
48163264
Give feedback
**Conclusion**
Linear search has a linear operation count because it may examine every element. Binary search has a logarithmic search count because it halves the search space at each step. Hash table search usually takes constant time after construction, but building the table requires linear average time. Therefore, preprocessing costs must be included when comparing the total cost of locating a registration number.
