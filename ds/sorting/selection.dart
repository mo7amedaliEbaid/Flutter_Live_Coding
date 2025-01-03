// Selection Sort is a simple sorting algorithm that works by dividing the input array into two parts: the sorted part and the unsorted part. It iteratively selects the smallest (or largest, depending on the sorting order) element from the unsorted part and swaps it with the first element of the unsorted part, growing the sorted portion one element at a time.
//
// ### Steps of Selection Sort:
// 1. **Initialize**: Start with the entire array as the unsorted part.
// 2. **Find the Minimum (or Maximum)**:
//    - Scan the unsorted part of the array to find the smallest (or largest) element.
// 3. **Swap**:
//    - Swap the smallest (or largest) element found with the first element of the unsorted part.
// 4. **Shrink the Unsorted Part**:
//    - Move the boundary of the sorted part one element to the right.
// 5. **Repeat**:
//    - Repeat the process for the remaining unsorted part until the entire array is sorted.
//
// ### Example:
// Consider an array: `[64, 25, 12, 22, 11]`.
//
// 1. **First Pass**:
//    - Find the smallest element in `[64, 25, 12, 22, 11]`: it's `11`.
//    - Swap `11` with `64`.
//    - Array becomes: `[11, 25, 12, 22, 64]`.
//
// 2. **Second Pass**:
//    - Find the smallest element in `[25, 12, 22, 64]`: it's `12`.
//    - Swap `12` with `25`.
//    - Array becomes: `[11, 12, 25, 22, 64]`.
//
// 3. **Third Pass**:
//    - Find the smallest element in `[25, 22, 64]`: it's `22`.
//    - Swap `22` with `25`.
//    - Array becomes: `[11, 12, 22, 25, 64]`.
//
// 4. **Fourth Pass**:
//    - Find the smallest element in `[25, 64]`: it's `25`.
//    - No swap needed.
//    - Array becomes: `[11, 12, 22, 25, 64]`.
//
// 5. **Fifth Pass**:
//    - Only one element (`64`) remains, so it's already sorted.
//
// Final sorted array: `[11, 12, 22, 25, 64]`.
//
// ### Characteristics:
// - **Time Complexity**:
//   - Best, Average, and Worst Case: \(O(n^2)\) (always scans the unsorted part fully).
// - **Space Complexity**: \(O(1)\) (in-place sorting).
// - **Stable Sort**: No, as it may change the relative order of equal elements.
// - **Use Case**: Suitable for small datasets or when simplicity is preferred over efficiency.

List<int> selectionSort(List<int> nums) {
  int n = nums.length;
  for (int i = 0; i < n - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < n; j++) {
      if (nums[j] < nums[minIndex]) {
        minIndex = j;
      }
    }
    // Swap nums[i] and nums[minIndex]
    int temp = nums[i];
    nums[i] = nums[minIndex];
    nums[minIndex] = temp;
  }
  return nums;
}

main() {
  print(selectionSort([5, 3, 4, 1, 2]));
}
