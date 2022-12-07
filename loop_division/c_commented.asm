
0000000000401160 <loopDivision>:
  401160:	53                   	push   %rbx
  401161:	31 db                	xor    %ebx,%ebx
  401163:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40116a:	00 00 00 
  40116d:	0f 1f 00             	nopl   (%rax)
  401170:	e8 cb fe ff ff       	callq  401040 <random@plt>
  401175:	89 04 9d 50 40 40 00 	mov    %eax,0x404050(,%rbx,4)
  40117c:	48 83 c3 01          	add    $0x1,%rbx
  401180:	48 81 fb 00 00 00 40 	cmp    $0x40000000,%rbx
  401187:	75 e7                	jne    401170 <loopDivision+0x10>
  401189:	31 c0                	xor    %eax,%eax
  40118b:	eb 20                	jmp    4011ad <loopDivision+0x4d>
  40118d:	0f 1f 00             	nopl   (%rax)

  
  // Loop start 
  401190:	31 d2                	xor    %edx,%edx // %edx = 0
  401192:	f6 c1 03             	test   $0x3,%cl
  401195:	0f 94 c2             	sete   %dl
  401198:	f3 0f 10 04 95 04 20 	movss  0x402004(,%rdx,4),%xmm0


  40119f:	40 00 
  4011a1:	48 83 c0 01          	add    $0x1,%rax
  4011a5:	48 3d 00 00 00 40    	cmp    $0x40000000,%rax
  4011ab:	74 47                	je     4011f4 <loopDivision+0x94>

  // %ecx = nums[i]
  4011ad:	8b 0c 85 50 40 40 00 	mov    0x404050(,%rax,4),%ecx
  4011b4:	69 d1 ab aa aa aa    	imul   $0xaaaaaaab,%ecx,%edx
  4011ba:	81 c2 aa aa aa 2a    	add    $0x2aaaaaaa,%edx
  4011c0:	81 fa 54 55 55 55    	cmp    $0x55555554,%edx
  4011c6:	77 c8                	ja     401190 <loopDivision+0x30>
  4011c8:	69 c9 cd cc cc cc    	imul   $0xcccccccd,%ecx,%ecx
  4011ce:	81 c1 99 99 99 19    	add    $0x19999999,%ecx
  4011d4:	31 d2                	xor    %edx,%edx
  4011d6:	81 f9 33 33 33 33    	cmp    $0x33333333,%ecx
  4011dc:	0f 92 c2             	setb   %dl
  4011df:	f3 0f 10 04 95 0c 20 	movss  0x40200c(,%rdx,4),%xmm0
  4011e6:	40 00 
  4011e8:	48 83 c0 01          	add    $0x1,%rax
  4011ec:	48 3d 00 00 00 40    	cmp    $0x40000000,%rax
  4011f2:	75 b9                	jne    4011ad <loopDivision+0x4d>
  // Loop end



  4011f4:	f3 0f 10 0d 18 0e 00 	movss  0xe18(%rip),%xmm1        # 402014 <_IO_stdin_used+0x14>
  4011fb:	00 
  4011fc:	f3 0f 5e c8          	divss  %xmm0,%xmm1
  401200:	f3 0f 58 c8          	addss  %xmm0,%xmm1
  401204:	f3 0f 52 d1          	rsqrtss %xmm1,%xmm2
  401208:	0f 57 c0             	xorps  %xmm0,%xmm0
  40120b:	f3 0f c2 c1 00       	cmpeqss %xmm1,%xmm0
  401210:	f3 0f 59 ca          	mulss  %xmm2,%xmm1
  401214:	f3 0f 10 1d fc 0d 00 	movss  0xdfc(%rip),%xmm3        # 402018 <_IO_stdin_used+0x18>
  40121b:	00 
  40121c:	f3 0f 59 d9          	mulss  %xmm1,%xmm3
  401220:	f3 0f 59 ca          	mulss  %xmm2,%xmm1
  401224:	f3 0f 58 0d f0 0d 00 	addss  0xdf0(%rip),%xmm1        # 40201c <_IO_stdin_used+0x1c>
  40122b:	00 
  40122c:	f3 0f 59 cb          	mulss  %xmm3,%xmm1
  401230:	0f 55 c1             	andnps %xmm1,%xmm0
  401233:	5b                   	pop    %rbx
  401234:	c3                   	retq   
  401235:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40123c:	00 00 00 
  40123f:	90                   	nop
