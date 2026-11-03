Q7 – Design Divide and Conquer from First Principles (10 Marks)
Note: Since the question does not specify a particular problem, we can use the Closest Pair of Points problem as an example. It is suitable because it clearly demonstrates decomposition, recursion, combining subproblem results, and experimental validation.
Stage 1 – Independent Design Proposal
Student A – Initial Proposal
1. Decomposition: Divide the given points into two halves based on their X-coordinate.
2. Base case: If the number of points is three or fewer, calculate all pairwise distances directly.
3. Required information: Each subproblem should return the minimum distance and the closest pair of points.
4. Combine strategy: Compare the minimum distances from both halves and check points near the dividing line.
Student B – Initial Proposal
1. Decomposition: Sort the points and divide them into left and right groups.
2. Base case: If there are only two points, calculate their distance directly.
3. Required information: Return the minimum distance from each group.
4. Combine strategy: Compare the left and right minimum distances and check points in the middle region.
Stage 2 – Compare the Two Designs
Design aspect	Student A	Student B
Decomposition	Divide by X-coordinate	Sort and divide into groups
Base case	Three or fewer points	Two points
Returned information	Minimum distance and pair	Minimum distance
Combine	Check middle region	Check middle region

Discussion:
- Both designs use the same basic divide-and-conquer approach.
- Student A's base case is useful because directly checking up to three points is simple.
- Student B's sorting idea helps organize the points before division.
- Returning the closest pair along with the distance makes it easier to identify the final answer.
- The final design combines the strongest ideas from both proposals.
- We also decided to maintain points sorted by Y-coordinate to reduce unnecessary comparisons in the middle region.
Stage 3 – Joint Final Design
1. Decomposition
- Sort all points according to their X-coordinate.
- Divide the points into left and right halves.
- Recursively find the closest pair in each half.
- Check points near the middle dividing line.
2. Subproblems
- Left subproblem: Find the closest pair in the left half.
- Right subproblem: Find the closest pair in the right half.
- Middle subproblem: Check whether a closer pair exists across the dividing line.
3. Base Case
If the number of points is three or fewer, calculate all possible pairwise distances and return the smallest distance.
4. Information Returned
Each recursive call returns:
- The minimum distance.
- The two points that produce that distance.
5. Combine Operation
- Find the smaller distance from the left and right halves.
- Create a middle strip containing points whose X-distance from the dividing line is less than the current minimum distance.
- Check nearby points in the strip, arranged by Y-coordinate.
- Return the smallest distance and its corresponding pair.
6. Complete Algorithm / Pseudocode

CLOSEST_PAIR(points):

1. Sort points by X-coordinate.
2. Sort points by Y-coordinate.

3. If number of points <= 3:
       Calculate all pairwise distances.
       Return the smallest distance and pair.

4. Divide points into:
       Left half
       Right half

5. left_result = CLOSEST_PAIR(left half)
6. right_result = CLOSEST_PAIR(right half)

7. best = minimum of left_result and right_result

8. Create a strip containing points close to
   the middle dividing line.

9. Sort/check strip points by Y-coordinate.
10. Compare each point with at most the next
    7 points in the strip.

11. Update best if a smaller distance is found.

12. Return the best distance and closest pair.



Stage 4 – Divide the Validation Responsibilities
Student A – Mathematical Validation
Recurrence relation:
\[
T(n)=2T(n/2)+O(n)
\]

Explanation:
- \(2T(n/2)\): Two recursive calls, one for the left half and one for the right half.
- \(O(n)\): Work required to combine the results, including checking the middle strip.
- Base case: \(T(3)=O(1)\), because a fixed number of points requires only a fixed number of comparisons.
Using the Master Theorem:
\[
T(n)=aT(n/b)+f(n)
\]

Here,
\[
a=2,\quad b=2,\quad f(n)=O(n)
\]

\[
n^{\log_b a}=n^{\log_2 2}=n
\]

Therefore,
\[
\boxed{T(n)=O(n\log n)}
\]

Complexity:
- Time complexity: \(O(n\log n)\)
- Auxiliary space: \(O(n)\), with an implementation that reuses temporary arrays for recursive partitions.
Student B – Experimental Validation
Test cases:
Test case	Points	Expected result
1	(1,2), (2,3)	Distance = 1.414
2	(0,0), (3,4), (1,1)	Distance = 1.414
3	(1,1), (5,5), (2,2), (8,8)	Distance = 1.414
4	(0,0), (0,0), (4,4)	Distance = 0
5	100 random points	Same answer as brute force

Experimental procedure:
1. Implement the divide-and-conquer algorithm.
2. Implement brute-force closest pair as a baseline.
3. Generate different point datasets.
4. Run both algorithms on the same datasets.
5. Record execution time and distance calculations.
6. Compare the results to verify correctness and performance.
Python code for testing:
import randomimport mathimport timedef brute_force(points):    best = float("inf")    count = 0    for i in range(len(points)):        for j in range(i + 1, len(points)):            count += 1            d = math.dist(points[i], points[j])            if d < best:                best = d    return best, countdef divide_conquer(points):    # Base case    if len(points) <= 3:        return brute_force(points)    # Divide    mid = len(points) // 2    left = points[:mid]    right = points[mid:]    # Conquer    d1, c1 = divide_conquer(left)    d2, c2 = divide_conquer(right)



Important implementation note
For a fully correct general implementation, the recursive algorithm must maintain the Y-sorted order of points in each subproblem. The simplified code above sorts the strip but does not maintain Y-sorted subproblem lists, so it is an illustration rather than a complete \(O(n\log n)\) implementation. Use the earlier full closest-pair implementation from Q5 for the final experiment, and compare its result with brute force.

Expected evidence:
- Both algorithms should return the same minimum distance.
- Brute force checks \(n(n-1)/2\) pairs.
- Divide and conquer reduces the number of distance calculations for sufficiently large datasets.
- Record actual execution times rather than assuming which implementation is faster.
Stage 5 – Cross-Defence
Student A – What experimental evidence supports the group's design?
- Both algorithms produce the same closest distance for the test datasets.
- Divide and conquer performs fewer distance calculations on larger datasets.
- The comparison count grows more slowly than brute force.
- These observations support the correctness and efficiency of the design.
Student B – How does the recurrence arise from the decomposition?
- The problem is divided into two halves.
- Each half contains approximately \(n/2\) points.
- Therefore, there are two recursive calls: \(2T(n/2)\).
- Combining the results requires \(O(n)\) work.
- Thus, the recurrence is \(T(n)=2T(n/2)+O(n)\).
Stage 6 – Joint Evaluation
1. Why is the problem suitable for Divide and Conquer?
- The points can be divided into two smaller groups.
- Each group can be solved independently.
- The results can be combined to find the global closest pair.
- The same process can be repeated recursively.
2. What computational work does decomposition reduce?
- It avoids checking every possible pair of points.
- It reduces unnecessary distance calculations.
- It improves the time complexity from \(O(n^2)\) to \(O(n\log n)\).
3. What additional costs does recursion introduce?
- Recursive function calls.
- Extra memory for storing subproblems.
- Sorting and combining operations.
- Stack memory for recursive execution.
4. When might Divide and Conquer not be appropriate?
- When the input size is very small.
- When the problem cannot be divided into useful independent subproblems.
- When combining results is more expensive than solving the original problem.
- When recursion and extra memory create too much overhead.
5. What should an algorithm designer look for before choosing Divide and Conquer?
1. The problem should be divisible into smaller subproblems.
2. The subproblems should be easier to solve.
3. Each subproblem should have a clear base case.
4. The subproblem results should be easy to combine.
5. The decomposition should reduce total computational work.
6. Recursion and memory costs should be acceptable.
7. The final algorithm should be tested against a straightforward solution.
Conclusion
- Divide and Conquer solves a large problem by dividing it into smaller problems.
- Each smaller problem is solved independently.
- The results are combined to obtain the final answer.
- In the closest-pair problem, it improves the time complexity from \(O(n^2)\) to \(O(n\log n)\).
- It is useful when decomposition reduces computational work and combining the results is efficient.
Final observation: An algorithm designer should choose Divide and Conquer only when the benefits of dividing the problem are greater than the additional costs of recursion, memory, and combining results.
