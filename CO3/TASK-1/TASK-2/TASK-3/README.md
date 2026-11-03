Q3 – Breaking the Quadratic Barrier: Karatsuba Multiplication
7 Marks
This assignment includes the algorithm derivation, pseudocode, Python implementation, multiplication count, timing experiments, crossover analysis, and conclusion in simple language.
1. Aim
To implement and compare Standard Multiplication and Karatsuba Multiplication and analyse how Karatsuba reduces the number of recursive multiplications and improves performance for large integers.
2. Standard Multiplication
Explanation
Standard multiplication is the normal method of multiplying two numbers.
- Multiply each digit of the first number by every digit of the second number.
- Add the partial products.
- Generate the final result.
- It requires approximately \(n^2\) single-digit multiplications for two n-digit numbers.
Pseudocode
STANDARD_MULTIPLY(A, B)

1. Convert A and B into digit arrays.
2. Create a result array.
3. For each digit in A:
       For each digit in B:
           Multiply the two digits.
           Add the result to the correct position.
4. Handle carry values.
5. Return the final result.


Python Implementation
def standard_multiply(a, b):    x = list(map(int, str(a)[::-1]))    y = list(map(int, str(b)[::-1]))    result = [0] * (len(x) + len(y))    count = 0    for i in range(len(x)):        for j in range(len(y)):            result[i+j] += x[i] * y[j]            count += 1    for i in range(len(result)-1):        carry = result[i] // 10        result[i] %= 10        result[i+1] += carry    answer = int(''.join(map(str, result[::-1])))    return answer, counta = 1234b = 5678answer, count = standard_multiply(a, b)print("Multiplication result:", answer)print("Multiplication count:", count)



Expected Output
Multiplication result: 7006652
Multiplication count: 16


3. Karatsuba Multiplication
Explanation
Karatsuba is a Divide-and-Conquer multiplication algorithm.

It divides two large numbers into smaller parts and reduces four recursive multiplications to only three.

Consider two numbers:
\[
X=1234,\quad Y=5678
\]

Divide them into two parts:
\[
X=a\times10^m+b
\]

\[
Y=c\times10^m+d
\]

For example:
- a = 12
- b = 34
- c = 56
- d = 78
The multiplication is calculated using three products:
\[
z_2=a\times c
\]

\[
z_0=b\times d
\]

\[
z_1=(a+b)(c+d)-z_2-z_0
\]

Finally, combine the results:
\[
XY=z_2\times10^{2m}+z_1\times10^m+z_0
\]

Main advantage: Normal multiplication requires four recursive multiplications after decomposition, but Karatsuba requires only three.
4. Karatsuba Decomposition Diagram
Karatsuba Multiplication
X = 1234

a = 12

b = 34


Y = 5678

c = 56

d = 78



z₂

a × c

12 × 56


z₀

b × d

34 × 78


z₁

(a+b)(c+d)

−z₂−z₀



Combine the three results

Final answer = 7006652


5. Karatsuba Pseudocode
KARATSUBA(X, Y)

1. If X or Y has one digit:
       Return X * Y

2. Find the maximum number of digits.

3. Divide X into a and b.

4. Divide Y into c and d.

5. z2 = KARATSUBA(a, c)

6. z0 = KARATSUBA(b, d)

7. z1 = KARATSUBA(a+b, c+d) - z2 - z0

8. Return z2 * 10^(2*m)
         + z1 * 10^m
         + z0


6. Karatsuba Python Implementation
def karatsuba(x, y):    global count    if x < 10 or y < 10:        count += 1        return x * y    n = max(len(str(x)), len(str(y)))    m = n // 2    power = 10 ** m    a = x // power    b = x % power    c = y // power    d = y % power    z2 = karatsuba(a, c)    z0 = karatsuba(b, d)    z1 = karatsuba(a+b, c+d) - z2 - z0    return z2 * (10 ** (2*m)) + z1 * power + z0count = 0a = 1234b = 5678answer = karatsuba(a, b)print("Multiplication result:", answer)print("Multiplication count:", count)



Expected Output
Multiplication result: 7006652
Multiplication count: 9


Karatsuba uses 9 single-digit multiplication operations for this example, compared with 16 for standard multiplication.

7. Student A – Algorithmic Derivation
A. How are integers decomposed?
Two large integers are divided into two smaller parts.

For example:
X = 1234
Y = 5678

X = 12 × 100 + 34
Y = 56 × 100 + 78


Here, the number is divided into higher and lower parts.
B. How are subproblems formed?
Karatsuba creates three multiplication subproblems:
1. Multiply the higher parts.
2. Multiply the lower parts.
3. Multiply the sum of both parts.
These three results are combined to produce the final answer.
C. Why does Karatsuba reduce multiplication?
- Standard multiplication requires four recursive multiplications after dividing the numbers.
- Karatsuba requires only three recursive multiplications.
- This reduces the total multiplication work for large numbers.
D. Recurrence Relation
For Standard Multiplication:
\[
T(n)=4T(n/2)+O(n)
\]

Therefore:
\[
T(n)=O(n^2)
\]

For Karatsuba:
\[
T(n)=3T(n/2)+O(n)
\]

Using the Master Theorem:
\[
T(n)=O(n^{\log_2 3})
\]

\[
\boxed{T(n)=O(n^{1.585})}
\]

E. Complexity Comparison
Algorithm	Time Complexity
Standard Multiplication	O(n²)
Karatsuba Multiplication	O(n^1.585)

Karatsuba is asymptotically faster for sufficiently large inputs.
8. Student B – Crossover Investigation
A. Experimental Input Sizes
We can test the following input sizes:
Experiment	Number of digits
1	8
2	16
3	32
4	64
5	128
6	256
7	512

For each input size:
- Generate two large random integers.
- Run Standard Multiplication.
- Run Karatsuba Multiplication.
- Repeat the experiment five times.
- Calculate the median execution time.
- Record the multiplication counts.
- Compare both algorithms.
B. Experimental Python Program
The following program performs repeated timing experiments and identifies the approximate crossover range on your computer.
import randomimport timeimport statistics# Standard multiplicationdef standard(a, b):    x = list(map(int, str(a)[::-1]))    y = list(map(int, str(b)[::-1]))    result = [0] * (len(x) + len(y))    count = 0    for i in range(len(x)):        for j in range(len(y)):            result[i+j] += x[i] * y[j]            count += 1    for i in range(len(result)-1):        result[i+1] += result[i] // 10        result[i] %= 10    return int(''.join(map(str, result[::-1]))), count# Karatsuba multiplicationdef karatsuba(a, b, counter):    if a < 10 or b < 10:        counter[0] += 1        return a * b    n = max(len(str(a)), len(str(b)))    m = n // 2    p = 10 ** m    x1, x0 = divmod(a, p)



C. Experimental Observation
The following table represents the theoretical multiplication-count trend for powers of two, assuming balanced recursive splits and one-digit base cases.
Digits	Standard multiplication	Ideal Karatsuba count
8	64	27
16	256	81
32	1,024	243
64	4,096	729
128	16,384	2,187

Actual counts in the Python implementation may differ because the sums in Karatsuba can produce an extra digit.
D. Why can Karatsuba perform worse for small inputs?
1. It requires recursive function calls.
2. It repeatedly divides numbers into smaller parts.
3. It performs additional addition and subtraction operations.
4. It creates intermediate values.
5. These operations introduce overhead for small numbers.
Therefore, Standard Multiplication can be faster for small inputs even though its asymptotic complexity is higher.
E. What is crossover?
Crossover is the approximate input size at which Karatsuba becomes faster than Standard Multiplication.
- Before crossover: Standard Multiplication may be faster.
- At crossover: Both algorithms have similar execution times.
- After crossover: Karatsuba may become faster.
The exact crossover point depends on the computer, Python implementation, and algorithm implementation. Use the benchmark results rather than assuming a fixed value.

9. Why does Karatsuba have overhead?
Karatsuba reduces recursive multiplications, but it introduces additional work:
- Splitting large integers.
- Creating temporary variables.
- Performing additions and subtractions.
- Making recursive function calls.
- Combining intermediate results.
These operations take time and memory. For small numbers, this overhead can be greater than the time saved by reducing multiplication operations.
10. Joint Conclusion
Better asymptotic complexity does not automatically mean better performance for every input size.
- Standard Multiplication is simple and works well for small numbers.
- Karatsuba reduces the number of recursive multiplications.
- Karatsuba has better asymptotic complexity for large numbers.
- Recursive calls and decomposition create overhead.
- Therefore, Standard Multiplication may perform better for small inputs, while Karatsuba may perform better for large inputs.
- The best algorithm should be selected based on input size and experimental performance.
11. Final Comparison
Feature	Standard	Karatsuba
Technique	Normal multiplication	Divide and Conquer
Recursive products	4	3
Time complexity	O(n²)	O(n^1.585)
Small inputs	Usually efficient	Overhead can be high
Large inputs	Slower growth	Faster growth
Extra overhead	Low	Higher

12. Viva Questions and Answers
1. What is Karatsuba multiplication?

It is an algorithm used to multiply large integers efficiently.

2. Who developed Karatsuba multiplication?

Anatoly Karatsuba.

3. What is the main advantage of Karatsuba?

It reduces four recursive multiplications to three.

4. What is its time complexity?

O(n^1.585).

5. What is the time complexity of standard multiplication?

O(n²).

6. What is crossover point?

It is the input size at which Karatsuba becomes faster than standard multiplication.

7. Why is Karatsuba slower for small numbers?

Because of recursive calls, decomposition, and additional operations.

8. Which algorithm is better for large integers?

Karatsuba multiplication, once the input is sufficiently large.

9. What is the recurrence relation of Karatsuba?
\[
T(n)=3T(n/2)+O(n)
\]

10. What is the main conclusion?

An algorithm with better theoretical complexity may not always be faster for small inputs.

Important correction for your Part 6 sample: For the provided Karatsuba code and inputs 1234 and 5678, the actual multiplication count is 11, not 9. The correct output is:
Multiplication result: 7006652
Multiplication count: 11
