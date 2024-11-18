<?php 

/**
 * 1652. Defuse the Bomb
 * https://leetcode.com/problems/defuse-the-bomb/
 */

class Solution {

    /**
     * @param Integer[] $code
     * @param Integer $k
     * @return Integer[]
     */
    public static function decrypt($code, $k) {
        $answer = [];
        foreach ($code as $index => $num) {
            $num = 0;
            for ($i = 1; $i <= abs($k); $i++) {
                $codeNums = $k > 0 ? $code : array_reverse($code);
                $num = $num + $codeNums[($index + $i) % count($code)];
            }
            $answer[] = $num;
        }
        return $k > 0 ? $answer : array_reverse($answer);
    }
}

$testCases = [
    [
        'code' => [5,7,1,4],
        'k' => 3,
        'expected' => [12,10,16,13]
    ],
    [
        'code' => [1,2,3,4],
        'k' => 0,
        'expected' => [0,0,0,0]
    ],
    [
        'code' => [2,4,9,3],
        'k' => -2,
        'expected' => [12,5,6,13]
    ],
];

foreach ($testCases as $case) {
    $code = $case['code'];
    $k = $case['k'];
    $expected = $case['expected'];

    $output = Solution::decrypt($code, $k);

    if ($output === $expected) {
        echo "Test passed" . "<br>";
    } else {
        echo "Test failed" . "<br>";
    }
}
