## Loop Division

### Chapel codes
```
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
```

### C codes
```C
float loopDivision()
{
    float sum = 0;

    for (int i = 0; i < N; i ++) nums[i] = random();

    for (int i = 0; i < N; i ++)
    {
        const float x = nums[i] % 3 == 0 ?
            (nums[i] % 5 == 0 ? A : B) :
            (nums[i] % 4 == 0 ? C : D);
        const float rx = 1.0f / x;
        sum = x + rx;
    }

    sum = sqrt(sum);

    return sum;
}
```

### Chapel Assembly
```asm
  43b1c0:	c5 fa 10 1e          	vmovss (%rsi),%xmm3
  43b1c4:	c5 ea 5e e3          	vdivss %xmm3,%xmm2,%xmm4
  43b1c8:	c5 e2 58 dc          	vaddss %xmm4,%xmm3,%xmm3
  43b1cc:	c5 fa 58 c3          	vaddss %xmm3,%xmm0,%xmm0
```

### C Assembly
```asm
4011b4:	69 d1 ab aa aa aa    	imul   $0xaaaaaaab,%ecx,%edx
  4011ba:	81 c2 aa aa aa 2a    	add    $0x2aaaaaaa,%edx
  4011c0:	81 fa 54 55 55 55    	cmp    $0x55555554,%edx
  4011c6:	77 c8                	ja     401190 <loopDivision+0x30>
  4011c8:	69 c9 cd cc cc cc    	imul   $0xcccccccd,%ecx,%ecx
  4011ce:	81 c1 99 99 99 19    	add    $0x19999999,%ecx
```