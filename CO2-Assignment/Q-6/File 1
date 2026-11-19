SELECTION SORT

START
INPUT array A
FOR i = 0 TO n-2
    minimum = i
    FOR j = i+1 TO n-1
        IF A[j] < A[minimum]
            minimum = j
    IF minimum != i
        SWAP A[i] AND A[minimum]
OUTPUT sorted array
STOP


BUBBLE SORT

START
INPUT array A
FOR i = 0 TO n-2
    swapped = FALSE
    FOR j = 0 TO n-i-2
        IF A[j] > A[j+1]
            SWAP A[j] AND A[j+1]
            swapped = TRUE
    IF swapped == FALSE
        BREAK
OUTPUT sorted array
STOP


INSERTION SORT

START
INPUT array A
FOR i = 1 TO n-1
    key = A[i]
    j = i-1
    WHILE j >= 0 AND A[j] > key
        A[j+1] = A[j]
        j = j-1
    A[j+1] = key
OUTPUT sorted array
STOP
