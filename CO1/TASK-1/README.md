**1. Introduction**
The objective is to design and compare three different algorithms to locate a given student registration number from a dataset. The selected approaches are Linear Search, Binary Search, and Hash Table Search. They use different strategies and have different time complexities and preprocessing requirements.
**2. Approach 1: Linear Search**
Design strategy: Brute Force (Iterative)
Basic idea: Linear search checks each registration number one by one until the required number is found or the list ends. It works with both sorted and unsorted data.
**Pseudocode:**
LinearSearch(A, target)
    for i = 0 to length(A) - 1
        if A[i] == target
            return i
    return -1
Preprocessing required: No sorting or restructuring is required.
Justification: Selected because it is simple to implement and works directly on unsorted registration numbers. It provides a baseline for comparing the performance of other algorithms.
**Time complexity:**
- Best case: \(O(1)\)
- Average case: \(O(n)\)
- Worst case: \(O(n)\)
**3. Approach 2: Binary Search**
Design strategy: Divide and Conquer (Iterative)
Basic idea: Binary search compares the target with the middle element. It repeatedly eliminates half of the remaining search space until the target is found or no elements remain.
**Pseudocode:**
BinarySearch(A, target)
    low = 0
    high = length(A) - 1
    while low <= high
        mid = (low + high) / 2
        if A[mid] == target
            return mid
        else if A[mid] < target
            low = mid + 1
        else
            high = mid - 1
    return -1
**Preprocessing required:** The registration numbers must be sorted in ascending order before searching. Sorting typically takes \(O(n \log n)\) time using an efficient comparison-based sorting algorithm.
Justification: Selected because it reduces the search space by half at each step and is efficient for large, sorted datasets.
**Time complexity:**
- Best case: \(O(1)\)
- Average case: \(O(\log n)\)
- Worst case: \(O(\log n)\)
**4. Approach 3: Hash Table Search**
Design strategy: Hashing (Direct Key-Based Access)
Basic idea: A hash function converts a registration number into an index in a hash table. The algorithm accesses that location to find the registration number. Collisions are handled using a method such as separate chaining.
**Pseudocode:**
HashSearch(table, target)
    index = HashFunction(target)
    for each item in table[index]
        if item == target
            return item
    return NOT_FOUND
Preprocessing required:Create a hash table and insert all registration numbers using the hash function. This requires approximately \(O(n)\) time on average.
Justification: Selected because it provides fast lookup for repeated searches and represents a different strategy from sequential and divide-and-conquer searching.
Time complexity:
- Best case: \(O(1)\)
- Average case: \(O(1)\)
- Worst case: \(O(n)\), when many keys collide.
**5. Comparison of the Three Approaches**
Feature	Linear Search	Binary Search	Hash Table Search
Design strategy	Brute force	Divide and conquer	Hashing
Implementation	Iterative	Iterative	Iterative
Requires sorting	No	Yes	No
Preprocessing	None	Sorting	Build hash table
Average search time	\(O(n)\)	\(O(\log n)\)	\(O(1)\)
Suitable for	Small or unsorted data	Large, sorted data	Frequent lookups
**6. Conclusion**
The three algorithms use distinct strategies for locating student registration numbers. Linear search is suitable for small or unsorted datasets, binary search is efficient when data is sorted, and hash table search is effective for frequent lookups. Their performance can be compared using search time, number of comparisons, and preprocessing cost.
Note: The question requires at least one recursive approach. To satisfy this requirement explicitly, Binary Search can instead be implemented recursively, without changing its underlying algorithmic strategy. Its pseudocode is given below.
Recursive Binary Search (Alternative Implementation)
RecursiveBinarySearch(A, low, high, target)
    if low > high
        return -1
    mid = (low + high) / 2
    if A[mid] == target
        return mid
    else if A[mid] < target
        return RecursiveBinarySearch(A, mid + 1, high, target)
    else
        return RecursiveBinarySearch(A, low, mid - 1, target)
This recursive version satisfies the recursive-implementation requirement, while Linear Search and Hash Table Search retain their distinct algorithmic strategies.
