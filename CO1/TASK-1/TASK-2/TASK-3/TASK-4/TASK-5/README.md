Asymptotic notation describes how the running time of an algorithm grows as the number of student registration numbers (\(n\)) increases.
-** Big-O \(O\): Represents an asymptotic upper bound.
- Big-Omega \(\Omega\): Represents an asymptotic lower bound.
- Big-Theta \(\Theta\): Represents a tight asymptotic bound when both upper and lower bounds match.
**1. Linear Search**
Linear search checks registration numbers one by one.
- Best case: The target is the first element. \(T(n)=1\), so the complexity is \(\Theta(1)\).
- Worst case: The target is last or absent. \(T(n)=n\), so the complexity is \(\Theta(n)\).
- Average case: Assuming the target is equally likely to be at any position, the expected comparisons are \((n+1)/2\), giving \(\Theta(n)\).
As the dataset grows, the number of comparisons increases proportionally to its size. Therefore, searching one million records may require up to one million comparisons.
**2. Binary Search**
Binary search repeatedly halves a sorted dataset.
- Best case: The target is the middle element. \(T(n)=1\), giving \(\Theta(1)\).
- Worst case: The search continues until the interval is empty or the target is found at the final level. The number of comparisons is approximately \(\log_2 n\), giving \(\Theta(\log n)\).
- Average case: The search space is halved at each step, so the expected search time is also \(\Theta(\log n)\) under typical successful or unsuccessful search assumptions.
Binary search scales efficiently because the number of comparisons grows slowly. However, sorting unsorted records adds a preprocessing cost of \(O(n\log n)\).
**3. Hash Table Search**
Hash table search uses a hash function to access the bucket associated with a registration number.
- Best case: The target is found immediately, giving \(\Theta(1)\).
- Average case: With a suitable hash function, controlled load factor, and effective collision handling, expected search time is \(\Theta(1)\).
- Worst case: Many keys collide in the same bucket, requiring up to \(n\) comparisons. The worst-case complexity is \(\Theta(n)\).
Hash tables are particularly effective when the student database is searched repeatedly, because the table can be built once and reused.
**4. Growth Comparison for Large Datasets**
The following table shows representative operation counts for searching \(n\) records. These are theoretical counts, not measured execution times.
Dataset size (\(n\))	Linear search (worst case)	Binary search (worst case)	Hash search (average)
1,000	1,000	10	Approximately constant
10,000	10,000	14	Approximately constant
100,000	100,000	17	Approximately constant
1,000,000	1,000,000	20	Approximately constant
For binary search, the approximate comparison count is \(\lfloor\log_2 n\rfloor+1\). Hash table comparisons depend on the hash function, load factor, and collision distribution.
**5. Interpretation for the Student Registration System**
As the database grows from 1,000 to 1,000,000 records:
- Linear search: The worst-case comparisons increase by a factor of 1,000. It may become slow for frequent searches.
- Binary search: The worst-case comparisons increase only from about 10 to 20. It is highly suitable for sorted registration numbers.
- Hash table search: Expected lookup time remains approximately constant when the table is properly designed. It is suitable for frequent registration-number lookups, although maintaining the table requires memory and preprocessing.
**Conclusion**
The asymptotic growth rates show that binary search and hash table search generally scale better than linear search for large student databases. Binary search provides predictable logarithmic search time but requires sorted data, while hash tables offer expected constant-time lookup with appropriate collision management. The best choice depends on preprocessing costs, update frequency, memory availability, and the number of searches performed.
