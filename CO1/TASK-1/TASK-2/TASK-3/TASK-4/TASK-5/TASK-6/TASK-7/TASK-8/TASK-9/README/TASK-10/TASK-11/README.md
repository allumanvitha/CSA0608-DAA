**1. Recommended Algorithm: Hash Table Search**
Based on the mathematical analysis and experimental results, Hash Table Search is recommended for locating student registration numbers in the university student-record system, provided the database is designed for frequent lookups and the hash table can be maintained efficiently.

A hash table maps each unique registration number to its corresponding student record. When a search request arrives, the system calculates the hash and retrieves the associated record without checking every student individually.
**2. Why Hash Table Search Is More Appropriate**
Hash table search is preferable for frequent registration-number lookups because it offers expected constant-time searching. Unlike linear search, it does not normally examine every record. Unlike binary search, it does not require the records to remain sorted for lookup.

The experimental results support this recommendation:
Dataset size	Linear search comparisons	Recursive binary search comparisons	Hash table lookups
1,000	1,000	10	1
10,000	10,000	14	1
100,000	100,000	17	1
1,000,000	1,000,000	20	1

The hash table performs one dictionary lookup per request in the implementation. This is a simplified operation count, not a claim that the internal hash-table implementation performs exactly one comparison.
**3. Theoretical Efficiency**
The expected average-case search complexity is:
\[
T(n)=\Theta(1)
\]

This assumes a suitable hash function, a controlled load factor, and effective collision handling. In the worst case, when many keys collide, search time can reach:
\[
T(n)=\Theta(n)
\]

Hash-table construction requires expected \(O(n)\) time and \(O(n)\) additional space for \(n\) records.

For comparison:
- Linear search: \(O(n)\) worst-case search time.
- Recursive binary search: \(O(\log n)\) worst-case search time on sorted data.
- Hash table search: Expected \(O(1)\) search time after construction.
**4. Experimentally Observed Performance**
The unsuccessful-search measurements from the experiment were:
Dataset size	Linear search	Recursive binary search	Hash table search
1,000	0.0397 ms	0.0016 ms	0.00015 ms
10,000	0.4679 ms	0.0035 ms	0.00017 ms
100,000	4.6493 ms	0.0026 ms	0.00016 ms
1,000,000	47.0840 ms	0.0032 ms	0.00019 ms

The results show that linear search becomes substantially slower as the dataset grows. Binary search remains efficient, while hash-table lookup is fastest in these measurements.

These timings are specific to the test environment and should be treated as indicative rather than universal benchmarks. The hash table was built before individual searches were timed, so the lookup figures exclude construction time.
**5. Preprocessing and Maintenance Costs**
Before searching, the system must build the hash table by inserting registration numbers and their associated record locations.
\[
T_{\text{build}}(n)=O(n)
\]

If the university has one million records, the initial construction requires processing those records once. When a new student registers, the system can insert the new key into the table rather than rebuild the entire structure.

The system must also handle record updates and deletions, maintain unique registration numbers, and ensure that the hash table remains consistent with the underlying database.
**6. Trade-offs and Limitations**
- Memory usage: The hash table requires additional memory for keys, indices, and internal data structures.
- Collisions: Poor hash distribution can reduce performance.
- Database updates: Insertions and deletions require careful synchronisation with the student database.
- Ordered queries: Hash tables do not naturally support range queries or retrieving records in registration-number order. A sorted index is better for those operations.
- Persistence and reliability: A production university system should use a database index rather than depend solely on an in-memory Python dictionary.
**7. Practicality as the Database Grows**
Hash-table searching remains practical as the dataset grows from thousands to millions of records, provided sufficient memory is available and the table is maintained properly. For a real university application, a database such as PostgreSQL or MySQL with an appropriate index on the registration-number column would provide persistence, concurrency control, and reliable updates.

A database's B-tree index typically offers \(O(\log n)\) lookups, while hash indexes can provide expected \(O(1)\) equality lookups where supported. The appropriate database index should be selected according to the required queries and database engine.
**8. Final Recommendation**
Hash Table Search is the recommended strategy for frequent exact registration-number lookups. This recommendation is supported by its expected \(O(1)\) search complexity and the experiment's consistently low lookup times across datasets up to one million records. Although binary search is also efficient and offers predictable logarithmic performance, it requires sorted data. Linear search is simpler but becomes inefficient for large databases.

For a production university student-record system, the practical design is to use a database with an indexed, unique registration-number column. This preserves the benefits of fast lookup while supporting student-record updates, persistent storage, and reliable multi-user access.
