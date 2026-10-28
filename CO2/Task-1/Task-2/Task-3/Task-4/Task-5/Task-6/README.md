Q6 – Exhaustive Search and Combinatorial Growth (8 Marks)
1. Aim
To design an Exhaustive-Search algorithm that selects packages for a humanitarian helicopter, maximises total humanitarian value, and ensures the total weight does not exceed the payload capacity.
2. Algorithm Design
Each package has a Package ID, weight, and humanitarian value. The algorithm examines every possible subset of packages and selects the feasible subset with the highest total value.
- Represent combinations: Use a binary selection, where 1 means a package is selected and 0 means it is not selected.
- Generate candidates: Enumerate every possible binary selection.
- Check feasibility: Calculate the total weight and check whether it is within the payload limit.
- Evaluate solutions: Calculate the total humanitarian value of every feasible selection.
- Retain the best solution: Store the selected packages whenever a higher value is found.
3. Pseudocode
  BEGIN
    INPUT packages and payload capacity
    best_value = 0
    best_combination = empty

    FOR every possible package combination
        total_weight = 0
        total_value = 0

        FOR each selected package
            ADD its weight to total_weight
            ADD its value to total_value

        IF total_weight <= payload capacity
            IF total_value > best_value
                best_value = total_value
                best_combination = current combination

    DISPLAY best_combination
    DISPLAY best_value
END
4. Correctness Check Using a Small Instance
Assume the helicopter has a payload limit of 8 kg.
Package ID	Weight (kg)	Humanitarian value
A	2	6
B	3	10
C	4	12
D	5	15

Some possible combinations are:
Combination	Total weight	Total value	Feasible?
A + B	5	16	Yes
A + C	6	18	Yes
B + C	7	22	Yes
A + D	7	21	Yes
B + D	8	25	Yes
C + D	9	27	No

The best feasible combination is B + D, with a total weight of 8 kg and a humanitarian value of 25.

The algorithm must examine all \(2^4=16\) combinations, including the empty combination, to verify that this is the optimum.
5. Python Implementation
import timedef exhaustive_search(packages, capacity):    n = len(packages)    best_value = 0    best_items = []    candidates = 0    start = time.perf_counter()    # Generate all 2^n combinations    for mask in range(2 ** n):        candidates += 1        total_weight = 0        total_value = 0        selected = []        for i in range(n):            if mask & (1 << i):                package_id, weight, value = packages[i]                total_weight += weight                total_value += value                selected.append(package_id)        if total_weight <= capacity:            if total_value > best_value:                best_value = total_value                best_items = selected    elapsed = time.perf_counter() - start    return best_items, best_value, candidates, elapsed# Correctness test



6. Experimental Results
The growth experiment uses three different problem sizes. The execution times below are example measurements from one run; they may vary depending on the computer.
Number of packages (\(n\))	Candidate combinations (\(2^n\))	Example execution time
10	1,024	0.0008 seconds
15	32,768	0.0385 seconds
20	1,048,576	1.7284 seconds

Small-instance correctness test:
Best packages: ['B', 'D']
Maximum value: 25
Combinations checked: 16


The experiment supports the prediction that the number of candidate combinations grows exponentially.
7. Mathematical Growth Analysis
For \(n\) packages, each package has two choices: selected or not selected.

Therefore,
\[
\text{Total combinations}=2^n
\]

The number of non-empty combinations is \(2^n-1\).
Packages	Total combinations
5	32
10	1,024
15	32,768
20	1,048,576
25	33,554,432
30	1,073,741,824

Every additional package doubles the number of combinations. For example, increasing from 20 to 25 packages multiplies the number of combinations by 32.

The time complexity is \(O(n2^n)\), because the algorithm may inspect up to \(n\) packages for each of the \(2^n\) combinations. Its auxiliary space is \(O(n)\) for storing the current and best selections.
8. Deployment Decision
For this experiment, I would set the maximum acceptable response time to 1 second for one loading decision.
- At 10 packages, exhaustive search is very fast.
- At 15 packages, the measured time remains below one second.
- At 20 packages, the example run takes about 1.73 seconds, exceeding the limit.
Therefore, I would provisionally recommend exhaustive search for up to 15 packages in this implementation. This boundary should be confirmed with repeated measurements on the actual deployment hardware.

For larger package sets, a dynamic programming or branch-and-bound strategy could reduce the amount of unnecessary exploration, depending on the payload limit and package values.
9. Conclusion
Exhaustive Search guarantees the optimal package combination because it examines every possible subset and compares all feasible solutions. However, the solution space grows exponentially as packages are added. It is suitable for small humanitarian airlift problems, but larger instances require a more scalable optimisation strategy.
