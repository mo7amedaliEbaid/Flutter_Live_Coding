// Insertion sort is a simple and intuitive sorting algorithm that works by building the sorted portion of an array one element at a time. It operates similarly to how you might sort playing cards in your hands. Here's how it works:
//
// ### Algorithm Steps:
//
// 1. **Start with the first element:**
//    - Consider the first element of the array as sorted.
//
// 2. **Pick the next element:**
//    - Take the next element from the unsorted portion.
//
// 3. **Compare and shift:**
//    - Compare this element with elements in the sorted portion (from right to left).
//    - Shift the elements in the sorted portion one position to the right if they are larger than the current element.
//
// 4. **Insert the element:**
//    - Place the current element in its correct position in the sorted portion.
//
// 5. **Repeat:**
//    - Repeat steps 2–4 for all remaining elements in the unsorted portion.
//
// 6. **Stop:**
//    - When all elements are processed, the array is sorted.
//
// ### Example:
//
// Let's sort the array `[5, 3, 4, 1, 2]` using insertion sort:
//
// - Initial array: `[5, 3, 4, 1, 2]`
//
// 1. **Step 1:** `[5]` (first element is already sorted)
//
// 2. **Step 2:** Compare 3 with 5. Shift 5 to the right and insert 3:
//    - `[3, 5, 4, 1, 2]`
//
// 3. **Step 3:** Compare 4 with 5 (shift 5). Compare 4 with 3 (no shift). Insert 4:
//    - `[3, 4, 5, 1, 2]`
//
// 4. **Step 4:** Compare 1 with 5, 4, and 3 (shift all three). Insert 1:
//    - `[1, 3, 4, 5, 2]`
//
// 5. **Step 5:** Compare 2 with 5, 4, and 3 (shift all three). Insert 2:
//    - `[1, 2, 3, 4, 5]`
//
// ### Characteristics of Insertion Sort:
//
// - **Time Complexity:**
//   - Best case: \(O(n)\) (already sorted array)
//   - Worst case: \(O(n^2)\) (reverse sorted array)
//   - Average case: \(O(n^2)\)
//
// - **Space Complexity:**
//   - \(O(1)\) (in-place sorting)
//
// - **Stability:**
//   - It is a stable sorting algorithm (maintains the relative order of equal elements).
//
// ### Visual Representation:
//
// Imagine the array as two sections: sorted and unsorted. The sorted portion grows by picking and placing elements from the unsorted portion in the correct position.

List<int> insertionSort(List<int> nums) {
  print("nums=$nums");
  for (var i = 1; i < nums.length; i++) {
    print("nums[i]=${nums[i]}");
    int curr = nums[i];
    print("curr=$curr");
    int j = i - 1;
    print("j=$j");
    while (j >= 0 && curr < nums[j]) {
      print("nums[j + 1]=${nums[j + 1]}");
      print("nums[j]=${nums[j]}");
      nums[j + 1] = nums[j];
      j--;
      print("j=$j");
    }
    nums[j + 1] = curr;
    print("nums=$nums");
  }
  return nums;
}

main() {
  print(insertionSort([5, 3, 4, 1, 2]));
}
