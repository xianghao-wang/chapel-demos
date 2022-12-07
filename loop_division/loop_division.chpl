module LoopDivision {
    use Random;

    const N = 1024 * 1024 * 1024;
    const A: real(32) = 1.0;
    const B: real(32) = 20.0;
    const C: real(32) = 25.6;
    const D: real(32) = 24.0;
    
    proc main() {
        writeln(loopDivision());
    }

    proc loopDivision() {
        var nums: [0..<N] int;
        var sum: real(32) = 0.0;

        fillRandom(nums);

        for i in 0..<N {
            const x: real(32) = 
                if nums[i] % 3 == 0 
                then (if nums[i] % 5 == 0 then A else B)
                else (if nums[i] % 4 == 0 then C else D);

            const rx: real(32) = 1.0 / x;
            sum += x + rx;
        }

        sum = sqrt(sum);

        return sum;
    }
}