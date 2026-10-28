1. Aim
To design and implement a Brute-Force Closest-Pair algorithm that identifies the two drones closest to each other using their \((x,y)\) coordinates, counts distance calculations, and analyses scalability.
2. Algorithm Design
1. Read the coordinates of all drones.
2. Select the first drone and compare it with every drone after it.
3. Calculate the Euclidean distance between each pair.
4. Store the smallest distance and the corresponding pair.
5. Repeat until all unique pairs have been examined.
6. Display the closest pair, minimum distance, number of pairs examined, and execution time.
How to avoid duplicate comparisons
Use two loops where the inner loop starts at i + 1. This ensures that each pair is examined once, avoiding comparisons such as both (D1, D2) and (D2, D1), as well as comparisons of a drone with itself.
3. Mathematical Derivation
For \(n\) drones, each drone can be paired with the remaining drones, but every pair should be counted only once.
\[
\text{Number of unique pairs}
=\binom{n}{2}
=\frac{n(n-1)}{2}
\]

Therefore, the number of candidate pairs grows quadratically, giving a time complexity of \(O(n^2)\).
Number of drones (\(n\))	Unique pairs
10	45
100	4,950
1,000	499,500
5,000	12,497,500
10,000	49,995,000

For example, with 1,000 drones, the algorithm must examine 499,500 unique pairs to guarantee that it finds the closest pair.
4. Python Implementation
import randomimport timeimport mathdef closest_pair(points):    n = len(points)    min_distance = float("inf")    closest = None    comparisons = 0    start = time.perf_counter()    for i in range(n):        for j in range(i + 1, n):            comparisons += 1            x1, y1 = points[i]            x2, y2 = points[j]            distance = math.sqrt(                (x2 - x1) ** 2 + (y2 - y1) ** 2            )            if distance < min_distance:                min_distance = distance                closest = (points[i], points[j])    elapsed = time.perf_counter() - start    return closest, min_distance, comparisons, elapsed# Test different input sizesfor n in [100, 1000, 3000]:    random.seed(10)



5. Experimental Results
The following pair counts are exact. Execution times are illustrative measurements from one run and may vary depending on the computer.
Drones	Pairs examined	Distance calculations	Example execution time
100	4,950	4,950	0.0005 s
1,000	499,500	499,500	0.0799 s
3,000	4,498,500	4,498,500	0.6063 s

The number of distance calculations equals the number of unique pairs because the algorithm calculates one distance for every candidate pair.
6. Scalability Analysis
For this experiment, define an acceptable response time as 1 second for a single closest-pair calculation on the test computer.
- With 100 drones, the algorithm completes very quickly.
- With 1,000 drones, it examines nearly half a million pairs.
- With 3,000 drones, it examines almost 4.5 million pairs and takes around 0.61 seconds in the illustrative test.
- Extrapolating from this result, 5,000 drones may require approximately 1.7 seconds, and 10,000 may require approximately 6.7 seconds. These are estimates, not measured results.
Under this criterion, brute force may become impractical at around 5,000 drones on a computer with similar performance. The actual boundary must be established by running the experiment on the target monitoring system.
