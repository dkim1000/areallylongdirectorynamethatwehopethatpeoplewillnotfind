
../../../build/user/uw-testbin/files1/files1:     file format elf32-tradbigmips

Disassembly of section .text:

00400000 <__start>:
  400000:	3c1c1001 	lui	gp,0x1001
  400004:	279c8000 	addiu	gp,gp,-32768
  400008:	2408fff8 	li	t0,-8
  40000c:	03a8e824 	and	sp,sp,t0
  400010:	27bdfff0 	addiu	sp,sp,-16
  400014:	3c011000 	lui	at,0x1000
  400018:	ac250020 	sw	a1,32(at)
  40001c:	0c100014 	jal	400050 <main>
  400020:	00000000 	nop
  400024:	00408021 	move	s0,v0
  400028:	0c1002b9 	jal	400ae4 <exit>
  40002c:	02002021 	move	a0,s0
  400030:	0c1002cf 	jal	400b3c <_exit>
  400034:	02002021 	move	a0,s0
  400038:	02002021 	move	a0,s0
  40003c:	24020003 	li	v0,3
  400040:	0000000c 	syscall
  400044:	0810000e 	j	400038 <__start+0x38>
  400048:	00000000 	nop
  40004c:	00000000 	nop

00400050 <main>:
  400050:	27bdffb8 	addiu	sp,sp,-72
  400054:	afb60040 	sw	s6,64(sp)
  400058:	3c160040 	lui	s6,0x40
  40005c:	2403fc19 	li	v1,-999
  400060:	26c41f40 	addiu	a0,s6,8000
  400064:	24050016 	li	a1,22
  400068:	2402002a 	li	v0,42
  40006c:	afbf0044 	sw	ra,68(sp)
  400070:	afa3001c 	sw	v1,28(sp)
  400074:	afb5003c 	sw	s5,60(sp)
  400078:	afb40038 	sw	s4,56(sp)
  40007c:	afb30034 	sw	s3,52(sp)
  400080:	afb20030 	sw	s2,48(sp)
  400084:	afb1002c 	sw	s1,44(sp)
  400088:	afb00028 	sw	s0,40(sp)
  40008c:	3c110040 	lui	s1,0x40
  400090:	3c100040 	lui	s0,0x40
  400094:	afa20018 	sw	v0,24(sp)
  400098:	0c1002ff 	jal	400bfc <open>
  40009c:	afa00020 	sw	zero,32(sp)
  4000a0:	3c050040 	lui	a1,0x40
  4000a4:	00409021 	move	s2,v0
  4000a8:	26071e80 	addiu	a3,s0,7808
  4000ac:	26261f60 	addiu	a2,s1,8032
  4000b0:	00402021 	move	a0,v0
  4000b4:	3c140040 	lui	s4,0x40
  4000b8:	24020023 	li	v0,35
  4000bc:	24a51f48 	addiu	a1,a1,8008
  4000c0:	0c10016e 	jal	4005b8 <test_positive>
  4000c4:	afa20010 	sw	v0,16(sp)
  4000c8:	26841f6c 	addiu	a0,s4,8044
  4000cc:	0c1002ff 	jal	400bfc <open>
  4000d0:	24050016 	li	a1,22
  4000d4:	3c050040 	lui	a1,0x40
  4000d8:	00409821 	move	s3,v0
  4000dc:	00402021 	move	a0,v0
  4000e0:	26071e80 	addiu	a3,s0,7808
  4000e4:	24020027 	li	v0,39
  4000e8:	24a51f74 	addiu	a1,a1,8052
  4000ec:	26261f60 	addiu	a2,s1,8032
  4000f0:	3c150040 	lui	s5,0x40
  4000f4:	26101e80 	addiu	s0,s0,7808
  4000f8:	0c10016e 	jal	4005b8 <test_positive>
  4000fc:	afa20010 	sw	v0,16(sp)
  400100:	26271f60 	addiu	a3,s1,8032
  400104:	02602821 	move	a1,s3
  400108:	02402021 	move	a0,s2
  40010c:	24020029 	li	v0,41
  400110:	26a61f8c 	addiu	a2,s5,8076
  400114:	afa20014 	sw	v0,20(sp)
  400118:	0c1000ed 	jal	4003b4 <test_not_equal>
  40011c:	afb00010 	sw	s0,16(sp)
  400120:	02402021 	move	a0,s2
  400124:	27a50018 	addiu	a1,sp,24
  400128:	0c10030f 	jal	400c3c <write>
  40012c:	24060004 	li	a2,4
  400130:	3c060040 	lui	a2,0x40
  400134:	00402021 	move	a0,v0
  400138:	26271f60 	addiu	a3,s1,8032
  40013c:	2402002d 	li	v0,45
  400140:	24c61f98 	addiu	a2,a2,8088
  400144:	24050004 	li	a1,4
  400148:	afa20014 	sw	v0,20(sp)
  40014c:	0c1001f4 	jal	4007d0 <test_equal>
  400150:	afb00010 	sw	s0,16(sp)
  400154:	02602021 	move	a0,s3
  400158:	27a5001c 	addiu	a1,sp,28
  40015c:	0c10030f 	jal	400c3c <write>
  400160:	24060004 	li	a2,4
  400164:	3c060040 	lui	a2,0x40
  400168:	24c61fc8 	addiu	a2,a2,8136
  40016c:	00402021 	move	a0,v0
  400170:	24050004 	li	a1,4
  400174:	26271f60 	addiu	a3,s1,8032
  400178:	24020031 	li	v0,49
  40017c:	afa20014 	sw	v0,20(sp)
  400180:	0c1001f4 	jal	4007d0 <test_equal>
  400184:	afb00010 	sw	s0,16(sp)
  400188:	0c100307 	jal	400c1c <close>
  40018c:	02402021 	move	a0,s2
  400190:	3c060040 	lui	a2,0x40
  400194:	24c61ff8 	addiu	a2,a2,8184
  400198:	00402021 	move	a0,v0
  40019c:	00002821 	move	a1,zero
  4001a0:	26271f60 	addiu	a3,s1,8032
  4001a4:	24020034 	li	v0,52
  4001a8:	afa20014 	sw	v0,20(sp)
  4001ac:	0c1001f4 	jal	4007d0 <test_equal>
  4001b0:	afb00010 	sw	s0,16(sp)
  4001b4:	0c100307 	jal	400c1c <close>
  4001b8:	02402021 	move	a0,s2
  4001bc:	3c050040 	lui	a1,0x40
  4001c0:	24a52008 	addiu	a1,a1,8200
  4001c4:	00402021 	move	a0,v0
  4001c8:	26261f60 	addiu	a2,s1,8032
  4001cc:	02003821 	move	a3,s0
  4001d0:	24020039 	li	v0,57
  4001d4:	0c10012e 	jal	4004b8 <test_negative>
  4001d8:	afa20010 	sw	v0,16(sp)
  4001dc:	0c100307 	jal	400c1c <close>
  4001e0:	02602021 	move	a0,s3
  4001e4:	3c060040 	lui	a2,0x40
  4001e8:	00402021 	move	a0,v0
  4001ec:	24c6202c 	addiu	a2,a2,8236
  4001f0:	26271f60 	addiu	a3,s1,8032
  4001f4:	2402003c 	li	v0,60
  4001f8:	00002821 	move	a1,zero
  4001fc:	afa20014 	sw	v0,20(sp)
  400200:	0c1001f4 	jal	4007d0 <test_equal>
  400204:	afb00010 	sw	s0,16(sp)
  400208:	26c41f40 	addiu	a0,s6,8000
  40020c:	0c1002ff 	jal	400bfc <open>
  400210:	00002821 	move	a1,zero
  400214:	3c050040 	lui	a1,0x40
  400218:	00409021 	move	s2,v0
  40021c:	26261f60 	addiu	a2,s1,8032
  400220:	02003821 	move	a3,s0
  400224:	00402021 	move	a0,v0
  400228:	24a5203c 	addiu	a1,a1,8252
  40022c:	2402003f 	li	v0,63
  400230:	0c10016e 	jal	4005b8 <test_positive>
  400234:	afa20010 	sw	v0,16(sp)
  400238:	26841f6c 	addiu	a0,s4,8044
  40023c:	0c1002ff 	jal	400bfc <open>
  400240:	00002821 	move	a1,zero
  400244:	3c050040 	lui	a1,0x40
  400248:	0040a021 	move	s4,v0
  40024c:	24a52060 	addiu	a1,a1,8288
  400250:	24020042 	li	v0,66
  400254:	02402021 	move	a0,s2
  400258:	26261f60 	addiu	a2,s1,8032
  40025c:	02003821 	move	a3,s0
  400260:	afa20010 	sw	v0,16(sp)
  400264:	0c10016e 	jal	4005b8 <test_positive>
  400268:	27b30020 	addiu	s3,sp,32
  40026c:	26271f60 	addiu	a3,s1,8032
  400270:	24020044 	li	v0,68
  400274:	26a61f8c 	addiu	a2,s5,8076
  400278:	02402021 	move	a0,s2
  40027c:	02802821 	move	a1,s4
  400280:	afa20014 	sw	v0,20(sp)
  400284:	0c1000ed 	jal	4003b4 <test_not_equal>
  400288:	afb00010 	sw	s0,16(sp)
  40028c:	02402021 	move	a0,s2
  400290:	02602821 	move	a1,s3
  400294:	0c100309 	jal	400c24 <read>
  400298:	24060004 	li	a2,4
  40029c:	3c060040 	lui	a2,0x40
  4002a0:	00402021 	move	a0,v0
  4002a4:	24c62084 	addiu	a2,a2,8324
  4002a8:	24020048 	li	v0,72
  4002ac:	24050004 	li	a1,4
  4002b0:	26271f60 	addiu	a3,s1,8032
  4002b4:	afa20014 	sw	v0,20(sp)
  4002b8:	0c1001f4 	jal	4007d0 <test_equal>
  4002bc:	afb00010 	sw	s0,16(sp)
  4002c0:	8fa40020 	lw	a0,32(sp)
  4002c4:	8fa50018 	lw	a1,24(sp)
  4002c8:	3c060040 	lui	a2,0x40
  4002cc:	26271f60 	addiu	a3,s1,8032
  4002d0:	2402004a 	li	v0,74
  4002d4:	24c620b4 	addiu	a2,a2,8372
  4002d8:	afa20014 	sw	v0,20(sp)
  4002dc:	0c1001f4 	jal	4007d0 <test_equal>
  4002e0:	afb00010 	sw	s0,16(sp)
  4002e4:	02802021 	move	a0,s4
  4002e8:	02602821 	move	a1,s3
  4002ec:	0c100309 	jal	400c24 <read>
  4002f0:	24060004 	li	a2,4
  4002f4:	3c060040 	lui	a2,0x40
  4002f8:	00402021 	move	a0,v0
  4002fc:	24c620dc 	addiu	a2,a2,8412
  400300:	2402004d 	li	v0,77
  400304:	24050004 	li	a1,4
  400308:	26271f60 	addiu	a3,s1,8032
  40030c:	afa20014 	sw	v0,20(sp)
  400310:	0c1001f4 	jal	4007d0 <test_equal>
  400314:	afb00010 	sw	s0,16(sp)
  400318:	8fa40020 	lw	a0,32(sp)
  40031c:	8fa5001c 	lw	a1,28(sp)
  400320:	3c060040 	lui	a2,0x40
  400324:	2402004e 	li	v0,78
  400328:	24c6210c 	addiu	a2,a2,8460
  40032c:	26271f60 	addiu	a3,s1,8032
  400330:	afa20014 	sw	v0,20(sp)
  400334:	0c1001f4 	jal	4007d0 <test_equal>
  400338:	afb00010 	sw	s0,16(sp)
  40033c:	26241f60 	addiu	a0,s1,8032
  400340:	02002821 	move	a1,s0
  400344:	0c100236 	jal	4008d8 <test_print_stats>
  400348:	24060050 	li	a2,80
  40034c:	0c1002b9 	jal	400ae4 <exit>
  400350:	00002021 	move	a0,zero
	...

00400360 <test_reset_stats>:
  400360:	3c021000 	lui	v0,0x1000
  400364:	3c031000 	lui	v1,0x1000
  400368:	ac400010 	sw	zero,16(v0)
  40036c:	03e00008 	jr	ra
  400370:	ac600014 	sw	zero,20(v1)

00400374 <print_location>:
  400374:	27bdffe0 	addiu	sp,sp,-32
  400378:	00801021 	move	v0,a0
  40037c:	00a01821 	move	v1,a1
  400380:	00c04021 	move	t0,a2
  400384:	3c040040 	lui	a0,0x40
  400388:	afa70010 	sw	a3,16(sp)
  40038c:	24842134 	addiu	a0,a0,8500
  400390:	00402821 	move	a1,v0
  400394:	00603021 	move	a2,v1
  400398:	afbf0018 	sw	ra,24(sp)
  40039c:	0c10027f 	jal	4009fc <printf>
  4003a0:	01003821 	move	a3,t0
  4003a4:	8fbf0018 	lw	ra,24(sp)
  4003a8:	00000000 	nop
  4003ac:	03e00008 	jr	ra
  4003b0:	27bd0020 	addiu	sp,sp,32

004003b4 <test_not_equal>:
  4003b4:	27bdffd0 	addiu	sp,sp,-48
  4003b8:	afb30024 	sw	s3,36(sp)
  4003bc:	afb20020 	sw	s2,32(sp)
  4003c0:	afb1001c 	sw	s1,28(sp)
  4003c4:	afb00018 	sw	s0,24(sp)
  4003c8:	afbf0028 	sw	ra,40(sp)
  4003cc:	3c031000 	lui	v1,0x1000
  4003d0:	8c620014 	lw	v0,20(v1)
  4003d4:	00804821 	move	t1,a0
  4003d8:	24480001 	addiu	t0,v0,1
  4003dc:	3c040040 	lui	a0,0x40
  4003e0:	00a05021 	move	t2,a1
  4003e4:	3c050040 	lui	a1,0x40
  4003e8:	00c08021 	move	s0,a2
  4003ec:	00e09821 	move	s3,a3
  4003f0:	3c0b1000 	lui	t3,0x1000
  4003f4:	24842164 	addiu	a0,a0,8548
  4003f8:	24a5219c 	addiu	a1,a1,8604
  4003fc:	ac680014 	sw	t0,20(v1)
  400400:	01003021 	move	a2,t0
  400404:	8fb10040 	lw	s1,64(sp)
  400408:	8fb20044 	lw	s2,68(sp)
  40040c:	112a001f 	beq	t1,t2,40048c <test_not_equal+0xd8>
  400410:	01203821 	move	a3,t1
  400414:	3c021000 	lui	v0,0x1000
  400418:	8c430018 	lw	v1,24(v0)
  40041c:	00000000 	nop
  400420:	14600008 	bnez	v1,400444 <test_not_equal+0x90>
  400424:	00000000 	nop
  400428:	8fbf0028 	lw	ra,40(sp)
  40042c:	8fb30024 	lw	s3,36(sp)
  400430:	8fb20020 	lw	s2,32(sp)
  400434:	8fb1001c 	lw	s1,28(sp)
  400438:	8fb00018 	lw	s0,24(sp)
  40043c:	03e00008 	jr	ra
  400440:	27bd0030 	addiu	sp,sp,48
  400444:	3c040040 	lui	a0,0x40
  400448:	3c050040 	lui	a1,0x40
  40044c:	24842164 	addiu	a0,a0,8548
  400450:	24a521ac 	addiu	a1,a1,8620
  400454:	0c10027f 	jal	4009fc <printf>
  400458:	afaa0010 	sw	t2,16(sp)
  40045c:	3c070040 	lui	a3,0x40
  400460:	02602021 	move	a0,s3
  400464:	02202821 	move	a1,s1
  400468:	02403021 	move	a2,s2
  40046c:	8fbf0028 	lw	ra,40(sp)
  400470:	8fb30024 	lw	s3,36(sp)
  400474:	8fb20020 	lw	s2,32(sp)
  400478:	8fb1001c 	lw	s1,28(sp)
  40047c:	8fb00018 	lw	s0,24(sp)
  400480:	24e71e90 	addiu	a3,a3,7824
  400484:	081000dd 	j	400374 <print_location>
  400488:	27bd0030 	addiu	sp,sp,48
  40048c:	8d620010 	lw	v0,16(t3)
  400490:	afa90010 	sw	t1,16(sp)
  400494:	24420001 	addiu	v0,v0,1
  400498:	0c10027f 	jal	4009fc <printf>
  40049c:	ad620010 	sw	v0,16(t3)
  4004a0:	3c040040 	lui	a0,0x40
  4004a4:	248421a4 	addiu	a0,a0,8612
  4004a8:	0c10027f 	jal	4009fc <printf>
  4004ac:	02002821 	move	a1,s0
  4004b0:	08100118 	j	400460 <test_not_equal+0xac>
  4004b4:	3c070040 	lui	a3,0x40

004004b8 <test_negative>:
  4004b8:	27bdffd8 	addiu	sp,sp,-40
  4004bc:	afb3001c 	sw	s3,28(sp)
  4004c0:	afb20018 	sw	s2,24(sp)
  4004c4:	afb10014 	sw	s1,20(sp)
  4004c8:	afb00010 	sw	s0,16(sp)
  4004cc:	afbf0020 	sw	ra,32(sp)
  4004d0:	3c031000 	lui	v1,0x1000
  4004d4:	8c620014 	lw	v0,20(v1)
  4004d8:	00804821 	move	t1,a0
  4004dc:	24480001 	addiu	t0,v0,1
  4004e0:	3c040040 	lui	a0,0x40
  4004e4:	00a08021 	move	s0,a1
  4004e8:	3c050040 	lui	a1,0x40
  4004ec:	00c09821 	move	s3,a2
  4004f0:	00e09021 	move	s2,a3
  4004f4:	3c0a1000 	lui	t2,0x1000
  4004f8:	248421b4 	addiu	a0,a0,8628
  4004fc:	ac680014 	sw	t0,20(v1)
  400500:	24a5219c 	addiu	a1,a1,8604
  400504:	01003021 	move	a2,t0
  400508:	8fb10038 	lw	s1,56(sp)
  40050c:	05200016 	bltz	t1,400568 <test_negative+0xb0>
  400510:	01203821 	move	a3,t1
  400514:	8d420010 	lw	v0,16(t2)
  400518:	00000000 	nop
  40051c:	24420001 	addiu	v0,v0,1
  400520:	0c10027f 	jal	4009fc <printf>
  400524:	ad420010 	sw	v0,16(t2)
  400528:	3c040040 	lui	a0,0x40
  40052c:	248421a4 	addiu	a0,a0,8612
  400530:	0c10027f 	jal	4009fc <printf>
  400534:	02002821 	move	a1,s0
  400538:	3c070040 	lui	a3,0x40
  40053c:	02602021 	move	a0,s3
  400540:	02402821 	move	a1,s2
  400544:	02203021 	move	a2,s1
  400548:	8fbf0020 	lw	ra,32(sp)
  40054c:	8fb3001c 	lw	s3,28(sp)
  400550:	8fb20018 	lw	s2,24(sp)
  400554:	8fb10014 	lw	s1,20(sp)
  400558:	8fb00010 	lw	s0,16(sp)
  40055c:	24e71ea0 	addiu	a3,a3,7840
  400560:	081000dd 	j	400374 <print_location>
  400564:	27bd0028 	addiu	sp,sp,40
  400568:	3c021000 	lui	v0,0x1000
  40056c:	8c430018 	lw	v1,24(v0)
  400570:	00000000 	nop
  400574:	14600008 	bnez	v1,400598 <test_negative+0xe0>
  400578:	3c040040 	lui	a0,0x40
  40057c:	8fbf0020 	lw	ra,32(sp)
  400580:	8fb3001c 	lw	s3,28(sp)
  400584:	8fb20018 	lw	s2,24(sp)
  400588:	8fb10014 	lw	s1,20(sp)
  40058c:	8fb00010 	lw	s0,16(sp)
  400590:	03e00008 	jr	ra
  400594:	27bd0028 	addiu	sp,sp,40
  400598:	3c050040 	lui	a1,0x40
  40059c:	248421b4 	addiu	a0,a0,8628
  4005a0:	24a521ac 	addiu	a1,a1,8620
  4005a4:	01003021 	move	a2,t0
  4005a8:	0c10027f 	jal	4009fc <printf>
  4005ac:	01203821 	move	a3,t1
  4005b0:	0810014f 	j	40053c <test_negative+0x84>
  4005b4:	3c070040 	lui	a3,0x40

004005b8 <test_positive>:
  4005b8:	27bdffd8 	addiu	sp,sp,-40
  4005bc:	afb3001c 	sw	s3,28(sp)
  4005c0:	afb20018 	sw	s2,24(sp)
  4005c4:	afb10014 	sw	s1,20(sp)
  4005c8:	afb00010 	sw	s0,16(sp)
  4005cc:	afbf0020 	sw	ra,32(sp)
  4005d0:	3c031000 	lui	v1,0x1000
  4005d4:	8c620014 	lw	v0,20(v1)
  4005d8:	00804821 	move	t1,a0
  4005dc:	24480001 	addiu	t0,v0,1
  4005e0:	3c040040 	lui	a0,0x40
  4005e4:	00a08021 	move	s0,a1
  4005e8:	3c050040 	lui	a1,0x40
  4005ec:	00c09821 	move	s3,a2
  4005f0:	00e09021 	move	s2,a3
  4005f4:	3c0a1000 	lui	t2,0x1000
  4005f8:	248421e8 	addiu	a0,a0,8680
  4005fc:	ac680014 	sw	t0,20(v1)
  400600:	24a5219c 	addiu	a1,a1,8604
  400604:	01003021 	move	a2,t0
  400608:	8fb10038 	lw	s1,56(sp)
  40060c:	1920001f 	blez	t1,40068c <test_positive+0xd4>
  400610:	01203821 	move	a3,t1
  400614:	3c021000 	lui	v0,0x1000
  400618:	8c430018 	lw	v1,24(v0)
  40061c:	00000000 	nop
  400620:	14600008 	bnez	v1,400644 <test_positive+0x8c>
  400624:	00000000 	nop
  400628:	8fbf0020 	lw	ra,32(sp)
  40062c:	8fb3001c 	lw	s3,28(sp)
  400630:	8fb20018 	lw	s2,24(sp)
  400634:	8fb10014 	lw	s1,20(sp)
  400638:	8fb00010 	lw	s0,16(sp)
  40063c:	03e00008 	jr	ra
  400640:	27bd0028 	addiu	sp,sp,40
  400644:	3c040040 	lui	a0,0x40
  400648:	3c050040 	lui	a1,0x40
  40064c:	248421e8 	addiu	a0,a0,8680
  400650:	24a521ac 	addiu	a1,a1,8620
  400654:	0c10027f 	jal	4009fc <printf>
  400658:	01203821 	move	a3,t1
  40065c:	3c070040 	lui	a3,0x40
  400660:	02602021 	move	a0,s3
  400664:	02402821 	move	a1,s2
  400668:	02203021 	move	a2,s1
  40066c:	8fbf0020 	lw	ra,32(sp)
  400670:	8fb3001c 	lw	s3,28(sp)
  400674:	8fb20018 	lw	s2,24(sp)
  400678:	8fb10014 	lw	s1,20(sp)
  40067c:	8fb00010 	lw	s0,16(sp)
  400680:	24e71eb0 	addiu	a3,a3,7856
  400684:	081000dd 	j	400374 <print_location>
  400688:	27bd0028 	addiu	sp,sp,40
  40068c:	8d420010 	lw	v0,16(t2)
  400690:	00000000 	nop
  400694:	24420001 	addiu	v0,v0,1
  400698:	0c10027f 	jal	4009fc <printf>
  40069c:	ad420010 	sw	v0,16(t2)
  4006a0:	3c040040 	lui	a0,0x40
  4006a4:	248421a4 	addiu	a0,a0,8612
  4006a8:	0c10027f 	jal	4009fc <printf>
  4006ac:	02002821 	move	a1,s0
  4006b0:	08100198 	j	400660 <test_positive+0xa8>
  4006b4:	3c070040 	lui	a3,0x40

004006b8 <test_equal_one_of>:
  4006b8:	27bdffd0 	addiu	sp,sp,-48
  4006bc:	afb30024 	sw	s3,36(sp)
  4006c0:	afb20020 	sw	s2,32(sp)
  4006c4:	afb1001c 	sw	s1,28(sp)
  4006c8:	afb00018 	sw	s0,24(sp)
  4006cc:	afbf0028 	sw	ra,40(sp)
  4006d0:	3c031000 	lui	v1,0x1000
  4006d4:	8c620014 	lw	v0,20(v1)
  4006d8:	00804021 	move	t0,a0
  4006dc:	24490001 	addiu	t1,v0,1
  4006e0:	00a05021 	move	t2,a1
  4006e4:	ac690014 	sw	t1,20(v1)
  4006e8:	00c05821 	move	t3,a2
  4006ec:	8fb10040 	lw	s1,64(sp)
  4006f0:	8fb20044 	lw	s2,68(sp)
  4006f4:	8fb30048 	lw	s3,72(sp)
  4006f8:	1085001f 	beq	a0,a1,400778 <test_equal_one_of+0xc0>
  4006fc:	00e08021 	move	s0,a3
  400700:	3c040040 	lui	a0,0x40
  400704:	3c050040 	lui	a1,0x40
  400708:	3c031000 	lui	v1,0x1000
  40070c:	2484221c 	addiu	a0,a0,8732
  400710:	24a5219c 	addiu	a1,a1,8604
  400714:	01203021 	move	a2,t1
  400718:	110b0017 	beq	t0,t3,400778 <test_equal_one_of+0xc0>
  40071c:	01003821 	move	a3,t0
  400720:	8c620010 	lw	v0,16(v1)
  400724:	afaa0010 	sw	t2,16(sp)
  400728:	24420001 	addiu	v0,v0,1
  40072c:	afab0014 	sw	t3,20(sp)
  400730:	0c10027f 	jal	4009fc <printf>
  400734:	ac620010 	sw	v0,16(v1)
  400738:	3c040040 	lui	a0,0x40
  40073c:	248421a4 	addiu	a0,a0,8612
  400740:	0c10027f 	jal	4009fc <printf>
  400744:	02002821 	move	a1,s0
  400748:	3c070040 	lui	a3,0x40
  40074c:	02202021 	move	a0,s1
  400750:	02402821 	move	a1,s2
  400754:	02603021 	move	a2,s3
  400758:	8fbf0028 	lw	ra,40(sp)
  40075c:	8fb30024 	lw	s3,36(sp)
  400760:	8fb20020 	lw	s2,32(sp)
  400764:	8fb1001c 	lw	s1,28(sp)
  400768:	8fb00018 	lw	s0,24(sp)
  40076c:	24e71ec0 	addiu	a3,a3,7872
  400770:	081000dd 	j	400374 <print_location>
  400774:	27bd0030 	addiu	sp,sp,48
  400778:	3c021000 	lui	v0,0x1000
  40077c:	8c430018 	lw	v1,24(v0)
  400780:	00000000 	nop
  400784:	14600008 	bnez	v1,4007a8 <test_equal_one_of+0xf0>
  400788:	3c040040 	lui	a0,0x40
  40078c:	8fbf0028 	lw	ra,40(sp)
  400790:	8fb30024 	lw	s3,36(sp)
  400794:	8fb20020 	lw	s2,32(sp)
  400798:	8fb1001c 	lw	s1,28(sp)
  40079c:	8fb00018 	lw	s0,24(sp)
  4007a0:	03e00008 	jr	ra
  4007a4:	27bd0030 	addiu	sp,sp,48
  4007a8:	3c050040 	lui	a1,0x40
  4007ac:	2484221c 	addiu	a0,a0,8732
  4007b0:	24a521ac 	addiu	a1,a1,8620
  4007b4:	01203021 	move	a2,t1
  4007b8:	01003821 	move	a3,t0
  4007bc:	afaa0010 	sw	t2,16(sp)
  4007c0:	0c10027f 	jal	4009fc <printf>
  4007c4:	afab0014 	sw	t3,20(sp)
  4007c8:	081001d3 	j	40074c <test_equal_one_of+0x94>
  4007cc:	3c070040 	lui	a3,0x40

004007d0 <test_equal>:
  4007d0:	27bdffd0 	addiu	sp,sp,-48
  4007d4:	afb30024 	sw	s3,36(sp)
  4007d8:	afb20020 	sw	s2,32(sp)
  4007dc:	afb1001c 	sw	s1,28(sp)
  4007e0:	afb00018 	sw	s0,24(sp)
  4007e4:	afbf0028 	sw	ra,40(sp)
  4007e8:	3c031000 	lui	v1,0x1000
  4007ec:	8c620014 	lw	v0,20(v1)
  4007f0:	00804021 	move	t0,a0
  4007f4:	24490001 	addiu	t1,v0,1
  4007f8:	3c040040 	lui	a0,0x40
  4007fc:	00a05021 	move	t2,a1
  400800:	3c050040 	lui	a1,0x40
  400804:	00c08021 	move	s0,a2
  400808:	00e09821 	move	s3,a3
  40080c:	3c0b1000 	lui	t3,0x1000
  400810:	24842254 	addiu	a0,a0,8788
  400814:	24a5219c 	addiu	a1,a1,8604
  400818:	ac690014 	sw	t1,20(v1)
  40081c:	01203021 	move	a2,t1
  400820:	8fb10040 	lw	s1,64(sp)
  400824:	8fb20044 	lw	s2,68(sp)
  400828:	110a0016 	beq	t0,t2,400884 <test_equal+0xb4>
  40082c:	01003821 	move	a3,t0
  400830:	8d620010 	lw	v0,16(t3)
  400834:	afaa0010 	sw	t2,16(sp)
  400838:	24420001 	addiu	v0,v0,1
  40083c:	0c10027f 	jal	4009fc <printf>
  400840:	ad620010 	sw	v0,16(t3)
  400844:	3c040040 	lui	a0,0x40
  400848:	248421a4 	addiu	a0,a0,8612
  40084c:	0c10027f 	jal	4009fc <printf>
  400850:	02002821 	move	a1,s0
  400854:	3c070040 	lui	a3,0x40
  400858:	02602021 	move	a0,s3
  40085c:	02202821 	move	a1,s1
  400860:	02403021 	move	a2,s2
  400864:	8fbf0028 	lw	ra,40(sp)
  400868:	8fb30024 	lw	s3,36(sp)
  40086c:	8fb20020 	lw	s2,32(sp)
  400870:	8fb1001c 	lw	s1,28(sp)
  400874:	8fb00018 	lw	s0,24(sp)
  400878:	24e71ed4 	addiu	a3,a3,7892
  40087c:	081000dd 	j	400374 <print_location>
  400880:	27bd0030 	addiu	sp,sp,48
  400884:	3c021000 	lui	v0,0x1000
  400888:	8c430018 	lw	v1,24(v0)
  40088c:	00000000 	nop
  400890:	14600008 	bnez	v1,4008b4 <test_equal+0xe4>
  400894:	3c040040 	lui	a0,0x40
  400898:	8fbf0028 	lw	ra,40(sp)
  40089c:	8fb30024 	lw	s3,36(sp)
  4008a0:	8fb20020 	lw	s2,32(sp)
  4008a4:	8fb1001c 	lw	s1,28(sp)
  4008a8:	8fb00018 	lw	s0,24(sp)
  4008ac:	03e00008 	jr	ra
  4008b0:	27bd0030 	addiu	sp,sp,48
  4008b4:	3c050040 	lui	a1,0x40
  4008b8:	24842254 	addiu	a0,a0,8788
  4008bc:	24a521ac 	addiu	a1,a1,8620
  4008c0:	01203021 	move	a2,t1
  4008c4:	01003821 	move	a3,t0
  4008c8:	0c10027f 	jal	4009fc <printf>
  4008cc:	afa80010 	sw	t0,16(sp)
  4008d0:	08100216 	j	400858 <test_equal+0x88>
  4008d4:	3c070040 	lui	a3,0x40

004008d8 <test_print_stats>:
  4008d8:	00a01821 	move	v1,a1
  4008dc:	00801021 	move	v0,a0
  4008e0:	3c040040 	lui	a0,0x40
  4008e4:	27bdffe8 	addiu	sp,sp,-24
  4008e8:	00c03821 	move	a3,a2
  4008ec:	2484227c 	addiu	a0,a0,8828
  4008f0:	00603021 	move	a2,v1
  4008f4:	afbf0010 	sw	ra,16(sp)
  4008f8:	0c10027f 	jal	4009fc <printf>
  4008fc:	00402821 	move	a1,v0
  400900:	3c031000 	lui	v1,0x1000
  400904:	3c021000 	lui	v0,0x1000
  400908:	8c460014 	lw	a2,20(v0)
  40090c:	8c650010 	lw	a1,16(v1)
  400910:	3c040040 	lui	a0,0x40
  400914:	248422b0 	addiu	a0,a0,8880
  400918:	00c03821 	move	a3,a2
  40091c:	0c10027f 	jal	4009fc <printf>
  400920:	00c53023 	subu	a2,a2,a1
  400924:	8fbf0010 	lw	ra,16(sp)
  400928:	2404000a 	li	a0,10
  40092c:	0810028c 	j	400a30 <putchar>
  400930:	27bd0018 	addiu	sp,sp,24

00400934 <test_verbose_off>:
  400934:	3c040040 	lui	a0,0x40
  400938:	27bdffe8 	addiu	sp,sp,-24
  40093c:	afbf0010 	sw	ra,16(sp)
  400940:	0c1002a4 	jal	400a90 <puts>
  400944:	24842300 	addiu	a0,a0,8960
  400948:	8fbf0010 	lw	ra,16(sp)
  40094c:	3c031000 	lui	v1,0x1000
  400950:	27bd0018 	addiu	sp,sp,24
  400954:	03e00008 	jr	ra
  400958:	ac600018 	sw	zero,24(v1)

0040095c <test_verbose_on>:
  40095c:	3c040040 	lui	a0,0x40
  400960:	27bdffe8 	addiu	sp,sp,-24
  400964:	afbf0010 	sw	ra,16(sp)
  400968:	0c1002a4 	jal	400a90 <puts>
  40096c:	24842314 	addiu	a0,a0,8980
  400970:	24030001 	li	v1,1
  400974:	3c021000 	lui	v0,0x1000
  400978:	ac430018 	sw	v1,24(v0)
  40097c:	8fbf0010 	lw	ra,16(sp)
  400980:	00000000 	nop
  400984:	03e00008 	jr	ra
  400988:	27bd0018 	addiu	sp,sp,24
  40098c:	00000000 	nop

00400990 <vprintf>:
  400990:	00803021 	move	a2,a0
  400994:	3c040040 	lui	a0,0x40
  400998:	00a03821 	move	a3,a1
  40099c:	248409a8 	addiu	a0,a0,2472
  4009a0:	08100435 	j	4010d4 <__vprintf>
  4009a4:	00002821 	move	a1,zero

004009a8 <__printf_send>:
  4009a8:	27bdffe0 	addiu	sp,sp,-32
  4009ac:	afb20018 	sw	s2,24(sp)
  4009b0:	afb10014 	sw	s1,20(sp)
  4009b4:	afbf001c 	sw	ra,28(sp)
  4009b8:	afb00010 	sw	s0,16(sp)
  4009bc:	00c09021 	move	s2,a2
  4009c0:	10c00008 	beqz	a2,4009e4 <__printf_send+0x3c>
  4009c4:	00a08821 	move	s1,a1
  4009c8:	00008021 	move	s0,zero
  4009cc:	02301021 	addu	v0,s1,s0
  4009d0:	80440000 	lb	a0,0(v0)
  4009d4:	0c10028c 	jal	400a30 <putchar>
  4009d8:	26100001 	addiu	s0,s0,1
  4009dc:	1650fffc 	bne	s2,s0,4009d0 <__printf_send+0x28>
  4009e0:	02301021 	addu	v0,s1,s0
  4009e4:	8fbf001c 	lw	ra,28(sp)
  4009e8:	8fb20018 	lw	s2,24(sp)
  4009ec:	8fb10014 	lw	s1,20(sp)
  4009f0:	8fb00010 	lw	s0,16(sp)
  4009f4:	03e00008 	jr	ra
  4009f8:	27bd0020 	addiu	sp,sp,32

004009fc <printf>:
  4009fc:	27bdffe0 	addiu	sp,sp,-32
  400a00:	27a20024 	addiu	v0,sp,36
  400a04:	afa50024 	sw	a1,36(sp)
  400a08:	00402821 	move	a1,v0
  400a0c:	afbf0018 	sw	ra,24(sp)
  400a10:	afa60028 	sw	a2,40(sp)
  400a14:	afa7002c 	sw	a3,44(sp)
  400a18:	0c100264 	jal	400990 <vprintf>
  400a1c:	afa20010 	sw	v0,16(sp)
  400a20:	8fbf0018 	lw	ra,24(sp)
  400a24:	00000000 	nop
  400a28:	03e00008 	jr	ra
  400a2c:	27bd0020 	addiu	sp,sp,32

00400a30 <putchar>:
  400a30:	27bdffe0 	addiu	sp,sp,-32
  400a34:	afb00018 	sw	s0,24(sp)
  400a38:	27a50010 	addiu	a1,sp,16
  400a3c:	00808021 	move	s0,a0
  400a40:	24060001 	li	a2,1
  400a44:	24040001 	li	a0,1
  400a48:	afbf001c 	sw	ra,28(sp)
  400a4c:	0c10030f 	jal	400c3c <write>
  400a50:	a3b00010 	sb	s0,16(sp)
  400a54:	18400005 	blez	v0,400a6c <putchar+0x3c>
  400a58:	02001021 	move	v0,s0
  400a5c:	8fbf001c 	lw	ra,28(sp)
  400a60:	8fb00018 	lw	s0,24(sp)
  400a64:	03e00008 	jr	ra
  400a68:	27bd0020 	addiu	sp,sp,32
  400a6c:	2410ffff 	li	s0,-1
  400a70:	02001021 	move	v0,s0
  400a74:	8fbf001c 	lw	ra,28(sp)
  400a78:	8fb00018 	lw	s0,24(sp)
  400a7c:	03e00008 	jr	ra
  400a80:	27bd0020 	addiu	sp,sp,32
	...

00400a90 <puts>:
  400a90:	27bdffe8 	addiu	sp,sp,-24
  400a94:	afbf0010 	sw	ra,16(sp)
  400a98:	0c100580 	jal	401600 <__puts>
  400a9c:	00000000 	nop
  400aa0:	0c10028c 	jal	400a30 <putchar>
  400aa4:	2404000a 	li	a0,10
  400aa8:	8fbf0010 	lw	ra,16(sp)
  400aac:	00001021 	move	v0,zero
  400ab0:	03e00008 	jr	ra
  400ab4:	27bd0018 	addiu	sp,sp,24
	...

00400ac0 <__exit_hack>:
  400ac0:	27bdfff8 	addiu	sp,sp,-8
  400ac4:	24020001 	li	v0,1
  400ac8:	afa20000 	sw	v0,0(sp)
  400acc:	8fa20000 	lw	v0,0(sp)
  400ad0:	00000000 	nop
  400ad4:	1440fffd 	bnez	v0,400acc <__exit_hack+0xc>
  400ad8:	00000000 	nop
  400adc:	03e00008 	jr	ra
  400ae0:	27bd0008 	addiu	sp,sp,8

00400ae4 <exit>:
  400ae4:	27bdffe8 	addiu	sp,sp,-24
  400ae8:	afbf0010 	sw	ra,16(sp)
  400aec:	0c1002cf 	jal	400b3c <_exit>
  400af0:	00000000 	nop
	...

00400b00 <__syscall>:
  400b00:	0000000c 	syscall
  400b04:	10e00005 	beqz	a3,400b1c <__syscall+0x1c>
  400b08:	00000000 	nop
  400b0c:	3c011000 	lui	at,0x1000
  400b10:	ac22001c 	sw	v0,28(at)
  400b14:	2403ffff 	li	v1,-1
  400b18:	2402ffff 	li	v0,-1
  400b1c:	03e00008 	jr	ra
  400b20:	00000000 	nop

00400b24 <fork>:
  400b24:	081002c0 	j	400b00 <__syscall>
  400b28:	24020000 	li	v0,0

00400b2c <vfork>:
  400b2c:	081002c0 	j	400b00 <__syscall>
  400b30:	24020001 	li	v0,1

00400b34 <execv>:
  400b34:	081002c0 	j	400b00 <__syscall>
  400b38:	24020002 	li	v0,2

00400b3c <_exit>:
  400b3c:	081002c0 	j	400b00 <__syscall>
  400b40:	24020003 	li	v0,3

00400b44 <waitpid>:
  400b44:	081002c0 	j	400b00 <__syscall>
  400b48:	24020004 	li	v0,4

00400b4c <getpid>:
  400b4c:	081002c0 	j	400b00 <__syscall>
  400b50:	24020005 	li	v0,5

00400b54 <getppid>:
  400b54:	081002c0 	j	400b00 <__syscall>
  400b58:	24020006 	li	v0,6

00400b5c <sbrk>:
  400b5c:	081002c0 	j	400b00 <__syscall>
  400b60:	24020007 	li	v0,7

00400b64 <mmap>:
  400b64:	081002c0 	j	400b00 <__syscall>
  400b68:	24020008 	li	v0,8

00400b6c <munmap>:
  400b6c:	081002c0 	j	400b00 <__syscall>
  400b70:	24020009 	li	v0,9

00400b74 <mprotect>:
  400b74:	081002c0 	j	400b00 <__syscall>
  400b78:	2402000a 	li	v0,10

00400b7c <umask>:
  400b7c:	081002c0 	j	400b00 <__syscall>
  400b80:	24020011 	li	v0,17

00400b84 <issetugid>:
  400b84:	081002c0 	j	400b00 <__syscall>
  400b88:	24020012 	li	v0,18

00400b8c <getresuid>:
  400b8c:	081002c0 	j	400b00 <__syscall>
  400b90:	24020013 	li	v0,19

00400b94 <setresuid>:
  400b94:	081002c0 	j	400b00 <__syscall>
  400b98:	24020014 	li	v0,20

00400b9c <getresgid>:
  400b9c:	081002c0 	j	400b00 <__syscall>
  400ba0:	24020015 	li	v0,21

00400ba4 <setresgid>:
  400ba4:	081002c0 	j	400b00 <__syscall>
  400ba8:	24020016 	li	v0,22

00400bac <getgroups>:
  400bac:	081002c0 	j	400b00 <__syscall>
  400bb0:	24020017 	li	v0,23

00400bb4 <setgroups>:
  400bb4:	081002c0 	j	400b00 <__syscall>
  400bb8:	24020018 	li	v0,24

00400bbc <__getlogin>:
  400bbc:	081002c0 	j	400b00 <__syscall>
  400bc0:	24020019 	li	v0,25

00400bc4 <__setlogin>:
  400bc4:	081002c0 	j	400b00 <__syscall>
  400bc8:	2402001a 	li	v0,26

00400bcc <kill>:
  400bcc:	081002c0 	j	400b00 <__syscall>
  400bd0:	2402001b 	li	v0,27

00400bd4 <sigaction>:
  400bd4:	081002c0 	j	400b00 <__syscall>
  400bd8:	2402001c 	li	v0,28

00400bdc <sigpending>:
  400bdc:	081002c0 	j	400b00 <__syscall>
  400be0:	2402001d 	li	v0,29

00400be4 <sigprocmask>:
  400be4:	081002c0 	j	400b00 <__syscall>
  400be8:	2402001e 	li	v0,30

00400bec <sigsuspend>:
  400bec:	081002c0 	j	400b00 <__syscall>
  400bf0:	2402001f 	li	v0,31

00400bf4 <sigreturn>:
  400bf4:	081002c0 	j	400b00 <__syscall>
  400bf8:	24020020 	li	v0,32

00400bfc <open>:
  400bfc:	081002c0 	j	400b00 <__syscall>
  400c00:	2402002d 	li	v0,45

00400c04 <pipe>:
  400c04:	081002c0 	j	400b00 <__syscall>
  400c08:	2402002e 	li	v0,46

00400c0c <dup>:
  400c0c:	081002c0 	j	400b00 <__syscall>
  400c10:	2402002f 	li	v0,47

00400c14 <dup2>:
  400c14:	081002c0 	j	400b00 <__syscall>
  400c18:	24020030 	li	v0,48

00400c1c <close>:
  400c1c:	081002c0 	j	400b00 <__syscall>
  400c20:	24020031 	li	v0,49

00400c24 <read>:
  400c24:	081002c0 	j	400b00 <__syscall>
  400c28:	24020032 	li	v0,50

00400c2c <pread>:
  400c2c:	081002c0 	j	400b00 <__syscall>
  400c30:	24020033 	li	v0,51

00400c34 <getdirentry>:
  400c34:	081002c0 	j	400b00 <__syscall>
  400c38:	24020036 	li	v0,54

00400c3c <write>:
  400c3c:	081002c0 	j	400b00 <__syscall>
  400c40:	24020037 	li	v0,55

00400c44 <pwrite>:
  400c44:	081002c0 	j	400b00 <__syscall>
  400c48:	24020038 	li	v0,56

00400c4c <lseek>:
  400c4c:	081002c0 	j	400b00 <__syscall>
  400c50:	2402003b 	li	v0,59

00400c54 <flock>:
  400c54:	081002c0 	j	400b00 <__syscall>
  400c58:	2402003c 	li	v0,60

00400c5c <ftruncate>:
  400c5c:	081002c0 	j	400b00 <__syscall>
  400c60:	2402003d 	li	v0,61

00400c64 <fsync>:
  400c64:	081002c0 	j	400b00 <__syscall>
  400c68:	2402003e 	li	v0,62

00400c6c <fcntl>:
  400c6c:	081002c0 	j	400b00 <__syscall>
  400c70:	2402003f 	li	v0,63

00400c74 <ioctl>:
  400c74:	081002c0 	j	400b00 <__syscall>
  400c78:	24020040 	li	v0,64

00400c7c <select>:
  400c7c:	081002c0 	j	400b00 <__syscall>
  400c80:	24020041 	li	v0,65

00400c84 <poll>:
  400c84:	081002c0 	j	400b00 <__syscall>
  400c88:	24020042 	li	v0,66

00400c8c <link>:
  400c8c:	081002c0 	j	400b00 <__syscall>
  400c90:	24020043 	li	v0,67

00400c94 <remove>:
  400c94:	081002c0 	j	400b00 <__syscall>
  400c98:	24020044 	li	v0,68

00400c9c <mkdir>:
  400c9c:	081002c0 	j	400b00 <__syscall>
  400ca0:	24020045 	li	v0,69

00400ca4 <rmdir>:
  400ca4:	081002c0 	j	400b00 <__syscall>
  400ca8:	24020046 	li	v0,70

00400cac <mkfifo>:
  400cac:	081002c0 	j	400b00 <__syscall>
  400cb0:	24020047 	li	v0,71

00400cb4 <rename>:
  400cb4:	081002c0 	j	400b00 <__syscall>
  400cb8:	24020048 	li	v0,72

00400cbc <access>:
  400cbc:	081002c0 	j	400b00 <__syscall>
  400cc0:	24020049 	li	v0,73

00400cc4 <chdir>:
  400cc4:	081002c0 	j	400b00 <__syscall>
  400cc8:	2402004a 	li	v0,74

00400ccc <fchdir>:
  400ccc:	081002c0 	j	400b00 <__syscall>
  400cd0:	2402004b 	li	v0,75

00400cd4 <__getcwd>:
  400cd4:	081002c0 	j	400b00 <__syscall>
  400cd8:	2402004c 	li	v0,76

00400cdc <symlink>:
  400cdc:	081002c0 	j	400b00 <__syscall>
  400ce0:	2402004d 	li	v0,77

00400ce4 <readlink>:
  400ce4:	081002c0 	j	400b00 <__syscall>
  400ce8:	2402004e 	li	v0,78

00400cec <mount>:
  400cec:	081002c0 	j	400b00 <__syscall>
  400cf0:	2402004f 	li	v0,79

00400cf4 <unmount>:
  400cf4:	081002c0 	j	400b00 <__syscall>
  400cf8:	24020050 	li	v0,80

00400cfc <stat>:
  400cfc:	081002c0 	j	400b00 <__syscall>
  400d00:	24020051 	li	v0,81

00400d04 <fstat>:
  400d04:	081002c0 	j	400b00 <__syscall>
  400d08:	24020052 	li	v0,82

00400d0c <lstat>:
  400d0c:	081002c0 	j	400b00 <__syscall>
  400d10:	24020053 	li	v0,83

00400d14 <utimes>:
  400d14:	081002c0 	j	400b00 <__syscall>
  400d18:	24020054 	li	v0,84

00400d1c <futimes>:
  400d1c:	081002c0 	j	400b00 <__syscall>
  400d20:	24020055 	li	v0,85

00400d24 <lutimes>:
  400d24:	081002c0 	j	400b00 <__syscall>
  400d28:	24020056 	li	v0,86

00400d2c <chmod>:
  400d2c:	081002c0 	j	400b00 <__syscall>
  400d30:	24020057 	li	v0,87

00400d34 <chown>:
  400d34:	081002c0 	j	400b00 <__syscall>
  400d38:	24020058 	li	v0,88

00400d3c <fchmod>:
  400d3c:	081002c0 	j	400b00 <__syscall>
  400d40:	24020059 	li	v0,89

00400d44 <fchown>:
  400d44:	081002c0 	j	400b00 <__syscall>
  400d48:	2402005a 	li	v0,90

00400d4c <lchmod>:
  400d4c:	081002c0 	j	400b00 <__syscall>
  400d50:	2402005b 	li	v0,91

00400d54 <lchown>:
  400d54:	081002c0 	j	400b00 <__syscall>
  400d58:	2402005c 	li	v0,92

00400d5c <socket>:
  400d5c:	081002c0 	j	400b00 <__syscall>
  400d60:	24020062 	li	v0,98

00400d64 <bind>:
  400d64:	081002c0 	j	400b00 <__syscall>
  400d68:	24020063 	li	v0,99

00400d6c <connect>:
  400d6c:	081002c0 	j	400b00 <__syscall>
  400d70:	24020064 	li	v0,100

00400d74 <listen>:
  400d74:	081002c0 	j	400b00 <__syscall>
  400d78:	24020065 	li	v0,101

00400d7c <accept>:
  400d7c:	081002c0 	j	400b00 <__syscall>
  400d80:	24020066 	li	v0,102

00400d84 <shutdown>:
  400d84:	081002c0 	j	400b00 <__syscall>
  400d88:	24020068 	li	v0,104

00400d8c <getsockname>:
  400d8c:	081002c0 	j	400b00 <__syscall>
  400d90:	24020069 	li	v0,105

00400d94 <getpeername>:
  400d94:	081002c0 	j	400b00 <__syscall>
  400d98:	2402006a 	li	v0,106

00400d9c <getsockopt>:
  400d9c:	081002c0 	j	400b00 <__syscall>
  400da0:	2402006b 	li	v0,107

00400da4 <setsockopt>:
  400da4:	081002c0 	j	400b00 <__syscall>
  400da8:	2402006c 	li	v0,108

00400dac <__time>:
  400dac:	081002c0 	j	400b00 <__syscall>
  400db0:	24020071 	li	v0,113

00400db4 <__settime>:
  400db4:	081002c0 	j	400b00 <__syscall>
  400db8:	24020072 	li	v0,114

00400dbc <nanosleep>:
  400dbc:	081002c0 	j	400b00 <__syscall>
  400dc0:	24020073 	li	v0,115

00400dc4 <sync>:
  400dc4:	081002c0 	j	400b00 <__syscall>
  400dc8:	24020076 	li	v0,118

00400dcc <reboot>:
  400dcc:	081002c0 	j	400b00 <__syscall>
  400dd0:	24020077 	li	v0,119
	...

00400de0 <__pf_print>:
  400de0:	27bdffe0 	addiu	sp,sp,-32
  400de4:	afbf0018 	sw	ra,24(sp)
  400de8:	afb10014 	sw	s1,20(sp)
  400dec:	afb00010 	sw	s0,16(sp)
  400df0:	8c830000 	lw	v1,0(a0)
  400df4:	00808021 	move	s0,a0
  400df8:	8c840004 	lw	a0,4(a0)
  400dfc:	0060f809 	jalr	v1
  400e00:	00c08821 	move	s1,a2
  400e04:	8e02000c 	lw	v0,12(s0)
  400e08:	00000000 	nop
  400e0c:	00511021 	addu	v0,v0,s1
  400e10:	ae02000c 	sw	v0,12(s0)
  400e14:	8fbf0018 	lw	ra,24(sp)
  400e18:	8fb10014 	lw	s1,20(sp)
  400e1c:	8fb00010 	lw	s0,16(sp)
  400e20:	03e00008 	jr	ra
  400e24:	27bd0020 	addiu	sp,sp,32

00400e28 <__pf_endfield>:
  400e28:	24020020 	li	v0,32
  400e2c:	ac82002c 	sw	v0,44(a0)
  400e30:	00001821 	move	v1,zero
  400e34:	00001021 	move	v0,zero
  400e38:	ac800038 	sw	zero,56(a0)
  400e3c:	ac800010 	sw	zero,16(a0)
  400e40:	ac800014 	sw	zero,20(a0)
  400e44:	ac83001c 	sw	v1,28(a0)
  400e48:	ac820018 	sw	v0,24(a0)
  400e4c:	ac800020 	sw	zero,32(a0)
  400e50:	ac800024 	sw	zero,36(a0)
  400e54:	ac800028 	sw	zero,40(a0)
  400e58:	ac800030 	sw	zero,48(a0)
  400e5c:	03e00008 	jr	ra
  400e60:	ac800034 	sw	zero,52(a0)

00400e64 <__pf_fill>:
  400e64:	27bdffd0 	addiu	sp,sp,-48
  400e68:	afb30024 	sw	s3,36(sp)
  400e6c:	afb20020 	sw	s2,32(sp)
  400e70:	afbf0028 	sw	ra,40(sp)
  400e74:	afb1001c 	sw	s1,28(sp)
  400e78:	afb00018 	sw	s0,24(sp)
  400e7c:	00809821 	move	s3,a0
  400e80:	8c82002c 	lw	v0,44(a0)
  400e84:	18a0000b 	blez	a1,400eb4 <__pf_fill+0x50>
  400e88:	00a09021 	move	s2,a1
  400e8c:	a3a20010 	sb	v0,16(sp)
  400e90:	00008021 	move	s0,zero
  400e94:	27b10010 	addiu	s1,sp,16
  400e98:	26100001 	addiu	s0,s0,1
  400e9c:	02602021 	move	a0,s3
  400ea0:	02202821 	move	a1,s1
  400ea4:	0c100378 	jal	400de0 <__pf_print>
  400ea8:	24060001 	li	a2,1
  400eac:	1650fffb 	bne	s2,s0,400e9c <__pf_fill+0x38>
  400eb0:	26100001 	addiu	s0,s0,1
  400eb4:	8fbf0028 	lw	ra,40(sp)
  400eb8:	8fb30024 	lw	s3,36(sp)
  400ebc:	8fb20020 	lw	s2,32(sp)
  400ec0:	8fb1001c 	lw	s1,28(sp)
  400ec4:	8fb00018 	lw	s0,24(sp)
  400ec8:	03e00008 	jr	ra
  400ecc:	27bd0030 	addiu	sp,sp,48

00400ed0 <__pf_printstuff>:
  400ed0:	27bdffd0 	addiu	sp,sp,-48
  400ed4:	afbf0028 	sw	ra,40(sp)
  400ed8:	afb50024 	sw	s5,36(sp)
  400edc:	afb40020 	sw	s4,32(sp)
  400ee0:	afb3001c 	sw	s3,28(sp)
  400ee4:	afb20018 	sw	s2,24(sp)
  400ee8:	00c09821 	move	s3,a2
  400eec:	afb10014 	sw	s1,20(sp)
  400ef0:	afb00010 	sw	s0,16(sp)
  400ef4:	00808821 	move	s1,a0
  400ef8:	00a02021 	move	a0,a1
  400efc:	00a0a021 	move	s4,a1
  400f00:	0c1005b4 	jal	4016d0 <strlen>
  400f04:	00e0a821 	move	s5,a3
  400f08:	02602021 	move	a0,s3
  400f0c:	0c1005b4 	jal	4016d0 <strlen>
  400f10:	00409021 	move	s2,v0
  400f14:	02a02021 	move	a0,s5
  400f18:	0c1005b4 	jal	4016d0 <strlen>
  400f1c:	02428021 	addu	s0,s2,v0
  400f20:	8e230024 	lw	v1,36(s1)
  400f24:	02022821 	addu	a1,s0,v0
  400f28:	00a3102a 	slt	v0,a1,v1
  400f2c:	10400040 	beqz	v0,401030 <__pf_printstuff+0x160>
  400f30:	00658023 	subu	s0,v1,a1
  400f34:	1a000056 	blez	s0,401090 <__pf_printstuff+0x1c0>
  400f38:	02403021 	move	a2,s2
  400f3c:	8e220028 	lw	v0,40(s1)
  400f40:	00000000 	nop
  400f44:	10400028 	beqz	v0,400fe8 <__pf_printstuff+0x118>
  400f48:	24020030 	li	v0,48
  400f4c:	0c1005b4 	jal	4016d0 <strlen>
  400f50:	02802021 	move	a0,s4
  400f54:	00403021 	move	a2,v0
  400f58:	02802821 	move	a1,s4
  400f5c:	0c100378 	jal	400de0 <__pf_print>
  400f60:	02202021 	move	a0,s1
  400f64:	0c1005b4 	jal	4016d0 <strlen>
  400f68:	02602021 	move	a0,s3
  400f6c:	00403021 	move	a2,v0
  400f70:	02202021 	move	a0,s1
  400f74:	0c100378 	jal	400de0 <__pf_print>
  400f78:	02602821 	move	a1,s3
  400f7c:	8e220028 	lw	v0,40(s1)
  400f80:	00000000 	nop
  400f84:	14400005 	bnez	v0,400f9c <__pf_printstuff+0xcc>
  400f88:	24020030 	li	v0,48
  400f8c:	8e23002c 	lw	v1,44(s1)
  400f90:	00000000 	nop
  400f94:	1062004b 	beq	v1,v0,4010c4 <__pf_printstuff+0x1f4>
  400f98:	02202021 	move	a0,s1
  400f9c:	0c1005b4 	jal	4016d0 <strlen>
  400fa0:	02a02021 	move	a0,s5
  400fa4:	00403021 	move	a2,v0
  400fa8:	02202021 	move	a0,s1
  400fac:	0c100378 	jal	400de0 <__pf_print>
  400fb0:	02a02821 	move	a1,s5
  400fb4:	8e220028 	lw	v0,40(s1)
  400fb8:	00000000 	nop
  400fbc:	14400012 	bnez	v0,401008 <__pf_printstuff+0x138>
  400fc0:	02202021 	move	a0,s1
  400fc4:	8fbf0028 	lw	ra,40(sp)
  400fc8:	8fb50024 	lw	s5,36(sp)
  400fcc:	8fb40020 	lw	s4,32(sp)
  400fd0:	8fb3001c 	lw	s3,28(sp)
  400fd4:	8fb20018 	lw	s2,24(sp)
  400fd8:	8fb10014 	lw	s1,20(sp)
  400fdc:	8fb00010 	lw	s0,16(sp)
  400fe0:	03e00008 	jr	ra
  400fe4:	27bd0030 	addiu	sp,sp,48
  400fe8:	8e23002c 	lw	v1,44(s1)
  400fec:	00000000 	nop
  400ff0:	1062ffd6 	beq	v1,v0,400f4c <__pf_printstuff+0x7c>
  400ff4:	02202021 	move	a0,s1
  400ff8:	0c100399 	jal	400e64 <__pf_fill>
  400ffc:	02002821 	move	a1,s0
  401000:	081003d3 	j	400f4c <__pf_printstuff+0x7c>
  401004:	00000000 	nop
  401008:	02002821 	move	a1,s0
  40100c:	8fbf0028 	lw	ra,40(sp)
  401010:	8fb50024 	lw	s5,36(sp)
  401014:	8fb40020 	lw	s4,32(sp)
  401018:	8fb3001c 	lw	s3,28(sp)
  40101c:	8fb20018 	lw	s2,24(sp)
  401020:	8fb10014 	lw	s1,20(sp)
  401024:	8fb00010 	lw	s0,16(sp)
  401028:	08100399 	j	400e64 <__pf_fill>
  40102c:	27bd0030 	addiu	sp,sp,48
  401030:	02802821 	move	a1,s4
  401034:	02403021 	move	a2,s2
  401038:	0c100378 	jal	400de0 <__pf_print>
  40103c:	02202021 	move	a0,s1
  401040:	0c1005b4 	jal	4016d0 <strlen>
  401044:	02602021 	move	a0,s3
  401048:	00403021 	move	a2,v0
  40104c:	02202021 	move	a0,s1
  401050:	0c100378 	jal	400de0 <__pf_print>
  401054:	02602821 	move	a1,s3
  401058:	0c1005b4 	jal	4016d0 <strlen>
  40105c:	02a02021 	move	a0,s5
  401060:	02202021 	move	a0,s1
  401064:	02a02821 	move	a1,s5
  401068:	8fbf0028 	lw	ra,40(sp)
  40106c:	8fb50024 	lw	s5,36(sp)
  401070:	8fb40020 	lw	s4,32(sp)
  401074:	8fb3001c 	lw	s3,28(sp)
  401078:	8fb20018 	lw	s2,24(sp)
  40107c:	8fb10014 	lw	s1,20(sp)
  401080:	8fb00010 	lw	s0,16(sp)
  401084:	00403021 	move	a2,v0
  401088:	08100378 	j	400de0 <__pf_print>
  40108c:	27bd0030 	addiu	sp,sp,48
  401090:	02802821 	move	a1,s4
  401094:	0c100378 	jal	400de0 <__pf_print>
  401098:	02202021 	move	a0,s1
  40109c:	0c1005b4 	jal	4016d0 <strlen>
  4010a0:	02602021 	move	a0,s3
  4010a4:	00403021 	move	a2,v0
  4010a8:	02202021 	move	a0,s1
  4010ac:	0c100378 	jal	400de0 <__pf_print>
  4010b0:	02602821 	move	a1,s3
  4010b4:	0c1005b4 	jal	4016d0 <strlen>
  4010b8:	02a02021 	move	a0,s5
  4010bc:	08100419 	j	401064 <__pf_printstuff+0x194>
  4010c0:	02202021 	move	a0,s1
  4010c4:	0c100399 	jal	400e64 <__pf_fill>
  4010c8:	02002821 	move	a1,s0
  4010cc:	081003e7 	j	400f9c <__pf_printstuff+0xcc>
  4010d0:	00000000 	nop

004010d4 <__vprintf>:
  4010d4:	27bdff68 	addiu	sp,sp,-152
  4010d8:	afbe0090 	sw	s8,144(sp)
  4010dc:	27be0030 	addiu	s8,sp,48
  4010e0:	afb10074 	sw	s1,116(sp)
  4010e4:	afa40030 	sw	a0,48(sp)
  4010e8:	00c08821 	move	s1,a2
  4010ec:	03c02021 	move	a0,s8
  4010f0:	afb00070 	sw	s0,112(sp)
  4010f4:	afbf0094 	sw	ra,148(sp)
  4010f8:	afb7008c 	sw	s7,140(sp)
  4010fc:	afb60088 	sw	s6,136(sp)
  401100:	afb50084 	sw	s5,132(sp)
  401104:	afb40080 	sw	s4,128(sp)
  401108:	afb3007c 	sw	s3,124(sp)
  40110c:	afb20078 	sw	s2,120(sp)
  401110:	afa50034 	sw	a1,52(sp)
  401114:	afa70038 	sw	a3,56(sp)
  401118:	0c10038a 	jal	400e28 <__pf_endfield>
  40111c:	afa0003c 	sw	zero,60(sp)
  401120:	82300000 	lb	s0,0(s1)
  401124:	00000000 	nop
  401128:	12000017 	beqz	s0,401188 <__vprintf+0xb4>
  40112c:	0220a021 	move	s4,s1
  401130:	08100456 	j	401158 <__vprintf+0x84>
  401134:	00000000 	nop
  401138:	27a50010 	addiu	a1,sp,16
  40113c:	24060001 	li	a2,1
  401140:	0c100378 	jal	400de0 <__pf_print>
  401144:	a3b00010 	sb	s0,16(sp)
  401148:	82900001 	lb	s0,1(s4)
  40114c:	00000000 	nop
  401150:	1200000d 	beqz	s0,401188 <__vprintf+0xb4>
  401154:	26940001 	addiu	s4,s4,1
  401158:	8fa20040 	lw	v0,64(sp)
  40115c:	00000000 	nop
  401160:	14400016 	bnez	v0,4011bc <__vprintf+0xe8>
  401164:	24020025 	li	v0,37
  401168:	1602fff3 	bne	s0,v0,401138 <__vprintf+0x64>
  40116c:	03c02021 	move	a0,s8
  401170:	24020001 	li	v0,1
  401174:	afa20040 	sw	v0,64(sp)
  401178:	82900001 	lb	s0,1(s4)
  40117c:	00000000 	nop
  401180:	1600fff5 	bnez	s0,401158 <__vprintf+0x84>
  401184:	26940001 	addiu	s4,s4,1
  401188:	8fa2003c 	lw	v0,60(sp)
  40118c:	8fbf0094 	lw	ra,148(sp)
  401190:	8fbe0090 	lw	s8,144(sp)
  401194:	8fb7008c 	lw	s7,140(sp)
  401198:	8fb60088 	lw	s6,136(sp)
  40119c:	8fb50084 	lw	s5,132(sp)
  4011a0:	8fb40080 	lw	s4,128(sp)
  4011a4:	8fb3007c 	lw	s3,124(sp)
  4011a8:	8fb20078 	lw	s2,120(sp)
  4011ac:	8fb10074 	lw	s1,116(sp)
  4011b0:	8fb00070 	lw	s0,112(sp)
  4011b4:	03e00008 	jr	ra
  4011b8:	27bd0098 	addiu	sp,sp,152
  4011bc:	3c040040 	lui	a0,0x40
  4011c0:	24842330 	addiu	a0,a0,9008
  4011c4:	0c10059c 	jal	401670 <strchr>
  4011c8:	02002821 	move	a1,s0
  4011cc:	10400031 	beqz	v0,401294 <__vprintf+0x1c0>
  4011d0:	24020030 	li	v0,48
  4011d4:	1202001d 	beq	s0,v0,40124c <__vprintf+0x178>
  4011d8:	2a020031 	slti	v0,s0,49
  4011dc:	10400013 	beqz	v0,40122c <__vprintf+0x158>
  4011e0:	2402006c 	li	v0,108
  4011e4:	24020023 	li	v0,35
  4011e8:	12020027 	beq	s0,v0,401288 <__vprintf+0x1b4>
  4011ec:	2402002d 	li	v0,45
  4011f0:	1202004a 	beq	s0,v0,40131c <__vprintf+0x248>
  4011f4:	24020001 	li	v0,1
  4011f8:	2602ffcf 	addiu	v0,s0,-49
  4011fc:	2c420009 	sltiu	v0,v0,9
  401200:	1040001a 	beqz	v0,40126c <__vprintf+0x198>
  401204:	3c040040 	lui	a0,0x40
  401208:	8fa20054 	lw	v0,84(sp)
  40120c:	00000000 	nop
  401210:	000218c0 	sll	v1,v0,0x3
  401214:	00021040 	sll	v0,v0,0x1
  401218:	00431021 	addu	v0,v0,v1
  40121c:	02021021 	addu	v0,s0,v0
  401220:	2442ffd0 	addiu	v0,v0,-48
  401224:	08100452 	j	401148 <__vprintf+0x74>
  401228:	afa20054 	sw	v0,84(sp)
  40122c:	1602fff3 	bne	s0,v0,4011fc <__vprintf+0x128>
  401230:	2602ffcf 	addiu	v0,s0,-49
  401234:	8fa20044 	lw	v0,68(sp)
  401238:	24030001 	li	v1,1
  40123c:	10430039 	beq	v0,v1,401324 <__vprintf+0x250>
  401240:	24020002 	li	v0,2
  401244:	08100452 	j	401148 <__vprintf+0x74>
  401248:	afa30044 	sw	v1,68(sp)
  40124c:	8fa20054 	lw	v0,84(sp)
  401250:	00000000 	nop
  401254:	1840008c 	blez	v0,401488 <__vprintf+0x3b4>
  401258:	000218c0 	sll	v1,v0,0x3
  40125c:	00021040 	sll	v0,v0,0x1
  401260:	00431021 	addu	v0,v0,v1
  401264:	08100452 	j	401148 <__vprintf+0x74>
  401268:	afa20054 	sw	v0,84(sp)
  40126c:	3c060040 	lui	a2,0x40
  401270:	24842340 	addiu	a0,a0,9024
  401274:	24c62368 	addiu	a2,a2,9064
  401278:	0c1005d8 	jal	401760 <__bad_assert>
  40127c:	240500dc 	li	a1,220
  401280:	08100482 	j	401208 <__vprintf+0x134>
  401284:	00000000 	nop
  401288:	24020001 	li	v0,1
  40128c:	08100452 	j	401148 <__vprintf+0x74>
  401290:	afa20068 	sw	v0,104(sp)
  401294:	3c040040 	lui	a0,0x40
  401298:	2484237c 	addiu	a0,a0,9084
  40129c:	0c10059c 	jal	401670 <strchr>
  4012a0:	02002821 	move	a1,s0
  4012a4:	10400091 	beqz	v0,4014ec <__vprintf+0x418>
  4012a8:	24020070 	li	v0,112
  4012ac:	1202001f 	beq	s0,v0,40132c <__vprintf+0x258>
  4012b0:	24020064 	li	v0,100
  4012b4:	1202009e 	beq	s0,v0,401530 <__vprintf+0x45c>
  4012b8:	24020001 	li	v0,1
  4012bc:	8fa30044 	lw	v1,68(sp)
  4012c0:	00000000 	nop
  4012c4:	10620003 	beq	v1,v0,4012d4 <__vprintf+0x200>
  4012c8:	00000000 	nop
  4012cc:	14600074 	bnez	v1,4014a0 <__vprintf+0x3cc>
  4012d0:	24020002 	li	v0,2
  4012d4:	8fa20038 	lw	v0,56(sp)
  4012d8:	afa00048 	sw	zero,72(sp)
  4012dc:	8c430000 	lw	v1,0(v0)
  4012e0:	24420004 	addiu	v0,v0,4
  4012e4:	afa20038 	sw	v0,56(sp)
  4012e8:	afa3004c 	sw	v1,76(sp)
  4012ec:	2602ff9c 	addiu	v0,s0,-100
  4012f0:	304200ff 	andi	v0,v0,0xff
  4012f4:	2c430015 	sltiu	v1,v0,21
  4012f8:	10600015 	beqz	v1,401350 <__vprintf+0x27c>
  4012fc:	3c030040 	lui	v1,0x40
  401300:	00021080 	sll	v0,v0,0x2
  401304:	24631ee0 	addiu	v1,v1,7904
  401308:	00431021 	addu	v0,v0,v1
  40130c:	8c440000 	lw	a0,0(v0)
  401310:	00000000 	nop
  401314:	00800008 	jr	a0
  401318:	00000000 	nop
  40131c:	08100452 	j	401148 <__vprintf+0x74>
  401320:	afa20058 	sw	v0,88(sp)
  401324:	08100452 	j	401148 <__vprintf+0x74>
  401328:	afa20044 	sw	v0,68(sp)
  40132c:	8fa20038 	lw	v0,56(sp)
  401330:	afa00048 	sw	zero,72(sp)
  401334:	24430004 	addiu	v1,v0,4
  401338:	afa30038 	sw	v1,56(sp)
  40133c:	8c440000 	lw	a0,0(v0)
  401340:	00000000 	nop
  401344:	afa4004c 	sw	a0,76(sp)
  401348:	24020010 	li	v0,16
  40134c:	afa20060 	sw	v0,96(sp)
  401350:	8fa20068 	lw	v0,104(sp)
  401354:	00000000 	nop
  401358:	1440004d 	bnez	v0,401490 <__vprintf+0x3bc>
  40135c:	24020001 	li	v0,1
  401360:	24020070 	li	v0,112
  401364:	1202004a 	beq	s0,v0,401490 <__vprintf+0x3bc>
  401368:	24020001 	li	v0,1
  40136c:	8fb60060 	lw	s6,96(sp)
  401370:	3c020040 	lui	v0,0x40
  401374:	8fb1004c 	lw	s1,76(sp)
  401378:	8fb00048 	lw	s0,72(sp)
  40137c:	a3a00029 	sb	zero,41(sp)
  401380:	24572384 	addiu	s7,v0,9092
  401384:	27b50028 	addiu	s5,sp,40
  401388:	02c09821 	move	s3,s6
  40138c:	001697c3 	sra	s2,s6,0x1f
  401390:	02202821 	move	a1,s1
  401394:	02002021 	move	a0,s0
  401398:	02603821 	move	a3,s3
  40139c:	0c1005cc 	jal	401730 <__umoddi3>
  4013a0:	02403021 	move	a2,s2
  4013a4:	02e31821 	addu	v1,s7,v1
  4013a8:	90620000 	lbu	v0,0(v1)
  4013ac:	02202821 	move	a1,s1
  4013b0:	02002021 	move	a0,s0
  4013b4:	02603821 	move	a3,s3
  4013b8:	02403021 	move	a2,s2
  4013bc:	0c1005c4 	jal	401710 <__udivdi3>
  4013c0:	a2a20000 	sb	v0,0(s5)
  4013c4:	00408021 	move	s0,v0
  4013c8:	02031025 	or	v0,s0,v1
  4013cc:	00608821 	move	s1,v1
  4013d0:	1440ffef 	bnez	v0,401390 <__vprintf+0x2bc>
  4013d4:	26b5ffff 	addiu	s5,s5,-1
  4013d8:	8fa20064 	lw	v0,100(sp)
  4013dc:	00000000 	nop
  4013e0:	10400006 	beqz	v0,4013fc <__vprintf+0x328>
  4013e4:	3c020040 	lui	v0,0x40
  4013e8:	24020010 	li	v0,16
  4013ec:	12c2005e 	beq	s6,v0,401568 <__vprintf+0x494>
  4013f0:	24020008 	li	v0,8
  4013f4:	12c20037 	beq	s6,v0,4014d4 <__vprintf+0x400>
  4013f8:	3c020040 	lui	v0,0x40
  4013fc:	24462250 	addiu	a2,v0,8784
  401400:	8fa20050 	lw	v0,80(sp)
  401404:	00000000 	nop
  401408:	10400023 	beqz	v0,401498 <__vprintf+0x3c4>
  40140c:	3c020040 	lui	v0,0x40
  401410:	3c020040 	lui	v0,0x40
  401414:	24452324 	addiu	a1,v0,8996
  401418:	03c02021 	move	a0,s8
  40141c:	0c1003b4 	jal	400ed0 <__pf_printstuff>
  401420:	26a70001 	addiu	a3,s5,1
  401424:	0c10038a 	jal	400e28 <__pf_endfield>
  401428:	03c02021 	move	a0,s8
  40142c:	08100452 	j	401148 <__vprintf+0x74>
  401430:	00000000 	nop
  401434:	8fa20038 	lw	v0,56(sp)
  401438:	2403fff8 	li	v1,-8
  40143c:	24420007 	addiu	v0,v0,7
  401440:	00431024 	and	v0,v0,v1
  401444:	8c470004 	lw	a3,4(v0)
  401448:	8c460000 	lw	a2,0(v0)
  40144c:	24420008 	addiu	v0,v0,8
  401450:	afa20038 	sw	v0,56(sp)
  401454:	04c10040 	bgez	a2,401558 <__vprintf+0x484>
  401458:	2402000a 	li	v0,10
  40145c:	00071823 	negu	v1,a3
  401460:	0003282b 	sltu	a1,zero,v1
  401464:	00061023 	negu	v0,a2
  401468:	00451023 	subu	v0,v0,a1
  40146c:	2404ffff 	li	a0,-1
  401470:	afa40050 	sw	a0,80(sp)
  401474:	afa3004c 	sw	v1,76(sp)
  401478:	afa20048 	sw	v0,72(sp)
  40147c:	2402000a 	li	v0,10
  401480:	081004d4 	j	401350 <__vprintf+0x27c>
  401484:	afa20060 	sw	v0,96(sp)
  401488:	08100452 	j	401148 <__vprintf+0x74>
  40148c:	afb0005c 	sw	s0,92(sp)
  401490:	081004db 	j	40136c <__vprintf+0x298>
  401494:	afa20064 	sw	v0,100(sp)
  401498:	08100506 	j	401418 <__vprintf+0x344>
  40149c:	24452250 	addiu	a1,v0,8784
  4014a0:	1462ff93 	bne	v1,v0,4012f0 <__vprintf+0x21c>
  4014a4:	2602ff9c 	addiu	v0,s0,-100
  4014a8:	8fa20038 	lw	v0,56(sp)
  4014ac:	2403fff8 	li	v1,-8
  4014b0:	24420007 	addiu	v0,v0,7
  4014b4:	00431024 	and	v0,v0,v1
  4014b8:	8c450004 	lw	a1,4(v0)
  4014bc:	8c440000 	lw	a0,0(v0)
  4014c0:	24420008 	addiu	v0,v0,8
  4014c4:	afa20038 	sw	v0,56(sp)
  4014c8:	afa5004c 	sw	a1,76(sp)
  4014cc:	081004bb 	j	4012ec <__vprintf+0x218>
  4014d0:	afa40048 	sw	a0,72(sp)
  4014d4:	3c020040 	lui	v0,0x40
  4014d8:	08100500 	j	401400 <__vprintf+0x32c>
  4014dc:	2446239c 	addiu	a2,v0,9116
  4014e0:	24020008 	li	v0,8
  4014e4:	081004d4 	j	401350 <__vprintf+0x27c>
  4014e8:	afa20060 	sw	v0,96(sp)
  4014ec:	24020073 	li	v0,115
  4014f0:	12020028 	beq	s0,v0,401594 <__vprintf+0x4c0>
  4014f4:	24020063 	li	v0,99
  4014f8:	12020037 	beq	s0,v0,4015d8 <__vprintf+0x504>
  4014fc:	00000000 	nop
  401500:	a3b00011 	sb	s0,17(sp)
  401504:	3c050040 	lui	a1,0x40
  401508:	24a52250 	addiu	a1,a1,8784
  40150c:	03c02021 	move	a0,s8
  401510:	00a03021 	move	a2,a1
  401514:	27a70011 	addiu	a3,sp,17
  401518:	0c1003b4 	jal	400ed0 <__pf_printstuff>
  40151c:	a3a00012 	sb	zero,18(sp)
  401520:	0c10038a 	jal	400e28 <__pf_endfield>
  401524:	03c02021 	move	a0,s8
  401528:	08100452 	j	401148 <__vprintf+0x74>
  40152c:	00000000 	nop
  401530:	8fa30044 	lw	v1,68(sp)
  401534:	00000000 	nop
  401538:	1062000e 	beq	v1,v0,401574 <__vprintf+0x4a0>
  40153c:	00000000 	nop
  401540:	1060000c 	beqz	v1,401574 <__vprintf+0x4a0>
  401544:	24020002 	li	v0,2
  401548:	1062ffba 	beq	v1,v0,401434 <__vprintf+0x360>
  40154c:	00003821 	move	a3,zero
  401550:	00003021 	move	a2,zero
  401554:	2402000a 	li	v0,10
  401558:	afa7004c 	sw	a3,76(sp)
  40155c:	afa60048 	sw	a2,72(sp)
  401560:	081004d4 	j	401350 <__vprintf+0x27c>
  401564:	afa20060 	sw	v0,96(sp)
  401568:	3c020040 	lui	v0,0x40
  40156c:	08100500 	j	401400 <__vprintf+0x32c>
  401570:	24462398 	addiu	a2,v0,9112
  401574:	8fa20038 	lw	v0,56(sp)
  401578:	00000000 	nop
  40157c:	8c430000 	lw	v1,0(v0)
  401580:	24420004 	addiu	v0,v0,4
  401584:	00603821 	move	a3,v1
  401588:	000337c3 	sra	a2,v1,0x1f
  40158c:	08100515 	j	401454 <__vprintf+0x380>
  401590:	afa20038 	sw	v0,56(sp)
  401594:	8fa30038 	lw	v1,56(sp)
  401598:	00000000 	nop
  40159c:	8c670000 	lw	a3,0(v1)
  4015a0:	00000000 	nop
  4015a4:	10e00013 	beqz	a3,4015f4 <__vprintf+0x520>
  4015a8:	3c020040 	lui	v0,0x40
  4015ac:	3c050040 	lui	a1,0x40
  4015b0:	24a52250 	addiu	a1,a1,8784
  4015b4:	24620004 	addiu	v0,v1,4
  4015b8:	03c02021 	move	a0,s8
  4015bc:	00a03021 	move	a2,a1
  4015c0:	0c1003b4 	jal	400ed0 <__pf_printstuff>
  4015c4:	afa20038 	sw	v0,56(sp)
  4015c8:	0c10038a 	jal	400e28 <__pf_endfield>
  4015cc:	03c02021 	move	a0,s8
  4015d0:	08100452 	j	401148 <__vprintf+0x74>
  4015d4:	00000000 	nop
  4015d8:	8fa20038 	lw	v0,56(sp)
  4015dc:	00000000 	nop
  4015e0:	8c430000 	lw	v1,0(v0)
  4015e4:	24420004 	addiu	v0,v0,4
  4015e8:	afa20038 	sw	v0,56(sp)
  4015ec:	08100541 	j	401504 <__vprintf+0x430>
  4015f0:	a3a30011 	sb	v1,17(sp)
  4015f4:	0810056b 	j	4015ac <__vprintf+0x4d8>
  4015f8:	24472328 	addiu	a3,v0,9000
  4015fc:	00000000 	nop

00401600 <__puts>:
  401600:	27bdffe0 	addiu	sp,sp,-32
  401604:	afb00010 	sw	s0,16(sp)
  401608:	afbf0018 	sw	ra,24(sp)
  40160c:	afb10014 	sw	s1,20(sp)
  401610:	00808021 	move	s0,a0
  401614:	80840000 	lb	a0,0(a0)
  401618:	00000000 	nop
  40161c:	1080000d 	beqz	a0,401654 <__puts+0x54>
  401620:	00008821 	move	s1,zero
  401624:	0c10028c 	jal	400a30 <putchar>
  401628:	26100001 	addiu	s0,s0,1
  40162c:	82040000 	lb	a0,0(s0)
  401630:	00000000 	nop
  401634:	1480fffb 	bnez	a0,401624 <__puts+0x24>
  401638:	26310001 	addiu	s1,s1,1
  40163c:	02201021 	move	v0,s1
  401640:	8fbf0018 	lw	ra,24(sp)
  401644:	8fb10014 	lw	s1,20(sp)
  401648:	8fb00010 	lw	s0,16(sp)
  40164c:	03e00008 	jr	ra
  401650:	27bd0020 	addiu	sp,sp,32
  401654:	02201021 	move	v0,s1
  401658:	8fbf0018 	lw	ra,24(sp)
  40165c:	8fb10014 	lw	s1,20(sp)
  401660:	8fb00010 	lw	s0,16(sp)
  401664:	03e00008 	jr	ra
  401668:	27bd0020 	addiu	sp,sp,32
  40166c:	00000000 	nop

00401670 <strchr>:
  401670:	80830000 	lb	v1,0(a0)
  401674:	00052e00 	sll	a1,a1,0x18
  401678:	00801021 	move	v0,a0
  40167c:	1060000c 	beqz	v1,4016b0 <strchr+0x40>
  401680:	00052e03 	sra	a1,a1,0x18
  401684:	14a30006 	bne	a1,v1,4016a0 <strchr+0x30>
  401688:	24420001 	addiu	v0,v0,1
  40168c:	03e00008 	jr	ra
  401690:	2442ffff 	addiu	v0,v0,-1
  401694:	10a3000c 	beq	a1,v1,4016c8 <strchr+0x58>
  401698:	00000000 	nop
  40169c:	24420001 	addiu	v0,v0,1
  4016a0:	80430000 	lb	v1,0(v0)
  4016a4:	00000000 	nop
  4016a8:	1460fffa 	bnez	v1,401694 <strchr+0x24>
  4016ac:	00000000 	nop
  4016b0:	14a00003 	bnez	a1,4016c0 <strchr+0x50>
  4016b4:	00000000 	nop
  4016b8:	03e00008 	jr	ra
  4016bc:	00000000 	nop
  4016c0:	03e00008 	jr	ra
  4016c4:	00001021 	move	v0,zero
  4016c8:	03e00008 	jr	ra
  4016cc:	00000000 	nop

004016d0 <strlen>:
  4016d0:	80820000 	lb	v0,0(a0)
  4016d4:	00000000 	nop
  4016d8:	1040000a 	beqz	v0,401704 <strlen+0x34>
  4016dc:	00002821 	move	a1,zero
  4016e0:	24a50001 	addiu	a1,a1,1
  4016e4:	00851021 	addu	v0,a0,a1
  4016e8:	80430000 	lb	v1,0(v0)
  4016ec:	00000000 	nop
  4016f0:	1460fffc 	bnez	v1,4016e4 <strlen+0x14>
  4016f4:	24a50001 	addiu	a1,a1,1
  4016f8:	24a5ffff 	addiu	a1,a1,-1
  4016fc:	03e00008 	jr	ra
  401700:	00a01021 	move	v0,a1
  401704:	03e00008 	jr	ra
  401708:	00a01021 	move	v0,a1
  40170c:	00000000 	nop

00401710 <__udivdi3>:
  401710:	27bdffe0 	addiu	sp,sp,-32
  401714:	afbf0018 	sw	ra,24(sp)
  401718:	0c100653 	jal	40194c <__qdivrem>
  40171c:	afa00010 	sw	zero,16(sp)
  401720:	8fbf0018 	lw	ra,24(sp)
  401724:	00000000 	nop
  401728:	03e00008 	jr	ra
  40172c:	27bd0020 	addiu	sp,sp,32

00401730 <__umoddi3>:
  401730:	27bdffd8 	addiu	sp,sp,-40
  401734:	27a20018 	addiu	v0,sp,24
  401738:	afbf0020 	sw	ra,32(sp)
  40173c:	0c100653 	jal	40194c <__qdivrem>
  401740:	afa20010 	sw	v0,16(sp)
  401744:	8fa3001c 	lw	v1,28(sp)
  401748:	8fa20018 	lw	v0,24(sp)
  40174c:	8fbf0020 	lw	ra,32(sp)
  401750:	00000000 	nop
  401754:	03e00008 	jr	ra
  401758:	27bd0028 	addiu	sp,sp,40
  40175c:	00000000 	nop

00401760 <__bad_assert>:
  401760:	27bdfee0 	addiu	sp,sp,-288
  401764:	00c03821 	move	a3,a2
  401768:	afb00118 	sw	s0,280(sp)
  40176c:	3c060040 	lui	a2,0x40
  401770:	27b00018 	addiu	s0,sp,24
  401774:	24c623a0 	addiu	a2,a2,9120
  401778:	afa40010 	sw	a0,16(sp)
  40177c:	afa50014 	sw	a1,20(sp)
  401780:	02002021 	move	a0,s0
  401784:	afbf011c 	sw	ra,284(sp)
  401788:	0c100624 	jal	401890 <snprintf>
  40178c:	24050100 	li	a1,256
  401790:	0c1005b4 	jal	4016d0 <strlen>
  401794:	02002021 	move	a0,s0
  401798:	00403021 	move	a2,v0
  40179c:	02002821 	move	a1,s0
  4017a0:	0c10030f 	jal	400c3c <write>
  4017a4:	24040002 	li	a0,2
  4017a8:	0c100630 	jal	4018c0 <abort>
  4017ac:	00000000 	nop

004017b0 <__snprintf_send>:
  4017b0:	10c00012 	beqz	a2,4017fc <__snprintf_send+0x4c>
  4017b4:	00004021 	move	t0,zero
  4017b8:	8c870008 	lw	a3,8(a0)
  4017bc:	8c820004 	lw	v0,4(a0)
  4017c0:	00a81821 	addu	v1,a1,t0
  4017c4:	00e2102b 	sltu	v0,a3,v0
  4017c8:	1040000a 	beqz	v0,4017f4 <__snprintf_send+0x44>
  4017cc:	25080001 	addiu	t0,t0,1
  4017d0:	8c820000 	lw	v0,0(a0)
  4017d4:	90630000 	lbu	v1,0(v1)
  4017d8:	00471021 	addu	v0,v0,a3
  4017dc:	a0430000 	sb	v1,0(v0)
  4017e0:	8c870008 	lw	a3,8(a0)
  4017e4:	00000000 	nop
  4017e8:	24e20001 	addiu	v0,a3,1
  4017ec:	00403821 	move	a3,v0
  4017f0:	ac820008 	sw	v0,8(a0)
  4017f4:	14c8fff1 	bne	a2,t0,4017bc <__snprintf_send+0xc>
  4017f8:	00000000 	nop
  4017fc:	03e00008 	jr	ra
  401800:	00000000 	nop

00401804 <vsnprintf>:
  401804:	27bdffd8 	addiu	sp,sp,-40
  401808:	afb00020 	sw	s0,32(sp)
  40180c:	00a01021 	move	v0,a1
  401810:	00808021 	move	s0,a0
  401814:	3c040040 	lui	a0,0x40
  401818:	24a3ffff 	addiu	v1,a1,-1
  40181c:	afbf0024 	sw	ra,36(sp)
  401820:	248417b0 	addiu	a0,a0,6064
  401824:	27a50010 	addiu	a1,sp,16
  401828:	1440000c 	bnez	v0,40185c <vsnprintf+0x58>
  40182c:	afb00010 	sw	s0,16(sp)
  401830:	3c040040 	lui	a0,0x40
  401834:	248417b0 	addiu	a0,a0,6064
  401838:	afa00014 	sw	zero,20(sp)
  40183c:	0c100435 	jal	4010d4 <__vprintf>
  401840:	afa00018 	sw	zero,24(sp)
  401844:	00401821 	move	v1,v0
  401848:	8fbf0024 	lw	ra,36(sp)
  40184c:	8fb00020 	lw	s0,32(sp)
  401850:	00601021 	move	v0,v1
  401854:	03e00008 	jr	ra
  401858:	27bd0028 	addiu	sp,sp,40
  40185c:	afa30014 	sw	v1,20(sp)
  401860:	0c100435 	jal	4010d4 <__vprintf>
  401864:	afa00018 	sw	zero,24(sp)
  401868:	00401821 	move	v1,v0
  40186c:	8fa20018 	lw	v0,24(sp)
  401870:	00000000 	nop
  401874:	02021021 	addu	v0,s0,v0
  401878:	a0400000 	sb	zero,0(v0)
  40187c:	8fbf0024 	lw	ra,36(sp)
  401880:	8fb00020 	lw	s0,32(sp)
  401884:	00601021 	move	v0,v1
  401888:	03e00008 	jr	ra
  40188c:	27bd0028 	addiu	sp,sp,40

00401890 <snprintf>:
  401890:	27bdffe0 	addiu	sp,sp,-32
  401894:	27a2002c 	addiu	v0,sp,44
  401898:	afa7002c 	sw	a3,44(sp)
  40189c:	00403821 	move	a3,v0
  4018a0:	afbf0018 	sw	ra,24(sp)
  4018a4:	0c100601 	jal	401804 <vsnprintf>
  4018a8:	afa20010 	sw	v0,16(sp)
  4018ac:	8fbf0018 	lw	ra,24(sp)
  4018b0:	00000000 	nop
  4018b4:	03e00008 	jr	ra
  4018b8:	27bd0020 	addiu	sp,sp,32
  4018bc:	00000000 	nop

004018c0 <abort>:
  4018c0:	27bdffe8 	addiu	sp,sp,-24
  4018c4:	afbf0010 	sw	ra,16(sp)
  4018c8:	0c1002cf 	jal	400b3c <_exit>
  4018cc:	240400ff 	li	a0,255

004018d0 <shl>:
  4018d0:	18a00016 	blez	a1,40192c <shl+0x5c>
  4018d4:	24020010 	li	v0,16
  4018d8:	00464823 	subu	t1,v0,a2
  4018dc:	00803821 	move	a3,a0
  4018e0:	00004021 	move	t0,zero
  4018e4:	8ce20000 	lw	v0,0(a3)
  4018e8:	8ce30004 	lw	v1,4(a3)
  4018ec:	00c21004 	sllv	v0,v0,a2
  4018f0:	3042ffff 	andi	v0,v0,0xffff
  4018f4:	01231806 	srlv	v1,v1,t1
  4018f8:	00431025 	or	v0,v0,v1
  4018fc:	25080001 	addiu	t0,t0,1
  401900:	ace20000 	sw	v0,0(a3)
  401904:	14a8fff7 	bne	a1,t0,4018e4 <shl+0x14>
  401908:	24e70004 	addiu	a3,a3,4
  40190c:	00051880 	sll	v1,a1,0x2
  401910:	00831821 	addu	v1,a0,v1
  401914:	8c620000 	lw	v0,0(v1)
  401918:	00000000 	nop
  40191c:	00c21004 	sllv	v0,v0,a2
  401920:	3042ffff 	andi	v0,v0,0xffff
  401924:	03e00008 	jr	ra
  401928:	ac620000 	sw	v0,0(v1)
  40192c:	00001821 	move	v1,zero
  401930:	00831821 	addu	v1,a0,v1
  401934:	8c620000 	lw	v0,0(v1)
  401938:	00000000 	nop
  40193c:	00c21004 	sllv	v0,v0,a2
  401940:	3042ffff 	andi	v0,v0,0xffff
  401944:	03e00008 	jr	ra
  401948:	ac620000 	sw	v0,0(v1)

0040194c <__qdivrem>:
  40194c:	27bdff80 	addiu	sp,sp,-128
  401950:	00c71025 	or	v0,a2,a3
  401954:	afb20060 	sw	s2,96(sp)
  401958:	afbf007c 	sw	ra,124(sp)
  40195c:	afbe0078 	sw	s8,120(sp)
  401960:	afb70074 	sw	s7,116(sp)
  401964:	afb60070 	sw	s6,112(sp)
  401968:	afb5006c 	sw	s5,108(sp)
  40196c:	afb40068 	sw	s4,104(sp)
  401970:	afb30064 	sw	s3,100(sp)
  401974:	afb1005c 	sw	s1,92(sp)
  401978:	afb00058 	sw	s0,88(sp)
  40197c:	00a04821 	move	t1,a1
  401980:	8fb20090 	lw	s2,144(sp)
  401984:	14400018 	bnez	v0,4019e8 <__qdivrem+0x9c>
  401988:	00804021 	move	t0,a0
  40198c:	3c031000 	lui	v1,0x1000
  401990:	8c640000 	lw	a0,0(v1)
  401994:	24020001 	li	v0,1
  401998:	14800002 	bnez	a0,4019a4 <__qdivrem+0x58>
  40199c:	0044001b 	divu	zero,v0,a0
  4019a0:	0007000d 	break	0x7
  4019a4:	00001012 	mflo	v0
  4019a8:	12400003 	beqz	s2,4019b8 <__qdivrem+0x6c>
  4019ac:	00401821 	move	v1,v0
  4019b0:	ae450004 	sw	a1,4(s2)
  4019b4:	ae480000 	sw	t0,0(s2)
  4019b8:	8fbf007c 	lw	ra,124(sp)
  4019bc:	8fbe0078 	lw	s8,120(sp)
  4019c0:	8fb70074 	lw	s7,116(sp)
  4019c4:	8fb60070 	lw	s6,112(sp)
  4019c8:	8fb5006c 	lw	s5,108(sp)
  4019cc:	8fb40068 	lw	s4,104(sp)
  4019d0:	8fb30064 	lw	s3,100(sp)
  4019d4:	8fb20060 	lw	s2,96(sp)
  4019d8:	8fb1005c 	lw	s1,92(sp)
  4019dc:	8fb00058 	lw	s0,88(sp)
  4019e0:	03e00008 	jr	ra
  4019e4:	27bd0080 	addiu	sp,sp,128
  4019e8:	0086102b 	sltu	v0,a0,a2
  4019ec:	10400008 	beqz	v0,401a10 <__qdivrem+0xc4>
  4019f0:	00000000 	nop
  4019f4:	1240010c 	beqz	s2,401e28 <__qdivrem+0x4dc>
  4019f8:	00000000 	nop
  4019fc:	00001821 	move	v1,zero
  401a00:	00001021 	move	v0,zero
  401a04:	ae490004 	sw	t1,4(s2)
  401a08:	0810066e 	j	4019b8 <__qdivrem+0x6c>
  401a0c:	ae480000 	sw	t0,0(s2)
  401a10:	10860046 	beq	a0,a2,401b2c <__qdivrem+0x1e0>
  401a14:	00a7102b 	sltu	v0,a1,a3
  401a18:	00e08821 	move	s1,a3
  401a1c:	01001821 	move	v1,t0
  401a20:	00c08021 	move	s0,a2
  401a24:	30c7ffff 	andi	a3,a2,0xffff
  401a28:	3108ffff 	andi	t0,t0,0xffff
  401a2c:	312affff 	andi	t2,t1,0xffff
  401a30:	3226ffff 	andi	a2,s1,0xffff
  401a34:	00031c02 	srl	v1,v1,0x10
  401a38:	00092c02 	srl	a1,t1,0x10
  401a3c:	00101402 	srl	v0,s0,0x10
  401a40:	00112402 	srl	a0,s1,0x10
  401a44:	afa00010 	sw	zero,16(sp)
  401a48:	afa30014 	sw	v1,20(sp)
  401a4c:	afa80018 	sw	t0,24(sp)
  401a50:	afa5001c 	sw	a1,28(sp)
  401a54:	afaa0020 	sw	t2,32(sp)
  401a58:	afa20028 	sw	v0,40(sp)
  401a5c:	afa7002c 	sw	a3,44(sp)
  401a60:	afa40030 	sw	a0,48(sp)
  401a64:	144000f6 	bnez	v0,401e40 <__qdivrem+0x4f4>
  401a68:	afa60034 	sw	a2,52(sp)
  401a6c:	14e00033 	bnez	a3,401b3c <__qdivrem+0x1f0>
  401a70:	27a20028 	addiu	v0,sp,40
  401a74:	148000f7 	bnez	a0,401e54 <__qdivrem+0x508>
  401a78:	27a2002c 	addiu	v0,sp,44
  401a7c:	14c00002 	bnez	a2,401a88 <__qdivrem+0x13c>
  401a80:	0066001b 	divu	zero,v1,a2
  401a84:	0007000d 	break	0x7
  401a88:	00001010 	mfhi	v0
  401a8c:	00021400 	sll	v0,v0,0x10
  401a90:	00481025 	or	v0,v0,t0
  401a94:	00004812 	mflo	t1
	...
  401aa0:	14c00002 	bnez	a2,401aac <__qdivrem+0x160>
  401aa4:	0046001b 	divu	zero,v0,a2
  401aa8:	0007000d 	break	0x7
  401aac:	00001810 	mfhi	v1
  401ab0:	00031c00 	sll	v1,v1,0x10
  401ab4:	00651825 	or	v1,v1,a1
  401ab8:	00003812 	mflo	a3
	...
  401ac4:	14c00002 	bnez	a2,401ad0 <__qdivrem+0x184>
  401ac8:	0066001b 	divu	zero,v1,a2
  401acc:	0007000d 	break	0x7
  401ad0:	00001010 	mfhi	v0
  401ad4:	00021400 	sll	v0,v0,0x10
  401ad8:	00001812 	mflo	v1
  401adc:	12400008 	beqz	s2,401b00 <__qdivrem+0x1b4>
  401ae0:	01422025 	or	a0,t2,v0
  401ae4:	14c00002 	bnez	a2,401af0 <__qdivrem+0x1a4>
  401ae8:	0086001b 	divu	zero,a0,a2
  401aec:	0007000d 	break	0x7
  401af0:	ae400000 	sw	zero,0(s2)
  401af4:	00001010 	mfhi	v0
  401af8:	ae420004 	sw	v0,4(s2)
  401afc:	00000000 	nop
  401b00:	14c00002 	bnez	a2,401b0c <__qdivrem+0x1c0>
  401b04:	0086001b 	divu	zero,a0,a2
  401b08:	0007000d 	break	0x7
  401b0c:	00091400 	sll	v0,t1,0x10
  401b10:	00031c00 	sll	v1,v1,0x10
  401b14:	00e28025 	or	s0,a3,v0
  401b18:	02001021 	move	v0,s0
  401b1c:	00002012 	mflo	a0
  401b20:	00838825 	or	s1,a0,v1
  401b24:	0810066e 	j	4019b8 <__qdivrem+0x6c>
  401b28:	02201821 	move	v1,s1
  401b2c:	1040ffbb 	beqz	v0,401a1c <__qdivrem+0xd0>
  401b30:	00e08821 	move	s1,a3
  401b34:	0810067d 	j	4019f4 <__qdivrem+0xa8>
  401b38:	00000000 	nop
  401b3c:	afa20050 	sw	v0,80(sp)
  401b40:	24170003 	li	s7,3
  401b44:	27be002c 	addiu	s8,sp,44
  401b48:	8fa30014 	lw	v1,20(sp)
  401b4c:	24020004 	li	v0,4
  401b50:	146000c4 	bnez	v1,401e64 <__qdivrem+0x518>
  401b54:	00579823 	subu	s3,v0,s7
  401b58:	081006d9 	j	401b64 <__qdivrem+0x218>
  401b5c:	27b40014 	addiu	s4,sp,20
  401b60:	0060a021 	move	s4,v1
  401b64:	8e820004 	lw	v0,4(s4)
  401b68:	2673ffff 	addiu	s3,s3,-1
  401b6c:	1040fffc 	beqz	v0,401b60 <__qdivrem+0x214>
  401b70:	26830004 	addiu	v1,s4,4
  401b74:	24020004 	li	v0,4
  401b78:	00532023 	subu	a0,v0,s3
  401b7c:	2483ffff 	addiu	v1,a0,-1
  401b80:	046000bc 	bltz	v1,401e74 <__qdivrem+0x528>
  401b84:	00001821 	move	v1,zero
  401b88:	27a60038 	addiu	a2,sp,56
  401b8c:	00042880 	sll	a1,a0,0x2
  401b90:	00c51021 	addu	v0,a2,a1
  401b94:	2442fffc 	addiu	v0,v0,-4
  401b98:	24630001 	addiu	v1,v1,1
  401b9c:	ac400000 	sw	zero,0(v0)
  401ba0:	1464fffd 	bne	v1,a0,401b98 <__qdivrem+0x24c>
  401ba4:	2442fffc 	addiu	v0,v0,-4
  401ba8:	8fcb0000 	lw	t3,0(s8)
  401bac:	34028000 	li	v0,0x8000
  401bb0:	0162102b 	sltu	v0,t3,v0
  401bb4:	00c5b021 	addu	s6,a2,a1
  401bb8:	104000ac 	beqz	v0,401e6c <__qdivrem+0x520>
  401bbc:	01601821 	move	v1,t3
  401bc0:	0000a821 	move	s5,zero
  401bc4:	34048000 	li	a0,0x8000
  401bc8:	00031840 	sll	v1,v1,0x1
  401bcc:	0064102b 	sltu	v0,v1,a0
  401bd0:	1440fffd 	bnez	v0,401bc8 <__qdivrem+0x27c>
  401bd4:	26b50001 	addiu	s5,s5,1
  401bd8:	1aa00009 	blez	s5,401c00 <__qdivrem+0x2b4>
  401bdc:	02f32821 	addu	a1,s7,s3
  401be0:	02a03021 	move	a2,s5
  401be4:	0c100634 	jal	4018d0 <shl>
  401be8:	02802021 	move	a0,s4
  401bec:	03c02021 	move	a0,s8
  401bf0:	26e5ffff 	addiu	a1,s7,-1
  401bf4:	0c100634 	jal	4018d0 <shl>
  401bf8:	02a03021 	move	a2,s5
  401bfc:	8fcb0000 	lw	t3,0(s8)
  401c00:	8fa20050 	lw	v0,80(sp)
  401c04:	00177080 	sll	t6,s7,0x2
  401c08:	8c580008 	lw	t8,8(v0)
  401c0c:	02c06821 	move	t5,s6
  401c10:	02804821 	move	t1,s4
  401c14:	028e6021 	addu	t4,s4,t6
  401c18:	00007821 	move	t7,zero
  401c1c:	3416ffff 	li	s6,0xffff
  401c20:	8d240000 	lw	a0,0(t1)
  401c24:	8d230004 	lw	v1,4(t1)
  401c28:	8d260008 	lw	a2,8(t1)
  401c2c:	11640081 	beq	t3,a0,401e34 <__qdivrem+0x4e8>
  401c30:	00041400 	sll	v0,a0,0x10
  401c34:	00621025 	or	v0,v1,v0
  401c38:	15600002 	bnez	t3,401c44 <__qdivrem+0x2f8>
  401c3c:	004b001b 	divu	zero,v0,t3
  401c40:	0007000d 	break	0x7
  401c44:	00002810 	mfhi	a1
  401c48:	00003812 	mflo	a3
	...
  401c54:	00f80018 	mult	a3,t8
  401c58:	00051400 	sll	v0,a1,0x10
  401c5c:	00c21025 	or	v0,a2,v0
  401c60:	00001812 	mflo	v1
  401c64:	0043182b 	sltu	v1,v0,v1
  401c68:	10600006 	beqz	v1,401c84 <__qdivrem+0x338>
  401c6c:	00000000 	nop
  401c70:	24e7ffff 	addiu	a3,a3,-1
  401c74:	00ab2821 	addu	a1,a1,t3
  401c78:	02c5102b 	sltu	v0,s6,a1
  401c7c:	1040fff6 	beqz	v0,401c58 <__qdivrem+0x30c>
  401c80:	00f80018 	mult	a3,t8
  401c84:	1ae00017 	blez	s7,401ce4 <__qdivrem+0x398>
  401c88:	00004021 	move	t0,zero
  401c8c:	8fa20050 	lw	v0,80(sp)
  401c90:	01802021 	move	a0,t4
  401c94:	004e3021 	addu	a2,v0,t6
  401c98:	02e02821 	move	a1,s7
  401c9c:	3c0a0001 	lui	t2,0x1
  401ca0:	8cc20000 	lw	v0,0(a2)
  401ca4:	8c830000 	lw	v1,0(a0)
  401ca8:	00e20018 	mult	a3,v0
  401cac:	24a5ffff 	addiu	a1,a1,-1
  401cb0:	24c6fffc 	addiu	a2,a2,-4
  401cb4:	00001012 	mflo	v0
  401cb8:	00621823 	subu	v1,v1,v0
  401cbc:	00681823 	subu	v1,v1,t0
  401cc0:	00031402 	srl	v0,v1,0x10
  401cc4:	01421023 	subu	v0,t2,v0
  401cc8:	3063ffff 	andi	v1,v1,0xffff
  401ccc:	ac830000 	sw	v1,0(a0)
  401cd0:	3048ffff 	andi	t0,v0,0xffff
  401cd4:	14a0fff2 	bnez	a1,401ca0 <__qdivrem+0x354>
  401cd8:	2484fffc 	addiu	a0,a0,-4
  401cdc:	8d240000 	lw	a0,0(t1)
  401ce0:	00000000 	nop
  401ce4:	00881023 	subu	v0,a0,t0
  401ce8:	3044ffff 	andi	a0,v0,0xffff
  401cec:	00021c02 	srl	v1,v0,0x10
  401cf0:	10600018 	beqz	v1,401d54 <__qdivrem+0x408>
  401cf4:	ad240000 	sw	a0,0(t1)
  401cf8:	1ae00012 	blez	s7,401d44 <__qdivrem+0x3f8>
  401cfc:	00004021 	move	t0,zero
  401d00:	8fa20050 	lw	v0,80(sp)
  401d04:	01802021 	move	a0,t4
  401d08:	004e3021 	addu	a2,v0,t6
  401d0c:	02e02821 	move	a1,s7
  401d10:	8c820000 	lw	v0,0(a0)
  401d14:	8cc30000 	lw	v1,0(a2)
  401d18:	01021021 	addu	v0,t0,v0
  401d1c:	00431021 	addu	v0,v0,v1
  401d20:	3043ffff 	andi	v1,v0,0xffff
  401d24:	24a5ffff 	addiu	a1,a1,-1
  401d28:	ac830000 	sw	v1,0(a0)
  401d2c:	00024402 	srl	t0,v0,0x10
  401d30:	2484fffc 	addiu	a0,a0,-4
  401d34:	14a0fff6 	bnez	a1,401d10 <__qdivrem+0x3c4>
  401d38:	24c6fffc 	addiu	a2,a2,-4
  401d3c:	8d240000 	lw	a0,0(t1)
  401d40:	00000000 	nop
  401d44:	01041021 	addu	v0,t0,a0
  401d48:	3042ffff 	andi	v0,v0,0xffff
  401d4c:	ad220000 	sw	v0,0(t1)
  401d50:	24e7ffff 	addiu	a3,a3,-1
  401d54:	25ef0001 	addiu	t7,t7,1
  401d58:	026f102a 	slt	v0,s3,t7
  401d5c:	ada70000 	sw	a3,0(t5)
  401d60:	25290004 	addiu	t1,t1,4
  401d64:	25ad0004 	addiu	t5,t5,4
  401d68:	1040ffad 	beqz	v0,401c20 <__qdivrem+0x2d4>
  401d6c:	258c0004 	addiu	t4,t4,4
  401d70:	12400022 	beqz	s2,401dfc <__qdivrem+0x4b0>
  401d74:	00000000 	nop
  401d78:	12a00016 	beqz	s5,401dd4 <__qdivrem+0x488>
  401d7c:	02f32821 	addu	a1,s7,s3
  401d80:	0265102a 	slt	v0,s3,a1
  401d84:	10400011 	beqz	v0,401dcc <__qdivrem+0x480>
  401d88:	00051080 	sll	v0,a1,0x2
  401d8c:	00051880 	sll	v1,a1,0x2
  401d90:	24020010 	li	v0,16
  401d94:	00553823 	subu	a3,v0,s5
  401d98:	02833021 	addu	a2,s4,v1
  401d9c:	8cc2fffc 	lw	v0,-4(a2)
  401da0:	8cc30000 	lw	v1,0(a2)
  401da4:	00e21004 	sllv	v0,v0,a3
  401da8:	02a31806 	srlv	v1,v1,s5
  401dac:	3042ffff 	andi	v0,v0,0xffff
  401db0:	24a5ffff 	addiu	a1,a1,-1
  401db4:	00621825 	or	v1,v1,v0
  401db8:	0265202a 	slt	a0,s3,a1
  401dbc:	acc30000 	sw	v1,0(a2)
  401dc0:	1480fff6 	bnez	a0,401d9c <__qdivrem+0x450>
  401dc4:	24c6fffc 	addiu	a2,a2,-4
  401dc8:	00051080 	sll	v0,a1,0x2
  401dcc:	00541021 	addu	v0,v0,s4
  401dd0:	ac400000 	sw	zero,0(v0)
  401dd4:	8fa20014 	lw	v0,20(sp)
  401dd8:	8fa40018 	lw	a0,24(sp)
  401ddc:	00021400 	sll	v0,v0,0x10
  401de0:	8fa3001c 	lw	v1,28(sp)
  401de4:	00448025 	or	s0,v0,a0
  401de8:	8fa20020 	lw	v0,32(sp)
  401dec:	00031c00 	sll	v1,v1,0x10
  401df0:	00628825 	or	s1,v1,v0
  401df4:	ae510004 	sw	s1,4(s2)
  401df8:	ae500000 	sw	s0,0(s2)
  401dfc:	8fa2003c 	lw	v0,60(sp)
  401e00:	8fa40040 	lw	a0,64(sp)
  401e04:	00021400 	sll	v0,v0,0x10
  401e08:	8fa30044 	lw	v1,68(sp)
  401e0c:	00448025 	or	s0,v0,a0
  401e10:	8fa20048 	lw	v0,72(sp)
  401e14:	00031c00 	sll	v1,v1,0x10
  401e18:	00628825 	or	s1,v1,v0
  401e1c:	02201821 	move	v1,s1
  401e20:	0810066e 	j	4019b8 <__qdivrem+0x6c>
  401e24:	02001021 	move	v0,s0
  401e28:	00001821 	move	v1,zero
  401e2c:	0810066e 	j	4019b8 <__qdivrem+0x6c>
  401e30:	00001021 	move	v0,zero
  401e34:	00602821 	move	a1,v1
  401e38:	0810071d 	j	401c74 <__qdivrem+0x328>
  401e3c:	3407ffff 	li	a3,0xffff
  401e40:	27a20024 	addiu	v0,sp,36
  401e44:	24170004 	li	s7,4
  401e48:	27be0028 	addiu	s8,sp,40
  401e4c:	081006d2 	j	401b48 <__qdivrem+0x1fc>
  401e50:	afa20050 	sw	v0,80(sp)
  401e54:	24170002 	li	s7,2
  401e58:	27be0030 	addiu	s8,sp,48
  401e5c:	081006d2 	j	401b48 <__qdivrem+0x1fc>
  401e60:	afa20050 	sw	v0,80(sp)
  401e64:	081006dd 	j	401b74 <__qdivrem+0x228>
  401e68:	27b40010 	addiu	s4,sp,16
  401e6c:	08100700 	j	401c00 <__qdivrem+0x2b4>
  401e70:	0000a821 	move	s5,zero
  401e74:	00042880 	sll	a1,a0,0x2
  401e78:	081006ea 	j	401ba8 <__qdivrem+0x25c>
  401e7c:	27a60038 	addiu	a2,sp,56
