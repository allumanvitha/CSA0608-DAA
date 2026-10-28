Q2 – When Is Sequential Search an Appropriate Engineering Choice? (4 Marks)
1. Aim
To investigate Sequential Search using different list sizes, successful searches at different positions, and unsuccessful searches by recording the number of comparisons.
2. Designed Experiments
Assume the list contains unique Tool IDs. Sequential Search checks each record from the beginning until the target is found or the list ends.
Test cases
Experiment	List size	Search target	Expected comparisons
1	5	First record	1
2	5	Middle record	3
3	5	Last record	5
4	5	Tool ID not present	5
5	10	First record	1
6	10	Middle record	5
7	10	Last record	10
8	10	Tool ID not present	10
9	100	First record	1
10	100	Middle record	50
11	100	Last record	100
12	100	Tool ID not present	100

Note: These are expected comparison counts for the stated positions, assuming the middle record is at position \(n/2\) for even-sized lists.
3. Python Implementation

def sequential_search(tools, target):
    comparisons = 0

    for tool in tools:
        comparisons += 1

        if tool == target:
            return comparisons

    return comparisons


tools_5 = ["T-101", "T-102", "T-103", "T-104", "T-105"]

print("First record:", sequential_search(tools_5, "T-101"))
print("Middle record:", sequential_search(tools_5, "T-103"))
print("Last record:", sequential_search(tools_5, "T-105"))
print("Not found:", sequential_search(tools_5, "T-999"))
First record: 1
Middle record: 3
Last record: 5
Not found: 5
. Analysis of Results
- Successful search: Comparisons depend on the position of the required tool. A tool at the beginning needs only one comparison, while a tool at the end requires \(n\) comparisons.
- Unsuccessful search: Every record must be checked, so the number of comparisons is \(n\).
- Small lists: Sequential Search is simple and effective when only a few tools are currently issued.
- Large lists: The number of comparisons increases linearly with list size.
The time complexity is:
- Best case: \(O(1)\)
- Average case: \(O(n)\)
- Worst case: \(O(n)\)
5. When Is Sequential Search a Reasonable Choice?
Operating condition	Recommendation
Small list, occasional searches	Use Sequential Search
Small list, frequent searches	It may still be suitable; measure actual workload
Large list, occasional searches	Consider indexing if lookup speed matters
Large list, frequent searches	Prefer a hash table or database index
Frequently changing list	Sequential Search avoids maintaining a separate search index

Operating boundary: There is no universal list-size limit. The decision depends on list size, search frequency, response-time requirements, and the cost of maintaining an alternative data structure.
6. Changed Condition: 20 Maintenance Facilities
Expanding from one hangar to 20 facilities increases the number of active tool records and lookup requests. Sequential Search may then require many comparisons for each request.

For example, if the combined list contains 10,000 records:
- First-record search: 1 comparison.
- Middle-record search: about 5,000 comparisons.
- Last-record search: 10,000 comparisons.
- Unsuccessful search: 10,000 comparisons.
Revised recommendation
I would modify the original design by using a hash table or indexed database keyed by Tool ID. This supports fast lookups while allowing tools to be issued and returned through record updates.

The system should also store the current Technician ID, Issue Time, and Work Bay for each Tool ID. A central database or coordinated facility-level indexes can help prevent outdated or conflicting records.
7. Conclusion
Sequential Search is appropriate for small, frequently changing lists with low lookup demand. For 20 maintenance facilities with more records and lookup requests, an indexed database or hash table is a better engineering choice. The final decision should be validated by measuring comparisons, response time, update cost, and concurrent lookup performance.
