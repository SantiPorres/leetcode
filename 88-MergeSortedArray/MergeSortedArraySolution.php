<?php 

class Solution {
    /**
     * @param Integer[] $nums1
     * @param Integer $m
     * @param Integer[] $nums2
     * @param Integer $n
     * @return NULL
     */
    static function merge(&$nums1, $m, $nums2, $n) {
        array_splice($nums1, $m, $n, $nums2);
        sort($nums1, SORT_NUMERIC);
        foreach($nums1 as $num){
            echo $num . "\n";
        }
    }
}

$testCases = [
    [
        'nums1' => [1,2,3,0,0,0],
        'm' => 3,
        'nums2' => [2,5,6],
        'n' => 3,
        'expected' => [1,2,2,3,5,6]
    ],
    [
        'nums1' => [1],
        'm' => 1,
        'nums2' => [],
        'n' => 0,
        'expected' => [1]
    ],
    [
        'nums1' => [0],
        'm' => 0,
        'nums2' => [1],
        'n' => 1,
        'expected' => [1]
    ]
];

foreach ($testCases as $case) {
    $nums1 = $case['nums1'];
    $m = $case['m'];
    $nums2 = $case['nums2'];
    $n = $case['n'];
    $expected = $case['expected'];

    Solution::merge($nums1, $m, $nums2, $n);

    if ($nums1 === $expected) {
        echo "Test passed" . "\n";
    } else {
        echo "Test failed" . "\n";
    }
}