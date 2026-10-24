**A. Impact Analysis –** 2 Marks
The university's requirements have changed from a general registration-number search to processing 50,000 search requests per hour on a database containing 1,000,000 student records. New student records are added only once per day.
- Changed requirements: The system must handle frequent searches and a large dataset efficiently.
- Affected assumptions: A simple linear search may no longer be suitable because its execution time increases with the number of records.
- Importance of search frequency: The system performs about 13.9 searches per second on average, so even small savings per search can improve overall performance.
- Low update frequency: Since records are added only once per day, the system can afford to build or update an index periodically without repeating that work for every search.
Therefore, the design should prioritize fast lookups while keeping daily preprocessing manageable.
**B. Evaluation of the Original Design** – 2 Marks
The original recommendation was Hash Table Search for frequent registration-number lookups.
Algorithm	Search complexity	Suitability for 1 million records
Linear Search	\(O(n)\)	Poor for frequent searches
Binary Search	\(O(\log n)\)	Good if records are sorted
Hash Table Search	Expected \(O(1)\)	Excellent for exact lookups

For one million records:
- Linear search: May require up to 1,000,000 comparisons per request.
- Binary search: Requires approximately 20 comparisons in the worst case.
- Hash table: Expected to locate a registration number in constant time, assuming a good hash function and controlled collisions.
A hash table requires \(O(n)\) expected time to build and \(O(n)\) additional memory. Since records are added only daily, this preprocessing cost is reasonable for 50,000 searches per hour. However, the entire table need not be rebuilt daily if the system can insert new records into the existing hash table.
******C. **Adaptation or Redesign ***– 2 Marks
Decision: RETAIN the hash table approach, with incremental updates.

The original hash table strategy remains suitable, but it should be adapted to avoid rebuilding the entire table whenever new student records are added.

Revised strategy:
1. Build a hash table using each student's unique registration number as the key.
2. Search for a registration number using the hash table.
3. Insert new student records into the existing table when they are added each day.
**4. Handle collisions appropriately to maintain efficient searches.**
Computational complexity:
- Initial construction: \(O(n)\) expected time.
- Search: \(O(1)\) expected time; \(O(n)\) worst case with severe collisions.
- Daily insertion: \(O(1)\) expected time per record, excluding occasional resizing.
- Space: \(O(n)\).
This modification avoids unnecessary rebuilding and keeps search performance efficient as the database grows.
**D. Evidence-Based Defence – 2 Marks**
For \(n = 1{,}000{,}000\) records and 50,000 searches per hour, the theoretical comparison is:
Algorithm	Approximate comparisons per search	Approximate comparisons per hour
Linear search	500,000 average for successful searches	25 billion
Binary search	About 20 in the worst case	About 1 million
Hash table	Expected constant-time lookup	Depends on collisions and implementation

These figures are theoretical estimates, not measured experimental results. Linear search assumes successful searches are uniformly distributed across the records.

The hash table is preferred because it offers expected constant-time lookup and requires only one initial construction, followed by incremental updates. Binary search is a strong alternative if memory usage is a concern or ordered searches are needed, but it requires sorted data and takes \(O(\log n)\) time per lookup. Linear search is unsuitable for this workload because its cost grows directly with the dataset size.

**Final conclusion: **Retain the hash table design and modify it to support incremental daily updates. This provides efficient exact registration-number searches, avoids repeated preprocessing, and suits the university's large dataset and high search frequency. For a production university database, an indexed registration-number column is also a practical implementation of this strategy.
