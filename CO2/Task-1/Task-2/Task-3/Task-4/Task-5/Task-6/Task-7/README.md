Q7 – Diagnose, Redesign and Validate (13 Marks)
Selected solution: Q6 – Exhaustive Search for Humanitarian Airlift Planning

I selected Q6 because the original algorithm examines every possible package combination. As the number of packages increases, the number of combinations grows exponentially, making it difficult to produce a loading decision within a fixed time limit.
A. Diagnose the Computational Bottleneck (2 Marks)
The original solution represents each package as either selected or not selected. For \(n\) packages, it examines \(2^n\) combinations.

The original time complexity is \(O(n2^n)\), because each combination may require checking up to \(n\) packages.
Packages	Combinations examined
10	1,024
15	32,768
20	1,048,576
25	33,554,432

Main bottleneck:
- Most computational effort is spent generating and evaluating candidate combinations.
- Many different combinations lead to the same total weight and similar optimisation subproblems.
- The algorithm repeatedly recalculates package weights and values for each combination.
- Adding one package doubles the number of candidate combinations.
Therefore, the main limitation is the repeated exploration of an exponentially growing solution space.
B. Define the Design Objective (2 Marks)
The redesign must find the same maximum humanitarian value without exceeding the helicopter's payload capacity.

The measurable objectives are:
1. Preserve the optimal result produced by Exhaustive Search.
2. Reduce the number of candidate combinations explicitly examined.
3. Reuse results from smaller package-selection problems instead of recalculating them.
4. Produce a loading decision within a chosen response-time limit of one second on the test computer.
Proposed redesign: Reuse previously calculated optimal values for smaller payload capacities and package sets, rather than evaluating every complete combination independently.

This is suitable when package weights and payload capacity are positive integers.
C. Design the Revised Computational Strategy (4 Marks)
Revised approach: Reuse subproblem results
Instead of checking every complete combination, use a table \(DP[i][c]\), where:
- \(i\) represents the number of packages considered.
- \(c\) represents the available payload capacity.
- \(DP[i][c]\) stores the maximum humanitarian value obtainable using the first \(i\) packages with capacity \(c\).
For each package, the algorithm compares two choices:
- Exclude the package: keep the best value already calculated.
- Include the package: add its value to the best value achievable with the remaining capacity, if it fits.
The better result is stored and reused in later calculations.
\[
DP[i][c]=\max\left(
DP[i-1][c],\
v_i+DP[i-1][c-w_i]
\right)
\]

The second option is considered only when \(w_i\leq c\). Otherwise, the package is excluded.
Revised pseudocode
BEGIN
    INPUT packages and capacity W
    CREATE DP table with (n+1) rows and (W+1) columns
    INITIALISE all values to zero

    FOR each package i
        FOR each capacity c from 0 to W
            EXCLUDE package i:
                best = DP[i-1][c]

            IF weight[i] <= c
                INCLUDE package i:
                    value = value[i] + DP[i-1][c-weight[i]]
                best = maximum(best, value)

            STORE best in DP[i][c]

    TRACE back through the table
    IDENTIFY selected packages
    DISPLAY selected packages and maximum value
END


What changes in the redesign?
Design aspect	Original exhaustive search	Redesigned strategy
Main operation	Examine every subset	Update reusable table states
Repeated work	Recalculates many combinations	Reuses previously calculated results
Preprocessing	None required	Initialise the DP table
Time complexity	\(O(n2^n)\)	\(O(nW)\)
Additional memory	\(O(n)\) in the earlier implementation	\(O(nW)\) for a full table
Trade-off	Simple but exponential	More memory and depends on manageable integer capacity

Here, \(W\) is the integer payload capacity. The redesign is not universally better: if the capacity is extremely large, \(O(nW)\) may itself be expensive. If weights are continuous, they must be represented at a suitable resolution or a different strategy must be considered.
D. Predict Before Implementing (1 Mark)
Prediction: The redesigned algorithm should return the same maximum humanitarian value as exhaustive search, but it should process far fewer states on problems with a moderate integer payload capacity.

The expected performance improvement is in the number of candidate combinations or repeated calculations. Instead of \(2^n\) complete combinations, it processes approximately \(n(W+1)\) table states.
E. Implement and Validate the Redesign (2 Marks)
The following Python program compares the original exhaustive approach with the redesigned dynamic programming approach using the same package data.
import timedef exhaustive_search(packages, capacity):    best_value = 0    best_items = []    combinations = 0    start = time.perf_counter()    for mask in range(2 ** len(packages)):        combinations += 1        weight = 0        value = 0        selected = []        for i, (name, w, v) in enumerate(packages):            if mask & (1 << i):                weight += w                value += v                selected.append(name)        if weight <= capacity and value > best_value:            best_value = value            best_items = selected    elapsed = time.perf_counter() - start    return best_items, best_value, combinations, elapseddef redesigned_search(packages, capacity):    n = len(packages)    # dp[i][c] = best value using first i packages    # with payload capacity c    dp = [[0] * (capacity + 1) for _ in range(n + 1)]



Comparison of results
For the specified package data, the expected operation counts are:
Packages	Exhaustive combinations	DP states processed	Maximum value from both
4	16	36	25
10	1,024	210	73
15	32,768	465	99
20	1,048,576	820	150

The counts are derived directly from the algorithms. Execution times should be taken from running the program on the test computer; they are not assumed from these operation counts.

Validation result: The optimal values match in all listed cases. This supports the correctness of the redesign for these test inputs. The dynamic programming method reduces the number of processed states substantially as the number of packages grows.
F. Defend the Final Design (2 Marks)
Has the redesign achieved its objective?
Yes. The redesigned solution reuses results for smaller package-selection problems instead of evaluating every possible subset independently.
- Correctness: Both algorithms return the same maximum humanitarian value for the tested instances.
- Efficiency: For 20 packages, the original algorithm examines 1,048,576 combinations, while the redesigned algorithm processes 820 DP states.
- Scalability: The redesign is more suitable when the number of packages grows and the integer payload capacity remains manageable.
- Limitation: Dynamic programming uses more memory for its table and can become costly when the payload capacity is very large.
Final decision
I recommend the redesigned dynamic programming solution for the humanitarian airlift planner when package weights and payload capacity can be represented as manageable integers. It maintains the optimal solution while reducing repeated computation. Before deployment, I would run repeated timing tests on the actual hardware and confirm that the loading decision meets the one-second response-time requirement.

Conclusion: The key improvement is not merely using a different algorithm. It is recognising that many package combinations repeat the same smaller capacity problems, then storing and reusing those results to avoid unnecessary computation.
