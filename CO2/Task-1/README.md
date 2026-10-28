Q1. Sorting Under Different Data Conditions (6 Marks)
1. Aim
To implement Selection Sort, Bubble Sort, and Insertion Sort, compare their performance using different input datasets, and recommend a suitable algorithm for an e-commerce fulfilment centre.
2. Pseudocode
A. Selection Sort
START
FOR i = 0 to n-2
    min = i
    FOR j = i+1 to n-1
        IF A[j] < A[min]
            min = j
    IF min != i
        Swap A[i] and A[min]
STOP
START
FOR i = 0 to n-2
    swapped = false
    FOR j = 0 to n-2-i
        IF A[j] > A[j+1]
            Swap A[j] and A[j+1]
            swapped = true
    IF swapped == false
        STOP
STOP
START
FOR i = 1 to n-1
    key = A[i]
    j = i-1
    WHILE j >= 0 AND A[j] > key
        A[j+1] = A[j]
        j = j-1
    A[j+1] = key
STOP
These pseudocode examples sort the scores in ascending order. If a higher dispatch priority must come first, reverse the comparison conditions to sort in descending order.
3. Python implementation
The following program sorts dispatch priority scores from highest to lowest and counts comparisons, swaps, and movements.

def selection_sort(a):
    a = a.copy()
    comparisons = 0
    swaps = 0

    for i in range(len(a) - 1):
        maximum = i

        for j in range(i + 1, len(a)):
            comparisons += 1

            if a[j] > a[maximum]:
                maximum = j

        if maximum != i:
            a[i], a[maximum] = a[maximum], a[i]
            swaps += 1

    return a, comparisons, swaps


def bubble_sort(a):
    a = a.copy()
    comparisons = 0
    swaps = 0

    for i in range(len(a) - 1):
        swapped = False

        for j in range(len(a) - 1 - i):
            comparisons += 1

            if a[j] < a[j + 1]:
                a[j], a[j + 1] = a[j + 1], a[j]
                swaps += 1
                swapped = True

        if not swapped:
            break

    return a, comparisons, swaps


def insertion_sort(a):
    a = a.copy()
    comparisons = 0
    movements = 0

    for i in range(1, len(a)):
        key = a[i]
        j = i - 1

        while j >= 0:
            comparisons += 1

            if a[j] < key:
                a[j + 1] = a[j]
                movements += 1
                j -= 1
            else:
                break

        a[j + 1] = key

    return a, comparisons, movements


datasets = {
    "Nearly sorted": [100, 90, 70, 80, 60],
    "Reverse sorted": [60, 70, 80, 90, 100],
    "Empty list": []
}

for name, data in datasets.items():
    print("\n", name, ":", data)
    print("Selection Sort:", selection_sort(data))
    print("Bubble Sort:", bubble_sort(data))
    print("Insertion Sort:", insertion_sort(data))
4. Output
Nearly sorted : [100, 90, 70, 80, 60]
Selection Sort: ([100, 90, 80, 70, 60], 10, 1)
Bubble Sort: ([100, 90, 80, 70, 60], 7, 1)
Insertion Sort: ([100, 90, 80, 70, 60], 5, 1)

Reverse sorted : [60, 70, 80, 90, 100]
Selection Sort: ([100, 90, 80, 70, 60], 10, 2)
Bubble Sort: ([100, 90, 80, 70, 60], 10, 10)
Insertion Sort: ([100, 90, 80, 70, 60], 10, 10)

Empty list : []
Selection Sort: ([], 0, 0)
Bubble Sort: ([], 0, 0)
Insertion Sort: ([], 0, 0)


The output format is (sorted_list, comparisons, swaps_or_movements). For Insertion Sort, the third value counts shifts, not the final placement of the key.
5. Comparison of results
Dataset	Algorithm	Comparisons	Swaps/shifts
Nearly sorted	Selection Sort	10	1 swap
Nearly sorted	Bubble Sort	7	1 swap
Nearly sorted	Insertion Sort	5	1 shift
Reverse sorted	Selection Sort	10	2 swaps
Reverse sorted	Bubble Sort	10	10 swaps
Reverse sorted	Insertion Sort	10	10 shifts
Empty list	All three	0	0

These counts are for the exact implementation and datasets shown above. Execution time is omitted because small five-element lists are too small for meaningful timing comparisons.
6. Time complexity
Algorithm	Best case	Average case	Worst case
Selection Sort	\(O(n^2)\)	\(O(n^2)\)	\(O(n^2)\)
Bubble Sort	\(O(n)\)	\(O(n^2)\)	\(O(n^2)\)
Insertion Sort	\(O(n)\)	\(O(n^2)\)	\(O(n^2)\)

7. Recommendation
I recommend Insertion Sort for this fulfilment centre because approximately 95% of the orders are already in the correct priority order. Insertion Sort can efficiently place a small number of new orders into their correct positions without repeatedly sorting the entire list.

Selection Sort performs a similar number of comparisons even when the data is nearly sorted. Bubble Sort with early stopping also performs well on nearly sorted data, but it may require many swaps for reverse-ordered input.
8. Conclusion
The experiment shows that no algorithm should always be preferred for every input condition. Insertion Sort is suitable for small, nearly sorted order lists, while the best choice depends on data arrangement and workload. For large production datasets, a stable built-in sorting method should also be considered.
