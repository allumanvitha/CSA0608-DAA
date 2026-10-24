Recursive Binary Search
**1. Input size of the original problem**
Let \(n\) be the number of sorted student registration numbers in the array.
**2. Size of the recursive subproblem**
Binary search compares the target with the middle element. If the target is not found, it searches either the left half or the right half.
Therefore, the next subproblem contains approximately \(n/2\) elements.
****3. Number of recursive calls**
At each step, the algorithm makes at most one recursive call, because it searches only one half of the array.
**4. Work performed outside the recursive call**
Before calling itself, the algorithm:
- Calculates the middle index.
- Compares the target with the middle element.
- Decides which half to search.
These operations require constant time, represented by \(c\).
**5. Base case**
The recursion stops when:
- The target is found, or
- The search interval becomes empty (\(low > high\)).
Both conditions require constant time, \(T(1)=c_0\), for a constant \(c_0\).
**6. Derivation of the recurrence relation**
For an input of size \(n\), the algorithm performs constant work and then searches a subproblem of approximately \(n/2\) elements.
Hence, the recurrence relation is:
\[
T(n)=T(n/2)+c,\quad n>1
\]
Base case:
\[
T(1)=c_0
\]
**7. Solving the recurrence**
Expanding the recurrence repeatedly:
\[
T(n)=T(n/2)+c
\]

\[
T(n)=T(n/4)+2c
\]

\[
T(n)=T(n/8)+3c
\]

After \(k\) steps:
\[
T(n)=T(n/2^k)+kc
\]

The recursion stops when \(n/2^k=1\). Therefore,
\[
k=\log_2 n
\]

Substituting this into the expression gives:
\[
T(n)=T(1)+c\log_2 n
\]

Thus, the time complexity is:
\[
\boxed{T(n)=\Theta(\log n)}
\]
**Conclusion:** Recursive binary search makes at most one recursive call per step and halves the search space each time. Therefore, its time complexity is logarithmic, making it efficient for searching large, sorted student registration databases.
