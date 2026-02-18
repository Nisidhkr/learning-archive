#include <bits/stdc++.h>
using namespace std;

struct Point {
    int x, y;
};

// Global reference point
Point p0;

// Find orientation of ordered triplet (a, b, c)
// 0 → collinear
// 1 → clockwise
// 2 → counterclockwise
int orientation(Point a, Point b, Point c) {
    int val = (b.y - a.y) * (c.x - b.x) -
              (b.x - a.x) * (c.y - b.y);

    if (val == 0) return 0;
    return (val > 0) ? 1 : 2;
}

// Distance squared between two points
int distSq(Point a, Point b) {
    return (a.x - b.x) * (a.x - b.x) +
           (a.y - b.y) * (a.y - b.y);
}

// Sort points by polar angle w.r.t p0
bool compare(Point a, Point b) {
    int o = orientation(p0, a, b);
    if (o == 0)
        return distSq(p0, a) < distSq(p0, b);
    return (o == 2);
}

// Graham Scan function
void convexHull(vector<Point>& points) {
    int n = points.size();

    // Step 1: Find bottom-most point
    int ymin = points[0].y, minIndex = 0;
    for (int i = 1; i < n; i++) {
        if (points[i].y < ymin ||
           (points[i].y == ymin && points[i].x < points[minIndex].x)) {
            ymin = points[i].y;
            minIndex = i;
        }
    }

    swap(points[0], points[minIndex]);
    p0 = points[0];

    // Step 2: Sort by angle
    sort(points.begin() + 1, points.end(), compare);

    // Step 3: Build hull using stack
    stack<Point> st;
    st.push(points[0]);
    st.push(points[1]);
    st.push(points[2]);

    for (int i = 3; i < n; i++) {
        while (st.size() > 1) {
            Point top = st.top();
            st.pop();
            Point nextTop = st.top();
            if (orientation(nextTop, top, points[i]) == 2) {
                st.push(top);
                break;
            }
        }
        st.push(points[i]);
    }

    // Output hull
    cout << "Convex Hull points:\n";
    while (!st.empty()) {
        Point p = st.top();
        cout << "(" << p.x << ", " << p.y << ")\n";
        st.pop();
    }
}

int main() {
    vector<Point> points = {
        {0, 3}, {2, 2}, {1, 1},
        {2, 1}, {3, 0}, {0, 0},
        {3, 3}
    };

    convexHull(points);
    return 0;
}
