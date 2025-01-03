// **Merge Sort** is a **divide and conquer** algorithm that splits the input array into smaller subarrays, sorts them, and then merges them back together in sorted order. It is efficient and widely used, especially for large datasets.
//
// ---
//
// ### **How Merge Sort Works:**
// 1. **Divide**:
//    - Split the array into two halves recursively until each subarray contains only one element (which is inherently sorted).
//
// 2. **Conquer (Sort)**:
//    - Sort each pair of subarrays by merging them in sorted order.
//
// 3. **Combine**:
//    - Repeatedly merge the sorted subarrays back together to form a fully sorted array.
//
// ---
//
// ### **Steps of Merge Sort** (Example with `[38, 27, 43, 3, 9, 82, 10]`):
// 1. **Divide**:
//    - Split the array into two halves: `[38, 27, 43]` and `[3, 9, 82, 10]`.
//
// 2. **Recursively Split**:
//    - `[38, 27, 43]` → `[38]` and `[27, 43]` → `[27]` and `[43]`.
//    - `[3, 9, 82, 10]` → `[3, 9]` and `[82, 10]` → `[3]`, `[9]`, `[82]`, `[10]`.
//
// 3. **Merge Subarrays**:
//    - `[27]` and `[43]` → `[27, 43]`.
//    - `[38]` and `[27, 43]` → `[27, 38, 43]`.
//    - `[3]` and `[9]` → `[3, 9]`.
//    - `[82]` and `[10]` → `[10, 82]`.
//    - `[3, 9]` and `[10, 82]` → `[3, 9, 10, 82]`.
//
// 4. **Final Merge**:
//    - `[27, 38, 43]` and `[3, 9, 10, 82]` → `[3, 9, 10, 27, 38, 43, 82]`.
//
// ---
//
// ### **Key Points**:
// - **Merge Process**:
//    - To merge two sorted arrays, compare their smallest (front) elements.
//    - Append the smaller element to the new array and move to the next element in that subarray.
//    - Continue until all elements from both arrays are merged.
//
// - **Recursive Approach**:
//    - Merge sort relies on recursion to repeatedly divide and merge.
//
// ---
//
// ### **Characteristics**:
// 1. **Time Complexity**:
//    - Best, Average, and Worst Case: \(O(n \log n)\), where \(n\) is the size of the array.
//    - Efficient even for large datasets due to its logarithmic nature.
//
// 2. **Space Complexity**:
//    - \(O(n)\) due to the temporary arrays used for merging.
//
// 3. **Stable Sort**:
//    - Yes, as it maintains the relative order of equal elements.
//
// 4. **Use Case**:
//    - Ideal for large datasets where stability is required and extra memory is available.
//
// ---
//
// ### **Visualization**:
// **Input**: `[38, 27, 43, 3, 9, 82, 10]`
// **Process**:
// ```
// [38, 27, 43, 3, 9, 82, 10]
//       /                 \
// [38, 27, 43]          [3, 9, 82, 10]
//    /     \              /         \
// [38]   [27, 43]      [3, 9]     [82, 10]
//         /   \          /  \       /   \
//       [27]  [43]     [3]  [9]   [82] [10]
//         \   /          \   /       \   /
//      [27, 43]       [3, 9]      [10, 82]
//         \               /            /
//      [27, 38, 43]   [3, 9, 10, 82]
//            \         /
//     [3, 9, 10, 27, 38, 43, 82]
// ```
// **Output**: `[3, 9, 10, 27, 38, 43, 82]`.


List<int> mergeSort(List<int> nums) {
  if (nums.length <= 1) {
    return nums;
  }
  int mid = nums.length ~/ 2;
  List<int> left = mergeSort(nums.sublist(0, mid));
  List<int> right = mergeSort(nums.sublist(mid));
  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;
  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }
  while (i < left.length) {
    result.add(left[i]);
    i++;
  }
  while (j < right.length) {
    result.add(right[j]);
    j++;
  }
  return result;
}


main() {
  print(mergeSort([5, 7, 8, 1, 3]));
}