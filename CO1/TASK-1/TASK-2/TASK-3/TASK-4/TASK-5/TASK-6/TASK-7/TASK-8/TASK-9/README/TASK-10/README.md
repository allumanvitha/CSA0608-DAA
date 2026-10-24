**1. Introduction**
The theoretical analysis predicts how the running time of an algorithm grows as the dataset size \(n\) increases. The experimental analysis measures the actual execution time and number of operations using Python. Comparing both helps determine whether the observed performance agrees with the theoretical predictions.
**2. Theoretical vs Experimental Comparison**
Dataset size	Linear comparisons	Binary comparisons	Hash lookups
1,000	1,000	10	1
10,000	10,000	14	1
100,000	100,000	17	1
1,000,000	1,000,000	20	1

The experimental operation counts agree with the expected theoretical growth for an unsuccessful search.
Linear Search
The theoretical worst-case complexity is \(O(n)\). Experimentally, the number of comparisons increases from 1,000 to 1,000,000 when the dataset grows from 1,000 to 1,000,000 records.

This confirms linear growth because every registration number must be checked when the target is absent. The measured execution time also increases substantially as the dataset grows.
Recursive Binary Search
The theoretical worst-case complexity is \(O(\log n)\). The experimental comparison count increases from approximately 10 to 20 across the tested dataset sizes.

Although the dataset increases by a factor of 1,000, the number of comparisons increases by only about 10. This agrees with the theoretical prediction that binary search eliminates half of the remaining elements at each recursive call.
Hash Table Search
The theoretical average-case complexity is \(O(1)\), assuming a suitable hash function and controlled collisions. The implementation performs one dictionary lookup for each target, so the measured lookup time remains approximately constant across the tested dataset sizes.

However, one dictionary lookup does not mean that Python performs exactly one internal key comparison. Hashing, collision handling, and other internal operations are not counted by the program's simplified comparison metric.
**3. Which Algorithm Scales Better?**
Based on the experiment:
- Linear search scales least efficiently for large datasets because the number of comparisons grows directly with \(n\).
- Recursive binary search scales very efficiently because the number of comparisons grows logarithmically, provided the dataset is sorted.
- Hash table search offers the fastest expected lookup growth when the hash table is already constructed and collisions are limited.
For a student registration system with frequent searches, a hash table is a strong choice. Binary search is also effective when records are maintained in sorted order and predictable search performance is important.
**4. Differences Between Theory and Experiment**
The theoretical and experimental results may not match exactly for several reasons:
1. Hardware differences: Processor speed, memory, and operating-system activity affect execution time.
2. Programming-language overhead: Python function calls, recursion, and dictionary implementation affect actual timing.
3. Measurement overhead: Very short searches may take less time than the timer can measure precisely.
4. Preprocessing: Sorting or building a hash table takes additional time, which is separate from individual search time in this experiment.
5. Input conditions: Searching for the first, middle, last, or a missing element produces different comparison counts, particularly for linear search.
Therefore, asymptotic complexity predicts growth trends rather than exact execution times.
**5. Interpretation of Execution Time**
The measured unsuccessful-search times from the experiment were:
Dataset size	Linear search	Recursive binary search	Hash table search
1,000	0.0397 ms	0.0016 ms	0.00015 ms
10,000	0.4679 ms	0.0035 ms	0.00017 ms
100,000	4.6493 ms	0.0026 ms	0.00016 ms
1,000,000	47.0840 ms	0.0032 ms	0.00019 ms

The linear search time increases substantially with dataset size, while binary search and hash-table lookup remain comparatively fast. Small fluctuations in binary search and hash-table timings are expected because these operations are very short and sensitive to measurement noise.
**6. Conclusion**
The experimental observations generally support the theoretical analysis. Linear search exhibits linear growth, recursive binary search exhibits logarithmic growth, and hash-table lookup demonstrates expected constant-time behaviour. For large student registration databases, binary search and hash tables scale better than linear search. The final choice should also consider preprocessing costs, memory usage, and how frequently records are added or searched.
