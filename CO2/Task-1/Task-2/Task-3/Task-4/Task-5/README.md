1. Aim
To design a Brute-Force Convex Hull algorithm that identifies the outer boundary of monitoring stations in a wildlife reserve using their coordinates.
2. Geometric Principle
Two points \(P_i=(x_i,y_i)\) and \(P_j=(x_j,y_j)\) define a candidate line. To determine whether this line can be part of the convex hull, check the position of every other point relative to it.

The position of a point \(P_k=(x_k,y_k)\) is determined using the cross-product expression:
\[
C=(x_j-x_i)(y_k-y_i)
-(y_j-y_i)(x_k-x_i)
\]

- If \(C>0\), the point lies on one side of the directed line.
- If \(C<0\), the point lies on the opposite side.
- If \(C=0\), the point lies on the line.
Decision rule: If all other points lie on the same side of a candidate line, or directly on it, the line is a potential convex-hull edge.
3. Pseudocode
BEGIN
    INPUT all points
    CREATE an empty list of hull edges

    FOR each pair of distinct points A and B
        SET positive = false
        SET negative = false

        FOR each other point P
            CALCULATE cross product of A, B, P

            IF cross product > 0
                positive = true
            ELSE IF cross product < 0
                negative = true

        IF positive is false OR negative is false
            ADD candidate edge A-B

    REMOVE duplicate edges
    ORDER the hull boundary points
    DISPLAY the convex hull
END

import matplotlib.pyplot as plt

def cross(a, b, p):
    return ((b[0] - a[0]) * (p[1] - a[1])
            - (b[1] - a[1]) * (p[0] - a[0]))


def convex_hull(points):
    points = sorted(set(points))
    n = len(points)
    edges = []
    checks = 0

    for i in range(n):
        for j in range(i + 1, n):
            a = points[i]
            b = points[j]
            positive = False
            negative = False
            collinear = []

            for p in points:
                if p == a or p == b:
                    continue

                checks += 1
                value = cross(a, b, p)

                if value > 0:
                    positive = True
                elif value < 0:
                    negative = True
                else:
                    collinear.append(p)

            # Points must lie on only one side
            if positive and negative:
                continue

            # Reject a pair if another point lies
            # strictly between its endpoints
            middle_point = False

            for p in collinear:
                if ((p[0] - a[0]) * (p[0] - b[0])
                    + (p[1] - a[1]) * (p[1] - b[1]) < 0):
                    middle_point = True
                    break

            if not middle_point:
                edges.append((a, b))

    return edges, checks


def display_hull(points, edges, title):
    plt.figure()
    x = [p[0] for p in points]
    y = [p[1] for p in points]
    plt.scatter(x, y, label="Monitoring stations")

    for a, b in edges:
        plt.plot([a[0], b[0]], [a[1], b[1]], "r-")

    plt.title(title)
    plt.xlabel("X coordinate")
    plt.ylabel("Y coordinate")
    plt.grid(True)
    plt.legend()
    plt.show()


# Test 1: Boundary and interior points
points1 = [
    (1, 1), (4, 1), (5, 3), (3, 5),
    (1, 4), (2, 2), (3, 2), (3, 3)
]

edges1, checks1 = convex_hull(points1)
print("Test 1")
print("Hull edges:", edges1)
print("Point checks:", checks1)
display_hull(points1, edges1, "Test 1: Wildlife Reserve")

# Test 2: Square with collinear boundary points
points2 = [
    (0, 0), (2, 0), (4, 0), (4, 2),
    (4, 4), (2, 4), (0, 4), (0, 2), (2, 2)
]

edges2, checks2 = convex_hull(points2)
print("Test 2")
print("Hull edges:", edges2)
print("Point checks:", checks2)
display_hull(points2, edges2, "Test 2: Square Boundary")
5. Test Configurations and Expected Results









Test 1: Boundary and interior points
- Contains eight stations.
- Five outer vertices form the hull.
- Three interior points must not become boundary vertices.
Expected outer vertices: (1,1), (4,1), (5,3), (3,5), (1,4).












Test 2: Square with collinear boundary points
- Contains nine stations.
- Some stations lie along the square's edges.
- One station lies inside the square.
Expected hull vertices: (0,0), (4,0), (4,4), (0,4).



The Python program generates the actual plots when executed. The red lines represent accepted hull edges.
6. Experimental Evidence
The implementation checks every other point for each candidate pair.
Test	Number of points (\(n\))	Candidate pairs	Point checks
Test 1	8	28	168
Test 2	9	36	252

The number of candidate pairs is:
\[
\frac{n(n-1)}{2}
\]

Each pair checks the remaining \(n-2\) points. Therefore, the total number of point checks is:
\[
T(n)=\frac{n(n-1)(n-2)}{2}
\]

The time complexity is \(O(n^3)\), and the auxiliary space is \(O(n)\) for storing points and accepted edges, excluding plotting.

As the number of monitoring stations increases, the number of checks grows rapidly. For example, increasing from 100 to 1,000 stations increases the theoretical point-check count from 485,100 to 498,501,000.
7. Correctness Explanation
The geometric test is based on the following reasoning:
1. Every convex-hull edge lies on a supporting line, with all points contained in one closed half-plane.
2. If points occur on both sides of a candidate line, that line cannot be a convex-hull boundary edge.
3. If all points lie on one side or on the line, the candidate line may support the convex hull.
4. Checking collinear points ensures that intermediate points do not create unnecessary short boundary edges.
5. The accepted extreme edges form the outer boundary of the point set.
8. Conclusion
The Brute-Force Convex Hull algorithm uses a cross-product test to identify the outer boundary of monitoring stations. It is easy to understand and suitable for small datasets, but its \(O(n^3)\) computational cost makes it inefficient for large reserves. A more scalable solution could use Graham Scan or Andrew's Monotone Chain, which typically run in \(O(n\log n)\) time.


Note: If several points are collinear on an accepted line, retain the two extreme endpoints for the final boundary. Duplicate coordinates should also be removed before processing.
4. Python Implementation with Boundary Visualisation
This implementation checks every candidate pair against all other points. It also avoids accepting short edges when another point lies between their endpoints on the same line.
