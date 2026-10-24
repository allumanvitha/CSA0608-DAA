**1. Recurrence Relation**
From Task 6, the recursive binary search recurrence relation is:
\[
T(n)=T(n/2)+c,\quad n>1
\]

Base case:
\[
T(1)=c_0
\]

Here, \(n\) is the number of sorted registration numbers, \(T(n)\) is the running time, and \(c\) is the constant time required for calculating the middle index and performing comparisons.
******2. Selected Method: *Iteration Method****
The iteration method is appropriate because binary search reduces the problem size by half in each recursive call and performs constant work at every step.
**3. Step-by-Step Solution**
Step 1: Expand the recurrence
\[
T(n)=T(n/2)+c
\]

Substitute \(T(n/2)\):
\[
T(n)=T(n/4)+c+c
\]

\[
T(n)=T(n/4)+2c
\]

Step 2: Expand further
\[
T(n)=T(n/8)+3c
\]

After \(k\) iterations:
\[
T(n)=T(n/2^k)+kc
\]

Step 3: Apply the base case

The recursion stops when the subproblem contains one element:
\[
\frac{n}{2^k}=1
\]

Therefore,
\[
n=2^k
\]

Taking logarithms to base 2:
\[
k=\log_2 n
\]

Step 4: Substitute into the recurrence

Using \(T(1)=c_0\):
\[
T(n)=T(1)+c\log_2 n
\]

\[
T(n)=c_0+c\log_2 n
\]

Hence, the time complexity is:
\[
\boxed{T(n)=\Theta(\log n)}
\]
**4. Interpretation**
As the number of student registration numbers increases, recursive binary search requires only a small increase in comparisons because it eliminates half of the remaining elements at every step.
For example:
Dataset size	Maximum comparisons
1,000	10
10,000	14
100,000	17
1,000,000	20
These values use the approximate worst-case comparison count \(\lfloor\log_2 n\rfloor+1\).
**Conclusion**
The iteration method shows that recursive binary search has logarithmic time complexity, \(\Theta(\log n)\). This means it can efficiently locate student registration numbers in large, sorted datasets. The analysis covers the searching process only; any sorting required beforehand must be considered separately.
