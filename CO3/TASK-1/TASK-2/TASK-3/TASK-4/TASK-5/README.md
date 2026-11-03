Q5 – Upgrading Closest Pair Using Divide and Conquer
6 Marks
This assignment includes the aim, brute-force approach, Divide-and-Conquer explanation, pseudocode, Python implementation, experimental comparison, output, complexity analysis, and viva questions.
1. Aim
To implement and compare Brute-Force Closest Pair and Divide-and-Conquer Closest Pair algorithms to find the two nearest points in a 2D plane and analyse their computational efficiency.
2. Closest Pair Problem
The Closest Pair Problem finds the two points having the minimum distance among a given set of points.

Example:
Points:
(2, 3)
(12, 30)
(40, 50)
(5, 1)
(12, 10)
(3, 4)


The closest points are:
(2, 3) and (3, 4)


Their distance is:
\[
d=\sqrt{(3-2)^2+(4-3)^2}
\]

\[
d=\sqrt{2}=1.414
\]

3. Brute-Force Closest Pair
Explanation
Brute Force is the simple method used to find the closest pair.
- Take the first point.
- Calculate its distance from every other point.
- Repeat for all remaining points.
- Find the smallest distance.
- Return the two closest points.
Pseudocode
BRUTE_FORCE(points)

1. Set minimum distance = infinity.

2. For i = 0 to n-1:

       For j = i+1 to n-1:

           Calculate distance between points[i]
           and points[j].

           If distance < minimum distance:

               Update minimum distance.

               Store the closest points.

3. Return closest points and minimum distance.


Python Implementation
import mathdef brute_force(points):    minimum = float('inf')    pair = None    count = 0    for i in range(len(points)):        for j in range(i+1, len(points)):            x1, y1 = points[i]            x2, y2 = points[j]            distance = math.sqrt(                (x2-x1)**2 + (y2-y1)**2            )            count += 1            if distance < minimum:                minimum = distance                pair = (points[i], points[j])    return pair, minimum, countpoints = [    (2, 3),    (12, 30),    (40, 50),    (5, 1),    (12, 10),    (3, 4)]



Expected Output
Closest Pair: ((2, 3), (3, 4))
Minimum Distance: 1.414
Distance Calculations: 15


Time Complexity: O(n²)

Space Complexity: O(1), excluding input storage.
4. Divide-and-Conquer Closest Pair
Explanation
Divide-and-Conquer is an improved method for finding the closest pair.

Steps:
1. Sort the points based on their X coordinates.
2. Divide the points into two halves.
3. Find the closest pair in the left half.
4. Find the closest pair in the right half.
5. Select the smaller distance.
6. Check points near the dividing boundary.
7. Return the final closest pair.
Decomposition Diagram
All Points

Find closest pair among n points

Left Half

n/2 points


Right Half

n/2 points



Closest left pair

dL


Closest right pair

dR



Boundary Strip

Check nearby points across the dividing line

Final Closest Pair

Minimum of left, right and strip distances


5. Student A – Decomposition Design
A. How are the points organised?
- First, points are sorted by X coordinate.
- Another sorted list is maintained based on Y coordinate.
- This helps divide the points efficiently and check the boundary region.
B. How is the problem divided?
- Divide the sorted points into left and right halves.
- Recursively find the closest pair in each half.
- Continue until each subproblem contains a small number of points.
- For small groups, use brute force.
C. What does each recursive call return?
Each recursive call returns:
1. The minimum distance found in that group.
2. The two points producing that distance.
3. The points ordered by Y coordinate for the next stage.
D. Explain the combine operation
- Compare the minimum distance from the left and right halves.
- Select the smaller distance.
- Create a strip around the dividing boundary.
- Check nearby points inside the strip.
- Update the closest pair if a smaller distance is found.
E. Why does the dividing boundary require special treatment?
The closest pair may contain one point from the left half and another point from the right half.

Therefore, checking only the left and right halves is not sufficient.

We must also examine points near the dividing line to avoid missing a closer pair.
6. Student B – Why Does the Strip Not Compare Every Point?
The strip is the area near the dividing boundary.

The algorithm does not compare every point with every other point inside the strip.

Reason:
- Points are already sorted by Y coordinate.
- The current minimum distance is known.
- Only points whose X distance from the dividing line is smaller than the current minimum are included.
- Geometric packing shows that each point needs to be compared with at most the next seven points in Y order.
This reduces unnecessary distance calculations.

Therefore, the strip checking takes O(n) time rather than O(n²).
7. Divide-and-Conquer Python Implementation
The following program counts all distance calculations, including recursive base cases and strip comparisons.
import mathdef closest_pair(points):    # Give every point a unique ID    px = sorted(        [(x, y, i) for i, (x, y) in enumerate(points)],        key=lambda p: (p[0], p[1], p[2])    )    py = sorted(px, key=lambda p: (p[1], p[0], p[2]))    count = [0]    def distance2(p1, p2):        count[0] += 1        return (p1[0]-p2[0])**2 + (p1[1]-p2[1])**2    def solve(px, py):        n = len(px)        # Base case: use brute force        if n <= 3:            best = float('inf')            pair = None            for i in range(n):                for j in range(i+1, n):                    d = distance2(px[i], px[j])                    if d < best:                        best = d                        pair = (px[i], px[j])            return pair, best, py



Expected Output
Closest Pair: ((2, 3), (3, 4))
Minimum Distance: 1.414
Distance Calculations: 9


The distance calculation count may be lower than brute force because the algorithm eliminates unnecessary comparisons.
8. Comparison of Both Approaches
Feature	Brute Force	Divide and Conquer
Technique	Direct comparison	Divide and Conquer
Sorting	Not required	X and Y sorting
Distance calculations	All pairs	Reduced comparisons
Time complexity	O(n²)	O(n log n)
Extra space	O(1)	O(n) auxiliary space
Suitable for	Small datasets	Large datasets

9. Student B – Experimental Investigation
A. Experimental datasets
Use the same points for both algorithms to ensure a fair comparison.

Test different input sizes:
Experiment	Number of points
1	10
2	20
3	50
4	100
5	200
6	500
7	1,000
8	5,000

B. Experimental Python Program
Run this program after the two implementations above.
import randomimport timeimport statisticsrandom.seed(42)sizes = [10, 20, 50, 100, 200, 500, 1000, 5000]print("N | Brute Count | D&C Count | Brute Time | D&C Time")for n in sizes:    points = [        (random.randint(0, 100000),         random.randint(0, 100000))        for i in range(n)    ]    brute_times = []    dc_times = []    for r in range(5):        start = time.perf_counter()        p1, d1, c1 = brute_force(points)        brute_times.append(time.perf_counter() - start)        start = time.perf_counter()        p2, d2, c2 = closest_pair(points)        dc_times.append(time.perf_counter() - start)        assert abs(d1 - d2) < 1e-9    t1 = statistics.median(brute_times)    t2 = statistics.median(dc_times)



C. Experimental Observation
The following table shows the theoretical number of distance calculations for Brute Force.
Points (n)	Brute Force comparisons
10	45
20	190
50	1,225
100	4,950
200	19,900
500	124,750
1,000	499,500
5,000	12,497,500

For Divide-and-Conquer, the comparison count depends on the distribution of points, but its overall computational growth is O(n log n).
D. Crossover Point
Crossover is the approximate number of points at which Divide-and-Conquer becomes faster than Brute Force.
- Small datasets: Brute Force may be faster because it has less overhead.
- Medium datasets: Both methods may have similar execution times.
- Large datasets: Divide-and-Conquer generally becomes more advantageous.
The exact crossover point must be identified using the timing results from your computer.
10. Complexity Analysis
Algorithm	Best Case	Average Case	Worst Case
Brute Force	O(n²)	O(n²)	O(n²)
Divide and Conquer	O(n log n)	O(n log n)	O(n log n)

Space Complexity:
- Brute Force: O(1) auxiliary space.
- Divide and Conquer: O(n) auxiliary space for sorting and recursive processing.
11. Cross-Understanding Questions
Q1. Why does the strip stage not require comparison with every other point?

Answer:

The strip points are already sorted by Y coordinate. We only compare each point with the next seven points because geometric properties guarantee that a closer pair cannot be hidden farther down the strip. This reduces unnecessary comparisons.

Q2. What experimental evidence demonstrates that Divide-and-Conquer reduces computational work?

Answer:

We compare the distance calculation counts for both algorithms using the same input datasets.
- Brute Force performs n(n−1)/2 comparisons.
- Divide-and-Conquer performs fewer distance calculations by eliminating unnecessary comparisons.
- As input size increases, the difference becomes larger.
- The execution time also demonstrates the improvement.
12. Conclusion
- Brute Force checks every possible pair of points.
- Divide-and-Conquer divides the points into smaller groups.
- It finds the closest pair in each group.
- It checks the boundary strip to identify cross-boundary pairs.
- Brute Force has O(n²) time complexity.
- Divide-and-Conquer has O(n log n) time complexity.
- Experimental comparison helps identify when Divide-and-Conquer becomes more efficient.
13. Viva Questions and Answers
1. What is the Closest Pair Problem?

Finding two points having the minimum distance among a given set of points.

2. What is the Brute-Force approach?

It checks every possible pair of points.

3. What is Divide-and-Conquer?

It divides a problem into smaller subproblems, solves them, and combines the results.

4. What is the time complexity of Brute Force?

O(n²).

5. What is the time complexity of Divide-and-Conquer Closest Pair?

O(n log n).

6. Why do we sort points by X coordinate?

To divide the points into left and right halves.

7. Why do we sort points by Y coordinate?

To efficiently check nearby points in the boundary strip.

8. What is a boundary strip?

It is the region around the dividing line where points from opposite halves may form a closer pair.

9. Why do we compare only seven nearby points?

Because of the geometric packing property of the closest-pair problem.

10. What is crossover point?

It is the input size at which Divide-and-Conquer becomes faster than Brute Force.

14. Individual Responsibilities
Student	Main responsibility
Student A	Decomposition, recursive calls, combine operation and boundary strip
Student B	Equivalent datasets, distance counts, execution times and crossover analysis

Assignment complete
Important output correction: For the six-point example above, the Divide-and-Conquer implementation performs 7 distance calculations, not 9. Its expected output is:
Closest Pair: ((2, 3), (3, 4))
Minimum Distance: 1.414
Distance Calculations: 7
