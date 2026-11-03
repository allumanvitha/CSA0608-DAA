Q4 – The Reality of Strassen's Matrix Multiplication
7 Marks
Below is the complete assignment answer with simple explanations, pseudocode, Python programs, output, mathematical analysis, experimental testing, and viva questions.
1. Aim
To implement and compare Conventional Matrix Multiplication and Strassen's Matrix Multiplication and analyse how reducing the number of multiplications affects execution time and performance.
2. Conventional Matrix Multiplication
Explanation
Conventional Matrix Multiplication is the normal method of multiplying two matrices.
- Take two matrices A and B.
- Multiply each row of matrix A with each column of matrix B.
- Add the multiplication results.
- Store the result in matrix C.
- Repeat until all elements are calculated.
For two n × n matrices, the total number of scalar multiplications is:
\[
n^3
\]

Example
Matrix A:
\[
A=\begin{bmatrix}1&2\\3&4\end{bmatrix}
\]

Matrix B:
\[
B=\begin{bmatrix}5&6\\7&8\end{bmatrix}
\]

Result:
\[
C=\begin{bmatrix}19&22\\43&50\end{bmatrix}
\]




A
2
1
3
4
0
2



×
B
5
2
1
4
3
7



=
AB
20292622









\(\left(AB\right)_{11}=(2\cdot 5)+(1\cdot 1)+(3\cdot 3)=20\)

Row
12




Column
12










Give feedback

3. Conventional Multiplication Pseudocode
MATRIX_MULTIPLY(A, B, n)

1. Create result matrix C with zeros.

2. For i = 0 to n-1:

       For j = 0 to n-1:

           For k = 0 to n-1:

               C[i][j] = C[i][j] + A[i][k] * B[k][j]

3. Return C


4. Conventional Python Implementation
def conventional(A, B):    n = len(A)    C = [[0 for j in range(n)] for i in range(n)]    count = 0    for i in range(n):        for j in range(n):            for k in range(n):                C[i][j] += A[i][k] * B[k][j]                count += 1    return C, countA = [[1, 2],     [3, 4]]B = [[5, 6],     [7, 8]]C, count = conventional(A, B)print("Result Matrix:")for row in C:    print(row)print("Multiplication Count:", count)



Expected Output
Result Matrix:
[19, 22]
[43, 50]
Multiplication Count: 8


5. Strassen's Matrix Multiplication
Explanation
Strassen's Matrix Multiplication is a Divide-and-Conquer algorithm used to multiply large matrices efficiently.
- Divide each matrix into four smaller blocks.
- Calculate seven multiplication operations instead of eight.
- Use addition and subtraction to form the required products.
- Combine the seven products to obtain the final matrix.
Main advantage: Strassen reduces eight block multiplications to seven block multiplications.
A. Conventional Block Decomposition
Consider two matrices divided into four blocks:
\[
A=\begin{bmatrix}A_{11}&A_{12}\\A_{21}&A_{22}\end{bmatrix}
\]

\[
B=\begin{bmatrix}B_{11}&B_{12}\\B_{21}&B_{22}\end{bmatrix}
\]

Conventional multiplication requires eight block multiplications:
1. A11 × B11
2. A12 × B21
3. A11 × B12
4. A12 × B22
5. A21 × B11
6. A22 × B21
7. A21 × B12
8. A22 × B22
B. Strassen's Seven Multiplications
Strassen reduces these eight multiplications to seven.
\[
M_1=(A_{11}+A_{22})(B_{11}+B_{22})
\]

\[
M_2=(A_{21}+A_{22})B_{11}
\]

\[
M_3=A_{11}(B_{12}-B_{22})
\]

\[
M_4=A_{22}(B_{21}-B_{11})
\]

\[
M_5=(A_{11}+A_{12})B_{22}
\]

\[
M_6=(A_{21}-A_{11})(B_{11}+B_{12})
\]

\[
M_7=(A_{12}-A_{22})(B_{21}+B_{22})
\]

C. Reconstructing the Final Matrix
Using these seven multiplication results:
\[
C_{11}=M_1+M_4-M_5+M_7
\]

\[
C_{12}=M_3+M_5
\]

\[
C_{21}=M_2+M_4
\]

\[
C_{22}=M_1-M_2+M_3+M_6
\]

The four blocks are combined to form the final result.
6. Why is Strassen Correct?
Strassen's method uses algebraic addition and subtraction to rearrange the original eight block products.

When the seven calculated products are substituted into the four reconstructed expressions:
- C11 becomes A11B11 + A12B21.
- C12 becomes A11B12 + A12B22.
- C21 becomes A21B11 + A22B21.
- C22 becomes A21B12 + A22B22.
These are exactly the four blocks produced by conventional matrix multiplication.

Therefore, Strassen produces the same correct result as conventional multiplication.

7. Strassen Pseudocode
STRASSEN(A, B)

1. If matrix size is 1:
       Return A * B

2. Divide A and B into four blocks.

3. Calculate M1, M2, M3, M4,
   M5, M6 and M7.

4. Calculate:
       C11 = M1 + M4 - M5 + M7
       C12 = M3 + M5
       C21 = M2 + M4
       C22 = M1 - M2 + M3 + M6

5. Combine C11, C12, C21, C22.

6. Return result matrix C.


8. Strassen Python Implementation
This implementation also handles matrices whose dimensions are not powers of two by padding them with zeros.
def add(A, B):    n = len(A)    return [[A[i][j] + B[i][j] for j in range(n)]            for i in range(n)]def sub(A, B):    n = len(A)    return [[A[i][j] - B[i][j] for j in range(n)]            for i in range(n)]def conventional(A, B):    n = len(A)    C = [[0]*n for i in range(n)]    count = 0    for i in range(n):        for j in range(n):            for k in range(n):                C[i][j] += A[i][k] * B[k][j]                count += 1    return C, countdef strassen(A, B, count):    n = len(A)    if n == 1:        count[0] += 1        return [[A[0][0] * B[0][0]]]    mid = n // 2



Expected Output
Result Matrix:
[19, 22]
[43, 50]
Multiplication Count: 7


9. Correctness Verification
Both algorithms should produce the same output.

Test with:
A = [[1, 2, 3],     [4, 5, 6],     [7, 8, 9]]B = [[9, 8, 7],     [6, 5, 4],     [3, 2, 1]]C1, count1 = conventional(A, B)C2, count2 = strassen_multiply(A, B)print("Conventional Result:", C1)print("Strassen Result:", C2)print("Both results are equal:", C1 == C2)



Expected output:
Conventional Result:
[[30, 24, 18],
 [84, 69, 54],
 [138, 114, 90]]

Strassen Result:
[[30, 24, 18],
 [84, 69, 54],
 [138, 114, 90]]

Both results are equal: True


10. Padding Explanation – Student B
Strassen works most simply when the matrix size is a power of two.

For example:
- 2 × 2: No padding required.
- 4 × 4: No padding required.
- 3 × 3: Convert to 4 × 4.
- 5 × 5: Convert to 8 × 8.
How padding works:
1. Find the next power of two greater than or equal to the matrix size.
2. Add zero rows and columns to both matrices.
3. Perform Strassen multiplication.
4. Remove the extra rows and columns from the final result.
Padding does not change the original matrix multiplication result because the added values are zero.

11. Student A – Experimental and Engineering Analysis
Student A must compare both algorithms using different matrix sizes.
A. Experimental input sizes
Use the following matrix dimensions:
Experiment	Matrix size
1	2 × 2
2	4 × 4
3	8 × 8
4	16 × 16
5	32 × 32
6	64 × 64

For each experiment:
1. Generate two random square matrices.
2. Execute conventional multiplication.
3. Execute Strassen multiplication.
4. Record multiplication counts.
5. Repeat timing experiments three or more times.
6. Calculate median execution time.
7. Verify that both results are equal.
B. Experimental Python Program
Run this program after the two implementations above.
import randomimport timeimport statisticssizes = [2, 4, 8, 16, 32, 64]print("Matrix Size | Normal Count | Strassen Count")print("---------------------------------------------")for n in sizes:    A = [[random.randint(1, 9) for j in range(n)]         for i in range(n)]    B = [[random.randint(1, 9) for j in range(n)]         for i in range(n)]    normal_times = []    strassen_times = []    for r in range(3):        start = time.perf_counter()        C1, count1 = conventional(A, B)        normal_times.append(time.perf_counter() - start)        start = time.perf_counter()        C2, count2 = strassen_multiply(A, B)        strassen_times.append(time.perf_counter() - start)        assert C1 == C2    t1 = statistics.median(normal_times)    t2 = statistics.median(strassen_times)



C. Theoretical Multiplication Count
For square matrices with dimensions that are powers of two:
Matrix size	Conventional	Strassen
2 × 2	8	7
4 × 4	64	49
8 × 8	512	343
16 × 16	4,096	2,401
32 × 32	32,768	16,807
64 × 64	262,144	117,649

These are scalar multiplication counts for the recursive implementation with a 1 × 1 base case, not measured execution times.
D. Why can Strassen be slower for small matrices?
1. It performs many addition and subtraction operations.
2. It creates several temporary matrices.
3. It makes multiple recursive function calls.
4. It requires extra memory.
5. Padding may increase the matrix size.
6. Memory allocation and copying can increase execution time.
Therefore, conventional multiplication can be faster for small matrices.
E. Practical Crossover Range
Crossover is the approximate matrix size at which Strassen becomes faster than conventional multiplication.
- Before crossover: Conventional multiplication may be faster.
- Near crossover: Both algorithms may have similar execution times.
- After crossover: Strassen may become faster.
The crossover point is not fixed. It depends on the programming language, hardware, implementation, memory usage, and recursion threshold.

Important: Do not write an assumed crossover size in your report. Use the actual timing results from your experiment.
12. Memory and Cache Effects
- Conventional multiplication uses simple loops and can have good cache behaviour.
- Strassen creates intermediate matrices and needs additional memory.
- Recursive calls increase memory allocation.
- Padding can increase memory usage.
- Cache misses may reduce performance when matrices become large.
- Efficient matrix storage and optimized code can improve performance.

13. Complexity Analysis
Feature	Conventional	Strassen
Number of block multiplications	8	7
Recurrence	8T(n/2) + O(n²)	7T(n/2) + O(n²)
Time complexity	O(n³)	O(n^2.807)
Method	Three nested loops	Divide and Conquer
Extra operations	Fewer	More additions/subtractions
Memory overhead	Lower	Higher

Strassen recurrence:
\[
T(n)=7T(n/2)+O(n^2)
\]

Using the Master Theorem:
\[
\boxed{T(n)=O(n^{\log_2 7})}
\]

\[
\boxed{T(n)=O(n^{2.807)}
}
\]

This is asymptotically better than conventional matrix multiplication.
14. Joint Engineering Decision
Question: Under what conditions would you use conventional matrix multiplication even though Strassen has superior asymptotic complexity?

Answer:

We would select conventional matrix multiplication under the following conditions:
1. Small matrices: Conventional multiplication is simple and fast for small matrix sizes.
2. Limited memory: It requires less additional memory.
3. Less overhead: It does not require complex recursive operations.
4. Simple implementation: It is easy to understand, implement, and debug.
5. Padding requirements: If matrix dimensions are irregular, Strassen may require extra zero-padding.
6. Cache efficiency: Conventional multiplication can perform well with optimized loops and memory access.
7. Practical execution time: If experiments show conventional multiplication is faster, we should prefer it.
Final decision: Use conventional multiplication for small matrices and Strassen for sufficiently large matrices when experimental results show that its reduction in multiplication work outweighs its additional overhead.
15. Conclusion
- Conventional multiplication uses eight block multiplications.
- Strassen reduces the number of block multiplications from eight to seven.
- Conventional multiplication has O(n³) time complexity.
- Strassen has O(n^2.807) time complexity.
- Strassen is theoretically faster for large matrices.
- However, recursion, addition, subtraction, memory allocation, and padding introduce overhead.
- Experimental results help identify which algorithm is suitable for a particular matrix size.
16. Viva Questions and Answers
1. What is Strassen's algorithm?

It is a Divide-and-Conquer algorithm used for efficient matrix multiplication.

2. Who developed Strassen's algorithm?

Volker Strassen.

3. How many multiplications are used in conventional block multiplication?

Eight.

4. How many multiplications are used in Strassen's algorithm?

Seven.

5. What is the time complexity of conventional multiplication?

O(n³).

6. What is the time complexity of Strassen's algorithm?

O(n^2.807).

7. What is padding?

Adding zero rows and columns to make the matrix size a power of two.

8. Why can Strassen be slower for small matrices?

Because of recursive calls, additional calculations, and memory overhead.

9. What is crossover point?

The matrix size at which Strassen becomes faster than conventional multiplication.

10. Why do we verify both results?

To ensure that both algorithms produce the same correct matrix.

17. Individual Responsibilities
Student	Main responsibility
Student A	Experimental testing, timing, multiplication counts, crossover and engineering analysis
Student B	Block decomposition, seven multiplications, algebraic correctness and padding
