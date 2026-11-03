Q6 – Advanced Divide-and-Conquer Mini-Investigations
7 Marks
This assignment contains two important algorithms:
1. Student A – Median of Medians: Finding the k-th smallest element efficiently.
2. Student B – Meet-in-the-Middle: Solving the Subset-Sum problem using two smaller groups.
It includes aim, explanation, pseudocode, Python implementation, output, complexity analysis, experimental comparison, and viva questions.
PART A – STUDENT A: MEDIAN OF MEDIANS
1. Aim
To implement the Median of Medians algorithm to find the k-th smallest element in an array and compare its performance with QuickSelect.
2. What is Median of Medians?
Median of Medians is a selection algorithm used to find the k-th smallest element in an unsorted array.

It uses the Divide-and-Conquer technique.

Steps:
1. Divide the array into groups of five elements.
2. Sort each group.
3. Find the median of every group.
4. Collect all the medians.
5. Find the median of these medians.
6. Use it as the pivot.
7. Partition the original array around the pivot.
8. Continue searching in the required partition.
3. Grouping Strategy
Consider the following array:
[12, 3, 5, 7, 4, 19, 26, 1, 15, 8, 10]


Divide it into groups of five:
Original array
12

3

5

7

4

19

26

1

15

8

10


Group 1
3

4

5

7

12


Median = 5

Group 2
1

8

15

19

26


Median = 15

Group 3
10


Median = 10

Medians
5

15

10


Median of medians = 10

The pivot selected from the medians is used to divide the original array into smaller and larger elements.
4. Pseudocode – Median of Medians
MEDIAN_OF_MEDIANS(A, k)

1. If length(A) <= 5:
       Sort A.
       Return A[k-1]

2. Divide A into groups of 5.

3. Find the median of each group.

4. Find the median of all group medians.

5. Select this median as pivot.

6. Divide A into:
       Left = elements smaller than pivot
       Equal = elements equal to pivot
       Right = elements greater than pivot

7. If k <= length(Left):
       Search Left.

8. Else if k <= length(Left)+length(Equal):
       Return pivot.

9. Else:
       Search Right with adjusted k.


5. Python Implementation – Median of Medians
def median_of_medians(a, k):    if len(a) <= 5:        a.sort()        return a[k-1]    groups = []    for i in range(0, len(a), 5):        group = sorted(a[i:i+5])        groups.append(group[len(group)//2])    pivot = median_of_medians(        groups, (len(groups)+1)//2    )    left = [x for x in a if x < pivot]    equal = [x for x in a if x == pivot]    right = [x for x in a if x > pivot]    if k <= len(left):        return median_of_medians(left, k)    elif k <= len(left) + len(equal):        return pivot    else:        return median_of_medians(            right, k-len(left)-len(equal)        )a = [12, 3, 5, 7, 4, 19, 26, 1, 15, 8, 10]k = 5



Expected Output
Array: [12, 3, 5, 7, 4, 19, 26, 1, 15, 8, 10]
K value: 5
K-th smallest element: 8


6. How is the pivot determined?
- Divide the array into groups of five.
- Sort each group.
- Find the median of each group.
- Find the median of the group medians.
- Select this value as the pivot.
The pivot is generally a better choice than an arbitrary element because it guarantees that a substantial fraction of elements lie on each side.
7. Why are disastrous partitions prevented?
Median of Medians provides a guaranteed reasonably balanced partition.

For groups of five, at least approximately 30% of the elements can be guaranteed on each side of the pivot, apart from small-group rounding details.

Therefore:
- One partition cannot repeatedly contain almost the entire array.
- The algorithm avoids repeated extremely poor splits.
- It provides guaranteed linear worst-case time complexity.
8. QuickSelect Algorithm
QuickSelect is used to find the k-th smallest element without sorting the entire array.

Explanation:
1. Select a pivot.
2. Partition the array.
3. Check the pivot position.
4. Search only the required side.
5. Repeat until the required element is found.
QuickSelect Pseudocode
QUICKSELECT(A, k)

1. Select a pivot.

2. Partition array around pivot.

3. Find pivot position p.

4. If p = k:
       Return pivot.

5. If k < p:
       Search left partition.

6. Otherwise:
       Search right partition.


9. Python Implementation – QuickSelect
This version uses the last element as its deterministic pivot.
def quickselect(a, k):    if len(a) == 1:        return a[0]    pivot = a[-1]    left = [x for x in a if x < pivot]    equal = [x for x in a if x == pivot]    right = [x for x in a if x > pivot]    if k <= len(left):        return quickselect(left, k)    elif k <= len(left) + len(equal):        return pivot    else:        return quickselect(            right, k-len(left)-len(equal)        )a = [12, 3, 5, 7, 4, 19, 26, 1, 15, 8, 10]k = 5print("K-th smallest element:", quickselect(a, k))



Expected Output
K-th smallest element: 8


10. Comparison – Median of Medians vs QuickSelect
Feature	QuickSelect	Median of Medians
Pivot	Selected element	Median of medians
Average time	O(n)	O(n)
Worst-case time	O(n²)	O(n)
Pivot quality	May be poor	Guaranteed reasonably good
Implementation	Simple	More complex
Performance	Usually fast in practice	More overhead


11. Demonstrating a Deterministic Poor Pivot
Consider an already sorted array:
[1, 2, 3, 4, 5, 6, 7, 8, 9]


If QuickSelect always selects the last element as pivot:
- First pivot = 9.
- Left partition contains 8 elements.
- Right partition contains 0 elements.
- The next partition can again be unbalanced.
- Repeated poor partitions increase the work.
This can lead to:
\[
T(n)=T(n-1)+O(n)
\]

\[
\boxed{T(n)=O(n^2)}
\]

12. Randomized QuickSelect
Randomized QuickSelect selects a random pivot instead of always selecting the last element.

Advantages:
- Reduces the possibility of repeatedly selecting a poor pivot.
- Usually gives good performance on different input arrangements.
- Expected time complexity is O(n).
Limitation:

Randomization does not eliminate poor partitions completely. A bad sequence of random choices is still possible.
Python Code – Randomized QuickSelect
import randomdef randomized_quickselect(a, k):    if len(a) == 1:        return a[0]    pivot = random.choice(a)    left = [x for x in a if x < pivot]    equal = [x for x in a if x == pivot]    right = [x for x in a if x > pivot]    if k <= len(left):        return randomized_quickselect(left, k)    elif k <= len(left) + len(equal):        return pivot    else:        return randomized_quickselect(            right, k-len(left)-len(equal)        )a = [12, 3, 5, 7, 4, 19, 26, 1, 15, 8, 10]k = 5print("K-th smallest element:",      randomized_quickselect(a, k))



Expected Output
K-th smallest element: 8


13. Worst-Case Guarantee
Algorithm	Best Case	Average Case	Worst Case
QuickSelect	O(n)	O(n)	O(n²)
Randomized QuickSelect	O(n)	Expected O(n)	O(n²)
Median of Medians	O(n)	O(n)	O(n)

Student A conclusion:

Median of Medians guarantees O(n) worst-case time by selecting a good pivot. QuickSelect is simpler and often faster in practice, but its worst-case time can become O(n²).
PART B – STUDENT B: MEET-IN-THE-MIDDLE
14. Aim
To implement the Meet-in-the-Middle technique for the Subset-Sum problem and compare its performance with straightforward exhaustive enumeration.
15. What is the Subset-Sum Problem?
Subset Sum is a problem in which we are given a list of numbers and a target value.

We need to determine whether any subset of the given numbers produces the target sum.

Example:
Array = [3, 4, 5, 2]

Target = 9


One possible subset is:
[4, 5]

Sum = 9


Therefore, the answer is TRUE.
16. Meet-in-the-Middle Explanation
Meet-in-the-Middle is a technique that divides the original problem into two smaller halves.

Steps:
1. Divide the array into two halves.
2. Generate all possible subset sums of the first half.
3. Generate all possible subset sums of the second half.
4. Sort the second half's subset sums.
5. Search for complementary sums.
6. Check whether two subset sums produce the target.
17. Decomposition Diagram
Consider:
Array = [3, 4, 5, 2]
Target = 9


Original Array

[3, 4, 5, 2]

Left Half

[3, 4]


Right Half

[5, 2]



Left sums

[0, 3, 4, 7]


Right sums

[0, 5, 2, 7]



Combine

4 + 5 = 9

TRUE
Target sum found!


18. Pseudocode – Meet-in-the-Middle
MEET_IN_THE_MIDDLE(A, target)

1. Divide array into Left and Right halves.

2. Generate all subset sums of Left.

3. Generate all subset sums of Right.

4. Sort the Right subset sums.

5. For every sum in Left:

       Find target - left_sum
       in the Right subset sums.

6. If a matching sum exists:
       Return TRUE.

7. Otherwise:
       Return FALSE.


19. Python Implementation – Meet-in-the-Middle
from bisect import bisect_leftdef subset_sums(a):    sums = [0]    for x in a:        sums += [s + x for s in sums]    return sumsdef meet_in_middle(a, target):    mid = len(a) // 2    left = a[:mid]    right = a[mid:]    left_sums = subset_sums(left)    right_sums = subset_sums(right)    right_sums.sort()    for s in left_sums:        needed = target - s        pos = bisect_left(right_sums, needed)        if pos < len(right_sums):            if right_sums[pos] == needed:                return True    return False



Expected Output
Array: [3, 4, 5, 2]
Target: 9
Subset exists: True



20. How Are Partial Results Combined?
For the example:
Left sums  = [0, 3, 4, 7]
Right sums = [0, 5, 2, 7]

Target = 9


We need:
\[
LeftSum+RightSum=Target
\]

For example:
\[
4+5=9
\]

Therefore, the target subset exists.

The algorithm searches for the required complementary sum instead of checking every complete subset.
21. Straightforward Brute-Force Subset Sum
Brute Force checks all possible subsets.
Python Implementation
def brute_subset_sum(a, target):    n = len(a)    for mask in range(1 << n):        total = 0        for i in range(n):            if mask & (1 << i):                total += a[i]        if total == target:            return True    return Falsea = [3, 4, 5, 2]target = 9print("Subset exists:",      brute_subset_sum(a, target))



Expected Output
Subset exists: True


22. Comparison – Brute Force vs Meet-in-the-Middle
Feature	Brute Force	Meet-in-the-Middle
Technique	Exhaustive search	Divide and Conquer
Division	No division	Two halves
Search space	2ⁿ	About 2^(n/2) per half
Time complexity	O(2ⁿ)	O(n × 2^(n/2)) with sorting
Extra memory	O(n) for this implementation	O(2^(n/2))
Suitable for	Small arrays	Medium-sized arrays

23. Search-Space Reduction
Consider an array with 20 elements.

Brute Force:
\[
2^{20}=1,048,576
\]

It checks over one million possible subsets.

Meet-in-the-Middle:

Divide the array into two halves of 10 elements.
\[
2^{10}=1,024
\]

Each half produces 1,024 subset sums.

Total generated subset sums:
\[
1024+1024=2048
\]

Instead of checking 1,048,576 complete subsets, Meet-in-the-Middle generates 2,048 partial sums and combines them efficiently.
24. Time and Space Complexity
Algorithm	Time Complexity	Space Complexity
Brute Force	O(2ⁿ)	O(n) auxiliary
Meet-in-the-Middle	O(n × 2^(n/2))	O(2^(n/2))

Meet-in-the-Middle introduces additional storage, but it greatly reduces the search space.
25. Time-Memory Trade-Off
Advantages:
- Reduces computational work.
- Avoids checking every complete subset.
- Works efficiently for moderately sized input arrays.
- Makes large search problems more manageable.
Disadvantages:
- Requires additional memory.
- Stores subset sums for both halves.
- Memory requirements increase as the input size increases.
- Very large arrays can still require significant storage.
PART C – CROSS-UNDERSTANDING
26. Student B Verification
Question: Why is pivot quality central to the performance of selection algorithms?

Answer:
- Pivot quality determines how the array is divided.
- A good pivot creates reasonably balanced partitions.
- Balanced partitions reduce unnecessary comparisons.
- A poor pivot creates highly unbalanced partitions.
- Repeated poor partitions can lead to O(n²) time complexity.
- Therefore, good pivot selection improves selection algorithm performance.
27. Student A Verification
Question: Why can Meet-in-the-Middle reduce computational work even though it introduces additional storage?

Answer:
- It divides the original array into two smaller halves.
- It generates subset sums separately for both halves.
- It combines partial results instead of checking all complete subsets.
- This reduces the search space from O(2ⁿ) to approximately O(2^(n/2)) subset sums per half.
- Although additional memory is required, the reduction in computational work makes it efficient for medium-sized problems.
28. Overall Complexity Comparison
Algorithm	Average Time	Worst Time
QuickSelect	O(n)	O(n²)
Median of Medians	O(n)	O(n)
Brute-Force Subset Sum	O(2ⁿ)	O(2ⁿ)
Meet-in-the-Middle	O(n × 2^(n/2))	O(n × 2^(n/2))

29. Conclusion
- Median of Medians finds the k-th smallest element using a carefully selected pivot.
- It guarantees O(n) worst-case time complexity.
- QuickSelect is simple and efficient on average but can take O(n²) in the worst case.
- Meet-in-the-Middle divides the Subset-Sum problem into two smaller halves.
- It reduces the search space compared with straightforward exhaustive enumeration.
- It requires additional memory to store partial subset sums.
- Both algorithms demonstrate how Divide-and-Conquer and related techniques improve computational efficiency.
30. Important Viva Questions
1. What is Median of Medians?

It is an algorithm used to find the k-th smallest element using a good pivot.

2. Why are groups of five used?

Groups of five provide a useful balance between efficient pivot selection and a guaranteed worst-case linear running time.

3. What is QuickSelect?

It is an algorithm that finds the k-th smallest element without sorting the entire array.

4. What is the worst-case complexity of QuickSelect?

O(n²).

5. What is the worst-case complexity of Median of Medians?

O(n).

6. What is a poor pivot?

A pivot that divides an array into highly unbalanced partitions.

7. What is randomization?

Selecting a pivot randomly to reduce the chance of repeatedly getting poor partitions.

8. What is Meet-in-the-Middle?

A technique that divides a problem into two halves and combines their partial results.

9. What is the Subset-Sum problem?

Finding whether a subset of given numbers adds up to a target value.

10. What is the main advantage of Meet-in-the-Middle?

It reduces the exponential search space from approximately O(2ⁿ) to O(2^(n/2)) per half.

11. What is its main disadvantage?

It requires additional memory to store subset sums.

31. Individual Responsibility Summary
Student	Primary task	Verification task
Student A	Median of Medians	Meet-in-the-Middle explanation
Student B	Meet-in-the-Middle	Pivot quality explanation
