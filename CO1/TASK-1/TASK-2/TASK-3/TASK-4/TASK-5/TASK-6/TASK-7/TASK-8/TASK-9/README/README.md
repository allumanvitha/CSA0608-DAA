## 1. Objective

The objective is to implement and compare three searching algorithms — Linear Search, Recursive Binary Search, and Hash Table Search — using student registration number datasets of 1,000, 10,000, 100,000, and 1,000,000 records.

The experiment will verify that all algorithms return correct results and compare their number of comparisons and execution time under consistent test conditions.

## 2. Experimental Setup

- Programming language: Python 3
- Dataset: Unique student registration numbers, generated in ascending order.
- Dataset sizes: 1,000; 10,000; 100,000; 1,000,000.
- Search cases: First element, middle element, last element, and missing registration number.
- Measurements: Number of comparisons and search execution time.
- Correctness: Each result is checked against the expected registration number.

To compare fairly, all three algorithms use the same registration numbers and target values. Binary search uses the sorted dataset, while linear search uses the same records in their original order. The hash table is built before timing individual searches, and its construction time is measured separately.

## 3. Python Implementation

The following program implements all three algorithms and automatically tests all four dataset sizes. It repeats each search three times and records the median execution time to reduce timing noise.

The program also checks the returned result using assertions. If any algorithm gives an incorrect result, the program stops with an error.

Download the complete files:

- Python source code – Task 8
- Experimental results – CSV file

## 4. Test Cases

|   |
| - |

Test case

|   |
| - |

Target

|   |
| - |

Purpose

|   |
| - |

First element

|   |
| - |

First registration number

|   |
| - |

Tests the best case for linear search

|   |
| - |

Middle element

|   |
| - |

Middle registration number

|   |
| - |

Tests a typical successful search

|   |
| - |

Last element

|   |
| - |

Last registration number

|   |
| - |

Tests the worst case for linear search

|   |
| - |

Missing number

|   |
| - |

Number not in dataset

|   |
| - |

Tests unsuccessful searching

The same logical registration numbers are used across all three algorithms. Binary search operates on sorted data, and hash-table construction is timed separately from lookup.

## 5. Experimental Results

The following results were obtained by running the Python implementation. Execution times are illustrative measurements from this run and may vary with hardware and system load.

### A. Worst-case or unsuccessful search

|   |
| - |

Dataset size

|   |
| - |

Linear comparisons

|   |
| - |

Binary comparisons

|   |
| - |

Hash lookups

|   |
| - |

1,000

|   |
| - |

1,000

|   |
| - |

10

|   |
| - |

1

|   |
| - |

10,000

|   |
| - |

10,000

|   |
| - |

14

|   |
| - |

1

|   |
| - |

100,000

|   |
| - |

100,000

|   |
| - |

17

|   |
| - |

1

|   |
| - |

1,000,000

|   |
| - |

1,000,000

|   |
| - |

20

|   |
| - |

1

Hash lookups count one dictionary lookup, not the internal key comparisons performed by Python.

### B. Measured search execution time

For the unsuccessful-search test, the measured median times were:

|   |
| - |

Dataset size

|   |
| - |

Linear search

|   |
| - |

Recursive binary search

|   |
| - |

Hash table search

|   |
| - |

1,000

|   |
| - |

0.0397 ms

|   |
| - |

0.0016 ms

|   |
| - |

0.00015 ms

|   |
| - |

10,000

|   |
| - |

0.4679 ms

|   |
| - |

0.0035 ms

|   |
| - |

0.00017 ms

|   |
| - |

100,000

|   |
| - |

4.6493 ms

|   |
| - |

0.0026 ms

|   |
| - |

0.00016 ms

|   |
| - |

1,000,000

|   |
| - |

47.0840 ms

|   |
| - |

0.0032 ms

|   |
| - |

0.00019 ms

These measurements support the theoretical trend, although very small timings are affected by measurement overhead and system variation.

## 6. Preprocessing Cost

The hash table is built once for each dataset, and its construction time is measured separately. Binary search requires sorted data; in this experiment, the generated dataset is already sorted, so no sorting time is included.

|   |
| - |

Algorithm

|   |
| - |

Preprocessing

|   |
| - |

Expected preprocessing complexity

|   |
| - |

Linear search

|   |
| - |

None

|   |
| - |

\\(O(1)\\) additional setup

|   |
| - |

Recursive binary search

|   |
| - |

Sorting if needed

|   |
| - |

\\(O(n\log n)\\)

|   |
| - |

Hash table search

|   |
| - |

Insert all keys

|   |
| - |

\\(O(n)\\) average

For a fair real-world comparison, include sorting or hash-table construction costs when the data is not already prepared. If many searches use the same dataset, these costs can be spread across the searches.

## 7. Analysis and Discussion

Linear search: The experiment shows that unsuccessful searches require \\(n\\) comparisons. When the dataset grows from 1,000 to 1,000,000 records, the number of comparisons increases from 1,000 to 1,000,000. This confirms the linear growth behaviour, \\(O(n)\\).

Recursive binary search: The comparison count increases from about 10 to 20 as the dataset grows by a factor of 1,000. This supports the logarithmic growth behaviour, \\(O(\log n)\\). It is efficient for large datasets when the records are sorted.

Hash table search: Each test performs one dictionary lookup in the implementation. The measured lookup time remains approximately constant across the tested sizes, supporting the expected \\(O(1)\\) lookup behaviour. Actual performance depends on hashing, collisions, memory, and implementation details.

## 8. Conclusion

The experimental results generally support the theoretical analysis from the previous tasks. Linear search becomes increasingly expensive for large datasets, recursive binary search scales logarithmically, and hash table search provides expected constant-time lookups after preprocessing.

All three algorithms are tested against first, middle, last, and missing registration numbers, and correctness is checked automatically. This makes the implementation suitable for comparing theoretical complexity with experimental behaviour.

task8_search_experiment.pyCodetask8_results.csvSpreadsheet

Create more advanced files

Upgrade to ChatGPT Plus to create more polished and accurate documents, spreadsheets, presentations, and more.

Try Plus free
