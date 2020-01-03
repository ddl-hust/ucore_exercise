
bin/kernel:     file format elf32-i386


Disassembly of section .text:

c0100000 <kern_entry>:
c0100000:	b8 00 10 12 00       	mov    $0x121000,%eax
c0100005:	0f 22 d8             	mov    %eax,%cr3
c0100008:	0f 20 c0             	mov    %cr0,%eax
c010000b:	0d 2f 00 05 80       	or     $0x8005002f,%eax
c0100010:	83 e0 f3             	and    $0xfffffff3,%eax
c0100013:	0f 22 c0             	mov    %eax,%cr0
c0100016:	8d 05 1e 00 10 c0    	lea    0xc010001e,%eax
c010001c:	ff e0                	jmp    *%eax

c010001e <next>:
c010001e:	31 c0                	xor    %eax,%eax
c0100020:	a3 00 10 12 c0       	mov    %eax,0xc0121000
c0100025:	bd 00 00 00 00       	mov    $0x0,%ebp
c010002a:	bc 00 00 12 c0       	mov    $0xc0120000,%esp
c010002f:	e8 02 00 00 00       	call   c0100036 <kern_init>

c0100034 <spin>:
c0100034:	eb fe                	jmp    c0100034 <spin>

c0100036 <kern_init>:
c0100036:	55                   	push   %ebp
c0100037:	89 e5                	mov    %esp,%ebp
c0100039:	83 ec 28             	sub    $0x28,%esp
c010003c:	ba fc 40 12 c0       	mov    $0xc01240fc,%edx
c0100041:	b8 00 30 12 c0       	mov    $0xc0123000,%eax
c0100046:	29 c2                	sub    %eax,%edx
c0100048:	89 d0                	mov    %edx,%eax
c010004a:	89 44 24 08          	mov    %eax,0x8(%esp)
c010004e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100055:	00 
c0100056:	c7 04 24 00 30 12 c0 	movl   $0xc0123000,(%esp)
c010005d:	e8 44 83 00 00       	call   c01083a6 <memset>
c0100062:	e8 06 1e 00 00       	call   c0101e6d <cons_init>
c0100067:	c7 45 f4 a0 8c 10 c0 	movl   $0xc0108ca0,-0xc(%ebp)
c010006e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100071:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100075:	c7 04 24 bc 8c 10 c0 	movl   $0xc0108cbc,(%esp)
c010007c:	e8 20 02 00 00       	call   c01002a1 <cprintf>
c0100081:	e8 d2 08 00 00       	call   c0100958 <print_kerninfo>
c0100086:	e8 95 00 00 00       	call   c0100120 <grade_backtrace>
c010008b:	e8 53 6b 00 00       	call   c0106be3 <pmm_init>
c0100090:	e8 35 1f 00 00       	call   c0101fca <pic_init>
c0100095:	e8 b9 20 00 00       	call   c0102153 <idt_init>
c010009a:	e8 7b 35 00 00       	call   c010361a <vmm_init>
c010009f:	e8 64 0d 00 00       	call   c0100e08 <ide_init>
c01000a4:	e8 40 44 00 00       	call   c01044e9 <swap_init>
c01000a9:	e8 75 15 00 00       	call   c0101623 <clock_init>
c01000ae:	e8 52 20 00 00       	call   c0102105 <intr_enable>
c01000b3:	eb fe                	jmp    c01000b3 <kern_init+0x7d>

c01000b5 <grade_backtrace2>:
c01000b5:	55                   	push   %ebp
c01000b6:	89 e5                	mov    %esp,%ebp
c01000b8:	83 ec 18             	sub    $0x18,%esp
c01000bb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01000c2:	00 
c01000c3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01000ca:	00 
c01000cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c01000d2:	e8 c5 0c 00 00       	call   c0100d9c <mon_backtrace>
c01000d7:	c9                   	leave  
c01000d8:	c3                   	ret    

c01000d9 <grade_backtrace1>:
c01000d9:	55                   	push   %ebp
c01000da:	89 e5                	mov    %esp,%ebp
c01000dc:	53                   	push   %ebx
c01000dd:	83 ec 14             	sub    $0x14,%esp
c01000e0:	8d 5d 0c             	lea    0xc(%ebp),%ebx
c01000e3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
c01000e6:	8d 55 08             	lea    0x8(%ebp),%edx
c01000e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01000ec:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c01000f0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01000f4:	89 54 24 04          	mov    %edx,0x4(%esp)
c01000f8:	89 04 24             	mov    %eax,(%esp)
c01000fb:	e8 b5 ff ff ff       	call   c01000b5 <grade_backtrace2>
c0100100:	83 c4 14             	add    $0x14,%esp
c0100103:	5b                   	pop    %ebx
c0100104:	5d                   	pop    %ebp
c0100105:	c3                   	ret    

c0100106 <grade_backtrace0>:
c0100106:	55                   	push   %ebp
c0100107:	89 e5                	mov    %esp,%ebp
c0100109:	83 ec 18             	sub    $0x18,%esp
c010010c:	8b 45 10             	mov    0x10(%ebp),%eax
c010010f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100113:	8b 45 08             	mov    0x8(%ebp),%eax
c0100116:	89 04 24             	mov    %eax,(%esp)
c0100119:	e8 bb ff ff ff       	call   c01000d9 <grade_backtrace1>
c010011e:	c9                   	leave  
c010011f:	c3                   	ret    

c0100120 <grade_backtrace>:
c0100120:	55                   	push   %ebp
c0100121:	89 e5                	mov    %esp,%ebp
c0100123:	83 ec 18             	sub    $0x18,%esp
c0100126:	b8 36 00 10 c0       	mov    $0xc0100036,%eax
c010012b:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
c0100132:	ff 
c0100133:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100137:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c010013e:	e8 c3 ff ff ff       	call   c0100106 <grade_backtrace0>
c0100143:	c9                   	leave  
c0100144:	c3                   	ret    

c0100145 <lab1_print_cur_status>:
c0100145:	55                   	push   %ebp
c0100146:	89 e5                	mov    %esp,%ebp
c0100148:	83 ec 28             	sub    $0x28,%esp
c010014b:	8c 4d f6             	mov    %cs,-0xa(%ebp)
c010014e:	8c 5d f4             	mov    %ds,-0xc(%ebp)
c0100151:	8c 45 f2             	mov    %es,-0xe(%ebp)
c0100154:	8c 55 f0             	mov    %ss,-0x10(%ebp)
c0100157:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c010015b:	0f b7 c0             	movzwl %ax,%eax
c010015e:	83 e0 03             	and    $0x3,%eax
c0100161:	89 c2                	mov    %eax,%edx
c0100163:	a1 00 30 12 c0       	mov    0xc0123000,%eax
c0100168:	89 54 24 08          	mov    %edx,0x8(%esp)
c010016c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100170:	c7 04 24 c1 8c 10 c0 	movl   $0xc0108cc1,(%esp)
c0100177:	e8 25 01 00 00       	call   c01002a1 <cprintf>
c010017c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0100180:	0f b7 d0             	movzwl %ax,%edx
c0100183:	a1 00 30 12 c0       	mov    0xc0123000,%eax
c0100188:	89 54 24 08          	mov    %edx,0x8(%esp)
c010018c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100190:	c7 04 24 cf 8c 10 c0 	movl   $0xc0108ccf,(%esp)
c0100197:	e8 05 01 00 00       	call   c01002a1 <cprintf>
c010019c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
c01001a0:	0f b7 d0             	movzwl %ax,%edx
c01001a3:	a1 00 30 12 c0       	mov    0xc0123000,%eax
c01001a8:	89 54 24 08          	mov    %edx,0x8(%esp)
c01001ac:	89 44 24 04          	mov    %eax,0x4(%esp)
c01001b0:	c7 04 24 dd 8c 10 c0 	movl   $0xc0108cdd,(%esp)
c01001b7:	e8 e5 00 00 00       	call   c01002a1 <cprintf>
c01001bc:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c01001c0:	0f b7 d0             	movzwl %ax,%edx
c01001c3:	a1 00 30 12 c0       	mov    0xc0123000,%eax
c01001c8:	89 54 24 08          	mov    %edx,0x8(%esp)
c01001cc:	89 44 24 04          	mov    %eax,0x4(%esp)
c01001d0:	c7 04 24 eb 8c 10 c0 	movl   $0xc0108ceb,(%esp)
c01001d7:	e8 c5 00 00 00       	call   c01002a1 <cprintf>
c01001dc:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
c01001e0:	0f b7 d0             	movzwl %ax,%edx
c01001e3:	a1 00 30 12 c0       	mov    0xc0123000,%eax
c01001e8:	89 54 24 08          	mov    %edx,0x8(%esp)
c01001ec:	89 44 24 04          	mov    %eax,0x4(%esp)
c01001f0:	c7 04 24 f9 8c 10 c0 	movl   $0xc0108cf9,(%esp)
c01001f7:	e8 a5 00 00 00       	call   c01002a1 <cprintf>
c01001fc:	a1 00 30 12 c0       	mov    0xc0123000,%eax
c0100201:	83 c0 01             	add    $0x1,%eax
c0100204:	a3 00 30 12 c0       	mov    %eax,0xc0123000
c0100209:	c9                   	leave  
c010020a:	c3                   	ret    

c010020b <lab1_switch_to_user>:
c010020b:	55                   	push   %ebp
c010020c:	89 e5                	mov    %esp,%ebp
c010020e:	5d                   	pop    %ebp
c010020f:	c3                   	ret    

c0100210 <lab1_switch_to_kernel>:
c0100210:	55                   	push   %ebp
c0100211:	89 e5                	mov    %esp,%ebp
c0100213:	5d                   	pop    %ebp
c0100214:	c3                   	ret    

c0100215 <lab1_switch_test>:
c0100215:	55                   	push   %ebp
c0100216:	89 e5                	mov    %esp,%ebp
c0100218:	83 ec 18             	sub    $0x18,%esp
c010021b:	e8 25 ff ff ff       	call   c0100145 <lab1_print_cur_status>
c0100220:	c7 04 24 08 8d 10 c0 	movl   $0xc0108d08,(%esp)
c0100227:	e8 75 00 00 00       	call   c01002a1 <cprintf>
c010022c:	e8 da ff ff ff       	call   c010020b <lab1_switch_to_user>
c0100231:	e8 0f ff ff ff       	call   c0100145 <lab1_print_cur_status>
c0100236:	c7 04 24 28 8d 10 c0 	movl   $0xc0108d28,(%esp)
c010023d:	e8 5f 00 00 00       	call   c01002a1 <cprintf>
c0100242:	e8 c9 ff ff ff       	call   c0100210 <lab1_switch_to_kernel>
c0100247:	e8 f9 fe ff ff       	call   c0100145 <lab1_print_cur_status>
c010024c:	c9                   	leave  
c010024d:	c3                   	ret    

c010024e <cputch>:
c010024e:	55                   	push   %ebp
c010024f:	89 e5                	mov    %esp,%ebp
c0100251:	83 ec 18             	sub    $0x18,%esp
c0100254:	8b 45 08             	mov    0x8(%ebp),%eax
c0100257:	89 04 24             	mov    %eax,(%esp)
c010025a:	e8 3a 1c 00 00       	call   c0101e99 <cons_putc>
c010025f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100262:	8b 00                	mov    (%eax),%eax
c0100264:	8d 50 01             	lea    0x1(%eax),%edx
c0100267:	8b 45 0c             	mov    0xc(%ebp),%eax
c010026a:	89 10                	mov    %edx,(%eax)
c010026c:	c9                   	leave  
c010026d:	c3                   	ret    

c010026e <vcprintf>:
c010026e:	55                   	push   %ebp
c010026f:	89 e5                	mov    %esp,%ebp
c0100271:	83 ec 28             	sub    $0x28,%esp
c0100274:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010027b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010027e:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0100282:	8b 45 08             	mov    0x8(%ebp),%eax
c0100285:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100289:	8d 45 f4             	lea    -0xc(%ebp),%eax
c010028c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100290:	c7 04 24 4e 02 10 c0 	movl   $0xc010024e,(%esp)
c0100297:	e8 5c 84 00 00       	call   c01086f8 <vprintfmt>
c010029c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010029f:	c9                   	leave  
c01002a0:	c3                   	ret    

c01002a1 <cprintf>:
c01002a1:	55                   	push   %ebp
c01002a2:	89 e5                	mov    %esp,%ebp
c01002a4:	83 ec 28             	sub    $0x28,%esp
c01002a7:	8d 45 0c             	lea    0xc(%ebp),%eax
c01002aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01002ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01002b0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01002b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01002b7:	89 04 24             	mov    %eax,(%esp)
c01002ba:	e8 af ff ff ff       	call   c010026e <vcprintf>
c01002bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01002c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01002c5:	c9                   	leave  
c01002c6:	c3                   	ret    

c01002c7 <cputchar>:
c01002c7:	55                   	push   %ebp
c01002c8:	89 e5                	mov    %esp,%ebp
c01002ca:	83 ec 18             	sub    $0x18,%esp
c01002cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01002d0:	89 04 24             	mov    %eax,(%esp)
c01002d3:	e8 c1 1b 00 00       	call   c0101e99 <cons_putc>
c01002d8:	c9                   	leave  
c01002d9:	c3                   	ret    

c01002da <cputs>:
c01002da:	55                   	push   %ebp
c01002db:	89 e5                	mov    %esp,%ebp
c01002dd:	83 ec 28             	sub    $0x28,%esp
c01002e0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01002e7:	eb 13                	jmp    c01002fc <cputs+0x22>
c01002e9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
c01002ed:	8d 55 f0             	lea    -0x10(%ebp),%edx
c01002f0:	89 54 24 04          	mov    %edx,0x4(%esp)
c01002f4:	89 04 24             	mov    %eax,(%esp)
c01002f7:	e8 52 ff ff ff       	call   c010024e <cputch>
c01002fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01002ff:	8d 50 01             	lea    0x1(%eax),%edx
c0100302:	89 55 08             	mov    %edx,0x8(%ebp)
c0100305:	0f b6 00             	movzbl (%eax),%eax
c0100308:	88 45 f7             	mov    %al,-0x9(%ebp)
c010030b:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
c010030f:	75 d8                	jne    c01002e9 <cputs+0xf>
c0100311:	8d 45 f0             	lea    -0x10(%ebp),%eax
c0100314:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100318:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
c010031f:	e8 2a ff ff ff       	call   c010024e <cputch>
c0100324:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100327:	c9                   	leave  
c0100328:	c3                   	ret    

c0100329 <getchar>:
c0100329:	55                   	push   %ebp
c010032a:	89 e5                	mov    %esp,%ebp
c010032c:	83 ec 18             	sub    $0x18,%esp
c010032f:	e8 a1 1b 00 00       	call   c0101ed5 <cons_getc>
c0100334:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100337:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010033b:	74 f2                	je     c010032f <getchar+0x6>
c010033d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100340:	c9                   	leave  
c0100341:	c3                   	ret    

c0100342 <readline>:
c0100342:	55                   	push   %ebp
c0100343:	89 e5                	mov    %esp,%ebp
c0100345:	83 ec 28             	sub    $0x28,%esp
c0100348:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010034c:	74 13                	je     c0100361 <readline+0x1f>
c010034e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100351:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100355:	c7 04 24 47 8d 10 c0 	movl   $0xc0108d47,(%esp)
c010035c:	e8 40 ff ff ff       	call   c01002a1 <cprintf>
c0100361:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100368:	e8 bc ff ff ff       	call   c0100329 <getchar>
c010036d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100370:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0100374:	79 07                	jns    c010037d <readline+0x3b>
c0100376:	b8 00 00 00 00       	mov    $0x0,%eax
c010037b:	eb 79                	jmp    c01003f6 <readline+0xb4>
c010037d:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
c0100381:	7e 28                	jle    c01003ab <readline+0x69>
c0100383:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
c010038a:	7f 1f                	jg     c01003ab <readline+0x69>
c010038c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010038f:	89 04 24             	mov    %eax,(%esp)
c0100392:	e8 30 ff ff ff       	call   c01002c7 <cputchar>
c0100397:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010039a:	8d 50 01             	lea    0x1(%eax),%edx
c010039d:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01003a0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01003a3:	88 90 20 30 12 c0    	mov    %dl,-0x3fedcfe0(%eax)
c01003a9:	eb 46                	jmp    c01003f1 <readline+0xaf>
c01003ab:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
c01003af:	75 17                	jne    c01003c8 <readline+0x86>
c01003b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01003b5:	7e 11                	jle    c01003c8 <readline+0x86>
c01003b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01003ba:	89 04 24             	mov    %eax,(%esp)
c01003bd:	e8 05 ff ff ff       	call   c01002c7 <cputchar>
c01003c2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c01003c6:	eb 29                	jmp    c01003f1 <readline+0xaf>
c01003c8:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
c01003cc:	74 06                	je     c01003d4 <readline+0x92>
c01003ce:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
c01003d2:	75 1d                	jne    c01003f1 <readline+0xaf>
c01003d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01003d7:	89 04 24             	mov    %eax,(%esp)
c01003da:	e8 e8 fe ff ff       	call   c01002c7 <cputchar>
c01003df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01003e2:	05 20 30 12 c0       	add    $0xc0123020,%eax
c01003e7:	c6 00 00             	movb   $0x0,(%eax)
c01003ea:	b8 20 30 12 c0       	mov    $0xc0123020,%eax
c01003ef:	eb 05                	jmp    c01003f6 <readline+0xb4>
c01003f1:	e9 72 ff ff ff       	jmp    c0100368 <readline+0x26>
c01003f6:	c9                   	leave  
c01003f7:	c3                   	ret    

c01003f8 <__panic>:
c01003f8:	55                   	push   %ebp
c01003f9:	89 e5                	mov    %esp,%ebp
c01003fb:	83 ec 28             	sub    $0x28,%esp
c01003fe:	a1 20 34 12 c0       	mov    0xc0123420,%eax
c0100403:	85 c0                	test   %eax,%eax
c0100405:	74 02                	je     c0100409 <__panic+0x11>
c0100407:	eb 59                	jmp    c0100462 <__panic+0x6a>
c0100409:	c7 05 20 34 12 c0 01 	movl   $0x1,0xc0123420
c0100410:	00 00 00 
c0100413:	8d 45 14             	lea    0x14(%ebp),%eax
c0100416:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100419:	8b 45 0c             	mov    0xc(%ebp),%eax
c010041c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100420:	8b 45 08             	mov    0x8(%ebp),%eax
c0100423:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100427:	c7 04 24 4a 8d 10 c0 	movl   $0xc0108d4a,(%esp)
c010042e:	e8 6e fe ff ff       	call   c01002a1 <cprintf>
c0100433:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100436:	89 44 24 04          	mov    %eax,0x4(%esp)
c010043a:	8b 45 10             	mov    0x10(%ebp),%eax
c010043d:	89 04 24             	mov    %eax,(%esp)
c0100440:	e8 29 fe ff ff       	call   c010026e <vcprintf>
c0100445:	c7 04 24 66 8d 10 c0 	movl   $0xc0108d66,(%esp)
c010044c:	e8 50 fe ff ff       	call   c01002a1 <cprintf>
c0100451:	c7 04 24 68 8d 10 c0 	movl   $0xc0108d68,(%esp)
c0100458:	e8 44 fe ff ff       	call   c01002a1 <cprintf>
c010045d:	e8 40 06 00 00       	call   c0100aa2 <print_stackframe>
c0100462:	e8 a4 1c 00 00       	call   c010210b <intr_disable>
c0100467:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c010046e:	e8 5a 08 00 00       	call   c0100ccd <kmonitor>
c0100473:	eb f2                	jmp    c0100467 <__panic+0x6f>

c0100475 <__warn>:
c0100475:	55                   	push   %ebp
c0100476:	89 e5                	mov    %esp,%ebp
c0100478:	83 ec 28             	sub    $0x28,%esp
c010047b:	8d 45 14             	lea    0x14(%ebp),%eax
c010047e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100481:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100484:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100488:	8b 45 08             	mov    0x8(%ebp),%eax
c010048b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010048f:	c7 04 24 7a 8d 10 c0 	movl   $0xc0108d7a,(%esp)
c0100496:	e8 06 fe ff ff       	call   c01002a1 <cprintf>
c010049b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010049e:	89 44 24 04          	mov    %eax,0x4(%esp)
c01004a2:	8b 45 10             	mov    0x10(%ebp),%eax
c01004a5:	89 04 24             	mov    %eax,(%esp)
c01004a8:	e8 c1 fd ff ff       	call   c010026e <vcprintf>
c01004ad:	c7 04 24 66 8d 10 c0 	movl   $0xc0108d66,(%esp)
c01004b4:	e8 e8 fd ff ff       	call   c01002a1 <cprintf>
c01004b9:	c9                   	leave  
c01004ba:	c3                   	ret    

c01004bb <is_kernel_panic>:
c01004bb:	55                   	push   %ebp
c01004bc:	89 e5                	mov    %esp,%ebp
c01004be:	a1 20 34 12 c0       	mov    0xc0123420,%eax
c01004c3:	5d                   	pop    %ebp
c01004c4:	c3                   	ret    

c01004c5 <stab_binsearch>:
c01004c5:	55                   	push   %ebp
c01004c6:	89 e5                	mov    %esp,%ebp
c01004c8:	83 ec 20             	sub    $0x20,%esp
c01004cb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01004ce:	8b 00                	mov    (%eax),%eax
c01004d0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01004d3:	8b 45 10             	mov    0x10(%ebp),%eax
c01004d6:	8b 00                	mov    (%eax),%eax
c01004d8:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01004db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01004e2:	e9 d2 00 00 00       	jmp    c01005b9 <stab_binsearch+0xf4>
c01004e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01004ea:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01004ed:	01 d0                	add    %edx,%eax
c01004ef:	89 c2                	mov    %eax,%edx
c01004f1:	c1 ea 1f             	shr    $0x1f,%edx
c01004f4:	01 d0                	add    %edx,%eax
c01004f6:	d1 f8                	sar    %eax
c01004f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01004fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01004fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100501:	eb 04                	jmp    c0100507 <stab_binsearch+0x42>
c0100503:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0100507:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010050a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c010050d:	7c 1f                	jl     c010052e <stab_binsearch+0x69>
c010050f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100512:	89 d0                	mov    %edx,%eax
c0100514:	01 c0                	add    %eax,%eax
c0100516:	01 d0                	add    %edx,%eax
c0100518:	c1 e0 02             	shl    $0x2,%eax
c010051b:	89 c2                	mov    %eax,%edx
c010051d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100520:	01 d0                	add    %edx,%eax
c0100522:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100526:	0f b6 c0             	movzbl %al,%eax
c0100529:	3b 45 14             	cmp    0x14(%ebp),%eax
c010052c:	75 d5                	jne    c0100503 <stab_binsearch+0x3e>
c010052e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100531:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c0100534:	7d 0b                	jge    c0100541 <stab_binsearch+0x7c>
c0100536:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100539:	83 c0 01             	add    $0x1,%eax
c010053c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010053f:	eb 78                	jmp    c01005b9 <stab_binsearch+0xf4>
c0100541:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0100548:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010054b:	89 d0                	mov    %edx,%eax
c010054d:	01 c0                	add    %eax,%eax
c010054f:	01 d0                	add    %edx,%eax
c0100551:	c1 e0 02             	shl    $0x2,%eax
c0100554:	89 c2                	mov    %eax,%edx
c0100556:	8b 45 08             	mov    0x8(%ebp),%eax
c0100559:	01 d0                	add    %edx,%eax
c010055b:	8b 40 08             	mov    0x8(%eax),%eax
c010055e:	3b 45 18             	cmp    0x18(%ebp),%eax
c0100561:	73 13                	jae    c0100576 <stab_binsearch+0xb1>
c0100563:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100566:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100569:	89 10                	mov    %edx,(%eax)
c010056b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010056e:	83 c0 01             	add    $0x1,%eax
c0100571:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0100574:	eb 43                	jmp    c01005b9 <stab_binsearch+0xf4>
c0100576:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100579:	89 d0                	mov    %edx,%eax
c010057b:	01 c0                	add    %eax,%eax
c010057d:	01 d0                	add    %edx,%eax
c010057f:	c1 e0 02             	shl    $0x2,%eax
c0100582:	89 c2                	mov    %eax,%edx
c0100584:	8b 45 08             	mov    0x8(%ebp),%eax
c0100587:	01 d0                	add    %edx,%eax
c0100589:	8b 40 08             	mov    0x8(%eax),%eax
c010058c:	3b 45 18             	cmp    0x18(%ebp),%eax
c010058f:	76 16                	jbe    c01005a7 <stab_binsearch+0xe2>
c0100591:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100594:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100597:	8b 45 10             	mov    0x10(%ebp),%eax
c010059a:	89 10                	mov    %edx,(%eax)
c010059c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010059f:	83 e8 01             	sub    $0x1,%eax
c01005a2:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01005a5:	eb 12                	jmp    c01005b9 <stab_binsearch+0xf4>
c01005a7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01005aa:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01005ad:	89 10                	mov    %edx,(%eax)
c01005af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01005b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01005b5:	83 45 18 01          	addl   $0x1,0x18(%ebp)
c01005b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01005bc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01005bf:	0f 8e 22 ff ff ff    	jle    c01004e7 <stab_binsearch+0x22>
c01005c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01005c9:	75 0f                	jne    c01005da <stab_binsearch+0x115>
c01005cb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01005ce:	8b 00                	mov    (%eax),%eax
c01005d0:	8d 50 ff             	lea    -0x1(%eax),%edx
c01005d3:	8b 45 10             	mov    0x10(%ebp),%eax
c01005d6:	89 10                	mov    %edx,(%eax)
c01005d8:	eb 3f                	jmp    c0100619 <stab_binsearch+0x154>
c01005da:	8b 45 10             	mov    0x10(%ebp),%eax
c01005dd:	8b 00                	mov    (%eax),%eax
c01005df:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01005e2:	eb 04                	jmp    c01005e8 <stab_binsearch+0x123>
c01005e4:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
c01005e8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01005eb:	8b 00                	mov    (%eax),%eax
c01005ed:	3b 45 fc             	cmp    -0x4(%ebp),%eax
c01005f0:	7d 1f                	jge    c0100611 <stab_binsearch+0x14c>
c01005f2:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01005f5:	89 d0                	mov    %edx,%eax
c01005f7:	01 c0                	add    %eax,%eax
c01005f9:	01 d0                	add    %edx,%eax
c01005fb:	c1 e0 02             	shl    $0x2,%eax
c01005fe:	89 c2                	mov    %eax,%edx
c0100600:	8b 45 08             	mov    0x8(%ebp),%eax
c0100603:	01 d0                	add    %edx,%eax
c0100605:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100609:	0f b6 c0             	movzbl %al,%eax
c010060c:	3b 45 14             	cmp    0x14(%ebp),%eax
c010060f:	75 d3                	jne    c01005e4 <stab_binsearch+0x11f>
c0100611:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100614:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0100617:	89 10                	mov    %edx,(%eax)
c0100619:	c9                   	leave  
c010061a:	c3                   	ret    

c010061b <debuginfo_eip>:
c010061b:	55                   	push   %ebp
c010061c:	89 e5                	mov    %esp,%ebp
c010061e:	83 ec 58             	sub    $0x58,%esp
c0100621:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100624:	c7 00 98 8d 10 c0    	movl   $0xc0108d98,(%eax)
c010062a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010062d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0100634:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100637:	c7 40 08 98 8d 10 c0 	movl   $0xc0108d98,0x8(%eax)
c010063e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100641:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
c0100648:	8b 45 0c             	mov    0xc(%ebp),%eax
c010064b:	8b 55 08             	mov    0x8(%ebp),%edx
c010064e:	89 50 10             	mov    %edx,0x10(%eax)
c0100651:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100654:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
c010065b:	c7 45 f4 24 ac 10 c0 	movl   $0xc010ac24,-0xc(%ebp)
c0100662:	c7 45 f0 5c 9a 11 c0 	movl   $0xc0119a5c,-0x10(%ebp)
c0100669:	c7 45 ec 5d 9a 11 c0 	movl   $0xc0119a5d,-0x14(%ebp)
c0100670:	c7 45 e8 f4 d2 11 c0 	movl   $0xc011d2f4,-0x18(%ebp)
c0100677:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010067a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c010067d:	76 0d                	jbe    c010068c <debuginfo_eip+0x71>
c010067f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100682:	83 e8 01             	sub    $0x1,%eax
c0100685:	0f b6 00             	movzbl (%eax),%eax
c0100688:	84 c0                	test   %al,%al
c010068a:	74 0a                	je     c0100696 <debuginfo_eip+0x7b>
c010068c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0100691:	e9 c0 02 00 00       	jmp    c0100956 <debuginfo_eip+0x33b>
c0100696:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010069d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01006a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01006a3:	29 c2                	sub    %eax,%edx
c01006a5:	89 d0                	mov    %edx,%eax
c01006a7:	c1 f8 02             	sar    $0x2,%eax
c01006aa:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
c01006b0:	83 e8 01             	sub    $0x1,%eax
c01006b3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01006b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01006b9:	89 44 24 10          	mov    %eax,0x10(%esp)
c01006bd:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
c01006c4:	00 
c01006c5:	8d 45 e0             	lea    -0x20(%ebp),%eax
c01006c8:	89 44 24 08          	mov    %eax,0x8(%esp)
c01006cc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c01006cf:	89 44 24 04          	mov    %eax,0x4(%esp)
c01006d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01006d6:	89 04 24             	mov    %eax,(%esp)
c01006d9:	e8 e7 fd ff ff       	call   c01004c5 <stab_binsearch>
c01006de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01006e1:	85 c0                	test   %eax,%eax
c01006e3:	75 0a                	jne    c01006ef <debuginfo_eip+0xd4>
c01006e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01006ea:	e9 67 02 00 00       	jmp    c0100956 <debuginfo_eip+0x33b>
c01006ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01006f2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01006f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01006f8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01006fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01006fe:	89 44 24 10          	mov    %eax,0x10(%esp)
c0100702:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
c0100709:	00 
c010070a:	8d 45 d8             	lea    -0x28(%ebp),%eax
c010070d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100711:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0100714:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100718:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010071b:	89 04 24             	mov    %eax,(%esp)
c010071e:	e8 a2 fd ff ff       	call   c01004c5 <stab_binsearch>
c0100723:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100726:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0100729:	39 c2                	cmp    %eax,%edx
c010072b:	7f 7c                	jg     c01007a9 <debuginfo_eip+0x18e>
c010072d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100730:	89 c2                	mov    %eax,%edx
c0100732:	89 d0                	mov    %edx,%eax
c0100734:	01 c0                	add    %eax,%eax
c0100736:	01 d0                	add    %edx,%eax
c0100738:	c1 e0 02             	shl    $0x2,%eax
c010073b:	89 c2                	mov    %eax,%edx
c010073d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100740:	01 d0                	add    %edx,%eax
c0100742:	8b 10                	mov    (%eax),%edx
c0100744:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0100747:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010074a:	29 c1                	sub    %eax,%ecx
c010074c:	89 c8                	mov    %ecx,%eax
c010074e:	39 c2                	cmp    %eax,%edx
c0100750:	73 22                	jae    c0100774 <debuginfo_eip+0x159>
c0100752:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100755:	89 c2                	mov    %eax,%edx
c0100757:	89 d0                	mov    %edx,%eax
c0100759:	01 c0                	add    %eax,%eax
c010075b:	01 d0                	add    %edx,%eax
c010075d:	c1 e0 02             	shl    $0x2,%eax
c0100760:	89 c2                	mov    %eax,%edx
c0100762:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100765:	01 d0                	add    %edx,%eax
c0100767:	8b 10                	mov    (%eax),%edx
c0100769:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010076c:	01 c2                	add    %eax,%edx
c010076e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100771:	89 50 08             	mov    %edx,0x8(%eax)
c0100774:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100777:	89 c2                	mov    %eax,%edx
c0100779:	89 d0                	mov    %edx,%eax
c010077b:	01 c0                	add    %eax,%eax
c010077d:	01 d0                	add    %edx,%eax
c010077f:	c1 e0 02             	shl    $0x2,%eax
c0100782:	89 c2                	mov    %eax,%edx
c0100784:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100787:	01 d0                	add    %edx,%eax
c0100789:	8b 50 08             	mov    0x8(%eax),%edx
c010078c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010078f:	89 50 10             	mov    %edx,0x10(%eax)
c0100792:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100795:	8b 40 10             	mov    0x10(%eax),%eax
c0100798:	29 45 08             	sub    %eax,0x8(%ebp)
c010079b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010079e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01007a1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01007a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01007a7:	eb 15                	jmp    c01007be <debuginfo_eip+0x1a3>
c01007a9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01007ac:	8b 55 08             	mov    0x8(%ebp),%edx
c01007af:	89 50 10             	mov    %edx,0x10(%eax)
c01007b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01007b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01007b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01007bb:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01007be:	8b 45 0c             	mov    0xc(%ebp),%eax
c01007c1:	8b 40 08             	mov    0x8(%eax),%eax
c01007c4:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
c01007cb:	00 
c01007cc:	89 04 24             	mov    %eax,(%esp)
c01007cf:	e8 46 7a 00 00       	call   c010821a <strfind>
c01007d4:	89 c2                	mov    %eax,%edx
c01007d6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01007d9:	8b 40 08             	mov    0x8(%eax),%eax
c01007dc:	29 c2                	sub    %eax,%edx
c01007de:	8b 45 0c             	mov    0xc(%ebp),%eax
c01007e1:	89 50 0c             	mov    %edx,0xc(%eax)
c01007e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01007e7:	89 44 24 10          	mov    %eax,0x10(%esp)
c01007eb:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
c01007f2:	00 
c01007f3:	8d 45 d0             	lea    -0x30(%ebp),%eax
c01007f6:	89 44 24 08          	mov    %eax,0x8(%esp)
c01007fa:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c01007fd:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100801:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100804:	89 04 24             	mov    %eax,(%esp)
c0100807:	e8 b9 fc ff ff       	call   c01004c5 <stab_binsearch>
c010080c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010080f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0100812:	39 c2                	cmp    %eax,%edx
c0100814:	7f 24                	jg     c010083a <debuginfo_eip+0x21f>
c0100816:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0100819:	89 c2                	mov    %eax,%edx
c010081b:	89 d0                	mov    %edx,%eax
c010081d:	01 c0                	add    %eax,%eax
c010081f:	01 d0                	add    %edx,%eax
c0100821:	c1 e0 02             	shl    $0x2,%eax
c0100824:	89 c2                	mov    %eax,%edx
c0100826:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100829:	01 d0                	add    %edx,%eax
c010082b:	0f b7 40 06          	movzwl 0x6(%eax),%eax
c010082f:	0f b7 d0             	movzwl %ax,%edx
c0100832:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100835:	89 50 04             	mov    %edx,0x4(%eax)
c0100838:	eb 13                	jmp    c010084d <debuginfo_eip+0x232>
c010083a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c010083f:	e9 12 01 00 00       	jmp    c0100956 <debuginfo_eip+0x33b>
c0100844:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100847:	83 e8 01             	sub    $0x1,%eax
c010084a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010084d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100850:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100853:	39 c2                	cmp    %eax,%edx
c0100855:	7c 56                	jl     c01008ad <debuginfo_eip+0x292>
c0100857:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010085a:	89 c2                	mov    %eax,%edx
c010085c:	89 d0                	mov    %edx,%eax
c010085e:	01 c0                	add    %eax,%eax
c0100860:	01 d0                	add    %edx,%eax
c0100862:	c1 e0 02             	shl    $0x2,%eax
c0100865:	89 c2                	mov    %eax,%edx
c0100867:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010086a:	01 d0                	add    %edx,%eax
c010086c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100870:	3c 84                	cmp    $0x84,%al
c0100872:	74 39                	je     c01008ad <debuginfo_eip+0x292>
c0100874:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100877:	89 c2                	mov    %eax,%edx
c0100879:	89 d0                	mov    %edx,%eax
c010087b:	01 c0                	add    %eax,%eax
c010087d:	01 d0                	add    %edx,%eax
c010087f:	c1 e0 02             	shl    $0x2,%eax
c0100882:	89 c2                	mov    %eax,%edx
c0100884:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100887:	01 d0                	add    %edx,%eax
c0100889:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c010088d:	3c 64                	cmp    $0x64,%al
c010088f:	75 b3                	jne    c0100844 <debuginfo_eip+0x229>
c0100891:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100894:	89 c2                	mov    %eax,%edx
c0100896:	89 d0                	mov    %edx,%eax
c0100898:	01 c0                	add    %eax,%eax
c010089a:	01 d0                	add    %edx,%eax
c010089c:	c1 e0 02             	shl    $0x2,%eax
c010089f:	89 c2                	mov    %eax,%edx
c01008a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01008a4:	01 d0                	add    %edx,%eax
c01008a6:	8b 40 08             	mov    0x8(%eax),%eax
c01008a9:	85 c0                	test   %eax,%eax
c01008ab:	74 97                	je     c0100844 <debuginfo_eip+0x229>
c01008ad:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01008b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01008b3:	39 c2                	cmp    %eax,%edx
c01008b5:	7c 46                	jl     c01008fd <debuginfo_eip+0x2e2>
c01008b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01008ba:	89 c2                	mov    %eax,%edx
c01008bc:	89 d0                	mov    %edx,%eax
c01008be:	01 c0                	add    %eax,%eax
c01008c0:	01 d0                	add    %edx,%eax
c01008c2:	c1 e0 02             	shl    $0x2,%eax
c01008c5:	89 c2                	mov    %eax,%edx
c01008c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01008ca:	01 d0                	add    %edx,%eax
c01008cc:	8b 10                	mov    (%eax),%edx
c01008ce:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c01008d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01008d4:	29 c1                	sub    %eax,%ecx
c01008d6:	89 c8                	mov    %ecx,%eax
c01008d8:	39 c2                	cmp    %eax,%edx
c01008da:	73 21                	jae    c01008fd <debuginfo_eip+0x2e2>
c01008dc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01008df:	89 c2                	mov    %eax,%edx
c01008e1:	89 d0                	mov    %edx,%eax
c01008e3:	01 c0                	add    %eax,%eax
c01008e5:	01 d0                	add    %edx,%eax
c01008e7:	c1 e0 02             	shl    $0x2,%eax
c01008ea:	89 c2                	mov    %eax,%edx
c01008ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01008ef:	01 d0                	add    %edx,%eax
c01008f1:	8b 10                	mov    (%eax),%edx
c01008f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01008f6:	01 c2                	add    %eax,%edx
c01008f8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01008fb:	89 10                	mov    %edx,(%eax)
c01008fd:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0100900:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0100903:	39 c2                	cmp    %eax,%edx
c0100905:	7d 4a                	jge    c0100951 <debuginfo_eip+0x336>
c0100907:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010090a:	83 c0 01             	add    $0x1,%eax
c010090d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100910:	eb 18                	jmp    c010092a <debuginfo_eip+0x30f>
c0100912:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100915:	8b 40 14             	mov    0x14(%eax),%eax
c0100918:	8d 50 01             	lea    0x1(%eax),%edx
c010091b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010091e:	89 50 14             	mov    %edx,0x14(%eax)
c0100921:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100924:	83 c0 01             	add    $0x1,%eax
c0100927:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010092a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010092d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0100930:	39 c2                	cmp    %eax,%edx
c0100932:	7d 1d                	jge    c0100951 <debuginfo_eip+0x336>
c0100934:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100937:	89 c2                	mov    %eax,%edx
c0100939:	89 d0                	mov    %edx,%eax
c010093b:	01 c0                	add    %eax,%eax
c010093d:	01 d0                	add    %edx,%eax
c010093f:	c1 e0 02             	shl    $0x2,%eax
c0100942:	89 c2                	mov    %eax,%edx
c0100944:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100947:	01 d0                	add    %edx,%eax
c0100949:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c010094d:	3c a0                	cmp    $0xa0,%al
c010094f:	74 c1                	je     c0100912 <debuginfo_eip+0x2f7>
c0100951:	b8 00 00 00 00       	mov    $0x0,%eax
c0100956:	c9                   	leave  
c0100957:	c3                   	ret    

c0100958 <print_kerninfo>:
c0100958:	55                   	push   %ebp
c0100959:	89 e5                	mov    %esp,%ebp
c010095b:	83 ec 18             	sub    $0x18,%esp
c010095e:	c7 04 24 a2 8d 10 c0 	movl   $0xc0108da2,(%esp)
c0100965:	e8 37 f9 ff ff       	call   c01002a1 <cprintf>
c010096a:	c7 44 24 04 36 00 10 	movl   $0xc0100036,0x4(%esp)
c0100971:	c0 
c0100972:	c7 04 24 bb 8d 10 c0 	movl   $0xc0108dbb,(%esp)
c0100979:	e8 23 f9 ff ff       	call   c01002a1 <cprintf>
c010097e:	c7 44 24 04 88 8c 10 	movl   $0xc0108c88,0x4(%esp)
c0100985:	c0 
c0100986:	c7 04 24 d3 8d 10 c0 	movl   $0xc0108dd3,(%esp)
c010098d:	e8 0f f9 ff ff       	call   c01002a1 <cprintf>
c0100992:	c7 44 24 04 00 30 12 	movl   $0xc0123000,0x4(%esp)
c0100999:	c0 
c010099a:	c7 04 24 eb 8d 10 c0 	movl   $0xc0108deb,(%esp)
c01009a1:	e8 fb f8 ff ff       	call   c01002a1 <cprintf>
c01009a6:	c7 44 24 04 fc 40 12 	movl   $0xc01240fc,0x4(%esp)
c01009ad:	c0 
c01009ae:	c7 04 24 03 8e 10 c0 	movl   $0xc0108e03,(%esp)
c01009b5:	e8 e7 f8 ff ff       	call   c01002a1 <cprintf>
c01009ba:	b8 fc 40 12 c0       	mov    $0xc01240fc,%eax
c01009bf:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
c01009c5:	b8 36 00 10 c0       	mov    $0xc0100036,%eax
c01009ca:	29 c2                	sub    %eax,%edx
c01009cc:	89 d0                	mov    %edx,%eax
c01009ce:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
c01009d4:	85 c0                	test   %eax,%eax
c01009d6:	0f 48 c2             	cmovs  %edx,%eax
c01009d9:	c1 f8 0a             	sar    $0xa,%eax
c01009dc:	89 44 24 04          	mov    %eax,0x4(%esp)
c01009e0:	c7 04 24 1c 8e 10 c0 	movl   $0xc0108e1c,(%esp)
c01009e7:	e8 b5 f8 ff ff       	call   c01002a1 <cprintf>
c01009ec:	c9                   	leave  
c01009ed:	c3                   	ret    

c01009ee <print_debuginfo>:
c01009ee:	55                   	push   %ebp
c01009ef:	89 e5                	mov    %esp,%ebp
c01009f1:	81 ec 48 01 00 00    	sub    $0x148,%esp
c01009f7:	8d 45 dc             	lea    -0x24(%ebp),%eax
c01009fa:	89 44 24 04          	mov    %eax,0x4(%esp)
c01009fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a01:	89 04 24             	mov    %eax,(%esp)
c0100a04:	e8 12 fc ff ff       	call   c010061b <debuginfo_eip>
c0100a09:	85 c0                	test   %eax,%eax
c0100a0b:	74 15                	je     c0100a22 <print_debuginfo+0x34>
c0100a0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a10:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100a14:	c7 04 24 46 8e 10 c0 	movl   $0xc0108e46,(%esp)
c0100a1b:	e8 81 f8 ff ff       	call   c01002a1 <cprintf>
c0100a20:	eb 6d                	jmp    c0100a8f <print_debuginfo+0xa1>
c0100a22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100a29:	eb 1c                	jmp    c0100a47 <print_debuginfo+0x59>
c0100a2b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0100a2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100a31:	01 d0                	add    %edx,%eax
c0100a33:	0f b6 00             	movzbl (%eax),%eax
c0100a36:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
c0100a3c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100a3f:	01 ca                	add    %ecx,%edx
c0100a41:	88 02                	mov    %al,(%edx)
c0100a43:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100a47:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100a4a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0100a4d:	7f dc                	jg     c0100a2b <print_debuginfo+0x3d>
c0100a4f:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
c0100a55:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100a58:	01 d0                	add    %edx,%eax
c0100a5a:	c6 00 00             	movb   $0x0,(%eax)
c0100a5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100a60:	8b 55 08             	mov    0x8(%ebp),%edx
c0100a63:	89 d1                	mov    %edx,%ecx
c0100a65:	29 c1                	sub    %eax,%ecx
c0100a67:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100a6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100a6d:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0100a71:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
c0100a77:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
c0100a7b:	89 54 24 08          	mov    %edx,0x8(%esp)
c0100a7f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100a83:	c7 04 24 62 8e 10 c0 	movl   $0xc0108e62,(%esp)
c0100a8a:	e8 12 f8 ff ff       	call   c01002a1 <cprintf>
c0100a8f:	c9                   	leave  
c0100a90:	c3                   	ret    

c0100a91 <read_eip>:
c0100a91:	55                   	push   %ebp
c0100a92:	89 e5                	mov    %esp,%ebp
c0100a94:	83 ec 10             	sub    $0x10,%esp
c0100a97:	8b 45 04             	mov    0x4(%ebp),%eax
c0100a9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0100a9d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100aa0:	c9                   	leave  
c0100aa1:	c3                   	ret    

c0100aa2 <print_stackframe>:
c0100aa2:	55                   	push   %ebp
c0100aa3:	89 e5                	mov    %esp,%ebp
c0100aa5:	83 ec 38             	sub    $0x38,%esp
c0100aa8:	89 e8                	mov    %ebp,%eax
c0100aaa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100aad:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100ab0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100ab3:	e8 d9 ff ff ff       	call   c0100a91 <read_eip>
c0100ab8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100abb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100ac2:	e9 88 00 00 00       	jmp    c0100b4f <print_stackframe+0xad>
c0100ac7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100aca:	89 44 24 08          	mov    %eax,0x8(%esp)
c0100ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ad1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100ad5:	c7 04 24 74 8e 10 c0 	movl   $0xc0108e74,(%esp)
c0100adc:	e8 c0 f7 ff ff       	call   c01002a1 <cprintf>
c0100ae1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ae4:	83 c0 08             	add    $0x8,%eax
c0100ae7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100aea:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0100af1:	eb 25                	jmp    c0100b18 <print_stackframe+0x76>
c0100af3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100af6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100afd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100b00:	01 d0                	add    %edx,%eax
c0100b02:	8b 00                	mov    (%eax),%eax
c0100b04:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100b08:	c7 04 24 90 8e 10 c0 	movl   $0xc0108e90,(%esp)
c0100b0f:	e8 8d f7 ff ff       	call   c01002a1 <cprintf>
c0100b14:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0100b18:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0100b1c:	7e d5                	jle    c0100af3 <print_stackframe+0x51>
c0100b1e:	c7 04 24 98 8e 10 c0 	movl   $0xc0108e98,(%esp)
c0100b25:	e8 77 f7 ff ff       	call   c01002a1 <cprintf>
c0100b2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100b2d:	83 e8 01             	sub    $0x1,%eax
c0100b30:	89 04 24             	mov    %eax,(%esp)
c0100b33:	e8 b6 fe ff ff       	call   c01009ee <print_debuginfo>
c0100b38:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100b3b:	83 c0 04             	add    $0x4,%eax
c0100b3e:	8b 00                	mov    (%eax),%eax
c0100b40:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100b43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100b46:	8b 00                	mov    (%eax),%eax
c0100b48:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100b4b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100b4f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100b53:	74 0a                	je     c0100b5f <print_stackframe+0xbd>
c0100b55:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
c0100b59:	0f 8e 68 ff ff ff    	jle    c0100ac7 <print_stackframe+0x25>
c0100b5f:	c9                   	leave  
c0100b60:	c3                   	ret    

c0100b61 <parse>:
c0100b61:	55                   	push   %ebp
c0100b62:	89 e5                	mov    %esp,%ebp
c0100b64:	83 ec 28             	sub    $0x28,%esp
c0100b67:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100b6e:	eb 0c                	jmp    c0100b7c <parse+0x1b>
c0100b70:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b73:	8d 50 01             	lea    0x1(%eax),%edx
c0100b76:	89 55 08             	mov    %edx,0x8(%ebp)
c0100b79:	c6 00 00             	movb   $0x0,(%eax)
c0100b7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b7f:	0f b6 00             	movzbl (%eax),%eax
c0100b82:	84 c0                	test   %al,%al
c0100b84:	74 1d                	je     c0100ba3 <parse+0x42>
c0100b86:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b89:	0f b6 00             	movzbl (%eax),%eax
c0100b8c:	0f be c0             	movsbl %al,%eax
c0100b8f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100b93:	c7 04 24 1c 8f 10 c0 	movl   $0xc0108f1c,(%esp)
c0100b9a:	e8 48 76 00 00       	call   c01081e7 <strchr>
c0100b9f:	85 c0                	test   %eax,%eax
c0100ba1:	75 cd                	jne    c0100b70 <parse+0xf>
c0100ba3:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ba6:	0f b6 00             	movzbl (%eax),%eax
c0100ba9:	84 c0                	test   %al,%al
c0100bab:	75 02                	jne    c0100baf <parse+0x4e>
c0100bad:	eb 67                	jmp    c0100c16 <parse+0xb5>
c0100baf:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
c0100bb3:	75 14                	jne    c0100bc9 <parse+0x68>
c0100bb5:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
c0100bbc:	00 
c0100bbd:	c7 04 24 21 8f 10 c0 	movl   $0xc0108f21,(%esp)
c0100bc4:	e8 d8 f6 ff ff       	call   c01002a1 <cprintf>
c0100bc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100bcc:	8d 50 01             	lea    0x1(%eax),%edx
c0100bcf:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0100bd2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0100bd9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100bdc:	01 c2                	add    %eax,%edx
c0100bde:	8b 45 08             	mov    0x8(%ebp),%eax
c0100be1:	89 02                	mov    %eax,(%edx)
c0100be3:	eb 04                	jmp    c0100be9 <parse+0x88>
c0100be5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0100be9:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bec:	0f b6 00             	movzbl (%eax),%eax
c0100bef:	84 c0                	test   %al,%al
c0100bf1:	74 1d                	je     c0100c10 <parse+0xaf>
c0100bf3:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bf6:	0f b6 00             	movzbl (%eax),%eax
c0100bf9:	0f be c0             	movsbl %al,%eax
c0100bfc:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100c00:	c7 04 24 1c 8f 10 c0 	movl   $0xc0108f1c,(%esp)
c0100c07:	e8 db 75 00 00       	call   c01081e7 <strchr>
c0100c0c:	85 c0                	test   %eax,%eax
c0100c0e:	74 d5                	je     c0100be5 <parse+0x84>
c0100c10:	90                   	nop
c0100c11:	e9 66 ff ff ff       	jmp    c0100b7c <parse+0x1b>
c0100c16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c19:	c9                   	leave  
c0100c1a:	c3                   	ret    

c0100c1b <runcmd>:
c0100c1b:	55                   	push   %ebp
c0100c1c:	89 e5                	mov    %esp,%ebp
c0100c1e:	83 ec 68             	sub    $0x68,%esp
c0100c21:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100c24:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100c28:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c2b:	89 04 24             	mov    %eax,(%esp)
c0100c2e:	e8 2e ff ff ff       	call   c0100b61 <parse>
c0100c33:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100c36:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0100c3a:	75 0a                	jne    c0100c46 <runcmd+0x2b>
c0100c3c:	b8 00 00 00 00       	mov    $0x0,%eax
c0100c41:	e9 85 00 00 00       	jmp    c0100ccb <runcmd+0xb0>
c0100c46:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100c4d:	eb 5c                	jmp    c0100cab <runcmd+0x90>
c0100c4f:	8b 4d b0             	mov    -0x50(%ebp),%ecx
c0100c52:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100c55:	89 d0                	mov    %edx,%eax
c0100c57:	01 c0                	add    %eax,%eax
c0100c59:	01 d0                	add    %edx,%eax
c0100c5b:	c1 e0 02             	shl    $0x2,%eax
c0100c5e:	05 00 00 12 c0       	add    $0xc0120000,%eax
c0100c63:	8b 00                	mov    (%eax),%eax
c0100c65:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0100c69:	89 04 24             	mov    %eax,(%esp)
c0100c6c:	e8 d7 74 00 00       	call   c0108148 <strcmp>
c0100c71:	85 c0                	test   %eax,%eax
c0100c73:	75 32                	jne    c0100ca7 <runcmd+0x8c>
c0100c75:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100c78:	89 d0                	mov    %edx,%eax
c0100c7a:	01 c0                	add    %eax,%eax
c0100c7c:	01 d0                	add    %edx,%eax
c0100c7e:	c1 e0 02             	shl    $0x2,%eax
c0100c81:	05 00 00 12 c0       	add    $0xc0120000,%eax
c0100c86:	8b 40 08             	mov    0x8(%eax),%eax
c0100c89:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100c8c:	8d 4a ff             	lea    -0x1(%edx),%ecx
c0100c8f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0100c92:	89 54 24 08          	mov    %edx,0x8(%esp)
c0100c96:	8d 55 b0             	lea    -0x50(%ebp),%edx
c0100c99:	83 c2 04             	add    $0x4,%edx
c0100c9c:	89 54 24 04          	mov    %edx,0x4(%esp)
c0100ca0:	89 0c 24             	mov    %ecx,(%esp)
c0100ca3:	ff d0                	call   *%eax
c0100ca5:	eb 24                	jmp    c0100ccb <runcmd+0xb0>
c0100ca7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100cab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100cae:	83 f8 02             	cmp    $0x2,%eax
c0100cb1:	76 9c                	jbe    c0100c4f <runcmd+0x34>
c0100cb3:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0100cb6:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100cba:	c7 04 24 3f 8f 10 c0 	movl   $0xc0108f3f,(%esp)
c0100cc1:	e8 db f5 ff ff       	call   c01002a1 <cprintf>
c0100cc6:	b8 00 00 00 00       	mov    $0x0,%eax
c0100ccb:	c9                   	leave  
c0100ccc:	c3                   	ret    

c0100ccd <kmonitor>:
c0100ccd:	55                   	push   %ebp
c0100cce:	89 e5                	mov    %esp,%ebp
c0100cd0:	83 ec 28             	sub    $0x28,%esp
c0100cd3:	c7 04 24 58 8f 10 c0 	movl   $0xc0108f58,(%esp)
c0100cda:	e8 c2 f5 ff ff       	call   c01002a1 <cprintf>
c0100cdf:	c7 04 24 80 8f 10 c0 	movl   $0xc0108f80,(%esp)
c0100ce6:	e8 b6 f5 ff ff       	call   c01002a1 <cprintf>
c0100ceb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0100cef:	74 0b                	je     c0100cfc <kmonitor+0x2f>
c0100cf1:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cf4:	89 04 24             	mov    %eax,(%esp)
c0100cf7:	e8 90 15 00 00       	call   c010228c <print_trapframe>
c0100cfc:	c7 04 24 a5 8f 10 c0 	movl   $0xc0108fa5,(%esp)
c0100d03:	e8 3a f6 ff ff       	call   c0100342 <readline>
c0100d08:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100d0b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0100d0f:	74 18                	je     c0100d29 <kmonitor+0x5c>
c0100d11:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d14:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100d18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d1b:	89 04 24             	mov    %eax,(%esp)
c0100d1e:	e8 f8 fe ff ff       	call   c0100c1b <runcmd>
c0100d23:	85 c0                	test   %eax,%eax
c0100d25:	79 02                	jns    c0100d29 <kmonitor+0x5c>
c0100d27:	eb 02                	jmp    c0100d2b <kmonitor+0x5e>
c0100d29:	eb d1                	jmp    c0100cfc <kmonitor+0x2f>
c0100d2b:	c9                   	leave  
c0100d2c:	c3                   	ret    

c0100d2d <mon_help>:
c0100d2d:	55                   	push   %ebp
c0100d2e:	89 e5                	mov    %esp,%ebp
c0100d30:	83 ec 28             	sub    $0x28,%esp
c0100d33:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100d3a:	eb 3f                	jmp    c0100d7b <mon_help+0x4e>
c0100d3c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100d3f:	89 d0                	mov    %edx,%eax
c0100d41:	01 c0                	add    %eax,%eax
c0100d43:	01 d0                	add    %edx,%eax
c0100d45:	c1 e0 02             	shl    $0x2,%eax
c0100d48:	05 00 00 12 c0       	add    $0xc0120000,%eax
c0100d4d:	8b 48 04             	mov    0x4(%eax),%ecx
c0100d50:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100d53:	89 d0                	mov    %edx,%eax
c0100d55:	01 c0                	add    %eax,%eax
c0100d57:	01 d0                	add    %edx,%eax
c0100d59:	c1 e0 02             	shl    $0x2,%eax
c0100d5c:	05 00 00 12 c0       	add    $0xc0120000,%eax
c0100d61:	8b 00                	mov    (%eax),%eax
c0100d63:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0100d67:	89 44 24 04          	mov    %eax,0x4(%esp)
c0100d6b:	c7 04 24 a9 8f 10 c0 	movl   $0xc0108fa9,(%esp)
c0100d72:	e8 2a f5 ff ff       	call   c01002a1 <cprintf>
c0100d77:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100d7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d7e:	83 f8 02             	cmp    $0x2,%eax
c0100d81:	76 b9                	jbe    c0100d3c <mon_help+0xf>
c0100d83:	b8 00 00 00 00       	mov    $0x0,%eax
c0100d88:	c9                   	leave  
c0100d89:	c3                   	ret    

c0100d8a <mon_kerninfo>:
c0100d8a:	55                   	push   %ebp
c0100d8b:	89 e5                	mov    %esp,%ebp
c0100d8d:	83 ec 08             	sub    $0x8,%esp
c0100d90:	e8 c3 fb ff ff       	call   c0100958 <print_kerninfo>
c0100d95:	b8 00 00 00 00       	mov    $0x0,%eax
c0100d9a:	c9                   	leave  
c0100d9b:	c3                   	ret    

c0100d9c <mon_backtrace>:
c0100d9c:	55                   	push   %ebp
c0100d9d:	89 e5                	mov    %esp,%ebp
c0100d9f:	83 ec 08             	sub    $0x8,%esp
c0100da2:	e8 fb fc ff ff       	call   c0100aa2 <print_stackframe>
c0100da7:	b8 00 00 00 00       	mov    $0x0,%eax
c0100dac:	c9                   	leave  
c0100dad:	c3                   	ret    

c0100dae <ide_wait_ready>:
c0100dae:	55                   	push   %ebp
c0100daf:	89 e5                	mov    %esp,%ebp
c0100db1:	83 ec 14             	sub    $0x14,%esp
c0100db4:	8b 45 08             	mov    0x8(%ebp),%eax
c0100db7:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
c0100dbb:	90                   	nop
c0100dbc:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
c0100dc0:	83 c0 07             	add    $0x7,%eax
c0100dc3:	0f b7 c0             	movzwl %ax,%eax
c0100dc6:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
c0100dca:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
c0100dce:	89 c2                	mov    %eax,%edx
c0100dd0:	ec                   	in     (%dx),%al
c0100dd1:	88 45 f9             	mov    %al,-0x7(%ebp)
c0100dd4:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
c0100dd8:	0f b6 c0             	movzbl %al,%eax
c0100ddb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0100dde:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100de1:	25 80 00 00 00       	and    $0x80,%eax
c0100de6:	85 c0                	test   %eax,%eax
c0100de8:	75 d2                	jne    c0100dbc <ide_wait_ready+0xe>
c0100dea:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0100dee:	74 11                	je     c0100e01 <ide_wait_ready+0x53>
c0100df0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0100df3:	83 e0 21             	and    $0x21,%eax
c0100df6:	85 c0                	test   %eax,%eax
c0100df8:	74 07                	je     c0100e01 <ide_wait_ready+0x53>
c0100dfa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0100dff:	eb 05                	jmp    c0100e06 <ide_wait_ready+0x58>
c0100e01:	b8 00 00 00 00       	mov    $0x0,%eax
c0100e06:	c9                   	leave  
c0100e07:	c3                   	ret    

c0100e08 <ide_init>:
c0100e08:	55                   	push   %ebp
c0100e09:	89 e5                	mov    %esp,%ebp
c0100e0b:	57                   	push   %edi
c0100e0c:	53                   	push   %ebx
c0100e0d:	81 ec 50 02 00 00    	sub    $0x250,%esp
c0100e13:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
c0100e19:	e9 d6 02 00 00       	jmp    c01010f4 <ide_init+0x2ec>
c0100e1e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0100e22:	c1 e0 03             	shl    $0x3,%eax
c0100e25:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0100e2c:	29 c2                	sub    %eax,%edx
c0100e2e:	8d 82 40 34 12 c0    	lea    -0x3fedcbc0(%edx),%eax
c0100e34:	c6 00 00             	movb   $0x0,(%eax)
c0100e37:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0100e3b:	66 d1 e8             	shr    %ax
c0100e3e:	0f b7 c0             	movzwl %ax,%eax
c0100e41:	0f b7 04 85 b4 8f 10 	movzwl -0x3fef704c(,%eax,4),%eax
c0100e48:	c0 
c0100e49:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100e4d:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100e51:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100e58:	00 
c0100e59:	89 04 24             	mov    %eax,(%esp)
c0100e5c:	e8 4d ff ff ff       	call   c0100dae <ide_wait_ready>
c0100e61:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0100e65:	83 e0 01             	and    $0x1,%eax
c0100e68:	c1 e0 04             	shl    $0x4,%eax
c0100e6b:	83 c8 e0             	or     $0xffffffe0,%eax
c0100e6e:	0f b6 c0             	movzbl %al,%eax
c0100e71:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
c0100e75:	83 c2 06             	add    $0x6,%edx
c0100e78:	0f b7 d2             	movzwl %dx,%edx
c0100e7b:	66 89 55 d2          	mov    %dx,-0x2e(%ebp)
c0100e7f:	88 45 d1             	mov    %al,-0x2f(%ebp)
c0100e82:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
c0100e86:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
c0100e8a:	ee                   	out    %al,(%dx)
c0100e8b:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100e8f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100e96:	00 
c0100e97:	89 04 24             	mov    %eax,(%esp)
c0100e9a:	e8 0f ff ff ff       	call   c0100dae <ide_wait_ready>
c0100e9f:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100ea3:	83 c0 07             	add    $0x7,%eax
c0100ea6:	0f b7 c0             	movzwl %ax,%eax
c0100ea9:	66 89 45 ce          	mov    %ax,-0x32(%ebp)
c0100ead:	c6 45 cd ec          	movb   $0xec,-0x33(%ebp)
c0100eb1:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
c0100eb5:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
c0100eb9:	ee                   	out    %al,(%dx)
c0100eba:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100ebe:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0100ec5:	00 
c0100ec6:	89 04 24             	mov    %eax,(%esp)
c0100ec9:	e8 e0 fe ff ff       	call   c0100dae <ide_wait_ready>
c0100ece:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100ed2:	83 c0 07             	add    $0x7,%eax
c0100ed5:	0f b7 c0             	movzwl %ax,%eax
c0100ed8:	66 89 45 ca          	mov    %ax,-0x36(%ebp)
c0100edc:	0f b7 45 ca          	movzwl -0x36(%ebp),%eax
c0100ee0:	89 c2                	mov    %eax,%edx
c0100ee2:	ec                   	in     (%dx),%al
c0100ee3:	88 45 c9             	mov    %al,-0x37(%ebp)
c0100ee6:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
c0100eea:	84 c0                	test   %al,%al
c0100eec:	0f 84 f7 01 00 00    	je     c01010e9 <ide_init+0x2e1>
c0100ef2:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100ef6:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0100efd:	00 
c0100efe:	89 04 24             	mov    %eax,(%esp)
c0100f01:	e8 a8 fe ff ff       	call   c0100dae <ide_wait_ready>
c0100f06:	85 c0                	test   %eax,%eax
c0100f08:	0f 85 db 01 00 00    	jne    c01010e9 <ide_init+0x2e1>
c0100f0e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0100f12:	c1 e0 03             	shl    $0x3,%eax
c0100f15:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0100f1c:	29 c2                	sub    %eax,%edx
c0100f1e:	8d 82 40 34 12 c0    	lea    -0x3fedcbc0(%edx),%eax
c0100f24:	c6 00 01             	movb   $0x1,(%eax)
c0100f27:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100f2b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0100f2e:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
c0100f34:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0100f37:	c7 45 bc 80 00 00 00 	movl   $0x80,-0x44(%ebp)
c0100f3e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0100f41:	8b 4d c0             	mov    -0x40(%ebp),%ecx
c0100f44:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0100f47:	89 cb                	mov    %ecx,%ebx
c0100f49:	89 df                	mov    %ebx,%edi
c0100f4b:	89 c1                	mov    %eax,%ecx
c0100f4d:	fc                   	cld    
c0100f4e:	f2 6d                	repnz insl (%dx),%es:(%edi)
c0100f50:	89 c8                	mov    %ecx,%eax
c0100f52:	89 fb                	mov    %edi,%ebx
c0100f54:	89 5d c0             	mov    %ebx,-0x40(%ebp)
c0100f57:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0100f5a:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
c0100f60:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100f63:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f66:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
c0100f6c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100f6f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100f72:	25 00 00 00 04       	and    $0x4000000,%eax
c0100f77:	85 c0                	test   %eax,%eax
c0100f79:	74 0e                	je     c0100f89 <ide_init+0x181>
c0100f7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f7e:	8b 80 c8 00 00 00    	mov    0xc8(%eax),%eax
c0100f84:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f87:	eb 09                	jmp    c0100f92 <ide_init+0x18a>
c0100f89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100f8c:	8b 40 78             	mov    0x78(%eax),%eax
c0100f8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f92:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0100f96:	c1 e0 03             	shl    $0x3,%eax
c0100f99:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0100fa0:	29 c2                	sub    %eax,%edx
c0100fa2:	81 c2 40 34 12 c0    	add    $0xc0123440,%edx
c0100fa8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100fab:	89 42 04             	mov    %eax,0x4(%edx)
c0100fae:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0100fb2:	c1 e0 03             	shl    $0x3,%eax
c0100fb5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0100fbc:	29 c2                	sub    %eax,%edx
c0100fbe:	81 c2 40 34 12 c0    	add    $0xc0123440,%edx
c0100fc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100fc7:	89 42 08             	mov    %eax,0x8(%edx)
c0100fca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100fcd:	83 c0 62             	add    $0x62,%eax
c0100fd0:	0f b7 00             	movzwl (%eax),%eax
c0100fd3:	0f b7 c0             	movzwl %ax,%eax
c0100fd6:	25 00 02 00 00       	and    $0x200,%eax
c0100fdb:	85 c0                	test   %eax,%eax
c0100fdd:	75 24                	jne    c0101003 <ide_init+0x1fb>
c0100fdf:	c7 44 24 0c bc 8f 10 	movl   $0xc0108fbc,0xc(%esp)
c0100fe6:	c0 
c0100fe7:	c7 44 24 08 ff 8f 10 	movl   $0xc0108fff,0x8(%esp)
c0100fee:	c0 
c0100fef:	c7 44 24 04 7d 00 00 	movl   $0x7d,0x4(%esp)
c0100ff6:	00 
c0100ff7:	c7 04 24 14 90 10 c0 	movl   $0xc0109014,(%esp)
c0100ffe:	e8 f5 f3 ff ff       	call   c01003f8 <__panic>
c0101003:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0101007:	c1 e0 03             	shl    $0x3,%eax
c010100a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0101011:	29 c2                	sub    %eax,%edx
c0101013:	8d 82 40 34 12 c0    	lea    -0x3fedcbc0(%edx),%eax
c0101019:	83 c0 0c             	add    $0xc,%eax
c010101c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010101f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101022:	83 c0 36             	add    $0x36,%eax
c0101025:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101028:	c7 45 d4 28 00 00 00 	movl   $0x28,-0x2c(%ebp)
c010102f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101036:	eb 34                	jmp    c010106c <ide_init+0x264>
c0101038:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010103b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010103e:	01 c2                	add    %eax,%edx
c0101040:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101043:	8d 48 01             	lea    0x1(%eax),%ecx
c0101046:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101049:	01 c8                	add    %ecx,%eax
c010104b:	0f b6 00             	movzbl (%eax),%eax
c010104e:	88 02                	mov    %al,(%edx)
c0101050:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101053:	8d 50 01             	lea    0x1(%eax),%edx
c0101056:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101059:	01 c2                	add    %eax,%edx
c010105b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010105e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
c0101061:	01 c8                	add    %ecx,%eax
c0101063:	0f b6 00             	movzbl (%eax),%eax
c0101066:	88 02                	mov    %al,(%edx)
c0101068:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c010106c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010106f:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0101072:	72 c4                	jb     c0101038 <ide_init+0x230>
c0101074:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101077:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010107a:	01 d0                	add    %edx,%eax
c010107c:	c6 00 00             	movb   $0x0,(%eax)
c010107f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101082:	8d 50 ff             	lea    -0x1(%eax),%edx
c0101085:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0101088:	85 c0                	test   %eax,%eax
c010108a:	74 0f                	je     c010109b <ide_init+0x293>
c010108c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010108f:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0101092:	01 d0                	add    %edx,%eax
c0101094:	0f b6 00             	movzbl (%eax),%eax
c0101097:	3c 20                	cmp    $0x20,%al
c0101099:	74 d9                	je     c0101074 <ide_init+0x26c>
c010109b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c010109f:	c1 e0 03             	shl    $0x3,%eax
c01010a2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01010a9:	29 c2                	sub    %eax,%edx
c01010ab:	8d 82 40 34 12 c0    	lea    -0x3fedcbc0(%edx),%eax
c01010b1:	8d 48 0c             	lea    0xc(%eax),%ecx
c01010b4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01010b8:	c1 e0 03             	shl    $0x3,%eax
c01010bb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01010c2:	29 c2                	sub    %eax,%edx
c01010c4:	8d 82 40 34 12 c0    	lea    -0x3fedcbc0(%edx),%eax
c01010ca:	8b 50 08             	mov    0x8(%eax),%edx
c01010cd:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01010d1:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
c01010d5:	89 54 24 08          	mov    %edx,0x8(%esp)
c01010d9:	89 44 24 04          	mov    %eax,0x4(%esp)
c01010dd:	c7 04 24 26 90 10 c0 	movl   $0xc0109026,(%esp)
c01010e4:	e8 b8 f1 ff ff       	call   c01002a1 <cprintf>
c01010e9:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01010ed:	83 c0 01             	add    $0x1,%eax
c01010f0:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
c01010f4:	66 83 7d f6 03       	cmpw   $0x3,-0xa(%ebp)
c01010f9:	0f 86 1f fd ff ff    	jbe    c0100e1e <ide_init+0x16>
c01010ff:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
c0101106:	e8 91 0e 00 00       	call   c0101f9c <pic_enable>
c010110b:	c7 04 24 0f 00 00 00 	movl   $0xf,(%esp)
c0101112:	e8 85 0e 00 00       	call   c0101f9c <pic_enable>
c0101117:	81 c4 50 02 00 00    	add    $0x250,%esp
c010111d:	5b                   	pop    %ebx
c010111e:	5f                   	pop    %edi
c010111f:	5d                   	pop    %ebp
c0101120:	c3                   	ret    

c0101121 <ide_device_valid>:
c0101121:	55                   	push   %ebp
c0101122:	89 e5                	mov    %esp,%ebp
c0101124:	83 ec 04             	sub    $0x4,%esp
c0101127:	8b 45 08             	mov    0x8(%ebp),%eax
c010112a:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c010112e:	66 83 7d fc 03       	cmpw   $0x3,-0x4(%ebp)
c0101133:	77 24                	ja     c0101159 <ide_device_valid+0x38>
c0101135:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0101139:	c1 e0 03             	shl    $0x3,%eax
c010113c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0101143:	29 c2                	sub    %eax,%edx
c0101145:	8d 82 40 34 12 c0    	lea    -0x3fedcbc0(%edx),%eax
c010114b:	0f b6 00             	movzbl (%eax),%eax
c010114e:	84 c0                	test   %al,%al
c0101150:	74 07                	je     c0101159 <ide_device_valid+0x38>
c0101152:	b8 01 00 00 00       	mov    $0x1,%eax
c0101157:	eb 05                	jmp    c010115e <ide_device_valid+0x3d>
c0101159:	b8 00 00 00 00       	mov    $0x0,%eax
c010115e:	c9                   	leave  
c010115f:	c3                   	ret    

c0101160 <ide_device_size>:
c0101160:	55                   	push   %ebp
c0101161:	89 e5                	mov    %esp,%ebp
c0101163:	83 ec 08             	sub    $0x8,%esp
c0101166:	8b 45 08             	mov    0x8(%ebp),%eax
c0101169:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c010116d:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0101171:	89 04 24             	mov    %eax,(%esp)
c0101174:	e8 a8 ff ff ff       	call   c0101121 <ide_device_valid>
c0101179:	85 c0                	test   %eax,%eax
c010117b:	74 1b                	je     c0101198 <ide_device_size+0x38>
c010117d:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0101181:	c1 e0 03             	shl    $0x3,%eax
c0101184:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010118b:	29 c2                	sub    %eax,%edx
c010118d:	8d 82 40 34 12 c0    	lea    -0x3fedcbc0(%edx),%eax
c0101193:	8b 40 08             	mov    0x8(%eax),%eax
c0101196:	eb 05                	jmp    c010119d <ide_device_size+0x3d>
c0101198:	b8 00 00 00 00       	mov    $0x0,%eax
c010119d:	c9                   	leave  
c010119e:	c3                   	ret    

c010119f <ide_read_secs>:
c010119f:	55                   	push   %ebp
c01011a0:	89 e5                	mov    %esp,%ebp
c01011a2:	57                   	push   %edi
c01011a3:	53                   	push   %ebx
c01011a4:	83 ec 50             	sub    $0x50,%esp
c01011a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01011aa:	66 89 45 c4          	mov    %ax,-0x3c(%ebp)
c01011ae:	81 7d 14 80 00 00 00 	cmpl   $0x80,0x14(%ebp)
c01011b5:	77 24                	ja     c01011db <ide_read_secs+0x3c>
c01011b7:	66 83 7d c4 03       	cmpw   $0x3,-0x3c(%ebp)
c01011bc:	77 1d                	ja     c01011db <ide_read_secs+0x3c>
c01011be:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
c01011c2:	c1 e0 03             	shl    $0x3,%eax
c01011c5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01011cc:	29 c2                	sub    %eax,%edx
c01011ce:	8d 82 40 34 12 c0    	lea    -0x3fedcbc0(%edx),%eax
c01011d4:	0f b6 00             	movzbl (%eax),%eax
c01011d7:	84 c0                	test   %al,%al
c01011d9:	75 24                	jne    c01011ff <ide_read_secs+0x60>
c01011db:	c7 44 24 0c 44 90 10 	movl   $0xc0109044,0xc(%esp)
c01011e2:	c0 
c01011e3:	c7 44 24 08 ff 8f 10 	movl   $0xc0108fff,0x8(%esp)
c01011ea:	c0 
c01011eb:	c7 44 24 04 9f 00 00 	movl   $0x9f,0x4(%esp)
c01011f2:	00 
c01011f3:	c7 04 24 14 90 10 c0 	movl   $0xc0109014,(%esp)
c01011fa:	e8 f9 f1 ff ff       	call   c01003f8 <__panic>
c01011ff:	81 7d 0c ff ff ff 0f 	cmpl   $0xfffffff,0xc(%ebp)
c0101206:	77 0f                	ja     c0101217 <ide_read_secs+0x78>
c0101208:	8b 45 14             	mov    0x14(%ebp),%eax
c010120b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010120e:	01 d0                	add    %edx,%eax
c0101210:	3d 00 00 00 10       	cmp    $0x10000000,%eax
c0101215:	76 24                	jbe    c010123b <ide_read_secs+0x9c>
c0101217:	c7 44 24 0c 6c 90 10 	movl   $0xc010906c,0xc(%esp)
c010121e:	c0 
c010121f:	c7 44 24 08 ff 8f 10 	movl   $0xc0108fff,0x8(%esp)
c0101226:	c0 
c0101227:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
c010122e:	00 
c010122f:	c7 04 24 14 90 10 c0 	movl   $0xc0109014,(%esp)
c0101236:	e8 bd f1 ff ff       	call   c01003f8 <__panic>
c010123b:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
c010123f:	66 d1 e8             	shr    %ax
c0101242:	0f b7 c0             	movzwl %ax,%eax
c0101245:	0f b7 04 85 b4 8f 10 	movzwl -0x3fef704c(,%eax,4),%eax
c010124c:	c0 
c010124d:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
c0101251:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
c0101255:	66 d1 e8             	shr    %ax
c0101258:	0f b7 c0             	movzwl %ax,%eax
c010125b:	0f b7 04 85 b6 8f 10 	movzwl -0x3fef704a(,%eax,4),%eax
c0101262:	c0 
c0101263:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
c0101267:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c010126b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0101272:	00 
c0101273:	89 04 24             	mov    %eax,(%esp)
c0101276:	e8 33 fb ff ff       	call   c0100dae <ide_wait_ready>
c010127b:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
c010127f:	83 c0 02             	add    $0x2,%eax
c0101282:	0f b7 c0             	movzwl %ax,%eax
c0101285:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
c0101289:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
c010128d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
c0101291:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
c0101295:	ee                   	out    %al,(%dx)
c0101296:	8b 45 14             	mov    0x14(%ebp),%eax
c0101299:	0f b6 c0             	movzbl %al,%eax
c010129c:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c01012a0:	83 c2 02             	add    $0x2,%edx
c01012a3:	0f b7 d2             	movzwl %dx,%edx
c01012a6:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
c01012aa:	88 45 e9             	mov    %al,-0x17(%ebp)
c01012ad:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
c01012b1:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
c01012b5:	ee                   	out    %al,(%dx)
c01012b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01012b9:	0f b6 c0             	movzbl %al,%eax
c01012bc:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c01012c0:	83 c2 03             	add    $0x3,%edx
c01012c3:	0f b7 d2             	movzwl %dx,%edx
c01012c6:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
c01012ca:	88 45 e5             	mov    %al,-0x1b(%ebp)
c01012cd:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
c01012d1:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
c01012d5:	ee                   	out    %al,(%dx)
c01012d6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01012d9:	c1 e8 08             	shr    $0x8,%eax
c01012dc:	0f b6 c0             	movzbl %al,%eax
c01012df:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c01012e3:	83 c2 04             	add    $0x4,%edx
c01012e6:	0f b7 d2             	movzwl %dx,%edx
c01012e9:	66 89 55 e2          	mov    %dx,-0x1e(%ebp)
c01012ed:	88 45 e1             	mov    %al,-0x1f(%ebp)
c01012f0:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
c01012f4:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
c01012f8:	ee                   	out    %al,(%dx)
c01012f9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01012fc:	c1 e8 10             	shr    $0x10,%eax
c01012ff:	0f b6 c0             	movzbl %al,%eax
c0101302:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c0101306:	83 c2 05             	add    $0x5,%edx
c0101309:	0f b7 d2             	movzwl %dx,%edx
c010130c:	66 89 55 de          	mov    %dx,-0x22(%ebp)
c0101310:	88 45 dd             	mov    %al,-0x23(%ebp)
c0101313:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
c0101317:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
c010131b:	ee                   	out    %al,(%dx)
c010131c:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
c0101320:	83 e0 01             	and    $0x1,%eax
c0101323:	c1 e0 04             	shl    $0x4,%eax
c0101326:	89 c2                	mov    %eax,%edx
c0101328:	8b 45 0c             	mov    0xc(%ebp),%eax
c010132b:	c1 e8 18             	shr    $0x18,%eax
c010132e:	83 e0 0f             	and    $0xf,%eax
c0101331:	09 d0                	or     %edx,%eax
c0101333:	83 c8 e0             	or     $0xffffffe0,%eax
c0101336:	0f b6 c0             	movzbl %al,%eax
c0101339:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c010133d:	83 c2 06             	add    $0x6,%edx
c0101340:	0f b7 d2             	movzwl %dx,%edx
c0101343:	66 89 55 da          	mov    %dx,-0x26(%ebp)
c0101347:	88 45 d9             	mov    %al,-0x27(%ebp)
c010134a:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
c010134e:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
c0101352:	ee                   	out    %al,(%dx)
c0101353:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c0101357:	83 c0 07             	add    $0x7,%eax
c010135a:	0f b7 c0             	movzwl %ax,%eax
c010135d:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0101361:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
c0101365:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
c0101369:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
c010136d:	ee                   	out    %al,(%dx)
c010136e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101375:	eb 5a                	jmp    c01013d1 <ide_read_secs+0x232>
c0101377:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c010137b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0101382:	00 
c0101383:	89 04 24             	mov    %eax,(%esp)
c0101386:	e8 23 fa ff ff       	call   c0100dae <ide_wait_ready>
c010138b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010138e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101392:	74 02                	je     c0101396 <ide_read_secs+0x1f7>
c0101394:	eb 41                	jmp    c01013d7 <ide_read_secs+0x238>
c0101396:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c010139a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010139d:	8b 45 10             	mov    0x10(%ebp),%eax
c01013a0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01013a3:	c7 45 c8 80 00 00 00 	movl   $0x80,-0x38(%ebp)
c01013aa:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01013ad:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c01013b0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01013b3:	89 cb                	mov    %ecx,%ebx
c01013b5:	89 df                	mov    %ebx,%edi
c01013b7:	89 c1                	mov    %eax,%ecx
c01013b9:	fc                   	cld    
c01013ba:	f2 6d                	repnz insl (%dx),%es:(%edi)
c01013bc:	89 c8                	mov    %ecx,%eax
c01013be:	89 fb                	mov    %edi,%ebx
c01013c0:	89 5d cc             	mov    %ebx,-0x34(%ebp)
c01013c3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01013c6:	83 6d 14 01          	subl   $0x1,0x14(%ebp)
c01013ca:	81 45 10 00 02 00 00 	addl   $0x200,0x10(%ebp)
c01013d1:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
c01013d5:	75 a0                	jne    c0101377 <ide_read_secs+0x1d8>
c01013d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013da:	83 c4 50             	add    $0x50,%esp
c01013dd:	5b                   	pop    %ebx
c01013de:	5f                   	pop    %edi
c01013df:	5d                   	pop    %ebp
c01013e0:	c3                   	ret    

c01013e1 <ide_write_secs>:
c01013e1:	55                   	push   %ebp
c01013e2:	89 e5                	mov    %esp,%ebp
c01013e4:	56                   	push   %esi
c01013e5:	53                   	push   %ebx
c01013e6:	83 ec 50             	sub    $0x50,%esp
c01013e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01013ec:	66 89 45 c4          	mov    %ax,-0x3c(%ebp)
c01013f0:	81 7d 14 80 00 00 00 	cmpl   $0x80,0x14(%ebp)
c01013f7:	77 24                	ja     c010141d <ide_write_secs+0x3c>
c01013f9:	66 83 7d c4 03       	cmpw   $0x3,-0x3c(%ebp)
c01013fe:	77 1d                	ja     c010141d <ide_write_secs+0x3c>
c0101400:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
c0101404:	c1 e0 03             	shl    $0x3,%eax
c0101407:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010140e:	29 c2                	sub    %eax,%edx
c0101410:	8d 82 40 34 12 c0    	lea    -0x3fedcbc0(%edx),%eax
c0101416:	0f b6 00             	movzbl (%eax),%eax
c0101419:	84 c0                	test   %al,%al
c010141b:	75 24                	jne    c0101441 <ide_write_secs+0x60>
c010141d:	c7 44 24 0c 44 90 10 	movl   $0xc0109044,0xc(%esp)
c0101424:	c0 
c0101425:	c7 44 24 08 ff 8f 10 	movl   $0xc0108fff,0x8(%esp)
c010142c:	c0 
c010142d:	c7 44 24 04 bc 00 00 	movl   $0xbc,0x4(%esp)
c0101434:	00 
c0101435:	c7 04 24 14 90 10 c0 	movl   $0xc0109014,(%esp)
c010143c:	e8 b7 ef ff ff       	call   c01003f8 <__panic>
c0101441:	81 7d 0c ff ff ff 0f 	cmpl   $0xfffffff,0xc(%ebp)
c0101448:	77 0f                	ja     c0101459 <ide_write_secs+0x78>
c010144a:	8b 45 14             	mov    0x14(%ebp),%eax
c010144d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101450:	01 d0                	add    %edx,%eax
c0101452:	3d 00 00 00 10       	cmp    $0x10000000,%eax
c0101457:	76 24                	jbe    c010147d <ide_write_secs+0x9c>
c0101459:	c7 44 24 0c 6c 90 10 	movl   $0xc010906c,0xc(%esp)
c0101460:	c0 
c0101461:	c7 44 24 08 ff 8f 10 	movl   $0xc0108fff,0x8(%esp)
c0101468:	c0 
c0101469:	c7 44 24 04 bd 00 00 	movl   $0xbd,0x4(%esp)
c0101470:	00 
c0101471:	c7 04 24 14 90 10 c0 	movl   $0xc0109014,(%esp)
c0101478:	e8 7b ef ff ff       	call   c01003f8 <__panic>
c010147d:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
c0101481:	66 d1 e8             	shr    %ax
c0101484:	0f b7 c0             	movzwl %ax,%eax
c0101487:	0f b7 04 85 b4 8f 10 	movzwl -0x3fef704c(,%eax,4),%eax
c010148e:	c0 
c010148f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
c0101493:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
c0101497:	66 d1 e8             	shr    %ax
c010149a:	0f b7 c0             	movzwl %ax,%eax
c010149d:	0f b7 04 85 b6 8f 10 	movzwl -0x3fef704a(,%eax,4),%eax
c01014a4:	c0 
c01014a5:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
c01014a9:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c01014ad:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01014b4:	00 
c01014b5:	89 04 24             	mov    %eax,(%esp)
c01014b8:	e8 f1 f8 ff ff       	call   c0100dae <ide_wait_ready>
c01014bd:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
c01014c1:	83 c0 02             	add    $0x2,%eax
c01014c4:	0f b7 c0             	movzwl %ax,%eax
c01014c7:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
c01014cb:	c6 45 ed 00          	movb   $0x0,-0x13(%ebp)
c01014cf:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
c01014d3:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
c01014d7:	ee                   	out    %al,(%dx)
c01014d8:	8b 45 14             	mov    0x14(%ebp),%eax
c01014db:	0f b6 c0             	movzbl %al,%eax
c01014de:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c01014e2:	83 c2 02             	add    $0x2,%edx
c01014e5:	0f b7 d2             	movzwl %dx,%edx
c01014e8:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
c01014ec:	88 45 e9             	mov    %al,-0x17(%ebp)
c01014ef:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
c01014f3:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
c01014f7:	ee                   	out    %al,(%dx)
c01014f8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01014fb:	0f b6 c0             	movzbl %al,%eax
c01014fe:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c0101502:	83 c2 03             	add    $0x3,%edx
c0101505:	0f b7 d2             	movzwl %dx,%edx
c0101508:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
c010150c:	88 45 e5             	mov    %al,-0x1b(%ebp)
c010150f:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
c0101513:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
c0101517:	ee                   	out    %al,(%dx)
c0101518:	8b 45 0c             	mov    0xc(%ebp),%eax
c010151b:	c1 e8 08             	shr    $0x8,%eax
c010151e:	0f b6 c0             	movzbl %al,%eax
c0101521:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c0101525:	83 c2 04             	add    $0x4,%edx
c0101528:	0f b7 d2             	movzwl %dx,%edx
c010152b:	66 89 55 e2          	mov    %dx,-0x1e(%ebp)
c010152f:	88 45 e1             	mov    %al,-0x1f(%ebp)
c0101532:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
c0101536:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
c010153a:	ee                   	out    %al,(%dx)
c010153b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010153e:	c1 e8 10             	shr    $0x10,%eax
c0101541:	0f b6 c0             	movzbl %al,%eax
c0101544:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c0101548:	83 c2 05             	add    $0x5,%edx
c010154b:	0f b7 d2             	movzwl %dx,%edx
c010154e:	66 89 55 de          	mov    %dx,-0x22(%ebp)
c0101552:	88 45 dd             	mov    %al,-0x23(%ebp)
c0101555:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
c0101559:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
c010155d:	ee                   	out    %al,(%dx)
c010155e:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
c0101562:	83 e0 01             	and    $0x1,%eax
c0101565:	c1 e0 04             	shl    $0x4,%eax
c0101568:	89 c2                	mov    %eax,%edx
c010156a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010156d:	c1 e8 18             	shr    $0x18,%eax
c0101570:	83 e0 0f             	and    $0xf,%eax
c0101573:	09 d0                	or     %edx,%eax
c0101575:	83 c8 e0             	or     $0xffffffe0,%eax
c0101578:	0f b6 c0             	movzbl %al,%eax
c010157b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c010157f:	83 c2 06             	add    $0x6,%edx
c0101582:	0f b7 d2             	movzwl %dx,%edx
c0101585:	66 89 55 da          	mov    %dx,-0x26(%ebp)
c0101589:	88 45 d9             	mov    %al,-0x27(%ebp)
c010158c:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
c0101590:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
c0101594:	ee                   	out    %al,(%dx)
c0101595:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c0101599:	83 c0 07             	add    $0x7,%eax
c010159c:	0f b7 c0             	movzwl %ax,%eax
c010159f:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c01015a3:	c6 45 d5 30          	movb   $0x30,-0x2b(%ebp)
c01015a7:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
c01015ab:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
c01015af:	ee                   	out    %al,(%dx)
c01015b0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01015b7:	eb 5a                	jmp    c0101613 <ide_write_secs+0x232>
c01015b9:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c01015bd:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01015c4:	00 
c01015c5:	89 04 24             	mov    %eax,(%esp)
c01015c8:	e8 e1 f7 ff ff       	call   c0100dae <ide_wait_ready>
c01015cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01015d0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01015d4:	74 02                	je     c01015d8 <ide_write_secs+0x1f7>
c01015d6:	eb 41                	jmp    c0101619 <ide_write_secs+0x238>
c01015d8:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c01015dc:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01015df:	8b 45 10             	mov    0x10(%ebp),%eax
c01015e2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01015e5:	c7 45 c8 80 00 00 00 	movl   $0x80,-0x38(%ebp)
c01015ec:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01015ef:	8b 4d cc             	mov    -0x34(%ebp),%ecx
c01015f2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01015f5:	89 cb                	mov    %ecx,%ebx
c01015f7:	89 de                	mov    %ebx,%esi
c01015f9:	89 c1                	mov    %eax,%ecx
c01015fb:	fc                   	cld    
c01015fc:	f2 6f                	repnz outsl %ds:(%esi),(%dx)
c01015fe:	89 c8                	mov    %ecx,%eax
c0101600:	89 f3                	mov    %esi,%ebx
c0101602:	89 5d cc             	mov    %ebx,-0x34(%ebp)
c0101605:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101608:	83 6d 14 01          	subl   $0x1,0x14(%ebp)
c010160c:	81 45 10 00 02 00 00 	addl   $0x200,0x10(%ebp)
c0101613:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
c0101617:	75 a0                	jne    c01015b9 <ide_write_secs+0x1d8>
c0101619:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010161c:	83 c4 50             	add    $0x50,%esp
c010161f:	5b                   	pop    %ebx
c0101620:	5e                   	pop    %esi
c0101621:	5d                   	pop    %ebp
c0101622:	c3                   	ret    

c0101623 <clock_init>:
c0101623:	55                   	push   %ebp
c0101624:	89 e5                	mov    %esp,%ebp
c0101626:	83 ec 28             	sub    $0x28,%esp
c0101629:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
c010162f:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
c0101633:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
c0101637:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
c010163b:	ee                   	out    %al,(%dx)
c010163c:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
c0101642:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
c0101646:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
c010164a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c010164e:	ee                   	out    %al,(%dx)
c010164f:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
c0101655:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
c0101659:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
c010165d:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
c0101661:	ee                   	out    %al,(%dx)
c0101662:	c7 05 0c 40 12 c0 00 	movl   $0x0,0xc012400c
c0101669:	00 00 00 
c010166c:	c7 04 24 a6 90 10 c0 	movl   $0xc01090a6,(%esp)
c0101673:	e8 29 ec ff ff       	call   c01002a1 <cprintf>
c0101678:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c010167f:	e8 18 09 00 00       	call   c0101f9c <pic_enable>
c0101684:	c9                   	leave  
c0101685:	c3                   	ret    

c0101686 <__intr_save>:
c0101686:	55                   	push   %ebp
c0101687:	89 e5                	mov    %esp,%ebp
c0101689:	83 ec 18             	sub    $0x18,%esp
c010168c:	9c                   	pushf  
c010168d:	58                   	pop    %eax
c010168e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101691:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101694:	25 00 02 00 00       	and    $0x200,%eax
c0101699:	85 c0                	test   %eax,%eax
c010169b:	74 0c                	je     c01016a9 <__intr_save+0x23>
c010169d:	e8 69 0a 00 00       	call   c010210b <intr_disable>
c01016a2:	b8 01 00 00 00       	mov    $0x1,%eax
c01016a7:	eb 05                	jmp    c01016ae <__intr_save+0x28>
c01016a9:	b8 00 00 00 00       	mov    $0x0,%eax
c01016ae:	c9                   	leave  
c01016af:	c3                   	ret    

c01016b0 <__intr_restore>:
c01016b0:	55                   	push   %ebp
c01016b1:	89 e5                	mov    %esp,%ebp
c01016b3:	83 ec 08             	sub    $0x8,%esp
c01016b6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01016ba:	74 05                	je     c01016c1 <__intr_restore+0x11>
c01016bc:	e8 44 0a 00 00       	call   c0102105 <intr_enable>
c01016c1:	c9                   	leave  
c01016c2:	c3                   	ret    

c01016c3 <delay>:
c01016c3:	55                   	push   %ebp
c01016c4:	89 e5                	mov    %esp,%ebp
c01016c6:	83 ec 10             	sub    $0x10,%esp
c01016c9:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
c01016cf:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
c01016d3:	89 c2                	mov    %eax,%edx
c01016d5:	ec                   	in     (%dx),%al
c01016d6:	88 45 fd             	mov    %al,-0x3(%ebp)
c01016d9:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
c01016df:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
c01016e3:	89 c2                	mov    %eax,%edx
c01016e5:	ec                   	in     (%dx),%al
c01016e6:	88 45 f9             	mov    %al,-0x7(%ebp)
c01016e9:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
c01016ef:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01016f3:	89 c2                	mov    %eax,%edx
c01016f5:	ec                   	in     (%dx),%al
c01016f6:	88 45 f5             	mov    %al,-0xb(%ebp)
c01016f9:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
c01016ff:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
c0101703:	89 c2                	mov    %eax,%edx
c0101705:	ec                   	in     (%dx),%al
c0101706:	88 45 f1             	mov    %al,-0xf(%ebp)
c0101709:	c9                   	leave  
c010170a:	c3                   	ret    

c010170b <cga_init>:
c010170b:	55                   	push   %ebp
c010170c:	89 e5                	mov    %esp,%ebp
c010170e:	83 ec 20             	sub    $0x20,%esp
c0101711:	c7 45 fc 00 80 0b c0 	movl   $0xc00b8000,-0x4(%ebp)
c0101718:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010171b:	0f b7 00             	movzwl (%eax),%eax
c010171e:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
c0101722:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0101725:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
c010172a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010172d:	0f b7 00             	movzwl (%eax),%eax
c0101730:	66 3d 5a a5          	cmp    $0xa55a,%ax
c0101734:	74 12                	je     c0101748 <cga_init+0x3d>
c0101736:	c7 45 fc 00 00 0b c0 	movl   $0xc00b0000,-0x4(%ebp)
c010173d:	66 c7 05 26 35 12 c0 	movw   $0x3b4,0xc0123526
c0101744:	b4 03 
c0101746:	eb 13                	jmp    c010175b <cga_init+0x50>
c0101748:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010174b:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
c010174f:	66 89 10             	mov    %dx,(%eax)
c0101752:	66 c7 05 26 35 12 c0 	movw   $0x3d4,0xc0123526
c0101759:	d4 03 
c010175b:	0f b7 05 26 35 12 c0 	movzwl 0xc0123526,%eax
c0101762:	0f b7 c0             	movzwl %ax,%eax
c0101765:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
c0101769:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
c010176d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
c0101771:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c0101775:	ee                   	out    %al,(%dx)
c0101776:	0f b7 05 26 35 12 c0 	movzwl 0xc0123526,%eax
c010177d:	83 c0 01             	add    $0x1,%eax
c0101780:	0f b7 c0             	movzwl %ax,%eax
c0101783:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
c0101787:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
c010178b:	89 c2                	mov    %eax,%edx
c010178d:	ec                   	in     (%dx),%al
c010178e:	88 45 ed             	mov    %al,-0x13(%ebp)
c0101791:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
c0101795:	0f b6 c0             	movzbl %al,%eax
c0101798:	c1 e0 08             	shl    $0x8,%eax
c010179b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010179e:	0f b7 05 26 35 12 c0 	movzwl 0xc0123526,%eax
c01017a5:	0f b7 c0             	movzwl %ax,%eax
c01017a8:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c01017ac:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
c01017b0:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
c01017b4:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
c01017b8:	ee                   	out    %al,(%dx)
c01017b9:	0f b7 05 26 35 12 c0 	movzwl 0xc0123526,%eax
c01017c0:	83 c0 01             	add    $0x1,%eax
c01017c3:	0f b7 c0             	movzwl %ax,%eax
c01017c6:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
c01017ca:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
c01017ce:	89 c2                	mov    %eax,%edx
c01017d0:	ec                   	in     (%dx),%al
c01017d1:	88 45 e5             	mov    %al,-0x1b(%ebp)
c01017d4:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
c01017d8:	0f b6 c0             	movzbl %al,%eax
c01017db:	09 45 f4             	or     %eax,-0xc(%ebp)
c01017de:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01017e1:	a3 20 35 12 c0       	mov    %eax,0xc0123520
c01017e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017e9:	66 a3 24 35 12 c0    	mov    %ax,0xc0123524
c01017ef:	c9                   	leave  
c01017f0:	c3                   	ret    

c01017f1 <serial_init>:
c01017f1:	55                   	push   %ebp
c01017f2:	89 e5                	mov    %esp,%ebp
c01017f4:	83 ec 48             	sub    $0x48,%esp
c01017f7:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
c01017fd:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
c0101801:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
c0101805:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
c0101809:	ee                   	out    %al,(%dx)
c010180a:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
c0101810:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
c0101814:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
c0101818:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c010181c:	ee                   	out    %al,(%dx)
c010181d:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
c0101823:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
c0101827:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
c010182b:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
c010182f:	ee                   	out    %al,(%dx)
c0101830:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
c0101836:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010183a:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
c010183e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
c0101842:	ee                   	out    %al,(%dx)
c0101843:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
c0101849:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
c010184d:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
c0101851:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
c0101855:	ee                   	out    %al,(%dx)
c0101856:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
c010185c:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0101860:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
c0101864:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
c0101868:	ee                   	out    %al,(%dx)
c0101869:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
c010186f:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
c0101873:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
c0101877:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
c010187b:	ee                   	out    %al,(%dx)
c010187c:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
c0101882:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
c0101886:	89 c2                	mov    %eax,%edx
c0101888:	ec                   	in     (%dx),%al
c0101889:	88 45 d9             	mov    %al,-0x27(%ebp)
c010188c:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
c0101890:	3c ff                	cmp    $0xff,%al
c0101892:	0f 95 c0             	setne  %al
c0101895:	0f b6 c0             	movzbl %al,%eax
c0101898:	a3 28 35 12 c0       	mov    %eax,0xc0123528
c010189d:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
c01018a3:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
c01018a7:	89 c2                	mov    %eax,%edx
c01018a9:	ec                   	in     (%dx),%al
c01018aa:	88 45 d5             	mov    %al,-0x2b(%ebp)
c01018ad:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
c01018b3:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
c01018b7:	89 c2                	mov    %eax,%edx
c01018b9:	ec                   	in     (%dx),%al
c01018ba:	88 45 d1             	mov    %al,-0x2f(%ebp)
c01018bd:	a1 28 35 12 c0       	mov    0xc0123528,%eax
c01018c2:	85 c0                	test   %eax,%eax
c01018c4:	74 0c                	je     c01018d2 <serial_init+0xe1>
c01018c6:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c01018cd:	e8 ca 06 00 00       	call   c0101f9c <pic_enable>
c01018d2:	c9                   	leave  
c01018d3:	c3                   	ret    

c01018d4 <lpt_putc_sub>:
c01018d4:	55                   	push   %ebp
c01018d5:	89 e5                	mov    %esp,%ebp
c01018d7:	83 ec 20             	sub    $0x20,%esp
c01018da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01018e1:	eb 09                	jmp    c01018ec <lpt_putc_sub+0x18>
c01018e3:	e8 db fd ff ff       	call   c01016c3 <delay>
c01018e8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01018ec:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
c01018f2:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
c01018f6:	89 c2                	mov    %eax,%edx
c01018f8:	ec                   	in     (%dx),%al
c01018f9:	88 45 f9             	mov    %al,-0x7(%ebp)
c01018fc:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
c0101900:	84 c0                	test   %al,%al
c0101902:	78 09                	js     c010190d <lpt_putc_sub+0x39>
c0101904:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
c010190b:	7e d6                	jle    c01018e3 <lpt_putc_sub+0xf>
c010190d:	8b 45 08             	mov    0x8(%ebp),%eax
c0101910:	0f b6 c0             	movzbl %al,%eax
c0101913:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
c0101919:	88 45 f5             	mov    %al,-0xb(%ebp)
c010191c:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
c0101920:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
c0101924:	ee                   	out    %al,(%dx)
c0101925:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
c010192b:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
c010192f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
c0101933:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c0101937:	ee                   	out    %al,(%dx)
c0101938:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
c010193e:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
c0101942:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
c0101946:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
c010194a:	ee                   	out    %al,(%dx)
c010194b:	c9                   	leave  
c010194c:	c3                   	ret    

c010194d <lpt_putc>:
c010194d:	55                   	push   %ebp
c010194e:	89 e5                	mov    %esp,%ebp
c0101950:	83 ec 04             	sub    $0x4,%esp
c0101953:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
c0101957:	74 0d                	je     c0101966 <lpt_putc+0x19>
c0101959:	8b 45 08             	mov    0x8(%ebp),%eax
c010195c:	89 04 24             	mov    %eax,(%esp)
c010195f:	e8 70 ff ff ff       	call   c01018d4 <lpt_putc_sub>
c0101964:	eb 24                	jmp    c010198a <lpt_putc+0x3d>
c0101966:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c010196d:	e8 62 ff ff ff       	call   c01018d4 <lpt_putc_sub>
c0101972:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0101979:	e8 56 ff ff ff       	call   c01018d4 <lpt_putc_sub>
c010197e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0101985:	e8 4a ff ff ff       	call   c01018d4 <lpt_putc_sub>
c010198a:	c9                   	leave  
c010198b:	c3                   	ret    

c010198c <cga_putc>:
c010198c:	55                   	push   %ebp
c010198d:	89 e5                	mov    %esp,%ebp
c010198f:	53                   	push   %ebx
c0101990:	83 ec 34             	sub    $0x34,%esp
c0101993:	8b 45 08             	mov    0x8(%ebp),%eax
c0101996:	b0 00                	mov    $0x0,%al
c0101998:	85 c0                	test   %eax,%eax
c010199a:	75 07                	jne    c01019a3 <cga_putc+0x17>
c010199c:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
c01019a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01019a6:	0f b6 c0             	movzbl %al,%eax
c01019a9:	83 f8 0a             	cmp    $0xa,%eax
c01019ac:	74 4c                	je     c01019fa <cga_putc+0x6e>
c01019ae:	83 f8 0d             	cmp    $0xd,%eax
c01019b1:	74 57                	je     c0101a0a <cga_putc+0x7e>
c01019b3:	83 f8 08             	cmp    $0x8,%eax
c01019b6:	0f 85 88 00 00 00    	jne    c0101a44 <cga_putc+0xb8>
c01019bc:	0f b7 05 24 35 12 c0 	movzwl 0xc0123524,%eax
c01019c3:	66 85 c0             	test   %ax,%ax
c01019c6:	74 30                	je     c01019f8 <cga_putc+0x6c>
c01019c8:	0f b7 05 24 35 12 c0 	movzwl 0xc0123524,%eax
c01019cf:	83 e8 01             	sub    $0x1,%eax
c01019d2:	66 a3 24 35 12 c0    	mov    %ax,0xc0123524
c01019d8:	a1 20 35 12 c0       	mov    0xc0123520,%eax
c01019dd:	0f b7 15 24 35 12 c0 	movzwl 0xc0123524,%edx
c01019e4:	0f b7 d2             	movzwl %dx,%edx
c01019e7:	01 d2                	add    %edx,%edx
c01019e9:	01 c2                	add    %eax,%edx
c01019eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01019ee:	b0 00                	mov    $0x0,%al
c01019f0:	83 c8 20             	or     $0x20,%eax
c01019f3:	66 89 02             	mov    %ax,(%edx)
c01019f6:	eb 72                	jmp    c0101a6a <cga_putc+0xde>
c01019f8:	eb 70                	jmp    c0101a6a <cga_putc+0xde>
c01019fa:	0f b7 05 24 35 12 c0 	movzwl 0xc0123524,%eax
c0101a01:	83 c0 50             	add    $0x50,%eax
c0101a04:	66 a3 24 35 12 c0    	mov    %ax,0xc0123524
c0101a0a:	0f b7 1d 24 35 12 c0 	movzwl 0xc0123524,%ebx
c0101a11:	0f b7 0d 24 35 12 c0 	movzwl 0xc0123524,%ecx
c0101a18:	0f b7 c1             	movzwl %cx,%eax
c0101a1b:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
c0101a21:	c1 e8 10             	shr    $0x10,%eax
c0101a24:	89 c2                	mov    %eax,%edx
c0101a26:	66 c1 ea 06          	shr    $0x6,%dx
c0101a2a:	89 d0                	mov    %edx,%eax
c0101a2c:	c1 e0 02             	shl    $0x2,%eax
c0101a2f:	01 d0                	add    %edx,%eax
c0101a31:	c1 e0 04             	shl    $0x4,%eax
c0101a34:	29 c1                	sub    %eax,%ecx
c0101a36:	89 ca                	mov    %ecx,%edx
c0101a38:	89 d8                	mov    %ebx,%eax
c0101a3a:	29 d0                	sub    %edx,%eax
c0101a3c:	66 a3 24 35 12 c0    	mov    %ax,0xc0123524
c0101a42:	eb 26                	jmp    c0101a6a <cga_putc+0xde>
c0101a44:	8b 0d 20 35 12 c0    	mov    0xc0123520,%ecx
c0101a4a:	0f b7 05 24 35 12 c0 	movzwl 0xc0123524,%eax
c0101a51:	8d 50 01             	lea    0x1(%eax),%edx
c0101a54:	66 89 15 24 35 12 c0 	mov    %dx,0xc0123524
c0101a5b:	0f b7 c0             	movzwl %ax,%eax
c0101a5e:	01 c0                	add    %eax,%eax
c0101a60:	8d 14 01             	lea    (%ecx,%eax,1),%edx
c0101a63:	8b 45 08             	mov    0x8(%ebp),%eax
c0101a66:	66 89 02             	mov    %ax,(%edx)
c0101a69:	90                   	nop
c0101a6a:	0f b7 05 24 35 12 c0 	movzwl 0xc0123524,%eax
c0101a71:	66 3d cf 07          	cmp    $0x7cf,%ax
c0101a75:	76 5b                	jbe    c0101ad2 <cga_putc+0x146>
c0101a77:	a1 20 35 12 c0       	mov    0xc0123520,%eax
c0101a7c:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
c0101a82:	a1 20 35 12 c0       	mov    0xc0123520,%eax
c0101a87:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
c0101a8e:	00 
c0101a8f:	89 54 24 04          	mov    %edx,0x4(%esp)
c0101a93:	89 04 24             	mov    %eax,(%esp)
c0101a96:	e8 4a 69 00 00       	call   c01083e5 <memmove>
c0101a9b:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
c0101aa2:	eb 15                	jmp    c0101ab9 <cga_putc+0x12d>
c0101aa4:	a1 20 35 12 c0       	mov    0xc0123520,%eax
c0101aa9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101aac:	01 d2                	add    %edx,%edx
c0101aae:	01 d0                	add    %edx,%eax
c0101ab0:	66 c7 00 20 07       	movw   $0x720,(%eax)
c0101ab5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101ab9:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
c0101ac0:	7e e2                	jle    c0101aa4 <cga_putc+0x118>
c0101ac2:	0f b7 05 24 35 12 c0 	movzwl 0xc0123524,%eax
c0101ac9:	83 e8 50             	sub    $0x50,%eax
c0101acc:	66 a3 24 35 12 c0    	mov    %ax,0xc0123524
c0101ad2:	0f b7 05 26 35 12 c0 	movzwl 0xc0123526,%eax
c0101ad9:	0f b7 c0             	movzwl %ax,%eax
c0101adc:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
c0101ae0:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
c0101ae4:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
c0101ae8:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c0101aec:	ee                   	out    %al,(%dx)
c0101aed:	0f b7 05 24 35 12 c0 	movzwl 0xc0123524,%eax
c0101af4:	66 c1 e8 08          	shr    $0x8,%ax
c0101af8:	0f b6 c0             	movzbl %al,%eax
c0101afb:	0f b7 15 26 35 12 c0 	movzwl 0xc0123526,%edx
c0101b02:	83 c2 01             	add    $0x1,%edx
c0101b05:	0f b7 d2             	movzwl %dx,%edx
c0101b08:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
c0101b0c:	88 45 ed             	mov    %al,-0x13(%ebp)
c0101b0f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
c0101b13:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
c0101b17:	ee                   	out    %al,(%dx)
c0101b18:	0f b7 05 26 35 12 c0 	movzwl 0xc0123526,%eax
c0101b1f:	0f b7 c0             	movzwl %ax,%eax
c0101b22:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0101b26:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
c0101b2a:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
c0101b2e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
c0101b32:	ee                   	out    %al,(%dx)
c0101b33:	0f b7 05 24 35 12 c0 	movzwl 0xc0123524,%eax
c0101b3a:	0f b6 c0             	movzbl %al,%eax
c0101b3d:	0f b7 15 26 35 12 c0 	movzwl 0xc0123526,%edx
c0101b44:	83 c2 01             	add    $0x1,%edx
c0101b47:	0f b7 d2             	movzwl %dx,%edx
c0101b4a:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
c0101b4e:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0101b51:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
c0101b55:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
c0101b59:	ee                   	out    %al,(%dx)
c0101b5a:	83 c4 34             	add    $0x34,%esp
c0101b5d:	5b                   	pop    %ebx
c0101b5e:	5d                   	pop    %ebp
c0101b5f:	c3                   	ret    

c0101b60 <serial_putc_sub>:
c0101b60:	55                   	push   %ebp
c0101b61:	89 e5                	mov    %esp,%ebp
c0101b63:	83 ec 10             	sub    $0x10,%esp
c0101b66:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0101b6d:	eb 09                	jmp    c0101b78 <serial_putc_sub+0x18>
c0101b6f:	e8 4f fb ff ff       	call   c01016c3 <delay>
c0101b74:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0101b78:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
c0101b7e:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
c0101b82:	89 c2                	mov    %eax,%edx
c0101b84:	ec                   	in     (%dx),%al
c0101b85:	88 45 f9             	mov    %al,-0x7(%ebp)
c0101b88:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
c0101b8c:	0f b6 c0             	movzbl %al,%eax
c0101b8f:	83 e0 20             	and    $0x20,%eax
c0101b92:	85 c0                	test   %eax,%eax
c0101b94:	75 09                	jne    c0101b9f <serial_putc_sub+0x3f>
c0101b96:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
c0101b9d:	7e d0                	jle    c0101b6f <serial_putc_sub+0xf>
c0101b9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ba2:	0f b6 c0             	movzbl %al,%eax
c0101ba5:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
c0101bab:	88 45 f5             	mov    %al,-0xb(%ebp)
c0101bae:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
c0101bb2:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
c0101bb6:	ee                   	out    %al,(%dx)
c0101bb7:	c9                   	leave  
c0101bb8:	c3                   	ret    

c0101bb9 <serial_putc>:
c0101bb9:	55                   	push   %ebp
c0101bba:	89 e5                	mov    %esp,%ebp
c0101bbc:	83 ec 04             	sub    $0x4,%esp
c0101bbf:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
c0101bc3:	74 0d                	je     c0101bd2 <serial_putc+0x19>
c0101bc5:	8b 45 08             	mov    0x8(%ebp),%eax
c0101bc8:	89 04 24             	mov    %eax,(%esp)
c0101bcb:	e8 90 ff ff ff       	call   c0101b60 <serial_putc_sub>
c0101bd0:	eb 24                	jmp    c0101bf6 <serial_putc+0x3d>
c0101bd2:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0101bd9:	e8 82 ff ff ff       	call   c0101b60 <serial_putc_sub>
c0101bde:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0101be5:	e8 76 ff ff ff       	call   c0101b60 <serial_putc_sub>
c0101bea:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
c0101bf1:	e8 6a ff ff ff       	call   c0101b60 <serial_putc_sub>
c0101bf6:	c9                   	leave  
c0101bf7:	c3                   	ret    

c0101bf8 <cons_intr>:
c0101bf8:	55                   	push   %ebp
c0101bf9:	89 e5                	mov    %esp,%ebp
c0101bfb:	83 ec 18             	sub    $0x18,%esp
c0101bfe:	eb 33                	jmp    c0101c33 <cons_intr+0x3b>
c0101c00:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101c04:	74 2d                	je     c0101c33 <cons_intr+0x3b>
c0101c06:	a1 44 37 12 c0       	mov    0xc0123744,%eax
c0101c0b:	8d 50 01             	lea    0x1(%eax),%edx
c0101c0e:	89 15 44 37 12 c0    	mov    %edx,0xc0123744
c0101c14:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101c17:	88 90 40 35 12 c0    	mov    %dl,-0x3fedcac0(%eax)
c0101c1d:	a1 44 37 12 c0       	mov    0xc0123744,%eax
c0101c22:	3d 00 02 00 00       	cmp    $0x200,%eax
c0101c27:	75 0a                	jne    c0101c33 <cons_intr+0x3b>
c0101c29:	c7 05 44 37 12 c0 00 	movl   $0x0,0xc0123744
c0101c30:	00 00 00 
c0101c33:	8b 45 08             	mov    0x8(%ebp),%eax
c0101c36:	ff d0                	call   *%eax
c0101c38:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101c3b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0101c3f:	75 bf                	jne    c0101c00 <cons_intr+0x8>
c0101c41:	c9                   	leave  
c0101c42:	c3                   	ret    

c0101c43 <serial_proc_data>:
c0101c43:	55                   	push   %ebp
c0101c44:	89 e5                	mov    %esp,%ebp
c0101c46:	83 ec 10             	sub    $0x10,%esp
c0101c49:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
c0101c4f:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
c0101c53:	89 c2                	mov    %eax,%edx
c0101c55:	ec                   	in     (%dx),%al
c0101c56:	88 45 f9             	mov    %al,-0x7(%ebp)
c0101c59:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
c0101c5d:	0f b6 c0             	movzbl %al,%eax
c0101c60:	83 e0 01             	and    $0x1,%eax
c0101c63:	85 c0                	test   %eax,%eax
c0101c65:	75 07                	jne    c0101c6e <serial_proc_data+0x2b>
c0101c67:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101c6c:	eb 2a                	jmp    c0101c98 <serial_proc_data+0x55>
c0101c6e:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
c0101c74:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0101c78:	89 c2                	mov    %eax,%edx
c0101c7a:	ec                   	in     (%dx),%al
c0101c7b:	88 45 f5             	mov    %al,-0xb(%ebp)
c0101c7e:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
c0101c82:	0f b6 c0             	movzbl %al,%eax
c0101c85:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0101c88:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
c0101c8c:	75 07                	jne    c0101c95 <serial_proc_data+0x52>
c0101c8e:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
c0101c95:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0101c98:	c9                   	leave  
c0101c99:	c3                   	ret    

c0101c9a <serial_intr>:
c0101c9a:	55                   	push   %ebp
c0101c9b:	89 e5                	mov    %esp,%ebp
c0101c9d:	83 ec 18             	sub    $0x18,%esp
c0101ca0:	a1 28 35 12 c0       	mov    0xc0123528,%eax
c0101ca5:	85 c0                	test   %eax,%eax
c0101ca7:	74 0c                	je     c0101cb5 <serial_intr+0x1b>
c0101ca9:	c7 04 24 43 1c 10 c0 	movl   $0xc0101c43,(%esp)
c0101cb0:	e8 43 ff ff ff       	call   c0101bf8 <cons_intr>
c0101cb5:	c9                   	leave  
c0101cb6:	c3                   	ret    

c0101cb7 <kbd_proc_data>:
c0101cb7:	55                   	push   %ebp
c0101cb8:	89 e5                	mov    %esp,%ebp
c0101cba:	83 ec 38             	sub    $0x38,%esp
c0101cbd:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
c0101cc3:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
c0101cc7:	89 c2                	mov    %eax,%edx
c0101cc9:	ec                   	in     (%dx),%al
c0101cca:	88 45 ef             	mov    %al,-0x11(%ebp)
c0101ccd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
c0101cd1:	0f b6 c0             	movzbl %al,%eax
c0101cd4:	83 e0 01             	and    $0x1,%eax
c0101cd7:	85 c0                	test   %eax,%eax
c0101cd9:	75 0a                	jne    c0101ce5 <kbd_proc_data+0x2e>
c0101cdb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101ce0:	e9 59 01 00 00       	jmp    c0101e3e <kbd_proc_data+0x187>
c0101ce5:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
c0101ceb:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
c0101cef:	89 c2                	mov    %eax,%edx
c0101cf1:	ec                   	in     (%dx),%al
c0101cf2:	88 45 eb             	mov    %al,-0x15(%ebp)
c0101cf5:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0101cf9:	88 45 f3             	mov    %al,-0xd(%ebp)
c0101cfc:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
c0101d00:	75 17                	jne    c0101d19 <kbd_proc_data+0x62>
c0101d02:	a1 48 37 12 c0       	mov    0xc0123748,%eax
c0101d07:	83 c8 40             	or     $0x40,%eax
c0101d0a:	a3 48 37 12 c0       	mov    %eax,0xc0123748
c0101d0f:	b8 00 00 00 00       	mov    $0x0,%eax
c0101d14:	e9 25 01 00 00       	jmp    c0101e3e <kbd_proc_data+0x187>
c0101d19:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0101d1d:	84 c0                	test   %al,%al
c0101d1f:	79 47                	jns    c0101d68 <kbd_proc_data+0xb1>
c0101d21:	a1 48 37 12 c0       	mov    0xc0123748,%eax
c0101d26:	83 e0 40             	and    $0x40,%eax
c0101d29:	85 c0                	test   %eax,%eax
c0101d2b:	75 09                	jne    c0101d36 <kbd_proc_data+0x7f>
c0101d2d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0101d31:	83 e0 7f             	and    $0x7f,%eax
c0101d34:	eb 04                	jmp    c0101d3a <kbd_proc_data+0x83>
c0101d36:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0101d3a:	88 45 f3             	mov    %al,-0xd(%ebp)
c0101d3d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0101d41:	0f b6 80 40 00 12 c0 	movzbl -0x3fedffc0(%eax),%eax
c0101d48:	83 c8 40             	or     $0x40,%eax
c0101d4b:	0f b6 c0             	movzbl %al,%eax
c0101d4e:	f7 d0                	not    %eax
c0101d50:	89 c2                	mov    %eax,%edx
c0101d52:	a1 48 37 12 c0       	mov    0xc0123748,%eax
c0101d57:	21 d0                	and    %edx,%eax
c0101d59:	a3 48 37 12 c0       	mov    %eax,0xc0123748
c0101d5e:	b8 00 00 00 00       	mov    $0x0,%eax
c0101d63:	e9 d6 00 00 00       	jmp    c0101e3e <kbd_proc_data+0x187>
c0101d68:	a1 48 37 12 c0       	mov    0xc0123748,%eax
c0101d6d:	83 e0 40             	and    $0x40,%eax
c0101d70:	85 c0                	test   %eax,%eax
c0101d72:	74 11                	je     c0101d85 <kbd_proc_data+0xce>
c0101d74:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
c0101d78:	a1 48 37 12 c0       	mov    0xc0123748,%eax
c0101d7d:	83 e0 bf             	and    $0xffffffbf,%eax
c0101d80:	a3 48 37 12 c0       	mov    %eax,0xc0123748
c0101d85:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0101d89:	0f b6 80 40 00 12 c0 	movzbl -0x3fedffc0(%eax),%eax
c0101d90:	0f b6 d0             	movzbl %al,%edx
c0101d93:	a1 48 37 12 c0       	mov    0xc0123748,%eax
c0101d98:	09 d0                	or     %edx,%eax
c0101d9a:	a3 48 37 12 c0       	mov    %eax,0xc0123748
c0101d9f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0101da3:	0f b6 80 40 01 12 c0 	movzbl -0x3fedfec0(%eax),%eax
c0101daa:	0f b6 d0             	movzbl %al,%edx
c0101dad:	a1 48 37 12 c0       	mov    0xc0123748,%eax
c0101db2:	31 d0                	xor    %edx,%eax
c0101db4:	a3 48 37 12 c0       	mov    %eax,0xc0123748
c0101db9:	a1 48 37 12 c0       	mov    0xc0123748,%eax
c0101dbe:	83 e0 03             	and    $0x3,%eax
c0101dc1:	8b 14 85 40 05 12 c0 	mov    -0x3fedfac0(,%eax,4),%edx
c0101dc8:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
c0101dcc:	01 d0                	add    %edx,%eax
c0101dce:	0f b6 00             	movzbl (%eax),%eax
c0101dd1:	0f b6 c0             	movzbl %al,%eax
c0101dd4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101dd7:	a1 48 37 12 c0       	mov    0xc0123748,%eax
c0101ddc:	83 e0 08             	and    $0x8,%eax
c0101ddf:	85 c0                	test   %eax,%eax
c0101de1:	74 22                	je     c0101e05 <kbd_proc_data+0x14e>
c0101de3:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
c0101de7:	7e 0c                	jle    c0101df5 <kbd_proc_data+0x13e>
c0101de9:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
c0101ded:	7f 06                	jg     c0101df5 <kbd_proc_data+0x13e>
c0101def:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
c0101df3:	eb 10                	jmp    c0101e05 <kbd_proc_data+0x14e>
c0101df5:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
c0101df9:	7e 0a                	jle    c0101e05 <kbd_proc_data+0x14e>
c0101dfb:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
c0101dff:	7f 04                	jg     c0101e05 <kbd_proc_data+0x14e>
c0101e01:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
c0101e05:	a1 48 37 12 c0       	mov    0xc0123748,%eax
c0101e0a:	f7 d0                	not    %eax
c0101e0c:	83 e0 06             	and    $0x6,%eax
c0101e0f:	85 c0                	test   %eax,%eax
c0101e11:	75 28                	jne    c0101e3b <kbd_proc_data+0x184>
c0101e13:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
c0101e1a:	75 1f                	jne    c0101e3b <kbd_proc_data+0x184>
c0101e1c:	c7 04 24 c1 90 10 c0 	movl   $0xc01090c1,(%esp)
c0101e23:	e8 79 e4 ff ff       	call   c01002a1 <cprintf>
c0101e28:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
c0101e2e:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
c0101e32:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0101e36:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
c0101e3a:	ee                   	out    %al,(%dx)
c0101e3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e3e:	c9                   	leave  
c0101e3f:	c3                   	ret    

c0101e40 <kbd_intr>:
c0101e40:	55                   	push   %ebp
c0101e41:	89 e5                	mov    %esp,%ebp
c0101e43:	83 ec 18             	sub    $0x18,%esp
c0101e46:	c7 04 24 b7 1c 10 c0 	movl   $0xc0101cb7,(%esp)
c0101e4d:	e8 a6 fd ff ff       	call   c0101bf8 <cons_intr>
c0101e52:	c9                   	leave  
c0101e53:	c3                   	ret    

c0101e54 <kbd_init>:
c0101e54:	55                   	push   %ebp
c0101e55:	89 e5                	mov    %esp,%ebp
c0101e57:	83 ec 18             	sub    $0x18,%esp
c0101e5a:	e8 e1 ff ff ff       	call   c0101e40 <kbd_intr>
c0101e5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0101e66:	e8 31 01 00 00       	call   c0101f9c <pic_enable>
c0101e6b:	c9                   	leave  
c0101e6c:	c3                   	ret    

c0101e6d <cons_init>:
c0101e6d:	55                   	push   %ebp
c0101e6e:	89 e5                	mov    %esp,%ebp
c0101e70:	83 ec 18             	sub    $0x18,%esp
c0101e73:	e8 93 f8 ff ff       	call   c010170b <cga_init>
c0101e78:	e8 74 f9 ff ff       	call   c01017f1 <serial_init>
c0101e7d:	e8 d2 ff ff ff       	call   c0101e54 <kbd_init>
c0101e82:	a1 28 35 12 c0       	mov    0xc0123528,%eax
c0101e87:	85 c0                	test   %eax,%eax
c0101e89:	75 0c                	jne    c0101e97 <cons_init+0x2a>
c0101e8b:	c7 04 24 cd 90 10 c0 	movl   $0xc01090cd,(%esp)
c0101e92:	e8 0a e4 ff ff       	call   c01002a1 <cprintf>
c0101e97:	c9                   	leave  
c0101e98:	c3                   	ret    

c0101e99 <cons_putc>:
c0101e99:	55                   	push   %ebp
c0101e9a:	89 e5                	mov    %esp,%ebp
c0101e9c:	83 ec 28             	sub    $0x28,%esp
c0101e9f:	e8 e2 f7 ff ff       	call   c0101686 <__intr_save>
c0101ea4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101ea7:	8b 45 08             	mov    0x8(%ebp),%eax
c0101eaa:	89 04 24             	mov    %eax,(%esp)
c0101ead:	e8 9b fa ff ff       	call   c010194d <lpt_putc>
c0101eb2:	8b 45 08             	mov    0x8(%ebp),%eax
c0101eb5:	89 04 24             	mov    %eax,(%esp)
c0101eb8:	e8 cf fa ff ff       	call   c010198c <cga_putc>
c0101ebd:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ec0:	89 04 24             	mov    %eax,(%esp)
c0101ec3:	e8 f1 fc ff ff       	call   c0101bb9 <serial_putc>
c0101ec8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ecb:	89 04 24             	mov    %eax,(%esp)
c0101ece:	e8 dd f7 ff ff       	call   c01016b0 <__intr_restore>
c0101ed3:	c9                   	leave  
c0101ed4:	c3                   	ret    

c0101ed5 <cons_getc>:
c0101ed5:	55                   	push   %ebp
c0101ed6:	89 e5                	mov    %esp,%ebp
c0101ed8:	83 ec 28             	sub    $0x28,%esp
c0101edb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101ee2:	e8 9f f7 ff ff       	call   c0101686 <__intr_save>
c0101ee7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101eea:	e8 ab fd ff ff       	call   c0101c9a <serial_intr>
c0101eef:	e8 4c ff ff ff       	call   c0101e40 <kbd_intr>
c0101ef4:	8b 15 40 37 12 c0    	mov    0xc0123740,%edx
c0101efa:	a1 44 37 12 c0       	mov    0xc0123744,%eax
c0101eff:	39 c2                	cmp    %eax,%edx
c0101f01:	74 31                	je     c0101f34 <cons_getc+0x5f>
c0101f03:	a1 40 37 12 c0       	mov    0xc0123740,%eax
c0101f08:	8d 50 01             	lea    0x1(%eax),%edx
c0101f0b:	89 15 40 37 12 c0    	mov    %edx,0xc0123740
c0101f11:	0f b6 80 40 35 12 c0 	movzbl -0x3fedcac0(%eax),%eax
c0101f18:	0f b6 c0             	movzbl %al,%eax
c0101f1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101f1e:	a1 40 37 12 c0       	mov    0xc0123740,%eax
c0101f23:	3d 00 02 00 00       	cmp    $0x200,%eax
c0101f28:	75 0a                	jne    c0101f34 <cons_getc+0x5f>
c0101f2a:	c7 05 40 37 12 c0 00 	movl   $0x0,0xc0123740
c0101f31:	00 00 00 
c0101f34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101f37:	89 04 24             	mov    %eax,(%esp)
c0101f3a:	e8 71 f7 ff ff       	call   c01016b0 <__intr_restore>
c0101f3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f42:	c9                   	leave  
c0101f43:	c3                   	ret    

c0101f44 <pic_setmask>:
c0101f44:	55                   	push   %ebp
c0101f45:	89 e5                	mov    %esp,%ebp
c0101f47:	83 ec 14             	sub    $0x14,%esp
c0101f4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f4d:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
c0101f51:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
c0101f55:	66 a3 50 05 12 c0    	mov    %ax,0xc0120550
c0101f5b:	a1 4c 37 12 c0       	mov    0xc012374c,%eax
c0101f60:	85 c0                	test   %eax,%eax
c0101f62:	74 36                	je     c0101f9a <pic_setmask+0x56>
c0101f64:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
c0101f68:	0f b6 c0             	movzbl %al,%eax
c0101f6b:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
c0101f71:	88 45 fd             	mov    %al,-0x3(%ebp)
c0101f74:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
c0101f78:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
c0101f7c:	ee                   	out    %al,(%dx)
c0101f7d:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
c0101f81:	66 c1 e8 08          	shr    $0x8,%ax
c0101f85:	0f b6 c0             	movzbl %al,%eax
c0101f88:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
c0101f8e:	88 45 f9             	mov    %al,-0x7(%ebp)
c0101f91:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
c0101f95:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
c0101f99:	ee                   	out    %al,(%dx)
c0101f9a:	c9                   	leave  
c0101f9b:	c3                   	ret    

c0101f9c <pic_enable>:
c0101f9c:	55                   	push   %ebp
c0101f9d:	89 e5                	mov    %esp,%ebp
c0101f9f:	83 ec 04             	sub    $0x4,%esp
c0101fa2:	8b 45 08             	mov    0x8(%ebp),%eax
c0101fa5:	ba 01 00 00 00       	mov    $0x1,%edx
c0101faa:	89 c1                	mov    %eax,%ecx
c0101fac:	d3 e2                	shl    %cl,%edx
c0101fae:	89 d0                	mov    %edx,%eax
c0101fb0:	f7 d0                	not    %eax
c0101fb2:	89 c2                	mov    %eax,%edx
c0101fb4:	0f b7 05 50 05 12 c0 	movzwl 0xc0120550,%eax
c0101fbb:	21 d0                	and    %edx,%eax
c0101fbd:	0f b7 c0             	movzwl %ax,%eax
c0101fc0:	89 04 24             	mov    %eax,(%esp)
c0101fc3:	e8 7c ff ff ff       	call   c0101f44 <pic_setmask>
c0101fc8:	c9                   	leave  
c0101fc9:	c3                   	ret    

c0101fca <pic_init>:
c0101fca:	55                   	push   %ebp
c0101fcb:	89 e5                	mov    %esp,%ebp
c0101fcd:	83 ec 44             	sub    $0x44,%esp
c0101fd0:	c7 05 4c 37 12 c0 01 	movl   $0x1,0xc012374c
c0101fd7:	00 00 00 
c0101fda:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
c0101fe0:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
c0101fe4:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
c0101fe8:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
c0101fec:	ee                   	out    %al,(%dx)
c0101fed:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
c0101ff3:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
c0101ff7:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
c0101ffb:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
c0101fff:	ee                   	out    %al,(%dx)
c0102000:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
c0102006:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
c010200a:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
c010200e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
c0102012:	ee                   	out    %al,(%dx)
c0102013:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
c0102019:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
c010201d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
c0102021:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
c0102025:	ee                   	out    %al,(%dx)
c0102026:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
c010202c:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
c0102030:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
c0102034:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
c0102038:	ee                   	out    %al,(%dx)
c0102039:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
c010203f:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
c0102043:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
c0102047:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
c010204b:	ee                   	out    %al,(%dx)
c010204c:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
c0102052:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
c0102056:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
c010205a:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
c010205e:	ee                   	out    %al,(%dx)
c010205f:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
c0102065:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
c0102069:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
c010206d:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
c0102071:	ee                   	out    %al,(%dx)
c0102072:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
c0102078:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
c010207c:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
c0102080:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
c0102084:	ee                   	out    %al,(%dx)
c0102085:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
c010208b:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
c010208f:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
c0102093:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
c0102097:	ee                   	out    %al,(%dx)
c0102098:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
c010209e:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
c01020a2:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
c01020a6:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
c01020aa:	ee                   	out    %al,(%dx)
c01020ab:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
c01020b1:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
c01020b5:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
c01020b9:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
c01020bd:	ee                   	out    %al,(%dx)
c01020be:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
c01020c4:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
c01020c8:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
c01020cc:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
c01020d0:	ee                   	out    %al,(%dx)
c01020d1:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
c01020d7:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
c01020db:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
c01020df:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
c01020e3:	ee                   	out    %al,(%dx)
c01020e4:	0f b7 05 50 05 12 c0 	movzwl 0xc0120550,%eax
c01020eb:	66 83 f8 ff          	cmp    $0xffff,%ax
c01020ef:	74 12                	je     c0102103 <pic_init+0x139>
c01020f1:	0f b7 05 50 05 12 c0 	movzwl 0xc0120550,%eax
c01020f8:	0f b7 c0             	movzwl %ax,%eax
c01020fb:	89 04 24             	mov    %eax,(%esp)
c01020fe:	e8 41 fe ff ff       	call   c0101f44 <pic_setmask>
c0102103:	c9                   	leave  
c0102104:	c3                   	ret    

c0102105 <intr_enable>:
c0102105:	55                   	push   %ebp
c0102106:	89 e5                	mov    %esp,%ebp
c0102108:	fb                   	sti    
c0102109:	5d                   	pop    %ebp
c010210a:	c3                   	ret    

c010210b <intr_disable>:
c010210b:	55                   	push   %ebp
c010210c:	89 e5                	mov    %esp,%ebp
c010210e:	fa                   	cli    
c010210f:	5d                   	pop    %ebp
c0102110:	c3                   	ret    

c0102111 <print_ticks>:
c0102111:	55                   	push   %ebp
c0102112:	89 e5                	mov    %esp,%ebp
c0102114:	83 ec 18             	sub    $0x18,%esp
c0102117:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
c010211e:	00 
c010211f:	c7 04 24 00 91 10 c0 	movl   $0xc0109100,(%esp)
c0102126:	e8 76 e1 ff ff       	call   c01002a1 <cprintf>
c010212b:	c7 04 24 0a 91 10 c0 	movl   $0xc010910a,(%esp)
c0102132:	e8 6a e1 ff ff       	call   c01002a1 <cprintf>
c0102137:	c7 44 24 08 18 91 10 	movl   $0xc0109118,0x8(%esp)
c010213e:	c0 
c010213f:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
c0102146:	00 
c0102147:	c7 04 24 2e 91 10 c0 	movl   $0xc010912e,(%esp)
c010214e:	e8 a5 e2 ff ff       	call   c01003f8 <__panic>

c0102153 <idt_init>:
c0102153:	55                   	push   %ebp
c0102154:	89 e5                	mov    %esp,%ebp
c0102156:	83 ec 10             	sub    $0x10,%esp
c0102159:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0102160:	e9 c3 00 00 00       	jmp    c0102228 <idt_init+0xd5>
c0102165:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102168:	8b 04 85 e0 05 12 c0 	mov    -0x3fedfa20(,%eax,4),%eax
c010216f:	89 c2                	mov    %eax,%edx
c0102171:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102174:	66 89 14 c5 60 37 12 	mov    %dx,-0x3fedc8a0(,%eax,8)
c010217b:	c0 
c010217c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010217f:	66 c7 04 c5 62 37 12 	movw   $0x8,-0x3fedc89e(,%eax,8)
c0102186:	c0 08 00 
c0102189:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010218c:	0f b6 14 c5 64 37 12 	movzbl -0x3fedc89c(,%eax,8),%edx
c0102193:	c0 
c0102194:	83 e2 e0             	and    $0xffffffe0,%edx
c0102197:	88 14 c5 64 37 12 c0 	mov    %dl,-0x3fedc89c(,%eax,8)
c010219e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021a1:	0f b6 14 c5 64 37 12 	movzbl -0x3fedc89c(,%eax,8),%edx
c01021a8:	c0 
c01021a9:	83 e2 1f             	and    $0x1f,%edx
c01021ac:	88 14 c5 64 37 12 c0 	mov    %dl,-0x3fedc89c(,%eax,8)
c01021b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021b6:	0f b6 14 c5 65 37 12 	movzbl -0x3fedc89b(,%eax,8),%edx
c01021bd:	c0 
c01021be:	83 e2 f0             	and    $0xfffffff0,%edx
c01021c1:	83 ca 0e             	or     $0xe,%edx
c01021c4:	88 14 c5 65 37 12 c0 	mov    %dl,-0x3fedc89b(,%eax,8)
c01021cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021ce:	0f b6 14 c5 65 37 12 	movzbl -0x3fedc89b(,%eax,8),%edx
c01021d5:	c0 
c01021d6:	83 e2 ef             	and    $0xffffffef,%edx
c01021d9:	88 14 c5 65 37 12 c0 	mov    %dl,-0x3fedc89b(,%eax,8)
c01021e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021e3:	0f b6 14 c5 65 37 12 	movzbl -0x3fedc89b(,%eax,8),%edx
c01021ea:	c0 
c01021eb:	83 e2 9f             	and    $0xffffff9f,%edx
c01021ee:	88 14 c5 65 37 12 c0 	mov    %dl,-0x3fedc89b(,%eax,8)
c01021f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021f8:	0f b6 14 c5 65 37 12 	movzbl -0x3fedc89b(,%eax,8),%edx
c01021ff:	c0 
c0102200:	83 ca 80             	or     $0xffffff80,%edx
c0102203:	88 14 c5 65 37 12 c0 	mov    %dl,-0x3fedc89b(,%eax,8)
c010220a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010220d:	8b 04 85 e0 05 12 c0 	mov    -0x3fedfa20(,%eax,4),%eax
c0102214:	c1 e8 10             	shr    $0x10,%eax
c0102217:	89 c2                	mov    %eax,%edx
c0102219:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010221c:	66 89 14 c5 66 37 12 	mov    %dx,-0x3fedc89a(,%eax,8)
c0102223:	c0 
c0102224:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102228:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010222b:	3d ff 00 00 00       	cmp    $0xff,%eax
c0102230:	0f 86 2f ff ff ff    	jbe    c0102165 <idt_init+0x12>
c0102236:	c7 45 f8 60 05 12 c0 	movl   $0xc0120560,-0x8(%ebp)
c010223d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102240:	0f 01 18             	lidtl  (%eax)
c0102243:	c9                   	leave  
c0102244:	c3                   	ret    

c0102245 <trapname>:
c0102245:	55                   	push   %ebp
c0102246:	89 e5                	mov    %esp,%ebp
c0102248:	8b 45 08             	mov    0x8(%ebp),%eax
c010224b:	83 f8 13             	cmp    $0x13,%eax
c010224e:	77 0c                	ja     c010225c <trapname+0x17>
c0102250:	8b 45 08             	mov    0x8(%ebp),%eax
c0102253:	8b 04 85 00 95 10 c0 	mov    -0x3fef6b00(,%eax,4),%eax
c010225a:	eb 18                	jmp    c0102274 <trapname+0x2f>
c010225c:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
c0102260:	7e 0d                	jle    c010226f <trapname+0x2a>
c0102262:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
c0102266:	7f 07                	jg     c010226f <trapname+0x2a>
c0102268:	b8 3f 91 10 c0       	mov    $0xc010913f,%eax
c010226d:	eb 05                	jmp    c0102274 <trapname+0x2f>
c010226f:	b8 52 91 10 c0       	mov    $0xc0109152,%eax
c0102274:	5d                   	pop    %ebp
c0102275:	c3                   	ret    

c0102276 <trap_in_kernel>:
c0102276:	55                   	push   %ebp
c0102277:	89 e5                	mov    %esp,%ebp
c0102279:	8b 45 08             	mov    0x8(%ebp),%eax
c010227c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
c0102280:	66 83 f8 08          	cmp    $0x8,%ax
c0102284:	0f 94 c0             	sete   %al
c0102287:	0f b6 c0             	movzbl %al,%eax
c010228a:	5d                   	pop    %ebp
c010228b:	c3                   	ret    

c010228c <print_trapframe>:
c010228c:	55                   	push   %ebp
c010228d:	89 e5                	mov    %esp,%ebp
c010228f:	83 ec 28             	sub    $0x28,%esp
c0102292:	8b 45 08             	mov    0x8(%ebp),%eax
c0102295:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102299:	c7 04 24 93 91 10 c0 	movl   $0xc0109193,(%esp)
c01022a0:	e8 fc df ff ff       	call   c01002a1 <cprintf>
c01022a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01022a8:	89 04 24             	mov    %eax,(%esp)
c01022ab:	e8 a1 01 00 00       	call   c0102451 <print_regs>
c01022b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01022b3:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c01022b7:	0f b7 c0             	movzwl %ax,%eax
c01022ba:	89 44 24 04          	mov    %eax,0x4(%esp)
c01022be:	c7 04 24 a4 91 10 c0 	movl   $0xc01091a4,(%esp)
c01022c5:	e8 d7 df ff ff       	call   c01002a1 <cprintf>
c01022ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01022cd:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c01022d1:	0f b7 c0             	movzwl %ax,%eax
c01022d4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01022d8:	c7 04 24 b7 91 10 c0 	movl   $0xc01091b7,(%esp)
c01022df:	e8 bd df ff ff       	call   c01002a1 <cprintf>
c01022e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01022e7:	0f b7 40 24          	movzwl 0x24(%eax),%eax
c01022eb:	0f b7 c0             	movzwl %ax,%eax
c01022ee:	89 44 24 04          	mov    %eax,0x4(%esp)
c01022f2:	c7 04 24 ca 91 10 c0 	movl   $0xc01091ca,(%esp)
c01022f9:	e8 a3 df ff ff       	call   c01002a1 <cprintf>
c01022fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0102301:	0f b7 40 20          	movzwl 0x20(%eax),%eax
c0102305:	0f b7 c0             	movzwl %ax,%eax
c0102308:	89 44 24 04          	mov    %eax,0x4(%esp)
c010230c:	c7 04 24 dd 91 10 c0 	movl   $0xc01091dd,(%esp)
c0102313:	e8 89 df ff ff       	call   c01002a1 <cprintf>
c0102318:	8b 45 08             	mov    0x8(%ebp),%eax
c010231b:	8b 40 30             	mov    0x30(%eax),%eax
c010231e:	89 04 24             	mov    %eax,(%esp)
c0102321:	e8 1f ff ff ff       	call   c0102245 <trapname>
c0102326:	8b 55 08             	mov    0x8(%ebp),%edx
c0102329:	8b 52 30             	mov    0x30(%edx),%edx
c010232c:	89 44 24 08          	mov    %eax,0x8(%esp)
c0102330:	89 54 24 04          	mov    %edx,0x4(%esp)
c0102334:	c7 04 24 f0 91 10 c0 	movl   $0xc01091f0,(%esp)
c010233b:	e8 61 df ff ff       	call   c01002a1 <cprintf>
c0102340:	8b 45 08             	mov    0x8(%ebp),%eax
c0102343:	8b 40 34             	mov    0x34(%eax),%eax
c0102346:	89 44 24 04          	mov    %eax,0x4(%esp)
c010234a:	c7 04 24 02 92 10 c0 	movl   $0xc0109202,(%esp)
c0102351:	e8 4b df ff ff       	call   c01002a1 <cprintf>
c0102356:	8b 45 08             	mov    0x8(%ebp),%eax
c0102359:	8b 40 38             	mov    0x38(%eax),%eax
c010235c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102360:	c7 04 24 11 92 10 c0 	movl   $0xc0109211,(%esp)
c0102367:	e8 35 df ff ff       	call   c01002a1 <cprintf>
c010236c:	8b 45 08             	mov    0x8(%ebp),%eax
c010236f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
c0102373:	0f b7 c0             	movzwl %ax,%eax
c0102376:	89 44 24 04          	mov    %eax,0x4(%esp)
c010237a:	c7 04 24 20 92 10 c0 	movl   $0xc0109220,(%esp)
c0102381:	e8 1b df ff ff       	call   c01002a1 <cprintf>
c0102386:	8b 45 08             	mov    0x8(%ebp),%eax
c0102389:	8b 40 40             	mov    0x40(%eax),%eax
c010238c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102390:	c7 04 24 33 92 10 c0 	movl   $0xc0109233,(%esp)
c0102397:	e8 05 df ff ff       	call   c01002a1 <cprintf>
c010239c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01023a3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01023aa:	eb 3e                	jmp    c01023ea <print_trapframe+0x15e>
c01023ac:	8b 45 08             	mov    0x8(%ebp),%eax
c01023af:	8b 50 40             	mov    0x40(%eax),%edx
c01023b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023b5:	21 d0                	and    %edx,%eax
c01023b7:	85 c0                	test   %eax,%eax
c01023b9:	74 28                	je     c01023e3 <print_trapframe+0x157>
c01023bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023be:	8b 04 85 80 05 12 c0 	mov    -0x3fedfa80(,%eax,4),%eax
c01023c5:	85 c0                	test   %eax,%eax
c01023c7:	74 1a                	je     c01023e3 <print_trapframe+0x157>
c01023c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023cc:	8b 04 85 80 05 12 c0 	mov    -0x3fedfa80(,%eax,4),%eax
c01023d3:	89 44 24 04          	mov    %eax,0x4(%esp)
c01023d7:	c7 04 24 42 92 10 c0 	movl   $0xc0109242,(%esp)
c01023de:	e8 be de ff ff       	call   c01002a1 <cprintf>
c01023e3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01023e7:	d1 65 f0             	shll   -0x10(%ebp)
c01023ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023ed:	83 f8 17             	cmp    $0x17,%eax
c01023f0:	76 ba                	jbe    c01023ac <print_trapframe+0x120>
c01023f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01023f5:	8b 40 40             	mov    0x40(%eax),%eax
c01023f8:	25 00 30 00 00       	and    $0x3000,%eax
c01023fd:	c1 e8 0c             	shr    $0xc,%eax
c0102400:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102404:	c7 04 24 46 92 10 c0 	movl   $0xc0109246,(%esp)
c010240b:	e8 91 de ff ff       	call   c01002a1 <cprintf>
c0102410:	8b 45 08             	mov    0x8(%ebp),%eax
c0102413:	89 04 24             	mov    %eax,(%esp)
c0102416:	e8 5b fe ff ff       	call   c0102276 <trap_in_kernel>
c010241b:	85 c0                	test   %eax,%eax
c010241d:	75 30                	jne    c010244f <print_trapframe+0x1c3>
c010241f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102422:	8b 40 44             	mov    0x44(%eax),%eax
c0102425:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102429:	c7 04 24 4f 92 10 c0 	movl   $0xc010924f,(%esp)
c0102430:	e8 6c de ff ff       	call   c01002a1 <cprintf>
c0102435:	8b 45 08             	mov    0x8(%ebp),%eax
c0102438:	0f b7 40 48          	movzwl 0x48(%eax),%eax
c010243c:	0f b7 c0             	movzwl %ax,%eax
c010243f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102443:	c7 04 24 5e 92 10 c0 	movl   $0xc010925e,(%esp)
c010244a:	e8 52 de ff ff       	call   c01002a1 <cprintf>
c010244f:	c9                   	leave  
c0102450:	c3                   	ret    

c0102451 <print_regs>:
c0102451:	55                   	push   %ebp
c0102452:	89 e5                	mov    %esp,%ebp
c0102454:	83 ec 18             	sub    $0x18,%esp
c0102457:	8b 45 08             	mov    0x8(%ebp),%eax
c010245a:	8b 00                	mov    (%eax),%eax
c010245c:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102460:	c7 04 24 71 92 10 c0 	movl   $0xc0109271,(%esp)
c0102467:	e8 35 de ff ff       	call   c01002a1 <cprintf>
c010246c:	8b 45 08             	mov    0x8(%ebp),%eax
c010246f:	8b 40 04             	mov    0x4(%eax),%eax
c0102472:	89 44 24 04          	mov    %eax,0x4(%esp)
c0102476:	c7 04 24 80 92 10 c0 	movl   $0xc0109280,(%esp)
c010247d:	e8 1f de ff ff       	call   c01002a1 <cprintf>
c0102482:	8b 45 08             	mov    0x8(%ebp),%eax
c0102485:	8b 40 08             	mov    0x8(%eax),%eax
c0102488:	89 44 24 04          	mov    %eax,0x4(%esp)
c010248c:	c7 04 24 8f 92 10 c0 	movl   $0xc010928f,(%esp)
c0102493:	e8 09 de ff ff       	call   c01002a1 <cprintf>
c0102498:	8b 45 08             	mov    0x8(%ebp),%eax
c010249b:	8b 40 0c             	mov    0xc(%eax),%eax
c010249e:	89 44 24 04          	mov    %eax,0x4(%esp)
c01024a2:	c7 04 24 9e 92 10 c0 	movl   $0xc010929e,(%esp)
c01024a9:	e8 f3 dd ff ff       	call   c01002a1 <cprintf>
c01024ae:	8b 45 08             	mov    0x8(%ebp),%eax
c01024b1:	8b 40 10             	mov    0x10(%eax),%eax
c01024b4:	89 44 24 04          	mov    %eax,0x4(%esp)
c01024b8:	c7 04 24 ad 92 10 c0 	movl   $0xc01092ad,(%esp)
c01024bf:	e8 dd dd ff ff       	call   c01002a1 <cprintf>
c01024c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01024c7:	8b 40 14             	mov    0x14(%eax),%eax
c01024ca:	89 44 24 04          	mov    %eax,0x4(%esp)
c01024ce:	c7 04 24 bc 92 10 c0 	movl   $0xc01092bc,(%esp)
c01024d5:	e8 c7 dd ff ff       	call   c01002a1 <cprintf>
c01024da:	8b 45 08             	mov    0x8(%ebp),%eax
c01024dd:	8b 40 18             	mov    0x18(%eax),%eax
c01024e0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01024e4:	c7 04 24 cb 92 10 c0 	movl   $0xc01092cb,(%esp)
c01024eb:	e8 b1 dd ff ff       	call   c01002a1 <cprintf>
c01024f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01024f3:	8b 40 1c             	mov    0x1c(%eax),%eax
c01024f6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01024fa:	c7 04 24 da 92 10 c0 	movl   $0xc01092da,(%esp)
c0102501:	e8 9b dd ff ff       	call   c01002a1 <cprintf>
c0102506:	c9                   	leave  
c0102507:	c3                   	ret    

c0102508 <print_pgfault>:
c0102508:	55                   	push   %ebp
c0102509:	89 e5                	mov    %esp,%ebp
c010250b:	53                   	push   %ebx
c010250c:	83 ec 34             	sub    $0x34,%esp
c010250f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102512:	8b 40 34             	mov    0x34(%eax),%eax
c0102515:	83 e0 01             	and    $0x1,%eax
c0102518:	85 c0                	test   %eax,%eax
c010251a:	74 07                	je     c0102523 <print_pgfault+0x1b>
c010251c:	b9 e9 92 10 c0       	mov    $0xc01092e9,%ecx
c0102521:	eb 05                	jmp    c0102528 <print_pgfault+0x20>
c0102523:	b9 fa 92 10 c0       	mov    $0xc01092fa,%ecx
c0102528:	8b 45 08             	mov    0x8(%ebp),%eax
c010252b:	8b 40 34             	mov    0x34(%eax),%eax
c010252e:	83 e0 02             	and    $0x2,%eax
c0102531:	85 c0                	test   %eax,%eax
c0102533:	74 07                	je     c010253c <print_pgfault+0x34>
c0102535:	ba 57 00 00 00       	mov    $0x57,%edx
c010253a:	eb 05                	jmp    c0102541 <print_pgfault+0x39>
c010253c:	ba 52 00 00 00       	mov    $0x52,%edx
c0102541:	8b 45 08             	mov    0x8(%ebp),%eax
c0102544:	8b 40 34             	mov    0x34(%eax),%eax
c0102547:	83 e0 04             	and    $0x4,%eax
c010254a:	85 c0                	test   %eax,%eax
c010254c:	74 07                	je     c0102555 <print_pgfault+0x4d>
c010254e:	b8 55 00 00 00       	mov    $0x55,%eax
c0102553:	eb 05                	jmp    c010255a <print_pgfault+0x52>
c0102555:	b8 4b 00 00 00       	mov    $0x4b,%eax
c010255a:	0f 20 d3             	mov    %cr2,%ebx
c010255d:	89 5d f4             	mov    %ebx,-0xc(%ebp)
c0102560:	8b 5d f4             	mov    -0xc(%ebp),%ebx
c0102563:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0102567:	89 54 24 0c          	mov    %edx,0xc(%esp)
c010256b:	89 44 24 08          	mov    %eax,0x8(%esp)
c010256f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0102573:	c7 04 24 08 93 10 c0 	movl   $0xc0109308,(%esp)
c010257a:	e8 22 dd ff ff       	call   c01002a1 <cprintf>
c010257f:	83 c4 34             	add    $0x34,%esp
c0102582:	5b                   	pop    %ebx
c0102583:	5d                   	pop    %ebp
c0102584:	c3                   	ret    

c0102585 <pgfault_handler>:
c0102585:	55                   	push   %ebp
c0102586:	89 e5                	mov    %esp,%ebp
c0102588:	83 ec 28             	sub    $0x28,%esp
c010258b:	8b 45 08             	mov    0x8(%ebp),%eax
c010258e:	89 04 24             	mov    %eax,(%esp)
c0102591:	e8 72 ff ff ff       	call   c0102508 <print_pgfault>
c0102596:	a1 10 40 12 c0       	mov    0xc0124010,%eax
c010259b:	85 c0                	test   %eax,%eax
c010259d:	74 28                	je     c01025c7 <pgfault_handler+0x42>
c010259f:	0f 20 d0             	mov    %cr2,%eax
c01025a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01025a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025a8:	89 c1                	mov    %eax,%ecx
c01025aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ad:	8b 50 34             	mov    0x34(%eax),%edx
c01025b0:	a1 10 40 12 c0       	mov    0xc0124010,%eax
c01025b5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c01025b9:	89 54 24 04          	mov    %edx,0x4(%esp)
c01025bd:	89 04 24             	mov    %eax,(%esp)
c01025c0:	e8 c2 17 00 00       	call   c0103d87 <do_pgfault>
c01025c5:	eb 1c                	jmp    c01025e3 <pgfault_handler+0x5e>
c01025c7:	c7 44 24 08 2b 93 10 	movl   $0xc010932b,0x8(%esp)
c01025ce:	c0 
c01025cf:	c7 44 24 04 a5 00 00 	movl   $0xa5,0x4(%esp)
c01025d6:	00 
c01025d7:	c7 04 24 2e 91 10 c0 	movl   $0xc010912e,(%esp)
c01025de:	e8 15 de ff ff       	call   c01003f8 <__panic>
c01025e3:	c9                   	leave  
c01025e4:	c3                   	ret    

c01025e5 <trap_dispatch>:
c01025e5:	55                   	push   %ebp
c01025e6:	89 e5                	mov    %esp,%ebp
c01025e8:	83 ec 28             	sub    $0x28,%esp
c01025eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01025ee:	8b 40 30             	mov    0x30(%eax),%eax
c01025f1:	83 f8 24             	cmp    $0x24,%eax
c01025f4:	0f 84 c2 00 00 00    	je     c01026bc <trap_dispatch+0xd7>
c01025fa:	83 f8 24             	cmp    $0x24,%eax
c01025fd:	77 18                	ja     c0102617 <trap_dispatch+0x32>
c01025ff:	83 f8 20             	cmp    $0x20,%eax
c0102602:	74 7d                	je     c0102681 <trap_dispatch+0x9c>
c0102604:	83 f8 21             	cmp    $0x21,%eax
c0102607:	0f 84 d5 00 00 00    	je     c01026e2 <trap_dispatch+0xfd>
c010260d:	83 f8 0e             	cmp    $0xe,%eax
c0102610:	74 28                	je     c010263a <trap_dispatch+0x55>
c0102612:	e9 0d 01 00 00       	jmp    c0102724 <trap_dispatch+0x13f>
c0102617:	83 f8 2e             	cmp    $0x2e,%eax
c010261a:	0f 82 04 01 00 00    	jb     c0102724 <trap_dispatch+0x13f>
c0102620:	83 f8 2f             	cmp    $0x2f,%eax
c0102623:	0f 86 33 01 00 00    	jbe    c010275c <trap_dispatch+0x177>
c0102629:	83 e8 78             	sub    $0x78,%eax
c010262c:	83 f8 01             	cmp    $0x1,%eax
c010262f:	0f 87 ef 00 00 00    	ja     c0102724 <trap_dispatch+0x13f>
c0102635:	e9 ce 00 00 00       	jmp    c0102708 <trap_dispatch+0x123>
c010263a:	8b 45 08             	mov    0x8(%ebp),%eax
c010263d:	89 04 24             	mov    %eax,(%esp)
c0102640:	e8 40 ff ff ff       	call   c0102585 <pgfault_handler>
c0102645:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102648:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010264c:	74 2e                	je     c010267c <trap_dispatch+0x97>
c010264e:	8b 45 08             	mov    0x8(%ebp),%eax
c0102651:	89 04 24             	mov    %eax,(%esp)
c0102654:	e8 33 fc ff ff       	call   c010228c <print_trapframe>
c0102659:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010265c:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0102660:	c7 44 24 08 42 93 10 	movl   $0xc0109342,0x8(%esp)
c0102667:	c0 
c0102668:	c7 44 24 04 b5 00 00 	movl   $0xb5,0x4(%esp)
c010266f:	00 
c0102670:	c7 04 24 2e 91 10 c0 	movl   $0xc010912e,(%esp)
c0102677:	e8 7c dd ff ff       	call   c01003f8 <__panic>
c010267c:	e9 dc 00 00 00       	jmp    c010275d <trap_dispatch+0x178>
c0102681:	a1 0c 40 12 c0       	mov    0xc012400c,%eax
c0102686:	83 c0 01             	add    $0x1,%eax
c0102689:	a3 0c 40 12 c0       	mov    %eax,0xc012400c
c010268e:	8b 0d 0c 40 12 c0    	mov    0xc012400c,%ecx
c0102694:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0102699:	89 c8                	mov    %ecx,%eax
c010269b:	f7 e2                	mul    %edx
c010269d:	89 d0                	mov    %edx,%eax
c010269f:	c1 e8 05             	shr    $0x5,%eax
c01026a2:	6b c0 64             	imul   $0x64,%eax,%eax
c01026a5:	29 c1                	sub    %eax,%ecx
c01026a7:	89 c8                	mov    %ecx,%eax
c01026a9:	85 c0                	test   %eax,%eax
c01026ab:	75 0a                	jne    c01026b7 <trap_dispatch+0xd2>
c01026ad:	e8 5f fa ff ff       	call   c0102111 <print_ticks>
c01026b2:	e9 a6 00 00 00       	jmp    c010275d <trap_dispatch+0x178>
c01026b7:	e9 a1 00 00 00       	jmp    c010275d <trap_dispatch+0x178>
c01026bc:	e8 14 f8 ff ff       	call   c0101ed5 <cons_getc>
c01026c1:	88 45 f3             	mov    %al,-0xd(%ebp)
c01026c4:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c01026c8:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
c01026cc:	89 54 24 08          	mov    %edx,0x8(%esp)
c01026d0:	89 44 24 04          	mov    %eax,0x4(%esp)
c01026d4:	c7 04 24 5d 93 10 c0 	movl   $0xc010935d,(%esp)
c01026db:	e8 c1 db ff ff       	call   c01002a1 <cprintf>
c01026e0:	eb 7b                	jmp    c010275d <trap_dispatch+0x178>
c01026e2:	e8 ee f7 ff ff       	call   c0101ed5 <cons_getc>
c01026e7:	88 45 f3             	mov    %al,-0xd(%ebp)
c01026ea:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c01026ee:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
c01026f2:	89 54 24 08          	mov    %edx,0x8(%esp)
c01026f6:	89 44 24 04          	mov    %eax,0x4(%esp)
c01026fa:	c7 04 24 6f 93 10 c0 	movl   $0xc010936f,(%esp)
c0102701:	e8 9b db ff ff       	call   c01002a1 <cprintf>
c0102706:	eb 55                	jmp    c010275d <trap_dispatch+0x178>
c0102708:	c7 44 24 08 7e 93 10 	movl   $0xc010937e,0x8(%esp)
c010270f:	c0 
c0102710:	c7 44 24 04 d3 00 00 	movl   $0xd3,0x4(%esp)
c0102717:	00 
c0102718:	c7 04 24 2e 91 10 c0 	movl   $0xc010912e,(%esp)
c010271f:	e8 d4 dc ff ff       	call   c01003f8 <__panic>
c0102724:	8b 45 08             	mov    0x8(%ebp),%eax
c0102727:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
c010272b:	0f b7 c0             	movzwl %ax,%eax
c010272e:	83 e0 03             	and    $0x3,%eax
c0102731:	85 c0                	test   %eax,%eax
c0102733:	75 28                	jne    c010275d <trap_dispatch+0x178>
c0102735:	8b 45 08             	mov    0x8(%ebp),%eax
c0102738:	89 04 24             	mov    %eax,(%esp)
c010273b:	e8 4c fb ff ff       	call   c010228c <print_trapframe>
c0102740:	c7 44 24 08 8e 93 10 	movl   $0xc010938e,0x8(%esp)
c0102747:	c0 
c0102748:	c7 44 24 04 dd 00 00 	movl   $0xdd,0x4(%esp)
c010274f:	00 
c0102750:	c7 04 24 2e 91 10 c0 	movl   $0xc010912e,(%esp)
c0102757:	e8 9c dc ff ff       	call   c01003f8 <__panic>
c010275c:	90                   	nop
c010275d:	c9                   	leave  
c010275e:	c3                   	ret    

c010275f <trap>:
c010275f:	55                   	push   %ebp
c0102760:	89 e5                	mov    %esp,%ebp
c0102762:	83 ec 18             	sub    $0x18,%esp
c0102765:	8b 45 08             	mov    0x8(%ebp),%eax
c0102768:	89 04 24             	mov    %eax,(%esp)
c010276b:	e8 75 fe ff ff       	call   c01025e5 <trap_dispatch>
c0102770:	c9                   	leave  
c0102771:	c3                   	ret    

c0102772 <vector0>:
c0102772:	6a 00                	push   $0x0
c0102774:	6a 00                	push   $0x0
c0102776:	e9 69 0a 00 00       	jmp    c01031e4 <__alltraps>

c010277b <vector1>:
c010277b:	6a 00                	push   $0x0
c010277d:	6a 01                	push   $0x1
c010277f:	e9 60 0a 00 00       	jmp    c01031e4 <__alltraps>

c0102784 <vector2>:
c0102784:	6a 00                	push   $0x0
c0102786:	6a 02                	push   $0x2
c0102788:	e9 57 0a 00 00       	jmp    c01031e4 <__alltraps>

c010278d <vector3>:
c010278d:	6a 00                	push   $0x0
c010278f:	6a 03                	push   $0x3
c0102791:	e9 4e 0a 00 00       	jmp    c01031e4 <__alltraps>

c0102796 <vector4>:
c0102796:	6a 00                	push   $0x0
c0102798:	6a 04                	push   $0x4
c010279a:	e9 45 0a 00 00       	jmp    c01031e4 <__alltraps>

c010279f <vector5>:
c010279f:	6a 00                	push   $0x0
c01027a1:	6a 05                	push   $0x5
c01027a3:	e9 3c 0a 00 00       	jmp    c01031e4 <__alltraps>

c01027a8 <vector6>:
c01027a8:	6a 00                	push   $0x0
c01027aa:	6a 06                	push   $0x6
c01027ac:	e9 33 0a 00 00       	jmp    c01031e4 <__alltraps>

c01027b1 <vector7>:
c01027b1:	6a 00                	push   $0x0
c01027b3:	6a 07                	push   $0x7
c01027b5:	e9 2a 0a 00 00       	jmp    c01031e4 <__alltraps>

c01027ba <vector8>:
c01027ba:	6a 08                	push   $0x8
c01027bc:	e9 23 0a 00 00       	jmp    c01031e4 <__alltraps>

c01027c1 <vector9>:
c01027c1:	6a 00                	push   $0x0
c01027c3:	6a 09                	push   $0x9
c01027c5:	e9 1a 0a 00 00       	jmp    c01031e4 <__alltraps>

c01027ca <vector10>:
c01027ca:	6a 0a                	push   $0xa
c01027cc:	e9 13 0a 00 00       	jmp    c01031e4 <__alltraps>

c01027d1 <vector11>:
c01027d1:	6a 0b                	push   $0xb
c01027d3:	e9 0c 0a 00 00       	jmp    c01031e4 <__alltraps>

c01027d8 <vector12>:
c01027d8:	6a 0c                	push   $0xc
c01027da:	e9 05 0a 00 00       	jmp    c01031e4 <__alltraps>

c01027df <vector13>:
c01027df:	6a 0d                	push   $0xd
c01027e1:	e9 fe 09 00 00       	jmp    c01031e4 <__alltraps>

c01027e6 <vector14>:
c01027e6:	6a 0e                	push   $0xe
c01027e8:	e9 f7 09 00 00       	jmp    c01031e4 <__alltraps>

c01027ed <vector15>:
c01027ed:	6a 00                	push   $0x0
c01027ef:	6a 0f                	push   $0xf
c01027f1:	e9 ee 09 00 00       	jmp    c01031e4 <__alltraps>

c01027f6 <vector16>:
c01027f6:	6a 00                	push   $0x0
c01027f8:	6a 10                	push   $0x10
c01027fa:	e9 e5 09 00 00       	jmp    c01031e4 <__alltraps>

c01027ff <vector17>:
c01027ff:	6a 11                	push   $0x11
c0102801:	e9 de 09 00 00       	jmp    c01031e4 <__alltraps>

c0102806 <vector18>:
c0102806:	6a 00                	push   $0x0
c0102808:	6a 12                	push   $0x12
c010280a:	e9 d5 09 00 00       	jmp    c01031e4 <__alltraps>

c010280f <vector19>:
c010280f:	6a 00                	push   $0x0
c0102811:	6a 13                	push   $0x13
c0102813:	e9 cc 09 00 00       	jmp    c01031e4 <__alltraps>

c0102818 <vector20>:
c0102818:	6a 00                	push   $0x0
c010281a:	6a 14                	push   $0x14
c010281c:	e9 c3 09 00 00       	jmp    c01031e4 <__alltraps>

c0102821 <vector21>:
c0102821:	6a 00                	push   $0x0
c0102823:	6a 15                	push   $0x15
c0102825:	e9 ba 09 00 00       	jmp    c01031e4 <__alltraps>

c010282a <vector22>:
c010282a:	6a 00                	push   $0x0
c010282c:	6a 16                	push   $0x16
c010282e:	e9 b1 09 00 00       	jmp    c01031e4 <__alltraps>

c0102833 <vector23>:
c0102833:	6a 00                	push   $0x0
c0102835:	6a 17                	push   $0x17
c0102837:	e9 a8 09 00 00       	jmp    c01031e4 <__alltraps>

c010283c <vector24>:
c010283c:	6a 00                	push   $0x0
c010283e:	6a 18                	push   $0x18
c0102840:	e9 9f 09 00 00       	jmp    c01031e4 <__alltraps>

c0102845 <vector25>:
c0102845:	6a 00                	push   $0x0
c0102847:	6a 19                	push   $0x19
c0102849:	e9 96 09 00 00       	jmp    c01031e4 <__alltraps>

c010284e <vector26>:
c010284e:	6a 00                	push   $0x0
c0102850:	6a 1a                	push   $0x1a
c0102852:	e9 8d 09 00 00       	jmp    c01031e4 <__alltraps>

c0102857 <vector27>:
c0102857:	6a 00                	push   $0x0
c0102859:	6a 1b                	push   $0x1b
c010285b:	e9 84 09 00 00       	jmp    c01031e4 <__alltraps>

c0102860 <vector28>:
c0102860:	6a 00                	push   $0x0
c0102862:	6a 1c                	push   $0x1c
c0102864:	e9 7b 09 00 00       	jmp    c01031e4 <__alltraps>

c0102869 <vector29>:
c0102869:	6a 00                	push   $0x0
c010286b:	6a 1d                	push   $0x1d
c010286d:	e9 72 09 00 00       	jmp    c01031e4 <__alltraps>

c0102872 <vector30>:
c0102872:	6a 00                	push   $0x0
c0102874:	6a 1e                	push   $0x1e
c0102876:	e9 69 09 00 00       	jmp    c01031e4 <__alltraps>

c010287b <vector31>:
c010287b:	6a 00                	push   $0x0
c010287d:	6a 1f                	push   $0x1f
c010287f:	e9 60 09 00 00       	jmp    c01031e4 <__alltraps>

c0102884 <vector32>:
c0102884:	6a 00                	push   $0x0
c0102886:	6a 20                	push   $0x20
c0102888:	e9 57 09 00 00       	jmp    c01031e4 <__alltraps>

c010288d <vector33>:
c010288d:	6a 00                	push   $0x0
c010288f:	6a 21                	push   $0x21
c0102891:	e9 4e 09 00 00       	jmp    c01031e4 <__alltraps>

c0102896 <vector34>:
c0102896:	6a 00                	push   $0x0
c0102898:	6a 22                	push   $0x22
c010289a:	e9 45 09 00 00       	jmp    c01031e4 <__alltraps>

c010289f <vector35>:
c010289f:	6a 00                	push   $0x0
c01028a1:	6a 23                	push   $0x23
c01028a3:	e9 3c 09 00 00       	jmp    c01031e4 <__alltraps>

c01028a8 <vector36>:
c01028a8:	6a 00                	push   $0x0
c01028aa:	6a 24                	push   $0x24
c01028ac:	e9 33 09 00 00       	jmp    c01031e4 <__alltraps>

c01028b1 <vector37>:
c01028b1:	6a 00                	push   $0x0
c01028b3:	6a 25                	push   $0x25
c01028b5:	e9 2a 09 00 00       	jmp    c01031e4 <__alltraps>

c01028ba <vector38>:
c01028ba:	6a 00                	push   $0x0
c01028bc:	6a 26                	push   $0x26
c01028be:	e9 21 09 00 00       	jmp    c01031e4 <__alltraps>

c01028c3 <vector39>:
c01028c3:	6a 00                	push   $0x0
c01028c5:	6a 27                	push   $0x27
c01028c7:	e9 18 09 00 00       	jmp    c01031e4 <__alltraps>

c01028cc <vector40>:
c01028cc:	6a 00                	push   $0x0
c01028ce:	6a 28                	push   $0x28
c01028d0:	e9 0f 09 00 00       	jmp    c01031e4 <__alltraps>

c01028d5 <vector41>:
c01028d5:	6a 00                	push   $0x0
c01028d7:	6a 29                	push   $0x29
c01028d9:	e9 06 09 00 00       	jmp    c01031e4 <__alltraps>

c01028de <vector42>:
c01028de:	6a 00                	push   $0x0
c01028e0:	6a 2a                	push   $0x2a
c01028e2:	e9 fd 08 00 00       	jmp    c01031e4 <__alltraps>

c01028e7 <vector43>:
c01028e7:	6a 00                	push   $0x0
c01028e9:	6a 2b                	push   $0x2b
c01028eb:	e9 f4 08 00 00       	jmp    c01031e4 <__alltraps>

c01028f0 <vector44>:
c01028f0:	6a 00                	push   $0x0
c01028f2:	6a 2c                	push   $0x2c
c01028f4:	e9 eb 08 00 00       	jmp    c01031e4 <__alltraps>

c01028f9 <vector45>:
c01028f9:	6a 00                	push   $0x0
c01028fb:	6a 2d                	push   $0x2d
c01028fd:	e9 e2 08 00 00       	jmp    c01031e4 <__alltraps>

c0102902 <vector46>:
c0102902:	6a 00                	push   $0x0
c0102904:	6a 2e                	push   $0x2e
c0102906:	e9 d9 08 00 00       	jmp    c01031e4 <__alltraps>

c010290b <vector47>:
c010290b:	6a 00                	push   $0x0
c010290d:	6a 2f                	push   $0x2f
c010290f:	e9 d0 08 00 00       	jmp    c01031e4 <__alltraps>

c0102914 <vector48>:
c0102914:	6a 00                	push   $0x0
c0102916:	6a 30                	push   $0x30
c0102918:	e9 c7 08 00 00       	jmp    c01031e4 <__alltraps>

c010291d <vector49>:
c010291d:	6a 00                	push   $0x0
c010291f:	6a 31                	push   $0x31
c0102921:	e9 be 08 00 00       	jmp    c01031e4 <__alltraps>

c0102926 <vector50>:
c0102926:	6a 00                	push   $0x0
c0102928:	6a 32                	push   $0x32
c010292a:	e9 b5 08 00 00       	jmp    c01031e4 <__alltraps>

c010292f <vector51>:
c010292f:	6a 00                	push   $0x0
c0102931:	6a 33                	push   $0x33
c0102933:	e9 ac 08 00 00       	jmp    c01031e4 <__alltraps>

c0102938 <vector52>:
c0102938:	6a 00                	push   $0x0
c010293a:	6a 34                	push   $0x34
c010293c:	e9 a3 08 00 00       	jmp    c01031e4 <__alltraps>

c0102941 <vector53>:
c0102941:	6a 00                	push   $0x0
c0102943:	6a 35                	push   $0x35
c0102945:	e9 9a 08 00 00       	jmp    c01031e4 <__alltraps>

c010294a <vector54>:
c010294a:	6a 00                	push   $0x0
c010294c:	6a 36                	push   $0x36
c010294e:	e9 91 08 00 00       	jmp    c01031e4 <__alltraps>

c0102953 <vector55>:
c0102953:	6a 00                	push   $0x0
c0102955:	6a 37                	push   $0x37
c0102957:	e9 88 08 00 00       	jmp    c01031e4 <__alltraps>

c010295c <vector56>:
c010295c:	6a 00                	push   $0x0
c010295e:	6a 38                	push   $0x38
c0102960:	e9 7f 08 00 00       	jmp    c01031e4 <__alltraps>

c0102965 <vector57>:
c0102965:	6a 00                	push   $0x0
c0102967:	6a 39                	push   $0x39
c0102969:	e9 76 08 00 00       	jmp    c01031e4 <__alltraps>

c010296e <vector58>:
c010296e:	6a 00                	push   $0x0
c0102970:	6a 3a                	push   $0x3a
c0102972:	e9 6d 08 00 00       	jmp    c01031e4 <__alltraps>

c0102977 <vector59>:
c0102977:	6a 00                	push   $0x0
c0102979:	6a 3b                	push   $0x3b
c010297b:	e9 64 08 00 00       	jmp    c01031e4 <__alltraps>

c0102980 <vector60>:
c0102980:	6a 00                	push   $0x0
c0102982:	6a 3c                	push   $0x3c
c0102984:	e9 5b 08 00 00       	jmp    c01031e4 <__alltraps>

c0102989 <vector61>:
c0102989:	6a 00                	push   $0x0
c010298b:	6a 3d                	push   $0x3d
c010298d:	e9 52 08 00 00       	jmp    c01031e4 <__alltraps>

c0102992 <vector62>:
c0102992:	6a 00                	push   $0x0
c0102994:	6a 3e                	push   $0x3e
c0102996:	e9 49 08 00 00       	jmp    c01031e4 <__alltraps>

c010299b <vector63>:
c010299b:	6a 00                	push   $0x0
c010299d:	6a 3f                	push   $0x3f
c010299f:	e9 40 08 00 00       	jmp    c01031e4 <__alltraps>

c01029a4 <vector64>:
c01029a4:	6a 00                	push   $0x0
c01029a6:	6a 40                	push   $0x40
c01029a8:	e9 37 08 00 00       	jmp    c01031e4 <__alltraps>

c01029ad <vector65>:
c01029ad:	6a 00                	push   $0x0
c01029af:	6a 41                	push   $0x41
c01029b1:	e9 2e 08 00 00       	jmp    c01031e4 <__alltraps>

c01029b6 <vector66>:
c01029b6:	6a 00                	push   $0x0
c01029b8:	6a 42                	push   $0x42
c01029ba:	e9 25 08 00 00       	jmp    c01031e4 <__alltraps>

c01029bf <vector67>:
c01029bf:	6a 00                	push   $0x0
c01029c1:	6a 43                	push   $0x43
c01029c3:	e9 1c 08 00 00       	jmp    c01031e4 <__alltraps>

c01029c8 <vector68>:
c01029c8:	6a 00                	push   $0x0
c01029ca:	6a 44                	push   $0x44
c01029cc:	e9 13 08 00 00       	jmp    c01031e4 <__alltraps>

c01029d1 <vector69>:
c01029d1:	6a 00                	push   $0x0
c01029d3:	6a 45                	push   $0x45
c01029d5:	e9 0a 08 00 00       	jmp    c01031e4 <__alltraps>

c01029da <vector70>:
c01029da:	6a 00                	push   $0x0
c01029dc:	6a 46                	push   $0x46
c01029de:	e9 01 08 00 00       	jmp    c01031e4 <__alltraps>

c01029e3 <vector71>:
c01029e3:	6a 00                	push   $0x0
c01029e5:	6a 47                	push   $0x47
c01029e7:	e9 f8 07 00 00       	jmp    c01031e4 <__alltraps>

c01029ec <vector72>:
c01029ec:	6a 00                	push   $0x0
c01029ee:	6a 48                	push   $0x48
c01029f0:	e9 ef 07 00 00       	jmp    c01031e4 <__alltraps>

c01029f5 <vector73>:
c01029f5:	6a 00                	push   $0x0
c01029f7:	6a 49                	push   $0x49
c01029f9:	e9 e6 07 00 00       	jmp    c01031e4 <__alltraps>

c01029fe <vector74>:
c01029fe:	6a 00                	push   $0x0
c0102a00:	6a 4a                	push   $0x4a
c0102a02:	e9 dd 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a07 <vector75>:
c0102a07:	6a 00                	push   $0x0
c0102a09:	6a 4b                	push   $0x4b
c0102a0b:	e9 d4 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a10 <vector76>:
c0102a10:	6a 00                	push   $0x0
c0102a12:	6a 4c                	push   $0x4c
c0102a14:	e9 cb 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a19 <vector77>:
c0102a19:	6a 00                	push   $0x0
c0102a1b:	6a 4d                	push   $0x4d
c0102a1d:	e9 c2 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a22 <vector78>:
c0102a22:	6a 00                	push   $0x0
c0102a24:	6a 4e                	push   $0x4e
c0102a26:	e9 b9 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a2b <vector79>:
c0102a2b:	6a 00                	push   $0x0
c0102a2d:	6a 4f                	push   $0x4f
c0102a2f:	e9 b0 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a34 <vector80>:
c0102a34:	6a 00                	push   $0x0
c0102a36:	6a 50                	push   $0x50
c0102a38:	e9 a7 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a3d <vector81>:
c0102a3d:	6a 00                	push   $0x0
c0102a3f:	6a 51                	push   $0x51
c0102a41:	e9 9e 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a46 <vector82>:
c0102a46:	6a 00                	push   $0x0
c0102a48:	6a 52                	push   $0x52
c0102a4a:	e9 95 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a4f <vector83>:
c0102a4f:	6a 00                	push   $0x0
c0102a51:	6a 53                	push   $0x53
c0102a53:	e9 8c 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a58 <vector84>:
c0102a58:	6a 00                	push   $0x0
c0102a5a:	6a 54                	push   $0x54
c0102a5c:	e9 83 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a61 <vector85>:
c0102a61:	6a 00                	push   $0x0
c0102a63:	6a 55                	push   $0x55
c0102a65:	e9 7a 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a6a <vector86>:
c0102a6a:	6a 00                	push   $0x0
c0102a6c:	6a 56                	push   $0x56
c0102a6e:	e9 71 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a73 <vector87>:
c0102a73:	6a 00                	push   $0x0
c0102a75:	6a 57                	push   $0x57
c0102a77:	e9 68 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a7c <vector88>:
c0102a7c:	6a 00                	push   $0x0
c0102a7e:	6a 58                	push   $0x58
c0102a80:	e9 5f 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a85 <vector89>:
c0102a85:	6a 00                	push   $0x0
c0102a87:	6a 59                	push   $0x59
c0102a89:	e9 56 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a8e <vector90>:
c0102a8e:	6a 00                	push   $0x0
c0102a90:	6a 5a                	push   $0x5a
c0102a92:	e9 4d 07 00 00       	jmp    c01031e4 <__alltraps>

c0102a97 <vector91>:
c0102a97:	6a 00                	push   $0x0
c0102a99:	6a 5b                	push   $0x5b
c0102a9b:	e9 44 07 00 00       	jmp    c01031e4 <__alltraps>

c0102aa0 <vector92>:
c0102aa0:	6a 00                	push   $0x0
c0102aa2:	6a 5c                	push   $0x5c
c0102aa4:	e9 3b 07 00 00       	jmp    c01031e4 <__alltraps>

c0102aa9 <vector93>:
c0102aa9:	6a 00                	push   $0x0
c0102aab:	6a 5d                	push   $0x5d
c0102aad:	e9 32 07 00 00       	jmp    c01031e4 <__alltraps>

c0102ab2 <vector94>:
c0102ab2:	6a 00                	push   $0x0
c0102ab4:	6a 5e                	push   $0x5e
c0102ab6:	e9 29 07 00 00       	jmp    c01031e4 <__alltraps>

c0102abb <vector95>:
c0102abb:	6a 00                	push   $0x0
c0102abd:	6a 5f                	push   $0x5f
c0102abf:	e9 20 07 00 00       	jmp    c01031e4 <__alltraps>

c0102ac4 <vector96>:
c0102ac4:	6a 00                	push   $0x0
c0102ac6:	6a 60                	push   $0x60
c0102ac8:	e9 17 07 00 00       	jmp    c01031e4 <__alltraps>

c0102acd <vector97>:
c0102acd:	6a 00                	push   $0x0
c0102acf:	6a 61                	push   $0x61
c0102ad1:	e9 0e 07 00 00       	jmp    c01031e4 <__alltraps>

c0102ad6 <vector98>:
c0102ad6:	6a 00                	push   $0x0
c0102ad8:	6a 62                	push   $0x62
c0102ada:	e9 05 07 00 00       	jmp    c01031e4 <__alltraps>

c0102adf <vector99>:
c0102adf:	6a 00                	push   $0x0
c0102ae1:	6a 63                	push   $0x63
c0102ae3:	e9 fc 06 00 00       	jmp    c01031e4 <__alltraps>

c0102ae8 <vector100>:
c0102ae8:	6a 00                	push   $0x0
c0102aea:	6a 64                	push   $0x64
c0102aec:	e9 f3 06 00 00       	jmp    c01031e4 <__alltraps>

c0102af1 <vector101>:
c0102af1:	6a 00                	push   $0x0
c0102af3:	6a 65                	push   $0x65
c0102af5:	e9 ea 06 00 00       	jmp    c01031e4 <__alltraps>

c0102afa <vector102>:
c0102afa:	6a 00                	push   $0x0
c0102afc:	6a 66                	push   $0x66
c0102afe:	e9 e1 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b03 <vector103>:
c0102b03:	6a 00                	push   $0x0
c0102b05:	6a 67                	push   $0x67
c0102b07:	e9 d8 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b0c <vector104>:
c0102b0c:	6a 00                	push   $0x0
c0102b0e:	6a 68                	push   $0x68
c0102b10:	e9 cf 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b15 <vector105>:
c0102b15:	6a 00                	push   $0x0
c0102b17:	6a 69                	push   $0x69
c0102b19:	e9 c6 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b1e <vector106>:
c0102b1e:	6a 00                	push   $0x0
c0102b20:	6a 6a                	push   $0x6a
c0102b22:	e9 bd 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b27 <vector107>:
c0102b27:	6a 00                	push   $0x0
c0102b29:	6a 6b                	push   $0x6b
c0102b2b:	e9 b4 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b30 <vector108>:
c0102b30:	6a 00                	push   $0x0
c0102b32:	6a 6c                	push   $0x6c
c0102b34:	e9 ab 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b39 <vector109>:
c0102b39:	6a 00                	push   $0x0
c0102b3b:	6a 6d                	push   $0x6d
c0102b3d:	e9 a2 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b42 <vector110>:
c0102b42:	6a 00                	push   $0x0
c0102b44:	6a 6e                	push   $0x6e
c0102b46:	e9 99 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b4b <vector111>:
c0102b4b:	6a 00                	push   $0x0
c0102b4d:	6a 6f                	push   $0x6f
c0102b4f:	e9 90 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b54 <vector112>:
c0102b54:	6a 00                	push   $0x0
c0102b56:	6a 70                	push   $0x70
c0102b58:	e9 87 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b5d <vector113>:
c0102b5d:	6a 00                	push   $0x0
c0102b5f:	6a 71                	push   $0x71
c0102b61:	e9 7e 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b66 <vector114>:
c0102b66:	6a 00                	push   $0x0
c0102b68:	6a 72                	push   $0x72
c0102b6a:	e9 75 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b6f <vector115>:
c0102b6f:	6a 00                	push   $0x0
c0102b71:	6a 73                	push   $0x73
c0102b73:	e9 6c 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b78 <vector116>:
c0102b78:	6a 00                	push   $0x0
c0102b7a:	6a 74                	push   $0x74
c0102b7c:	e9 63 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b81 <vector117>:
c0102b81:	6a 00                	push   $0x0
c0102b83:	6a 75                	push   $0x75
c0102b85:	e9 5a 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b8a <vector118>:
c0102b8a:	6a 00                	push   $0x0
c0102b8c:	6a 76                	push   $0x76
c0102b8e:	e9 51 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b93 <vector119>:
c0102b93:	6a 00                	push   $0x0
c0102b95:	6a 77                	push   $0x77
c0102b97:	e9 48 06 00 00       	jmp    c01031e4 <__alltraps>

c0102b9c <vector120>:
c0102b9c:	6a 00                	push   $0x0
c0102b9e:	6a 78                	push   $0x78
c0102ba0:	e9 3f 06 00 00       	jmp    c01031e4 <__alltraps>

c0102ba5 <vector121>:
c0102ba5:	6a 00                	push   $0x0
c0102ba7:	6a 79                	push   $0x79
c0102ba9:	e9 36 06 00 00       	jmp    c01031e4 <__alltraps>

c0102bae <vector122>:
c0102bae:	6a 00                	push   $0x0
c0102bb0:	6a 7a                	push   $0x7a
c0102bb2:	e9 2d 06 00 00       	jmp    c01031e4 <__alltraps>

c0102bb7 <vector123>:
c0102bb7:	6a 00                	push   $0x0
c0102bb9:	6a 7b                	push   $0x7b
c0102bbb:	e9 24 06 00 00       	jmp    c01031e4 <__alltraps>

c0102bc0 <vector124>:
c0102bc0:	6a 00                	push   $0x0
c0102bc2:	6a 7c                	push   $0x7c
c0102bc4:	e9 1b 06 00 00       	jmp    c01031e4 <__alltraps>

c0102bc9 <vector125>:
c0102bc9:	6a 00                	push   $0x0
c0102bcb:	6a 7d                	push   $0x7d
c0102bcd:	e9 12 06 00 00       	jmp    c01031e4 <__alltraps>

c0102bd2 <vector126>:
c0102bd2:	6a 00                	push   $0x0
c0102bd4:	6a 7e                	push   $0x7e
c0102bd6:	e9 09 06 00 00       	jmp    c01031e4 <__alltraps>

c0102bdb <vector127>:
c0102bdb:	6a 00                	push   $0x0
c0102bdd:	6a 7f                	push   $0x7f
c0102bdf:	e9 00 06 00 00       	jmp    c01031e4 <__alltraps>

c0102be4 <vector128>:
c0102be4:	6a 00                	push   $0x0
c0102be6:	68 80 00 00 00       	push   $0x80
c0102beb:	e9 f4 05 00 00       	jmp    c01031e4 <__alltraps>

c0102bf0 <vector129>:
c0102bf0:	6a 00                	push   $0x0
c0102bf2:	68 81 00 00 00       	push   $0x81
c0102bf7:	e9 e8 05 00 00       	jmp    c01031e4 <__alltraps>

c0102bfc <vector130>:
c0102bfc:	6a 00                	push   $0x0
c0102bfe:	68 82 00 00 00       	push   $0x82
c0102c03:	e9 dc 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c08 <vector131>:
c0102c08:	6a 00                	push   $0x0
c0102c0a:	68 83 00 00 00       	push   $0x83
c0102c0f:	e9 d0 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c14 <vector132>:
c0102c14:	6a 00                	push   $0x0
c0102c16:	68 84 00 00 00       	push   $0x84
c0102c1b:	e9 c4 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c20 <vector133>:
c0102c20:	6a 00                	push   $0x0
c0102c22:	68 85 00 00 00       	push   $0x85
c0102c27:	e9 b8 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c2c <vector134>:
c0102c2c:	6a 00                	push   $0x0
c0102c2e:	68 86 00 00 00       	push   $0x86
c0102c33:	e9 ac 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c38 <vector135>:
c0102c38:	6a 00                	push   $0x0
c0102c3a:	68 87 00 00 00       	push   $0x87
c0102c3f:	e9 a0 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c44 <vector136>:
c0102c44:	6a 00                	push   $0x0
c0102c46:	68 88 00 00 00       	push   $0x88
c0102c4b:	e9 94 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c50 <vector137>:
c0102c50:	6a 00                	push   $0x0
c0102c52:	68 89 00 00 00       	push   $0x89
c0102c57:	e9 88 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c5c <vector138>:
c0102c5c:	6a 00                	push   $0x0
c0102c5e:	68 8a 00 00 00       	push   $0x8a
c0102c63:	e9 7c 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c68 <vector139>:
c0102c68:	6a 00                	push   $0x0
c0102c6a:	68 8b 00 00 00       	push   $0x8b
c0102c6f:	e9 70 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c74 <vector140>:
c0102c74:	6a 00                	push   $0x0
c0102c76:	68 8c 00 00 00       	push   $0x8c
c0102c7b:	e9 64 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c80 <vector141>:
c0102c80:	6a 00                	push   $0x0
c0102c82:	68 8d 00 00 00       	push   $0x8d
c0102c87:	e9 58 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c8c <vector142>:
c0102c8c:	6a 00                	push   $0x0
c0102c8e:	68 8e 00 00 00       	push   $0x8e
c0102c93:	e9 4c 05 00 00       	jmp    c01031e4 <__alltraps>

c0102c98 <vector143>:
c0102c98:	6a 00                	push   $0x0
c0102c9a:	68 8f 00 00 00       	push   $0x8f
c0102c9f:	e9 40 05 00 00       	jmp    c01031e4 <__alltraps>

c0102ca4 <vector144>:
c0102ca4:	6a 00                	push   $0x0
c0102ca6:	68 90 00 00 00       	push   $0x90
c0102cab:	e9 34 05 00 00       	jmp    c01031e4 <__alltraps>

c0102cb0 <vector145>:
c0102cb0:	6a 00                	push   $0x0
c0102cb2:	68 91 00 00 00       	push   $0x91
c0102cb7:	e9 28 05 00 00       	jmp    c01031e4 <__alltraps>

c0102cbc <vector146>:
c0102cbc:	6a 00                	push   $0x0
c0102cbe:	68 92 00 00 00       	push   $0x92
c0102cc3:	e9 1c 05 00 00       	jmp    c01031e4 <__alltraps>

c0102cc8 <vector147>:
c0102cc8:	6a 00                	push   $0x0
c0102cca:	68 93 00 00 00       	push   $0x93
c0102ccf:	e9 10 05 00 00       	jmp    c01031e4 <__alltraps>

c0102cd4 <vector148>:
c0102cd4:	6a 00                	push   $0x0
c0102cd6:	68 94 00 00 00       	push   $0x94
c0102cdb:	e9 04 05 00 00       	jmp    c01031e4 <__alltraps>

c0102ce0 <vector149>:
c0102ce0:	6a 00                	push   $0x0
c0102ce2:	68 95 00 00 00       	push   $0x95
c0102ce7:	e9 f8 04 00 00       	jmp    c01031e4 <__alltraps>

c0102cec <vector150>:
c0102cec:	6a 00                	push   $0x0
c0102cee:	68 96 00 00 00       	push   $0x96
c0102cf3:	e9 ec 04 00 00       	jmp    c01031e4 <__alltraps>

c0102cf8 <vector151>:
c0102cf8:	6a 00                	push   $0x0
c0102cfa:	68 97 00 00 00       	push   $0x97
c0102cff:	e9 e0 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d04 <vector152>:
c0102d04:	6a 00                	push   $0x0
c0102d06:	68 98 00 00 00       	push   $0x98
c0102d0b:	e9 d4 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d10 <vector153>:
c0102d10:	6a 00                	push   $0x0
c0102d12:	68 99 00 00 00       	push   $0x99
c0102d17:	e9 c8 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d1c <vector154>:
c0102d1c:	6a 00                	push   $0x0
c0102d1e:	68 9a 00 00 00       	push   $0x9a
c0102d23:	e9 bc 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d28 <vector155>:
c0102d28:	6a 00                	push   $0x0
c0102d2a:	68 9b 00 00 00       	push   $0x9b
c0102d2f:	e9 b0 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d34 <vector156>:
c0102d34:	6a 00                	push   $0x0
c0102d36:	68 9c 00 00 00       	push   $0x9c
c0102d3b:	e9 a4 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d40 <vector157>:
c0102d40:	6a 00                	push   $0x0
c0102d42:	68 9d 00 00 00       	push   $0x9d
c0102d47:	e9 98 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d4c <vector158>:
c0102d4c:	6a 00                	push   $0x0
c0102d4e:	68 9e 00 00 00       	push   $0x9e
c0102d53:	e9 8c 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d58 <vector159>:
c0102d58:	6a 00                	push   $0x0
c0102d5a:	68 9f 00 00 00       	push   $0x9f
c0102d5f:	e9 80 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d64 <vector160>:
c0102d64:	6a 00                	push   $0x0
c0102d66:	68 a0 00 00 00       	push   $0xa0
c0102d6b:	e9 74 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d70 <vector161>:
c0102d70:	6a 00                	push   $0x0
c0102d72:	68 a1 00 00 00       	push   $0xa1
c0102d77:	e9 68 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d7c <vector162>:
c0102d7c:	6a 00                	push   $0x0
c0102d7e:	68 a2 00 00 00       	push   $0xa2
c0102d83:	e9 5c 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d88 <vector163>:
c0102d88:	6a 00                	push   $0x0
c0102d8a:	68 a3 00 00 00       	push   $0xa3
c0102d8f:	e9 50 04 00 00       	jmp    c01031e4 <__alltraps>

c0102d94 <vector164>:
c0102d94:	6a 00                	push   $0x0
c0102d96:	68 a4 00 00 00       	push   $0xa4
c0102d9b:	e9 44 04 00 00       	jmp    c01031e4 <__alltraps>

c0102da0 <vector165>:
c0102da0:	6a 00                	push   $0x0
c0102da2:	68 a5 00 00 00       	push   $0xa5
c0102da7:	e9 38 04 00 00       	jmp    c01031e4 <__alltraps>

c0102dac <vector166>:
c0102dac:	6a 00                	push   $0x0
c0102dae:	68 a6 00 00 00       	push   $0xa6
c0102db3:	e9 2c 04 00 00       	jmp    c01031e4 <__alltraps>

c0102db8 <vector167>:
c0102db8:	6a 00                	push   $0x0
c0102dba:	68 a7 00 00 00       	push   $0xa7
c0102dbf:	e9 20 04 00 00       	jmp    c01031e4 <__alltraps>

c0102dc4 <vector168>:
c0102dc4:	6a 00                	push   $0x0
c0102dc6:	68 a8 00 00 00       	push   $0xa8
c0102dcb:	e9 14 04 00 00       	jmp    c01031e4 <__alltraps>

c0102dd0 <vector169>:
c0102dd0:	6a 00                	push   $0x0
c0102dd2:	68 a9 00 00 00       	push   $0xa9
c0102dd7:	e9 08 04 00 00       	jmp    c01031e4 <__alltraps>

c0102ddc <vector170>:
c0102ddc:	6a 00                	push   $0x0
c0102dde:	68 aa 00 00 00       	push   $0xaa
c0102de3:	e9 fc 03 00 00       	jmp    c01031e4 <__alltraps>

c0102de8 <vector171>:
c0102de8:	6a 00                	push   $0x0
c0102dea:	68 ab 00 00 00       	push   $0xab
c0102def:	e9 f0 03 00 00       	jmp    c01031e4 <__alltraps>

c0102df4 <vector172>:
c0102df4:	6a 00                	push   $0x0
c0102df6:	68 ac 00 00 00       	push   $0xac
c0102dfb:	e9 e4 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e00 <vector173>:
c0102e00:	6a 00                	push   $0x0
c0102e02:	68 ad 00 00 00       	push   $0xad
c0102e07:	e9 d8 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e0c <vector174>:
c0102e0c:	6a 00                	push   $0x0
c0102e0e:	68 ae 00 00 00       	push   $0xae
c0102e13:	e9 cc 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e18 <vector175>:
c0102e18:	6a 00                	push   $0x0
c0102e1a:	68 af 00 00 00       	push   $0xaf
c0102e1f:	e9 c0 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e24 <vector176>:
c0102e24:	6a 00                	push   $0x0
c0102e26:	68 b0 00 00 00       	push   $0xb0
c0102e2b:	e9 b4 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e30 <vector177>:
c0102e30:	6a 00                	push   $0x0
c0102e32:	68 b1 00 00 00       	push   $0xb1
c0102e37:	e9 a8 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e3c <vector178>:
c0102e3c:	6a 00                	push   $0x0
c0102e3e:	68 b2 00 00 00       	push   $0xb2
c0102e43:	e9 9c 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e48 <vector179>:
c0102e48:	6a 00                	push   $0x0
c0102e4a:	68 b3 00 00 00       	push   $0xb3
c0102e4f:	e9 90 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e54 <vector180>:
c0102e54:	6a 00                	push   $0x0
c0102e56:	68 b4 00 00 00       	push   $0xb4
c0102e5b:	e9 84 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e60 <vector181>:
c0102e60:	6a 00                	push   $0x0
c0102e62:	68 b5 00 00 00       	push   $0xb5
c0102e67:	e9 78 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e6c <vector182>:
c0102e6c:	6a 00                	push   $0x0
c0102e6e:	68 b6 00 00 00       	push   $0xb6
c0102e73:	e9 6c 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e78 <vector183>:
c0102e78:	6a 00                	push   $0x0
c0102e7a:	68 b7 00 00 00       	push   $0xb7
c0102e7f:	e9 60 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e84 <vector184>:
c0102e84:	6a 00                	push   $0x0
c0102e86:	68 b8 00 00 00       	push   $0xb8
c0102e8b:	e9 54 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e90 <vector185>:
c0102e90:	6a 00                	push   $0x0
c0102e92:	68 b9 00 00 00       	push   $0xb9
c0102e97:	e9 48 03 00 00       	jmp    c01031e4 <__alltraps>

c0102e9c <vector186>:
c0102e9c:	6a 00                	push   $0x0
c0102e9e:	68 ba 00 00 00       	push   $0xba
c0102ea3:	e9 3c 03 00 00       	jmp    c01031e4 <__alltraps>

c0102ea8 <vector187>:
c0102ea8:	6a 00                	push   $0x0
c0102eaa:	68 bb 00 00 00       	push   $0xbb
c0102eaf:	e9 30 03 00 00       	jmp    c01031e4 <__alltraps>

c0102eb4 <vector188>:
c0102eb4:	6a 00                	push   $0x0
c0102eb6:	68 bc 00 00 00       	push   $0xbc
c0102ebb:	e9 24 03 00 00       	jmp    c01031e4 <__alltraps>

c0102ec0 <vector189>:
c0102ec0:	6a 00                	push   $0x0
c0102ec2:	68 bd 00 00 00       	push   $0xbd
c0102ec7:	e9 18 03 00 00       	jmp    c01031e4 <__alltraps>

c0102ecc <vector190>:
c0102ecc:	6a 00                	push   $0x0
c0102ece:	68 be 00 00 00       	push   $0xbe
c0102ed3:	e9 0c 03 00 00       	jmp    c01031e4 <__alltraps>

c0102ed8 <vector191>:
c0102ed8:	6a 00                	push   $0x0
c0102eda:	68 bf 00 00 00       	push   $0xbf
c0102edf:	e9 00 03 00 00       	jmp    c01031e4 <__alltraps>

c0102ee4 <vector192>:
c0102ee4:	6a 00                	push   $0x0
c0102ee6:	68 c0 00 00 00       	push   $0xc0
c0102eeb:	e9 f4 02 00 00       	jmp    c01031e4 <__alltraps>

c0102ef0 <vector193>:
c0102ef0:	6a 00                	push   $0x0
c0102ef2:	68 c1 00 00 00       	push   $0xc1
c0102ef7:	e9 e8 02 00 00       	jmp    c01031e4 <__alltraps>

c0102efc <vector194>:
c0102efc:	6a 00                	push   $0x0
c0102efe:	68 c2 00 00 00       	push   $0xc2
c0102f03:	e9 dc 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f08 <vector195>:
c0102f08:	6a 00                	push   $0x0
c0102f0a:	68 c3 00 00 00       	push   $0xc3
c0102f0f:	e9 d0 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f14 <vector196>:
c0102f14:	6a 00                	push   $0x0
c0102f16:	68 c4 00 00 00       	push   $0xc4
c0102f1b:	e9 c4 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f20 <vector197>:
c0102f20:	6a 00                	push   $0x0
c0102f22:	68 c5 00 00 00       	push   $0xc5
c0102f27:	e9 b8 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f2c <vector198>:
c0102f2c:	6a 00                	push   $0x0
c0102f2e:	68 c6 00 00 00       	push   $0xc6
c0102f33:	e9 ac 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f38 <vector199>:
c0102f38:	6a 00                	push   $0x0
c0102f3a:	68 c7 00 00 00       	push   $0xc7
c0102f3f:	e9 a0 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f44 <vector200>:
c0102f44:	6a 00                	push   $0x0
c0102f46:	68 c8 00 00 00       	push   $0xc8
c0102f4b:	e9 94 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f50 <vector201>:
c0102f50:	6a 00                	push   $0x0
c0102f52:	68 c9 00 00 00       	push   $0xc9
c0102f57:	e9 88 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f5c <vector202>:
c0102f5c:	6a 00                	push   $0x0
c0102f5e:	68 ca 00 00 00       	push   $0xca
c0102f63:	e9 7c 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f68 <vector203>:
c0102f68:	6a 00                	push   $0x0
c0102f6a:	68 cb 00 00 00       	push   $0xcb
c0102f6f:	e9 70 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f74 <vector204>:
c0102f74:	6a 00                	push   $0x0
c0102f76:	68 cc 00 00 00       	push   $0xcc
c0102f7b:	e9 64 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f80 <vector205>:
c0102f80:	6a 00                	push   $0x0
c0102f82:	68 cd 00 00 00       	push   $0xcd
c0102f87:	e9 58 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f8c <vector206>:
c0102f8c:	6a 00                	push   $0x0
c0102f8e:	68 ce 00 00 00       	push   $0xce
c0102f93:	e9 4c 02 00 00       	jmp    c01031e4 <__alltraps>

c0102f98 <vector207>:
c0102f98:	6a 00                	push   $0x0
c0102f9a:	68 cf 00 00 00       	push   $0xcf
c0102f9f:	e9 40 02 00 00       	jmp    c01031e4 <__alltraps>

c0102fa4 <vector208>:
c0102fa4:	6a 00                	push   $0x0
c0102fa6:	68 d0 00 00 00       	push   $0xd0
c0102fab:	e9 34 02 00 00       	jmp    c01031e4 <__alltraps>

c0102fb0 <vector209>:
c0102fb0:	6a 00                	push   $0x0
c0102fb2:	68 d1 00 00 00       	push   $0xd1
c0102fb7:	e9 28 02 00 00       	jmp    c01031e4 <__alltraps>

c0102fbc <vector210>:
c0102fbc:	6a 00                	push   $0x0
c0102fbe:	68 d2 00 00 00       	push   $0xd2
c0102fc3:	e9 1c 02 00 00       	jmp    c01031e4 <__alltraps>

c0102fc8 <vector211>:
c0102fc8:	6a 00                	push   $0x0
c0102fca:	68 d3 00 00 00       	push   $0xd3
c0102fcf:	e9 10 02 00 00       	jmp    c01031e4 <__alltraps>

c0102fd4 <vector212>:
c0102fd4:	6a 00                	push   $0x0
c0102fd6:	68 d4 00 00 00       	push   $0xd4
c0102fdb:	e9 04 02 00 00       	jmp    c01031e4 <__alltraps>

c0102fe0 <vector213>:
c0102fe0:	6a 00                	push   $0x0
c0102fe2:	68 d5 00 00 00       	push   $0xd5
c0102fe7:	e9 f8 01 00 00       	jmp    c01031e4 <__alltraps>

c0102fec <vector214>:
c0102fec:	6a 00                	push   $0x0
c0102fee:	68 d6 00 00 00       	push   $0xd6
c0102ff3:	e9 ec 01 00 00       	jmp    c01031e4 <__alltraps>

c0102ff8 <vector215>:
c0102ff8:	6a 00                	push   $0x0
c0102ffa:	68 d7 00 00 00       	push   $0xd7
c0102fff:	e9 e0 01 00 00       	jmp    c01031e4 <__alltraps>

c0103004 <vector216>:
c0103004:	6a 00                	push   $0x0
c0103006:	68 d8 00 00 00       	push   $0xd8
c010300b:	e9 d4 01 00 00       	jmp    c01031e4 <__alltraps>

c0103010 <vector217>:
c0103010:	6a 00                	push   $0x0
c0103012:	68 d9 00 00 00       	push   $0xd9
c0103017:	e9 c8 01 00 00       	jmp    c01031e4 <__alltraps>

c010301c <vector218>:
c010301c:	6a 00                	push   $0x0
c010301e:	68 da 00 00 00       	push   $0xda
c0103023:	e9 bc 01 00 00       	jmp    c01031e4 <__alltraps>

c0103028 <vector219>:
c0103028:	6a 00                	push   $0x0
c010302a:	68 db 00 00 00       	push   $0xdb
c010302f:	e9 b0 01 00 00       	jmp    c01031e4 <__alltraps>

c0103034 <vector220>:
c0103034:	6a 00                	push   $0x0
c0103036:	68 dc 00 00 00       	push   $0xdc
c010303b:	e9 a4 01 00 00       	jmp    c01031e4 <__alltraps>

c0103040 <vector221>:
c0103040:	6a 00                	push   $0x0
c0103042:	68 dd 00 00 00       	push   $0xdd
c0103047:	e9 98 01 00 00       	jmp    c01031e4 <__alltraps>

c010304c <vector222>:
c010304c:	6a 00                	push   $0x0
c010304e:	68 de 00 00 00       	push   $0xde
c0103053:	e9 8c 01 00 00       	jmp    c01031e4 <__alltraps>

c0103058 <vector223>:
c0103058:	6a 00                	push   $0x0
c010305a:	68 df 00 00 00       	push   $0xdf
c010305f:	e9 80 01 00 00       	jmp    c01031e4 <__alltraps>

c0103064 <vector224>:
c0103064:	6a 00                	push   $0x0
c0103066:	68 e0 00 00 00       	push   $0xe0
c010306b:	e9 74 01 00 00       	jmp    c01031e4 <__alltraps>

c0103070 <vector225>:
c0103070:	6a 00                	push   $0x0
c0103072:	68 e1 00 00 00       	push   $0xe1
c0103077:	e9 68 01 00 00       	jmp    c01031e4 <__alltraps>

c010307c <vector226>:
c010307c:	6a 00                	push   $0x0
c010307e:	68 e2 00 00 00       	push   $0xe2
c0103083:	e9 5c 01 00 00       	jmp    c01031e4 <__alltraps>

c0103088 <vector227>:
c0103088:	6a 00                	push   $0x0
c010308a:	68 e3 00 00 00       	push   $0xe3
c010308f:	e9 50 01 00 00       	jmp    c01031e4 <__alltraps>

c0103094 <vector228>:
c0103094:	6a 00                	push   $0x0
c0103096:	68 e4 00 00 00       	push   $0xe4
c010309b:	e9 44 01 00 00       	jmp    c01031e4 <__alltraps>

c01030a0 <vector229>:
c01030a0:	6a 00                	push   $0x0
c01030a2:	68 e5 00 00 00       	push   $0xe5
c01030a7:	e9 38 01 00 00       	jmp    c01031e4 <__alltraps>

c01030ac <vector230>:
c01030ac:	6a 00                	push   $0x0
c01030ae:	68 e6 00 00 00       	push   $0xe6
c01030b3:	e9 2c 01 00 00       	jmp    c01031e4 <__alltraps>

c01030b8 <vector231>:
c01030b8:	6a 00                	push   $0x0
c01030ba:	68 e7 00 00 00       	push   $0xe7
c01030bf:	e9 20 01 00 00       	jmp    c01031e4 <__alltraps>

c01030c4 <vector232>:
c01030c4:	6a 00                	push   $0x0
c01030c6:	68 e8 00 00 00       	push   $0xe8
c01030cb:	e9 14 01 00 00       	jmp    c01031e4 <__alltraps>

c01030d0 <vector233>:
c01030d0:	6a 00                	push   $0x0
c01030d2:	68 e9 00 00 00       	push   $0xe9
c01030d7:	e9 08 01 00 00       	jmp    c01031e4 <__alltraps>

c01030dc <vector234>:
c01030dc:	6a 00                	push   $0x0
c01030de:	68 ea 00 00 00       	push   $0xea
c01030e3:	e9 fc 00 00 00       	jmp    c01031e4 <__alltraps>

c01030e8 <vector235>:
c01030e8:	6a 00                	push   $0x0
c01030ea:	68 eb 00 00 00       	push   $0xeb
c01030ef:	e9 f0 00 00 00       	jmp    c01031e4 <__alltraps>

c01030f4 <vector236>:
c01030f4:	6a 00                	push   $0x0
c01030f6:	68 ec 00 00 00       	push   $0xec
c01030fb:	e9 e4 00 00 00       	jmp    c01031e4 <__alltraps>

c0103100 <vector237>:
c0103100:	6a 00                	push   $0x0
c0103102:	68 ed 00 00 00       	push   $0xed
c0103107:	e9 d8 00 00 00       	jmp    c01031e4 <__alltraps>

c010310c <vector238>:
c010310c:	6a 00                	push   $0x0
c010310e:	68 ee 00 00 00       	push   $0xee
c0103113:	e9 cc 00 00 00       	jmp    c01031e4 <__alltraps>

c0103118 <vector239>:
c0103118:	6a 00                	push   $0x0
c010311a:	68 ef 00 00 00       	push   $0xef
c010311f:	e9 c0 00 00 00       	jmp    c01031e4 <__alltraps>

c0103124 <vector240>:
c0103124:	6a 00                	push   $0x0
c0103126:	68 f0 00 00 00       	push   $0xf0
c010312b:	e9 b4 00 00 00       	jmp    c01031e4 <__alltraps>

c0103130 <vector241>:
c0103130:	6a 00                	push   $0x0
c0103132:	68 f1 00 00 00       	push   $0xf1
c0103137:	e9 a8 00 00 00       	jmp    c01031e4 <__alltraps>

c010313c <vector242>:
c010313c:	6a 00                	push   $0x0
c010313e:	68 f2 00 00 00       	push   $0xf2
c0103143:	e9 9c 00 00 00       	jmp    c01031e4 <__alltraps>

c0103148 <vector243>:
c0103148:	6a 00                	push   $0x0
c010314a:	68 f3 00 00 00       	push   $0xf3
c010314f:	e9 90 00 00 00       	jmp    c01031e4 <__alltraps>

c0103154 <vector244>:
c0103154:	6a 00                	push   $0x0
c0103156:	68 f4 00 00 00       	push   $0xf4
c010315b:	e9 84 00 00 00       	jmp    c01031e4 <__alltraps>

c0103160 <vector245>:
c0103160:	6a 00                	push   $0x0
c0103162:	68 f5 00 00 00       	push   $0xf5
c0103167:	e9 78 00 00 00       	jmp    c01031e4 <__alltraps>

c010316c <vector246>:
c010316c:	6a 00                	push   $0x0
c010316e:	68 f6 00 00 00       	push   $0xf6
c0103173:	e9 6c 00 00 00       	jmp    c01031e4 <__alltraps>

c0103178 <vector247>:
c0103178:	6a 00                	push   $0x0
c010317a:	68 f7 00 00 00       	push   $0xf7
c010317f:	e9 60 00 00 00       	jmp    c01031e4 <__alltraps>

c0103184 <vector248>:
c0103184:	6a 00                	push   $0x0
c0103186:	68 f8 00 00 00       	push   $0xf8
c010318b:	e9 54 00 00 00       	jmp    c01031e4 <__alltraps>

c0103190 <vector249>:
c0103190:	6a 00                	push   $0x0
c0103192:	68 f9 00 00 00       	push   $0xf9
c0103197:	e9 48 00 00 00       	jmp    c01031e4 <__alltraps>

c010319c <vector250>:
c010319c:	6a 00                	push   $0x0
c010319e:	68 fa 00 00 00       	push   $0xfa
c01031a3:	e9 3c 00 00 00       	jmp    c01031e4 <__alltraps>

c01031a8 <vector251>:
c01031a8:	6a 00                	push   $0x0
c01031aa:	68 fb 00 00 00       	push   $0xfb
c01031af:	e9 30 00 00 00       	jmp    c01031e4 <__alltraps>

c01031b4 <vector252>:
c01031b4:	6a 00                	push   $0x0
c01031b6:	68 fc 00 00 00       	push   $0xfc
c01031bb:	e9 24 00 00 00       	jmp    c01031e4 <__alltraps>

c01031c0 <vector253>:
c01031c0:	6a 00                	push   $0x0
c01031c2:	68 fd 00 00 00       	push   $0xfd
c01031c7:	e9 18 00 00 00       	jmp    c01031e4 <__alltraps>

c01031cc <vector254>:
c01031cc:	6a 00                	push   $0x0
c01031ce:	68 fe 00 00 00       	push   $0xfe
c01031d3:	e9 0c 00 00 00       	jmp    c01031e4 <__alltraps>

c01031d8 <vector255>:
c01031d8:	6a 00                	push   $0x0
c01031da:	68 ff 00 00 00       	push   $0xff
c01031df:	e9 00 00 00 00       	jmp    c01031e4 <__alltraps>

c01031e4 <__alltraps>:
c01031e4:	1e                   	push   %ds
c01031e5:	06                   	push   %es
c01031e6:	0f a0                	push   %fs
c01031e8:	0f a8                	push   %gs
c01031ea:	60                   	pusha  
c01031eb:	b8 10 00 00 00       	mov    $0x10,%eax
c01031f0:	8e d8                	mov    %eax,%ds
c01031f2:	8e c0                	mov    %eax,%es
c01031f4:	54                   	push   %esp
c01031f5:	e8 65 f5 ff ff       	call   c010275f <trap>
c01031fa:	5c                   	pop    %esp

c01031fb <__trapret>:
c01031fb:	61                   	popa   
c01031fc:	0f a9                	pop    %gs
c01031fe:	0f a1                	pop    %fs
c0103200:	07                   	pop    %es
c0103201:	1f                   	pop    %ds
c0103202:	83 c4 08             	add    $0x8,%esp
c0103205:	cf                   	iret   

c0103206 <pa2page>:
c0103206:	55                   	push   %ebp
c0103207:	89 e5                	mov    %esp,%ebp
c0103209:	83 ec 18             	sub    $0x18,%esp
c010320c:	8b 45 08             	mov    0x8(%ebp),%eax
c010320f:	c1 e8 0c             	shr    $0xc,%eax
c0103212:	89 c2                	mov    %eax,%edx
c0103214:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c0103219:	39 c2                	cmp    %eax,%edx
c010321b:	72 1c                	jb     c0103239 <pa2page+0x33>
c010321d:	c7 44 24 08 50 95 10 	movl   $0xc0109550,0x8(%esp)
c0103224:	c0 
c0103225:	c7 44 24 04 5b 00 00 	movl   $0x5b,0x4(%esp)
c010322c:	00 
c010322d:	c7 04 24 6f 95 10 c0 	movl   $0xc010956f,(%esp)
c0103234:	e8 bf d1 ff ff       	call   c01003f8 <__panic>
c0103239:	a1 f8 40 12 c0       	mov    0xc01240f8,%eax
c010323e:	8b 55 08             	mov    0x8(%ebp),%edx
c0103241:	c1 ea 0c             	shr    $0xc,%edx
c0103244:	c1 e2 05             	shl    $0x5,%edx
c0103247:	01 d0                	add    %edx,%eax
c0103249:	c9                   	leave  
c010324a:	c3                   	ret    

c010324b <pde2page>:
c010324b:	55                   	push   %ebp
c010324c:	89 e5                	mov    %esp,%ebp
c010324e:	83 ec 18             	sub    $0x18,%esp
c0103251:	8b 45 08             	mov    0x8(%ebp),%eax
c0103254:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103259:	89 04 24             	mov    %eax,(%esp)
c010325c:	e8 a5 ff ff ff       	call   c0103206 <pa2page>
c0103261:	c9                   	leave  
c0103262:	c3                   	ret    

c0103263 <mm_create>:
c0103263:	55                   	push   %ebp
c0103264:	89 e5                	mov    %esp,%ebp
c0103266:	83 ec 28             	sub    $0x28,%esp
c0103269:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
c0103270:	e8 1e 4b 00 00       	call   c0107d93 <kmalloc>
c0103275:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103278:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010327c:	74 58                	je     c01032d6 <mm_create+0x73>
c010327e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103281:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103284:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103287:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010328a:	89 50 04             	mov    %edx,0x4(%eax)
c010328d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103290:	8b 50 04             	mov    0x4(%eax),%edx
c0103293:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103296:	89 10                	mov    %edx,(%eax)
c0103298:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010329b:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01032a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01032a5:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c01032ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01032af:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
c01032b6:	a1 68 3f 12 c0       	mov    0xc0123f68,%eax
c01032bb:	85 c0                	test   %eax,%eax
c01032bd:	74 0d                	je     c01032cc <mm_create+0x69>
c01032bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01032c2:	89 04 24             	mov    %eax,(%esp)
c01032c5:	e8 af 12 00 00       	call   c0104579 <swap_init_mm>
c01032ca:	eb 0a                	jmp    c01032d6 <mm_create+0x73>
c01032cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01032cf:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
c01032d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01032d9:	c9                   	leave  
c01032da:	c3                   	ret    

c01032db <vma_create>:
c01032db:	55                   	push   %ebp
c01032dc:	89 e5                	mov    %esp,%ebp
c01032de:	83 ec 28             	sub    $0x28,%esp
c01032e1:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
c01032e8:	e8 a6 4a 00 00       	call   c0107d93 <kmalloc>
c01032ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01032f0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01032f4:	74 1b                	je     c0103311 <vma_create+0x36>
c01032f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01032f9:	8b 55 08             	mov    0x8(%ebp),%edx
c01032fc:	89 50 04             	mov    %edx,0x4(%eax)
c01032ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103302:	8b 55 0c             	mov    0xc(%ebp),%edx
c0103305:	89 50 08             	mov    %edx,0x8(%eax)
c0103308:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010330b:	8b 55 10             	mov    0x10(%ebp),%edx
c010330e:	89 50 0c             	mov    %edx,0xc(%eax)
c0103311:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103314:	c9                   	leave  
c0103315:	c3                   	ret    

c0103316 <find_vma>:
c0103316:	55                   	push   %ebp
c0103317:	89 e5                	mov    %esp,%ebp
c0103319:	83 ec 20             	sub    $0x20,%esp
c010331c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0103323:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0103327:	0f 84 95 00 00 00    	je     c01033c2 <find_vma+0xac>
c010332d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103330:	8b 40 08             	mov    0x8(%eax),%eax
c0103333:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103336:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c010333a:	74 16                	je     c0103352 <find_vma+0x3c>
c010333c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010333f:	8b 40 04             	mov    0x4(%eax),%eax
c0103342:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0103345:	77 0b                	ja     c0103352 <find_vma+0x3c>
c0103347:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010334a:	8b 40 08             	mov    0x8(%eax),%eax
c010334d:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0103350:	77 61                	ja     c01033b3 <find_vma+0x9d>
c0103352:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103359:	8b 45 08             	mov    0x8(%ebp),%eax
c010335c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010335f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103362:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103365:	eb 28                	jmp    c010338f <find_vma+0x79>
c0103367:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010336a:	83 e8 10             	sub    $0x10,%eax
c010336d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103370:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103373:	8b 40 04             	mov    0x4(%eax),%eax
c0103376:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0103379:	77 14                	ja     c010338f <find_vma+0x79>
c010337b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010337e:	8b 40 08             	mov    0x8(%eax),%eax
c0103381:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0103384:	76 09                	jbe    c010338f <find_vma+0x79>
c0103386:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
c010338d:	eb 17                	jmp    c01033a6 <find_vma+0x90>
c010338f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103392:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103395:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103398:	8b 40 04             	mov    0x4(%eax),%eax
c010339b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010339e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01033a1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01033a4:	75 c1                	jne    c0103367 <find_vma+0x51>
c01033a6:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
c01033aa:	75 07                	jne    c01033b3 <find_vma+0x9d>
c01033ac:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01033b3:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c01033b7:	74 09                	je     c01033c2 <find_vma+0xac>
c01033b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01033bc:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01033bf:	89 50 08             	mov    %edx,0x8(%eax)
c01033c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01033c5:	c9                   	leave  
c01033c6:	c3                   	ret    

c01033c7 <check_vma_overlap>:
c01033c7:	55                   	push   %ebp
c01033c8:	89 e5                	mov    %esp,%ebp
c01033ca:	83 ec 18             	sub    $0x18,%esp
c01033cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01033d0:	8b 50 04             	mov    0x4(%eax),%edx
c01033d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01033d6:	8b 40 08             	mov    0x8(%eax),%eax
c01033d9:	39 c2                	cmp    %eax,%edx
c01033db:	72 24                	jb     c0103401 <check_vma_overlap+0x3a>
c01033dd:	c7 44 24 0c 7d 95 10 	movl   $0xc010957d,0xc(%esp)
c01033e4:	c0 
c01033e5:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c01033ec:	c0 
c01033ed:	c7 44 24 04 67 00 00 	movl   $0x67,0x4(%esp)
c01033f4:	00 
c01033f5:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c01033fc:	e8 f7 cf ff ff       	call   c01003f8 <__panic>
c0103401:	8b 45 08             	mov    0x8(%ebp),%eax
c0103404:	8b 50 08             	mov    0x8(%eax),%edx
c0103407:	8b 45 0c             	mov    0xc(%ebp),%eax
c010340a:	8b 40 04             	mov    0x4(%eax),%eax
c010340d:	39 c2                	cmp    %eax,%edx
c010340f:	76 24                	jbe    c0103435 <check_vma_overlap+0x6e>
c0103411:	c7 44 24 0c c0 95 10 	movl   $0xc01095c0,0xc(%esp)
c0103418:	c0 
c0103419:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103420:	c0 
c0103421:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
c0103428:	00 
c0103429:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103430:	e8 c3 cf ff ff       	call   c01003f8 <__panic>
c0103435:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103438:	8b 50 04             	mov    0x4(%eax),%edx
c010343b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010343e:	8b 40 08             	mov    0x8(%eax),%eax
c0103441:	39 c2                	cmp    %eax,%edx
c0103443:	72 24                	jb     c0103469 <check_vma_overlap+0xa2>
c0103445:	c7 44 24 0c df 95 10 	movl   $0xc01095df,0xc(%esp)
c010344c:	c0 
c010344d:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103454:	c0 
c0103455:	c7 44 24 04 69 00 00 	movl   $0x69,0x4(%esp)
c010345c:	00 
c010345d:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103464:	e8 8f cf ff ff       	call   c01003f8 <__panic>
c0103469:	c9                   	leave  
c010346a:	c3                   	ret    

c010346b <insert_vma_struct>:
c010346b:	55                   	push   %ebp
c010346c:	89 e5                	mov    %esp,%ebp
c010346e:	83 ec 48             	sub    $0x48,%esp
c0103471:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103474:	8b 50 04             	mov    0x4(%eax),%edx
c0103477:	8b 45 0c             	mov    0xc(%ebp),%eax
c010347a:	8b 40 08             	mov    0x8(%eax),%eax
c010347d:	39 c2                	cmp    %eax,%edx
c010347f:	72 24                	jb     c01034a5 <insert_vma_struct+0x3a>
c0103481:	c7 44 24 0c fd 95 10 	movl   $0xc01095fd,0xc(%esp)
c0103488:	c0 
c0103489:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103490:	c0 
c0103491:	c7 44 24 04 70 00 00 	movl   $0x70,0x4(%esp)
c0103498:	00 
c0103499:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c01034a0:	e8 53 cf ff ff       	call   c01003f8 <__panic>
c01034a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01034a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01034ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01034ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01034b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01034b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01034b7:	eb 21                	jmp    c01034da <insert_vma_struct+0x6f>
c01034b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01034bc:	83 e8 10             	sub    $0x10,%eax
c01034bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01034c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01034c5:	8b 50 04             	mov    0x4(%eax),%edx
c01034c8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01034cb:	8b 40 04             	mov    0x4(%eax),%eax
c01034ce:	39 c2                	cmp    %eax,%edx
c01034d0:	76 02                	jbe    c01034d4 <insert_vma_struct+0x69>
c01034d2:	eb 1d                	jmp    c01034f1 <insert_vma_struct+0x86>
c01034d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01034d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01034da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01034dd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01034e0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01034e3:	8b 40 04             	mov    0x4(%eax),%eax
c01034e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01034e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01034ec:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c01034ef:	75 c8                	jne    c01034b9 <insert_vma_struct+0x4e>
c01034f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01034f4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01034f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01034fa:	8b 40 04             	mov    0x4(%eax),%eax
c01034fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103500:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103503:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0103506:	74 15                	je     c010351d <insert_vma_struct+0xb2>
c0103508:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010350b:	8d 50 f0             	lea    -0x10(%eax),%edx
c010350e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103511:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103515:	89 14 24             	mov    %edx,(%esp)
c0103518:	e8 aa fe ff ff       	call   c01033c7 <check_vma_overlap>
c010351d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103520:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0103523:	74 15                	je     c010353a <insert_vma_struct+0xcf>
c0103525:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103528:	83 e8 10             	sub    $0x10,%eax
c010352b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010352f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103532:	89 04 24             	mov    %eax,(%esp)
c0103535:	e8 8d fe ff ff       	call   c01033c7 <check_vma_overlap>
c010353a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010353d:	8b 55 08             	mov    0x8(%ebp),%edx
c0103540:	89 10                	mov    %edx,(%eax)
c0103542:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103545:	8d 50 10             	lea    0x10(%eax),%edx
c0103548:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010354b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010354e:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0103551:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103554:	8b 40 04             	mov    0x4(%eax),%eax
c0103557:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010355a:	89 55 d0             	mov    %edx,-0x30(%ebp)
c010355d:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0103560:	89 55 cc             	mov    %edx,-0x34(%ebp)
c0103563:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0103566:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0103569:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010356c:	89 10                	mov    %edx,(%eax)
c010356e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0103571:	8b 10                	mov    (%eax),%edx
c0103573:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0103576:	89 50 04             	mov    %edx,0x4(%eax)
c0103579:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010357c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c010357f:	89 50 04             	mov    %edx,0x4(%eax)
c0103582:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103585:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0103588:	89 10                	mov    %edx,(%eax)
c010358a:	8b 45 08             	mov    0x8(%ebp),%eax
c010358d:	8b 40 10             	mov    0x10(%eax),%eax
c0103590:	8d 50 01             	lea    0x1(%eax),%edx
c0103593:	8b 45 08             	mov    0x8(%ebp),%eax
c0103596:	89 50 10             	mov    %edx,0x10(%eax)
c0103599:	c9                   	leave  
c010359a:	c3                   	ret    

c010359b <mm_destroy>:
c010359b:	55                   	push   %ebp
c010359c:	89 e5                	mov    %esp,%ebp
c010359e:	83 ec 38             	sub    $0x38,%esp
c01035a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01035a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01035a7:	eb 3e                	jmp    c01035e7 <mm_destroy+0x4c>
c01035a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01035af:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01035b2:	8b 40 04             	mov    0x4(%eax),%eax
c01035b5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01035b8:	8b 12                	mov    (%edx),%edx
c01035ba:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01035bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01035c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01035c3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01035c6:	89 50 04             	mov    %edx,0x4(%eax)
c01035c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01035cc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01035cf:	89 10                	mov    %edx,(%eax)
c01035d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035d4:	83 e8 10             	sub    $0x10,%eax
c01035d7:	c7 44 24 04 18 00 00 	movl   $0x18,0x4(%esp)
c01035de:	00 
c01035df:	89 04 24             	mov    %eax,(%esp)
c01035e2:	e8 4c 48 00 00       	call   c0107e33 <kfree>
c01035e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01035ea:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01035ed:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01035f0:	8b 40 04             	mov    0x4(%eax),%eax
c01035f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01035f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035f9:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c01035fc:	75 ab                	jne    c01035a9 <mm_destroy+0xe>
c01035fe:	c7 44 24 04 18 00 00 	movl   $0x18,0x4(%esp)
c0103605:	00 
c0103606:	8b 45 08             	mov    0x8(%ebp),%eax
c0103609:	89 04 24             	mov    %eax,(%esp)
c010360c:	e8 22 48 00 00       	call   c0107e33 <kfree>
c0103611:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
c0103618:	c9                   	leave  
c0103619:	c3                   	ret    

c010361a <vmm_init>:
c010361a:	55                   	push   %ebp
c010361b:	89 e5                	mov    %esp,%ebp
c010361d:	83 ec 08             	sub    $0x8,%esp
c0103620:	e8 02 00 00 00       	call   c0103627 <check_vmm>
c0103625:	c9                   	leave  
c0103626:	c3                   	ret    

c0103627 <check_vmm>:
c0103627:	55                   	push   %ebp
c0103628:	89 e5                	mov    %esp,%ebp
c010362a:	83 ec 28             	sub    $0x28,%esp
c010362d:	e8 54 30 00 00       	call   c0106686 <nr_free_pages>
c0103632:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103635:	e8 41 00 00 00       	call   c010367b <check_vma_struct>
c010363a:	e8 03 05 00 00       	call   c0103b42 <check_pgfault>
c010363f:	e8 42 30 00 00       	call   c0106686 <nr_free_pages>
c0103644:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0103647:	74 24                	je     c010366d <check_vmm+0x46>
c0103649:	c7 44 24 0c 1c 96 10 	movl   $0xc010961c,0xc(%esp)
c0103650:	c0 
c0103651:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103658:	c0 
c0103659:	c7 44 24 04 a9 00 00 	movl   $0xa9,0x4(%esp)
c0103660:	00 
c0103661:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103668:	e8 8b cd ff ff       	call   c01003f8 <__panic>
c010366d:	c7 04 24 43 96 10 c0 	movl   $0xc0109643,(%esp)
c0103674:	e8 28 cc ff ff       	call   c01002a1 <cprintf>
c0103679:	c9                   	leave  
c010367a:	c3                   	ret    

c010367b <check_vma_struct>:
c010367b:	55                   	push   %ebp
c010367c:	89 e5                	mov    %esp,%ebp
c010367e:	83 ec 68             	sub    $0x68,%esp
c0103681:	e8 00 30 00 00       	call   c0106686 <nr_free_pages>
c0103686:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103689:	e8 d5 fb ff ff       	call   c0103263 <mm_create>
c010368e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103691:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0103695:	75 24                	jne    c01036bb <check_vma_struct+0x40>
c0103697:	c7 44 24 0c 5b 96 10 	movl   $0xc010965b,0xc(%esp)
c010369e:	c0 
c010369f:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c01036a6:	c0 
c01036a7:	c7 44 24 04 b3 00 00 	movl   $0xb3,0x4(%esp)
c01036ae:	00 
c01036af:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c01036b6:	e8 3d cd ff ff       	call   c01003f8 <__panic>
c01036bb:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%ebp)
c01036c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01036c5:	89 d0                	mov    %edx,%eax
c01036c7:	c1 e0 02             	shl    $0x2,%eax
c01036ca:	01 d0                	add    %edx,%eax
c01036cc:	01 c0                	add    %eax,%eax
c01036ce:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01036d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01036d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01036d7:	eb 70                	jmp    c0103749 <check_vma_struct+0xce>
c01036d9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01036dc:	89 d0                	mov    %edx,%eax
c01036de:	c1 e0 02             	shl    $0x2,%eax
c01036e1:	01 d0                	add    %edx,%eax
c01036e3:	83 c0 02             	add    $0x2,%eax
c01036e6:	89 c1                	mov    %eax,%ecx
c01036e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01036eb:	89 d0                	mov    %edx,%eax
c01036ed:	c1 e0 02             	shl    $0x2,%eax
c01036f0:	01 d0                	add    %edx,%eax
c01036f2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01036f9:	00 
c01036fa:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c01036fe:	89 04 24             	mov    %eax,(%esp)
c0103701:	e8 d5 fb ff ff       	call   c01032db <vma_create>
c0103706:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103709:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c010370d:	75 24                	jne    c0103733 <check_vma_struct+0xb8>
c010370f:	c7 44 24 0c 66 96 10 	movl   $0xc0109666,0xc(%esp)
c0103716:	c0 
c0103717:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c010371e:	c0 
c010371f:	c7 44 24 04 ba 00 00 	movl   $0xba,0x4(%esp)
c0103726:	00 
c0103727:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c010372e:	e8 c5 cc ff ff       	call   c01003f8 <__panic>
c0103733:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103736:	89 44 24 04          	mov    %eax,0x4(%esp)
c010373a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010373d:	89 04 24             	mov    %eax,(%esp)
c0103740:	e8 26 fd ff ff       	call   c010346b <insert_vma_struct>
c0103745:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0103749:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010374d:	7f 8a                	jg     c01036d9 <check_vma_struct+0x5e>
c010374f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103752:	83 c0 01             	add    $0x1,%eax
c0103755:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103758:	eb 70                	jmp    c01037ca <check_vma_struct+0x14f>
c010375a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010375d:	89 d0                	mov    %edx,%eax
c010375f:	c1 e0 02             	shl    $0x2,%eax
c0103762:	01 d0                	add    %edx,%eax
c0103764:	83 c0 02             	add    $0x2,%eax
c0103767:	89 c1                	mov    %eax,%ecx
c0103769:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010376c:	89 d0                	mov    %edx,%eax
c010376e:	c1 e0 02             	shl    $0x2,%eax
c0103771:	01 d0                	add    %edx,%eax
c0103773:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c010377a:	00 
c010377b:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c010377f:	89 04 24             	mov    %eax,(%esp)
c0103782:	e8 54 fb ff ff       	call   c01032db <vma_create>
c0103787:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010378a:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c010378e:	75 24                	jne    c01037b4 <check_vma_struct+0x139>
c0103790:	c7 44 24 0c 66 96 10 	movl   $0xc0109666,0xc(%esp)
c0103797:	c0 
c0103798:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c010379f:	c0 
c01037a0:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
c01037a7:	00 
c01037a8:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c01037af:	e8 44 cc ff ff       	call   c01003f8 <__panic>
c01037b4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01037b7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01037bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037be:	89 04 24             	mov    %eax,(%esp)
c01037c1:	e8 a5 fc ff ff       	call   c010346b <insert_vma_struct>
c01037c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01037ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01037cd:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c01037d0:	7e 88                	jle    c010375a <check_vma_struct+0xdf>
c01037d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037d5:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01037d8:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01037db:	8b 40 04             	mov    0x4(%eax),%eax
c01037de:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01037e1:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01037e8:	e9 97 00 00 00       	jmp    c0103884 <check_vma_struct+0x209>
c01037ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037f0:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01037f3:	75 24                	jne    c0103819 <check_vma_struct+0x19e>
c01037f5:	c7 44 24 0c 72 96 10 	movl   $0xc0109672,0xc(%esp)
c01037fc:	c0 
c01037fd:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103804:	c0 
c0103805:	c7 44 24 04 c7 00 00 	movl   $0xc7,0x4(%esp)
c010380c:	00 
c010380d:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103814:	e8 df cb ff ff       	call   c01003f8 <__panic>
c0103819:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010381c:	83 e8 10             	sub    $0x10,%eax
c010381f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103825:	8b 48 04             	mov    0x4(%eax),%ecx
c0103828:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010382b:	89 d0                	mov    %edx,%eax
c010382d:	c1 e0 02             	shl    $0x2,%eax
c0103830:	01 d0                	add    %edx,%eax
c0103832:	39 c1                	cmp    %eax,%ecx
c0103834:	75 17                	jne    c010384d <check_vma_struct+0x1d2>
c0103836:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103839:	8b 48 08             	mov    0x8(%eax),%ecx
c010383c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010383f:	89 d0                	mov    %edx,%eax
c0103841:	c1 e0 02             	shl    $0x2,%eax
c0103844:	01 d0                	add    %edx,%eax
c0103846:	83 c0 02             	add    $0x2,%eax
c0103849:	39 c1                	cmp    %eax,%ecx
c010384b:	74 24                	je     c0103871 <check_vma_struct+0x1f6>
c010384d:	c7 44 24 0c 8c 96 10 	movl   $0xc010968c,0xc(%esp)
c0103854:	c0 
c0103855:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c010385c:	c0 
c010385d:	c7 44 24 04 c9 00 00 	movl   $0xc9,0x4(%esp)
c0103864:	00 
c0103865:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c010386c:	e8 87 cb ff ff       	call   c01003f8 <__panic>
c0103871:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103874:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103877:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010387a:	8b 40 04             	mov    0x4(%eax),%eax
c010387d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103880:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103884:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103887:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c010388a:	0f 8e 5d ff ff ff    	jle    c01037ed <check_vma_struct+0x172>
c0103890:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0103897:	e9 cd 01 00 00       	jmp    c0103a69 <check_vma_struct+0x3ee>
c010389c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010389f:	89 44 24 04          	mov    %eax,0x4(%esp)
c01038a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01038a6:	89 04 24             	mov    %eax,(%esp)
c01038a9:	e8 68 fa ff ff       	call   c0103316 <find_vma>
c01038ae:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01038b1:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
c01038b5:	75 24                	jne    c01038db <check_vma_struct+0x260>
c01038b7:	c7 44 24 0c c1 96 10 	movl   $0xc01096c1,0xc(%esp)
c01038be:	c0 
c01038bf:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c01038c6:	c0 
c01038c7:	c7 44 24 04 cf 00 00 	movl   $0xcf,0x4(%esp)
c01038ce:	00 
c01038cf:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c01038d6:	e8 1d cb ff ff       	call   c01003f8 <__panic>
c01038db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038de:	83 c0 01             	add    $0x1,%eax
c01038e1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01038e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01038e8:	89 04 24             	mov    %eax,(%esp)
c01038eb:	e8 26 fa ff ff       	call   c0103316 <find_vma>
c01038f0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01038f3:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c01038f7:	75 24                	jne    c010391d <check_vma_struct+0x2a2>
c01038f9:	c7 44 24 0c ce 96 10 	movl   $0xc01096ce,0xc(%esp)
c0103900:	c0 
c0103901:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103908:	c0 
c0103909:	c7 44 24 04 d1 00 00 	movl   $0xd1,0x4(%esp)
c0103910:	00 
c0103911:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103918:	e8 db ca ff ff       	call   c01003f8 <__panic>
c010391d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103920:	83 c0 02             	add    $0x2,%eax
c0103923:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103927:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010392a:	89 04 24             	mov    %eax,(%esp)
c010392d:	e8 e4 f9 ff ff       	call   c0103316 <find_vma>
c0103932:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0103935:	83 7d c8 00          	cmpl   $0x0,-0x38(%ebp)
c0103939:	74 24                	je     c010395f <check_vma_struct+0x2e4>
c010393b:	c7 44 24 0c db 96 10 	movl   $0xc01096db,0xc(%esp)
c0103942:	c0 
c0103943:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c010394a:	c0 
c010394b:	c7 44 24 04 d3 00 00 	movl   $0xd3,0x4(%esp)
c0103952:	00 
c0103953:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c010395a:	e8 99 ca ff ff       	call   c01003f8 <__panic>
c010395f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103962:	83 c0 03             	add    $0x3,%eax
c0103965:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103969:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010396c:	89 04 24             	mov    %eax,(%esp)
c010396f:	e8 a2 f9 ff ff       	call   c0103316 <find_vma>
c0103974:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103977:	83 7d c4 00          	cmpl   $0x0,-0x3c(%ebp)
c010397b:	74 24                	je     c01039a1 <check_vma_struct+0x326>
c010397d:	c7 44 24 0c e8 96 10 	movl   $0xc01096e8,0xc(%esp)
c0103984:	c0 
c0103985:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c010398c:	c0 
c010398d:	c7 44 24 04 d5 00 00 	movl   $0xd5,0x4(%esp)
c0103994:	00 
c0103995:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c010399c:	e8 57 ca ff ff       	call   c01003f8 <__panic>
c01039a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01039a4:	83 c0 04             	add    $0x4,%eax
c01039a7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01039ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039ae:	89 04 24             	mov    %eax,(%esp)
c01039b1:	e8 60 f9 ff ff       	call   c0103316 <find_vma>
c01039b6:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01039b9:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
c01039bd:	74 24                	je     c01039e3 <check_vma_struct+0x368>
c01039bf:	c7 44 24 0c f5 96 10 	movl   $0xc01096f5,0xc(%esp)
c01039c6:	c0 
c01039c7:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c01039ce:	c0 
c01039cf:	c7 44 24 04 d7 00 00 	movl   $0xd7,0x4(%esp)
c01039d6:	00 
c01039d7:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c01039de:	e8 15 ca ff ff       	call   c01003f8 <__panic>
c01039e3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01039e6:	8b 50 04             	mov    0x4(%eax),%edx
c01039e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01039ec:	39 c2                	cmp    %eax,%edx
c01039ee:	75 10                	jne    c0103a00 <check_vma_struct+0x385>
c01039f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01039f3:	8b 50 08             	mov    0x8(%eax),%edx
c01039f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01039f9:	83 c0 02             	add    $0x2,%eax
c01039fc:	39 c2                	cmp    %eax,%edx
c01039fe:	74 24                	je     c0103a24 <check_vma_struct+0x3a9>
c0103a00:	c7 44 24 0c 04 97 10 	movl   $0xc0109704,0xc(%esp)
c0103a07:	c0 
c0103a08:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103a0f:	c0 
c0103a10:	c7 44 24 04 d9 00 00 	movl   $0xd9,0x4(%esp)
c0103a17:	00 
c0103a18:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103a1f:	e8 d4 c9 ff ff       	call   c01003f8 <__panic>
c0103a24:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0103a27:	8b 50 04             	mov    0x4(%eax),%edx
c0103a2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a2d:	39 c2                	cmp    %eax,%edx
c0103a2f:	75 10                	jne    c0103a41 <check_vma_struct+0x3c6>
c0103a31:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0103a34:	8b 50 08             	mov    0x8(%eax),%edx
c0103a37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a3a:	83 c0 02             	add    $0x2,%eax
c0103a3d:	39 c2                	cmp    %eax,%edx
c0103a3f:	74 24                	je     c0103a65 <check_vma_struct+0x3ea>
c0103a41:	c7 44 24 0c 34 97 10 	movl   $0xc0109734,0xc(%esp)
c0103a48:	c0 
c0103a49:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103a50:	c0 
c0103a51:	c7 44 24 04 da 00 00 	movl   $0xda,0x4(%esp)
c0103a58:	00 
c0103a59:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103a60:	e8 93 c9 ff ff       	call   c01003f8 <__panic>
c0103a65:	83 45 f4 05          	addl   $0x5,-0xc(%ebp)
c0103a69:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0103a6c:	89 d0                	mov    %edx,%eax
c0103a6e:	c1 e0 02             	shl    $0x2,%eax
c0103a71:	01 d0                	add    %edx,%eax
c0103a73:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0103a76:	0f 8d 20 fe ff ff    	jge    c010389c <check_vma_struct+0x221>
c0103a7c:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0103a83:	eb 70                	jmp    c0103af5 <check_vma_struct+0x47a>
c0103a85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a88:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103a8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a8f:	89 04 24             	mov    %eax,(%esp)
c0103a92:	e8 7f f8 ff ff       	call   c0103316 <find_vma>
c0103a97:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103a9a:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0103a9e:	74 27                	je     c0103ac7 <check_vma_struct+0x44c>
c0103aa0:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0103aa3:	8b 50 08             	mov    0x8(%eax),%edx
c0103aa6:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0103aa9:	8b 40 04             	mov    0x4(%eax),%eax
c0103aac:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0103ab0:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103ab4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103ab7:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103abb:	c7 04 24 64 97 10 c0 	movl   $0xc0109764,(%esp)
c0103ac2:	e8 da c7 ff ff       	call   c01002a1 <cprintf>
c0103ac7:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0103acb:	74 24                	je     c0103af1 <check_vma_struct+0x476>
c0103acd:	c7 44 24 0c 89 97 10 	movl   $0xc0109789,0xc(%esp)
c0103ad4:	c0 
c0103ad5:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103adc:	c0 
c0103add:	c7 44 24 04 e2 00 00 	movl   $0xe2,0x4(%esp)
c0103ae4:	00 
c0103ae5:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103aec:	e8 07 c9 ff ff       	call   c01003f8 <__panic>
c0103af1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0103af5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103af9:	79 8a                	jns    c0103a85 <check_vma_struct+0x40a>
c0103afb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103afe:	89 04 24             	mov    %eax,(%esp)
c0103b01:	e8 95 fa ff ff       	call   c010359b <mm_destroy>
c0103b06:	e8 7b 2b 00 00       	call   c0106686 <nr_free_pages>
c0103b0b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0103b0e:	74 24                	je     c0103b34 <check_vma_struct+0x4b9>
c0103b10:	c7 44 24 0c 1c 96 10 	movl   $0xc010961c,0xc(%esp)
c0103b17:	c0 
c0103b18:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103b1f:	c0 
c0103b20:	c7 44 24 04 e7 00 00 	movl   $0xe7,0x4(%esp)
c0103b27:	00 
c0103b28:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103b2f:	e8 c4 c8 ff ff       	call   c01003f8 <__panic>
c0103b34:	c7 04 24 a0 97 10 c0 	movl   $0xc01097a0,(%esp)
c0103b3b:	e8 61 c7 ff ff       	call   c01002a1 <cprintf>
c0103b40:	c9                   	leave  
c0103b41:	c3                   	ret    

c0103b42 <check_pgfault>:
c0103b42:	55                   	push   %ebp
c0103b43:	89 e5                	mov    %esp,%ebp
c0103b45:	83 ec 38             	sub    $0x38,%esp
c0103b48:	e8 39 2b 00 00       	call   c0106686 <nr_free_pages>
c0103b4d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103b50:	e8 0e f7 ff ff       	call   c0103263 <mm_create>
c0103b55:	a3 10 40 12 c0       	mov    %eax,0xc0124010
c0103b5a:	a1 10 40 12 c0       	mov    0xc0124010,%eax
c0103b5f:	85 c0                	test   %eax,%eax
c0103b61:	75 24                	jne    c0103b87 <check_pgfault+0x45>
c0103b63:	c7 44 24 0c bf 97 10 	movl   $0xc01097bf,0xc(%esp)
c0103b6a:	c0 
c0103b6b:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103b72:	c0 
c0103b73:	c7 44 24 04 f4 00 00 	movl   $0xf4,0x4(%esp)
c0103b7a:	00 
c0103b7b:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103b82:	e8 71 c8 ff ff       	call   c01003f8 <__panic>
c0103b87:	a1 10 40 12 c0       	mov    0xc0124010,%eax
c0103b8c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103b8f:	8b 15 00 0a 12 c0    	mov    0xc0120a00,%edx
c0103b95:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b98:	89 50 0c             	mov    %edx,0xc(%eax)
c0103b9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b9e:	8b 40 0c             	mov    0xc(%eax),%eax
c0103ba1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103ba4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103ba7:	8b 00                	mov    (%eax),%eax
c0103ba9:	85 c0                	test   %eax,%eax
c0103bab:	74 24                	je     c0103bd1 <check_pgfault+0x8f>
c0103bad:	c7 44 24 0c d7 97 10 	movl   $0xc01097d7,0xc(%esp)
c0103bb4:	c0 
c0103bb5:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103bbc:	c0 
c0103bbd:	c7 44 24 04 f8 00 00 	movl   $0xf8,0x4(%esp)
c0103bc4:	00 
c0103bc5:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103bcc:	e8 27 c8 ff ff       	call   c01003f8 <__panic>
c0103bd1:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
c0103bd8:	00 
c0103bd9:	c7 44 24 04 00 00 40 	movl   $0x400000,0x4(%esp)
c0103be0:	00 
c0103be1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0103be8:	e8 ee f6 ff ff       	call   c01032db <vma_create>
c0103bed:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103bf0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0103bf4:	75 24                	jne    c0103c1a <check_pgfault+0xd8>
c0103bf6:	c7 44 24 0c 66 96 10 	movl   $0xc0109666,0xc(%esp)
c0103bfd:	c0 
c0103bfe:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103c05:	c0 
c0103c06:	c7 44 24 04 fb 00 00 	movl   $0xfb,0x4(%esp)
c0103c0d:	00 
c0103c0e:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103c15:	e8 de c7 ff ff       	call   c01003f8 <__panic>
c0103c1a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103c1d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c21:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103c24:	89 04 24             	mov    %eax,(%esp)
c0103c27:	e8 3f f8 ff ff       	call   c010346b <insert_vma_struct>
c0103c2c:	c7 45 dc 00 01 00 00 	movl   $0x100,-0x24(%ebp)
c0103c33:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103c36:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103c3a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103c3d:	89 04 24             	mov    %eax,(%esp)
c0103c40:	e8 d1 f6 ff ff       	call   c0103316 <find_vma>
c0103c45:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0103c48:	74 24                	je     c0103c6e <check_pgfault+0x12c>
c0103c4a:	c7 44 24 0c e5 97 10 	movl   $0xc01097e5,0xc(%esp)
c0103c51:	c0 
c0103c52:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103c59:	c0 
c0103c5a:	c7 44 24 04 00 01 00 	movl   $0x100,0x4(%esp)
c0103c61:	00 
c0103c62:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103c69:	e8 8a c7 ff ff       	call   c01003f8 <__panic>
c0103c6e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0103c75:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103c7c:	eb 17                	jmp    c0103c95 <check_pgfault+0x153>
c0103c7e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103c81:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103c84:	01 d0                	add    %edx,%eax
c0103c86:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103c89:	88 10                	mov    %dl,(%eax)
c0103c8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103c8e:	01 45 f0             	add    %eax,-0x10(%ebp)
c0103c91:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103c95:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
c0103c99:	7e e3                	jle    c0103c7e <check_pgfault+0x13c>
c0103c9b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103ca2:	eb 15                	jmp    c0103cb9 <check_pgfault+0x177>
c0103ca4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103ca7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103caa:	01 d0                	add    %edx,%eax
c0103cac:	0f b6 00             	movzbl (%eax),%eax
c0103caf:	0f be c0             	movsbl %al,%eax
c0103cb2:	29 45 f0             	sub    %eax,-0x10(%ebp)
c0103cb5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103cb9:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
c0103cbd:	7e e5                	jle    c0103ca4 <check_pgfault+0x162>
c0103cbf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0103cc3:	74 24                	je     c0103ce9 <check_pgfault+0x1a7>
c0103cc5:	c7 44 24 0c ff 97 10 	movl   $0xc01097ff,0xc(%esp)
c0103ccc:	c0 
c0103ccd:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103cd4:	c0 
c0103cd5:	c7 44 24 04 0a 01 00 	movl   $0x10a,0x4(%esp)
c0103cdc:	00 
c0103cdd:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103ce4:	e8 0f c7 ff ff       	call   c01003f8 <__panic>
c0103ce9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103cec:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103cef:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103cf2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103cf7:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103cfb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103cfe:	89 04 24             	mov    %eax,(%esp)
c0103d01:	e8 b4 31 00 00       	call   c0106eba <page_remove>
c0103d06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103d09:	8b 00                	mov    (%eax),%eax
c0103d0b:	89 04 24             	mov    %eax,(%esp)
c0103d0e:	e8 38 f5 ff ff       	call   c010324b <pde2page>
c0103d13:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0103d1a:	00 
c0103d1b:	89 04 24             	mov    %eax,(%esp)
c0103d1e:	e8 31 29 00 00       	call   c0106654 <free_pages>
c0103d23:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103d26:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0103d2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103d2f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0103d36:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103d39:	89 04 24             	mov    %eax,(%esp)
c0103d3c:	e8 5a f8 ff ff       	call   c010359b <mm_destroy>
c0103d41:	c7 05 10 40 12 c0 00 	movl   $0x0,0xc0124010
c0103d48:	00 00 00 
c0103d4b:	e8 36 29 00 00       	call   c0106686 <nr_free_pages>
c0103d50:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0103d53:	74 24                	je     c0103d79 <check_pgfault+0x237>
c0103d55:	c7 44 24 0c 1c 96 10 	movl   $0xc010961c,0xc(%esp)
c0103d5c:	c0 
c0103d5d:	c7 44 24 08 9b 95 10 	movl   $0xc010959b,0x8(%esp)
c0103d64:	c0 
c0103d65:	c7 44 24 04 14 01 00 	movl   $0x114,0x4(%esp)
c0103d6c:	00 
c0103d6d:	c7 04 24 b0 95 10 c0 	movl   $0xc01095b0,(%esp)
c0103d74:	e8 7f c6 ff ff       	call   c01003f8 <__panic>
c0103d79:	c7 04 24 08 98 10 c0 	movl   $0xc0109808,(%esp)
c0103d80:	e8 1c c5 ff ff       	call   c01002a1 <cprintf>
c0103d85:	c9                   	leave  
c0103d86:	c3                   	ret    

c0103d87 <do_pgfault>:
c0103d87:	55                   	push   %ebp
c0103d88:	89 e5                	mov    %esp,%ebp
c0103d8a:	83 ec 38             	sub    $0x38,%esp
c0103d8d:	c7 45 f4 fd ff ff ff 	movl   $0xfffffffd,-0xc(%ebp)
c0103d94:	8b 45 10             	mov    0x10(%ebp),%eax
c0103d97:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103d9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d9e:	89 04 24             	mov    %eax,(%esp)
c0103da1:	e8 70 f5 ff ff       	call   c0103316 <find_vma>
c0103da6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103da9:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c0103dae:	83 c0 01             	add    $0x1,%eax
c0103db1:	a3 64 3f 12 c0       	mov    %eax,0xc0123f64
c0103db6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0103dba:	74 0b                	je     c0103dc7 <do_pgfault+0x40>
c0103dbc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103dbf:	8b 40 04             	mov    0x4(%eax),%eax
c0103dc2:	3b 45 10             	cmp    0x10(%ebp),%eax
c0103dc5:	76 18                	jbe    c0103ddf <do_pgfault+0x58>
c0103dc7:	8b 45 10             	mov    0x10(%ebp),%eax
c0103dca:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103dce:	c7 04 24 24 98 10 c0 	movl   $0xc0109824,(%esp)
c0103dd5:	e8 c7 c4 ff ff       	call   c01002a1 <cprintf>
c0103dda:	e9 68 01 00 00       	jmp    c0103f47 <do_pgfault+0x1c0>
c0103ddf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103de2:	83 e0 03             	and    $0x3,%eax
c0103de5:	85 c0                	test   %eax,%eax
c0103de7:	74 36                	je     c0103e1f <do_pgfault+0x98>
c0103de9:	83 f8 01             	cmp    $0x1,%eax
c0103dec:	74 20                	je     c0103e0e <do_pgfault+0x87>
c0103dee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103df1:	8b 40 0c             	mov    0xc(%eax),%eax
c0103df4:	83 e0 02             	and    $0x2,%eax
c0103df7:	85 c0                	test   %eax,%eax
c0103df9:	75 11                	jne    c0103e0c <do_pgfault+0x85>
c0103dfb:	c7 04 24 54 98 10 c0 	movl   $0xc0109854,(%esp)
c0103e02:	e8 9a c4 ff ff       	call   c01002a1 <cprintf>
c0103e07:	e9 3b 01 00 00       	jmp    c0103f47 <do_pgfault+0x1c0>
c0103e0c:	eb 2f                	jmp    c0103e3d <do_pgfault+0xb6>
c0103e0e:	c7 04 24 b4 98 10 c0 	movl   $0xc01098b4,(%esp)
c0103e15:	e8 87 c4 ff ff       	call   c01002a1 <cprintf>
c0103e1a:	e9 28 01 00 00       	jmp    c0103f47 <do_pgfault+0x1c0>
c0103e1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103e22:	8b 40 0c             	mov    0xc(%eax),%eax
c0103e25:	83 e0 05             	and    $0x5,%eax
c0103e28:	85 c0                	test   %eax,%eax
c0103e2a:	75 11                	jne    c0103e3d <do_pgfault+0xb6>
c0103e2c:	c7 04 24 ec 98 10 c0 	movl   $0xc01098ec,(%esp)
c0103e33:	e8 69 c4 ff ff       	call   c01002a1 <cprintf>
c0103e38:	e9 0a 01 00 00       	jmp    c0103f47 <do_pgfault+0x1c0>
c0103e3d:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
c0103e44:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103e47:	8b 40 0c             	mov    0xc(%eax),%eax
c0103e4a:	83 e0 02             	and    $0x2,%eax
c0103e4d:	85 c0                	test   %eax,%eax
c0103e4f:	74 04                	je     c0103e55 <do_pgfault+0xce>
c0103e51:	83 4d f0 02          	orl    $0x2,-0x10(%ebp)
c0103e55:	8b 45 10             	mov    0x10(%ebp),%eax
c0103e58:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103e5b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103e5e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103e63:	89 45 10             	mov    %eax,0x10(%ebp)
c0103e66:	c7 45 f4 fc ff ff ff 	movl   $0xfffffffc,-0xc(%ebp)
c0103e6d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103e74:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e77:	8b 40 0c             	mov    0xc(%eax),%eax
c0103e7a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0103e81:	00 
c0103e82:	8b 55 10             	mov    0x10(%ebp),%edx
c0103e85:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103e89:	89 04 24             	mov    %eax,(%esp)
c0103e8c:	e8 37 2e 00 00       	call   c0106cc8 <get_pte>
c0103e91:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103e94:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0103e98:	75 05                	jne    c0103e9f <do_pgfault+0x118>
c0103e9a:	e9 a8 00 00 00       	jmp    c0103f47 <do_pgfault+0x1c0>
c0103e9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103ea2:	8b 00                	mov    (%eax),%eax
c0103ea4:	85 c0                	test   %eax,%eax
c0103ea6:	75 22                	jne    c0103eca <do_pgfault+0x143>
c0103ea8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eab:	8b 40 0c             	mov    0xc(%eax),%eax
c0103eae:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0103eb1:	89 54 24 08          	mov    %edx,0x8(%esp)
c0103eb5:	8b 55 10             	mov    0x10(%ebp),%edx
c0103eb8:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103ebc:	89 04 24             	mov    %eax,(%esp)
c0103ebf:	e8 50 31 00 00       	call   c0107014 <pgdir_alloc_page>
c0103ec4:	85 c0                	test   %eax,%eax
c0103ec6:	75 78                	jne    c0103f40 <do_pgfault+0x1b9>
c0103ec8:	eb 7d                	jmp    c0103f47 <do_pgfault+0x1c0>
c0103eca:	a1 68 3f 12 c0       	mov    0xc0123f68,%eax
c0103ecf:	85 c0                	test   %eax,%eax
c0103ed1:	74 6d                	je     c0103f40 <do_pgfault+0x1b9>
c0103ed3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0103eda:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0103edd:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103ee1:	8b 45 10             	mov    0x10(%ebp),%eax
c0103ee4:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103ee8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eeb:	89 04 24             	mov    %eax,(%esp)
c0103eee:	e8 7f 08 00 00       	call   c0104772 <swap_in>
c0103ef3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0103ef6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ef9:	8b 40 0c             	mov    0xc(%eax),%eax
c0103efc:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0103eff:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
c0103f03:	8b 4d 10             	mov    0x10(%ebp),%ecx
c0103f06:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0103f0a:	89 54 24 04          	mov    %edx,0x4(%esp)
c0103f0e:	89 04 24             	mov    %eax,(%esp)
c0103f11:	e8 e8 2f 00 00       	call   c0106efe <page_insert>
c0103f16:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103f19:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
c0103f20:	00 
c0103f21:	89 44 24 08          	mov    %eax,0x8(%esp)
c0103f25:	8b 45 10             	mov    0x10(%ebp),%eax
c0103f28:	89 44 24 04          	mov    %eax,0x4(%esp)
c0103f2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f2f:	89 04 24             	mov    %eax,(%esp)
c0103f32:	e8 72 06 00 00       	call   c01045a9 <swap_map_swappable>
c0103f37:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103f3a:	8b 55 10             	mov    0x10(%ebp),%edx
c0103f3d:	89 50 1c             	mov    %edx,0x1c(%eax)
c0103f40:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103f47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103f4a:	c9                   	leave  
c0103f4b:	c3                   	ret    

c0103f4c <_fifo_init_mm>:
c0103f4c:	55                   	push   %ebp
c0103f4d:	89 e5                	mov    %esp,%ebp
c0103f4f:	83 ec 10             	sub    $0x10,%esp
c0103f52:	c7 45 fc 14 40 12 c0 	movl   $0xc0124014,-0x4(%ebp)
c0103f59:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103f5c:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0103f5f:	89 50 04             	mov    %edx,0x4(%eax)
c0103f62:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103f65:	8b 50 04             	mov    0x4(%eax),%edx
c0103f68:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103f6b:	89 10                	mov    %edx,(%eax)
c0103f6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f70:	c7 40 14 14 40 12 c0 	movl   $0xc0124014,0x14(%eax)
c0103f77:	b8 00 00 00 00       	mov    $0x0,%eax
c0103f7c:	c9                   	leave  
c0103f7d:	c3                   	ret    

c0103f7e <_fifo_map_swappable>:
c0103f7e:	55                   	push   %ebp
c0103f7f:	89 e5                	mov    %esp,%ebp
c0103f81:	83 ec 48             	sub    $0x48,%esp
c0103f84:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f87:	8b 40 14             	mov    0x14(%eax),%eax
c0103f8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103f8d:	8b 45 10             	mov    0x10(%ebp),%eax
c0103f90:	83 c0 14             	add    $0x14,%eax
c0103f93:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103f96:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0103f9a:	74 06                	je     c0103fa2 <_fifo_map_swappable+0x24>
c0103f9c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103fa0:	75 24                	jne    c0103fc6 <_fifo_map_swappable+0x48>
c0103fa2:	c7 44 24 0c 50 99 10 	movl   $0xc0109950,0xc(%esp)
c0103fa9:	c0 
c0103faa:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c0103fb1:	c0 
c0103fb2:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
c0103fb9:	00 
c0103fba:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c0103fc1:	e8 32 c4 ff ff       	call   c01003f8 <__panic>
c0103fc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103fc9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103fcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103fcf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103fd2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103fd5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103fd8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103fdb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103fde:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103fe1:	8b 40 04             	mov    0x4(%eax),%eax
c0103fe4:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0103fe7:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0103fea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0103fed:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0103ff0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103ff3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103ff6:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0103ff9:	89 10                	mov    %edx,(%eax)
c0103ffb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103ffe:	8b 10                	mov    (%eax),%edx
c0104000:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104003:	89 50 04             	mov    %edx,0x4(%eax)
c0104006:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104009:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010400c:	89 50 04             	mov    %edx,0x4(%eax)
c010400f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104012:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0104015:	89 10                	mov    %edx,(%eax)
c0104017:	b8 00 00 00 00       	mov    $0x0,%eax
c010401c:	c9                   	leave  
c010401d:	c3                   	ret    

c010401e <_fifo_swap_out_victim>:
c010401e:	55                   	push   %ebp
c010401f:	89 e5                	mov    %esp,%ebp
c0104021:	83 ec 38             	sub    $0x38,%esp
c0104024:	8b 45 08             	mov    0x8(%ebp),%eax
c0104027:	8b 40 14             	mov    0x14(%eax),%eax
c010402a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010402d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104031:	75 24                	jne    c0104057 <_fifo_swap_out_victim+0x39>
c0104033:	c7 44 24 0c 97 99 10 	movl   $0xc0109997,0xc(%esp)
c010403a:	c0 
c010403b:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c0104042:	c0 
c0104043:	c7 44 24 04 41 00 00 	movl   $0x41,0x4(%esp)
c010404a:	00 
c010404b:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c0104052:	e8 a1 c3 ff ff       	call   c01003f8 <__panic>
c0104057:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010405b:	74 24                	je     c0104081 <_fifo_swap_out_victim+0x63>
c010405d:	c7 44 24 0c a4 99 10 	movl   $0xc01099a4,0xc(%esp)
c0104064:	c0 
c0104065:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c010406c:	c0 
c010406d:	c7 44 24 04 42 00 00 	movl   $0x42,0x4(%esp)
c0104074:	00 
c0104075:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c010407c:	e8 77 c3 ff ff       	call   c01003f8 <__panic>
c0104081:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104084:	8b 00                	mov    (%eax),%eax
c0104086:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104089:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010408d:	75 24                	jne    c01040b3 <_fifo_swap_out_victim+0x95>
c010408f:	c7 44 24 0c af 99 10 	movl   $0xc01099af,0xc(%esp)
c0104096:	c0 
c0104097:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c010409e:	c0 
c010409f:	c7 44 24 04 48 00 00 	movl   $0x48,0x4(%esp)
c01040a6:	00 
c01040a7:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c01040ae:	e8 45 c3 ff ff       	call   c01003f8 <__panic>
c01040b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01040b6:	83 e8 14             	sub    $0x14,%eax
c01040b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01040bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01040bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01040c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01040c5:	8b 40 04             	mov    0x4(%eax),%eax
c01040c8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01040cb:	8b 12                	mov    (%edx),%edx
c01040cd:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01040d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01040d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01040d6:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01040d9:	89 50 04             	mov    %edx,0x4(%eax)
c01040dc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01040df:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01040e2:	89 10                	mov    %edx,(%eax)
c01040e4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01040e7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01040ea:	89 10                	mov    %edx,(%eax)
c01040ec:	b8 00 00 00 00       	mov    $0x0,%eax
c01040f1:	c9                   	leave  
c01040f2:	c3                   	ret    

c01040f3 <_fifo_check_swap>:
c01040f3:	55                   	push   %ebp
c01040f4:	89 e5                	mov    %esp,%ebp
c01040f6:	83 ec 18             	sub    $0x18,%esp
c01040f9:	c7 04 24 b8 99 10 c0 	movl   $0xc01099b8,(%esp)
c0104100:	e8 9c c1 ff ff       	call   c01002a1 <cprintf>
c0104105:	b8 00 30 00 00       	mov    $0x3000,%eax
c010410a:	c6 00 0c             	movb   $0xc,(%eax)
c010410d:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c0104112:	83 f8 04             	cmp    $0x4,%eax
c0104115:	74 24                	je     c010413b <_fifo_check_swap+0x48>
c0104117:	c7 44 24 0c de 99 10 	movl   $0xc01099de,0xc(%esp)
c010411e:	c0 
c010411f:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c0104126:	c0 
c0104127:	c7 44 24 04 53 00 00 	movl   $0x53,0x4(%esp)
c010412e:	00 
c010412f:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c0104136:	e8 bd c2 ff ff       	call   c01003f8 <__panic>
c010413b:	c7 04 24 f0 99 10 c0 	movl   $0xc01099f0,(%esp)
c0104142:	e8 5a c1 ff ff       	call   c01002a1 <cprintf>
c0104147:	b8 00 10 00 00       	mov    $0x1000,%eax
c010414c:	c6 00 0a             	movb   $0xa,(%eax)
c010414f:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c0104154:	83 f8 04             	cmp    $0x4,%eax
c0104157:	74 24                	je     c010417d <_fifo_check_swap+0x8a>
c0104159:	c7 44 24 0c de 99 10 	movl   $0xc01099de,0xc(%esp)
c0104160:	c0 
c0104161:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c0104168:	c0 
c0104169:	c7 44 24 04 56 00 00 	movl   $0x56,0x4(%esp)
c0104170:	00 
c0104171:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c0104178:	e8 7b c2 ff ff       	call   c01003f8 <__panic>
c010417d:	c7 04 24 18 9a 10 c0 	movl   $0xc0109a18,(%esp)
c0104184:	e8 18 c1 ff ff       	call   c01002a1 <cprintf>
c0104189:	b8 00 40 00 00       	mov    $0x4000,%eax
c010418e:	c6 00 0d             	movb   $0xd,(%eax)
c0104191:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c0104196:	83 f8 04             	cmp    $0x4,%eax
c0104199:	74 24                	je     c01041bf <_fifo_check_swap+0xcc>
c010419b:	c7 44 24 0c de 99 10 	movl   $0xc01099de,0xc(%esp)
c01041a2:	c0 
c01041a3:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c01041aa:	c0 
c01041ab:	c7 44 24 04 59 00 00 	movl   $0x59,0x4(%esp)
c01041b2:	00 
c01041b3:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c01041ba:	e8 39 c2 ff ff       	call   c01003f8 <__panic>
c01041bf:	c7 04 24 40 9a 10 c0 	movl   $0xc0109a40,(%esp)
c01041c6:	e8 d6 c0 ff ff       	call   c01002a1 <cprintf>
c01041cb:	b8 00 20 00 00       	mov    $0x2000,%eax
c01041d0:	c6 00 0b             	movb   $0xb,(%eax)
c01041d3:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c01041d8:	83 f8 04             	cmp    $0x4,%eax
c01041db:	74 24                	je     c0104201 <_fifo_check_swap+0x10e>
c01041dd:	c7 44 24 0c de 99 10 	movl   $0xc01099de,0xc(%esp)
c01041e4:	c0 
c01041e5:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c01041ec:	c0 
c01041ed:	c7 44 24 04 5c 00 00 	movl   $0x5c,0x4(%esp)
c01041f4:	00 
c01041f5:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c01041fc:	e8 f7 c1 ff ff       	call   c01003f8 <__panic>
c0104201:	c7 04 24 68 9a 10 c0 	movl   $0xc0109a68,(%esp)
c0104208:	e8 94 c0 ff ff       	call   c01002a1 <cprintf>
c010420d:	b8 00 50 00 00       	mov    $0x5000,%eax
c0104212:	c6 00 0e             	movb   $0xe,(%eax)
c0104215:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c010421a:	83 f8 05             	cmp    $0x5,%eax
c010421d:	74 24                	je     c0104243 <_fifo_check_swap+0x150>
c010421f:	c7 44 24 0c 8e 9a 10 	movl   $0xc0109a8e,0xc(%esp)
c0104226:	c0 
c0104227:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c010422e:	c0 
c010422f:	c7 44 24 04 5f 00 00 	movl   $0x5f,0x4(%esp)
c0104236:	00 
c0104237:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c010423e:	e8 b5 c1 ff ff       	call   c01003f8 <__panic>
c0104243:	c7 04 24 40 9a 10 c0 	movl   $0xc0109a40,(%esp)
c010424a:	e8 52 c0 ff ff       	call   c01002a1 <cprintf>
c010424f:	b8 00 20 00 00       	mov    $0x2000,%eax
c0104254:	c6 00 0b             	movb   $0xb,(%eax)
c0104257:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c010425c:	83 f8 05             	cmp    $0x5,%eax
c010425f:	74 24                	je     c0104285 <_fifo_check_swap+0x192>
c0104261:	c7 44 24 0c 8e 9a 10 	movl   $0xc0109a8e,0xc(%esp)
c0104268:	c0 
c0104269:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c0104270:	c0 
c0104271:	c7 44 24 04 62 00 00 	movl   $0x62,0x4(%esp)
c0104278:	00 
c0104279:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c0104280:	e8 73 c1 ff ff       	call   c01003f8 <__panic>
c0104285:	c7 04 24 f0 99 10 c0 	movl   $0xc01099f0,(%esp)
c010428c:	e8 10 c0 ff ff       	call   c01002a1 <cprintf>
c0104291:	b8 00 10 00 00       	mov    $0x1000,%eax
c0104296:	c6 00 0a             	movb   $0xa,(%eax)
c0104299:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c010429e:	83 f8 06             	cmp    $0x6,%eax
c01042a1:	74 24                	je     c01042c7 <_fifo_check_swap+0x1d4>
c01042a3:	c7 44 24 0c 9d 9a 10 	movl   $0xc0109a9d,0xc(%esp)
c01042aa:	c0 
c01042ab:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c01042b2:	c0 
c01042b3:	c7 44 24 04 65 00 00 	movl   $0x65,0x4(%esp)
c01042ba:	00 
c01042bb:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c01042c2:	e8 31 c1 ff ff       	call   c01003f8 <__panic>
c01042c7:	c7 04 24 40 9a 10 c0 	movl   $0xc0109a40,(%esp)
c01042ce:	e8 ce bf ff ff       	call   c01002a1 <cprintf>
c01042d3:	b8 00 20 00 00       	mov    $0x2000,%eax
c01042d8:	c6 00 0b             	movb   $0xb,(%eax)
c01042db:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c01042e0:	83 f8 07             	cmp    $0x7,%eax
c01042e3:	74 24                	je     c0104309 <_fifo_check_swap+0x216>
c01042e5:	c7 44 24 0c ac 9a 10 	movl   $0xc0109aac,0xc(%esp)
c01042ec:	c0 
c01042ed:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c01042f4:	c0 
c01042f5:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
c01042fc:	00 
c01042fd:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c0104304:	e8 ef c0 ff ff       	call   c01003f8 <__panic>
c0104309:	c7 04 24 b8 99 10 c0 	movl   $0xc01099b8,(%esp)
c0104310:	e8 8c bf ff ff       	call   c01002a1 <cprintf>
c0104315:	b8 00 30 00 00       	mov    $0x3000,%eax
c010431a:	c6 00 0c             	movb   $0xc,(%eax)
c010431d:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c0104322:	83 f8 08             	cmp    $0x8,%eax
c0104325:	74 24                	je     c010434b <_fifo_check_swap+0x258>
c0104327:	c7 44 24 0c bb 9a 10 	movl   $0xc0109abb,0xc(%esp)
c010432e:	c0 
c010432f:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c0104336:	c0 
c0104337:	c7 44 24 04 6b 00 00 	movl   $0x6b,0x4(%esp)
c010433e:	00 
c010433f:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c0104346:	e8 ad c0 ff ff       	call   c01003f8 <__panic>
c010434b:	c7 04 24 18 9a 10 c0 	movl   $0xc0109a18,(%esp)
c0104352:	e8 4a bf ff ff       	call   c01002a1 <cprintf>
c0104357:	b8 00 40 00 00       	mov    $0x4000,%eax
c010435c:	c6 00 0d             	movb   $0xd,(%eax)
c010435f:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c0104364:	83 f8 09             	cmp    $0x9,%eax
c0104367:	74 24                	je     c010438d <_fifo_check_swap+0x29a>
c0104369:	c7 44 24 0c ca 9a 10 	movl   $0xc0109aca,0xc(%esp)
c0104370:	c0 
c0104371:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c0104378:	c0 
c0104379:	c7 44 24 04 6e 00 00 	movl   $0x6e,0x4(%esp)
c0104380:	00 
c0104381:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c0104388:	e8 6b c0 ff ff       	call   c01003f8 <__panic>
c010438d:	c7 04 24 68 9a 10 c0 	movl   $0xc0109a68,(%esp)
c0104394:	e8 08 bf ff ff       	call   c01002a1 <cprintf>
c0104399:	b8 00 50 00 00       	mov    $0x5000,%eax
c010439e:	c6 00 0e             	movb   $0xe,(%eax)
c01043a1:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c01043a6:	83 f8 0a             	cmp    $0xa,%eax
c01043a9:	74 24                	je     c01043cf <_fifo_check_swap+0x2dc>
c01043ab:	c7 44 24 0c d9 9a 10 	movl   $0xc0109ad9,0xc(%esp)
c01043b2:	c0 
c01043b3:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c01043ba:	c0 
c01043bb:	c7 44 24 04 71 00 00 	movl   $0x71,0x4(%esp)
c01043c2:	00 
c01043c3:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c01043ca:	e8 29 c0 ff ff       	call   c01003f8 <__panic>
c01043cf:	c7 04 24 f0 99 10 c0 	movl   $0xc01099f0,(%esp)
c01043d6:	e8 c6 be ff ff       	call   c01002a1 <cprintf>
c01043db:	b8 00 10 00 00       	mov    $0x1000,%eax
c01043e0:	0f b6 00             	movzbl (%eax),%eax
c01043e3:	3c 0a                	cmp    $0xa,%al
c01043e5:	74 24                	je     c010440b <_fifo_check_swap+0x318>
c01043e7:	c7 44 24 0c ec 9a 10 	movl   $0xc0109aec,0xc(%esp)
c01043ee:	c0 
c01043ef:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c01043f6:	c0 
c01043f7:	c7 44 24 04 73 00 00 	movl   $0x73,0x4(%esp)
c01043fe:	00 
c01043ff:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c0104406:	e8 ed bf ff ff       	call   c01003f8 <__panic>
c010440b:	b8 00 10 00 00       	mov    $0x1000,%eax
c0104410:	c6 00 0a             	movb   $0xa,(%eax)
c0104413:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c0104418:	83 f8 0b             	cmp    $0xb,%eax
c010441b:	74 24                	je     c0104441 <_fifo_check_swap+0x34e>
c010441d:	c7 44 24 0c 0d 9b 10 	movl   $0xc0109b0d,0xc(%esp)
c0104424:	c0 
c0104425:	c7 44 24 08 6e 99 10 	movl   $0xc010996e,0x8(%esp)
c010442c:	c0 
c010442d:	c7 44 24 04 75 00 00 	movl   $0x75,0x4(%esp)
c0104434:	00 
c0104435:	c7 04 24 83 99 10 c0 	movl   $0xc0109983,(%esp)
c010443c:	e8 b7 bf ff ff       	call   c01003f8 <__panic>
c0104441:	b8 00 00 00 00       	mov    $0x0,%eax
c0104446:	c9                   	leave  
c0104447:	c3                   	ret    

c0104448 <_fifo_init>:
c0104448:	55                   	push   %ebp
c0104449:	89 e5                	mov    %esp,%ebp
c010444b:	b8 00 00 00 00       	mov    $0x0,%eax
c0104450:	5d                   	pop    %ebp
c0104451:	c3                   	ret    

c0104452 <_fifo_set_unswappable>:
c0104452:	55                   	push   %ebp
c0104453:	89 e5                	mov    %esp,%ebp
c0104455:	b8 00 00 00 00       	mov    $0x0,%eax
c010445a:	5d                   	pop    %ebp
c010445b:	c3                   	ret    

c010445c <_fifo_tick_event>:
c010445c:	55                   	push   %ebp
c010445d:	89 e5                	mov    %esp,%ebp
c010445f:	b8 00 00 00 00       	mov    $0x0,%eax
c0104464:	5d                   	pop    %ebp
c0104465:	c3                   	ret    

c0104466 <pa2page>:
c0104466:	55                   	push   %ebp
c0104467:	89 e5                	mov    %esp,%ebp
c0104469:	83 ec 18             	sub    $0x18,%esp
c010446c:	8b 45 08             	mov    0x8(%ebp),%eax
c010446f:	c1 e8 0c             	shr    $0xc,%eax
c0104472:	89 c2                	mov    %eax,%edx
c0104474:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c0104479:	39 c2                	cmp    %eax,%edx
c010447b:	72 1c                	jb     c0104499 <pa2page+0x33>
c010447d:	c7 44 24 08 30 9b 10 	movl   $0xc0109b30,0x8(%esp)
c0104484:	c0 
c0104485:	c7 44 24 04 5b 00 00 	movl   $0x5b,0x4(%esp)
c010448c:	00 
c010448d:	c7 04 24 4f 9b 10 c0 	movl   $0xc0109b4f,(%esp)
c0104494:	e8 5f bf ff ff       	call   c01003f8 <__panic>
c0104499:	a1 f8 40 12 c0       	mov    0xc01240f8,%eax
c010449e:	8b 55 08             	mov    0x8(%ebp),%edx
c01044a1:	c1 ea 0c             	shr    $0xc,%edx
c01044a4:	c1 e2 05             	shl    $0x5,%edx
c01044a7:	01 d0                	add    %edx,%eax
c01044a9:	c9                   	leave  
c01044aa:	c3                   	ret    

c01044ab <pte2page>:
c01044ab:	55                   	push   %ebp
c01044ac:	89 e5                	mov    %esp,%ebp
c01044ae:	83 ec 18             	sub    $0x18,%esp
c01044b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01044b4:	83 e0 01             	and    $0x1,%eax
c01044b7:	85 c0                	test   %eax,%eax
c01044b9:	75 1c                	jne    c01044d7 <pte2page+0x2c>
c01044bb:	c7 44 24 08 60 9b 10 	movl   $0xc0109b60,0x8(%esp)
c01044c2:	c0 
c01044c3:	c7 44 24 04 6d 00 00 	movl   $0x6d,0x4(%esp)
c01044ca:	00 
c01044cb:	c7 04 24 4f 9b 10 c0 	movl   $0xc0109b4f,(%esp)
c01044d2:	e8 21 bf ff ff       	call   c01003f8 <__panic>
c01044d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01044da:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01044df:	89 04 24             	mov    %eax,(%esp)
c01044e2:	e8 7f ff ff ff       	call   c0104466 <pa2page>
c01044e7:	c9                   	leave  
c01044e8:	c3                   	ret    

c01044e9 <swap_init>:
c01044e9:	55                   	push   %ebp
c01044ea:	89 e5                	mov    %esp,%ebp
c01044ec:	83 ec 28             	sub    $0x28,%esp
c01044ef:	e8 57 3a 00 00       	call   c0107f4b <swapfs_init>
c01044f4:	a1 bc 40 12 c0       	mov    0xc01240bc,%eax
c01044f9:	3d ff 03 00 00       	cmp    $0x3ff,%eax
c01044fe:	76 0c                	jbe    c010450c <swap_init+0x23>
c0104500:	a1 bc 40 12 c0       	mov    0xc01240bc,%eax
c0104505:	3d ff ff ff 00       	cmp    $0xffffff,%eax
c010450a:	76 25                	jbe    c0104531 <swap_init+0x48>
c010450c:	a1 bc 40 12 c0       	mov    0xc01240bc,%eax
c0104511:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0104515:	c7 44 24 08 81 9b 10 	movl   $0xc0109b81,0x8(%esp)
c010451c:	c0 
c010451d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
c0104524:	00 
c0104525:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c010452c:	e8 c7 be ff ff       	call   c01003f8 <__panic>
c0104531:	c7 05 70 3f 12 c0 e0 	movl   $0xc01209e0,0xc0123f70
c0104538:	09 12 c0 
c010453b:	a1 70 3f 12 c0       	mov    0xc0123f70,%eax
c0104540:	8b 40 04             	mov    0x4(%eax),%eax
c0104543:	ff d0                	call   *%eax
c0104545:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104548:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010454c:	75 26                	jne    c0104574 <swap_init+0x8b>
c010454e:	c7 05 68 3f 12 c0 01 	movl   $0x1,0xc0123f68
c0104555:	00 00 00 
c0104558:	a1 70 3f 12 c0       	mov    0xc0123f70,%eax
c010455d:	8b 00                	mov    (%eax),%eax
c010455f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104563:	c7 04 24 ab 9b 10 c0 	movl   $0xc0109bab,(%esp)
c010456a:	e8 32 bd ff ff       	call   c01002a1 <cprintf>
c010456f:	e8 a4 04 00 00       	call   c0104a18 <check_swap>
c0104574:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104577:	c9                   	leave  
c0104578:	c3                   	ret    

c0104579 <swap_init_mm>:
c0104579:	55                   	push   %ebp
c010457a:	89 e5                	mov    %esp,%ebp
c010457c:	83 ec 18             	sub    $0x18,%esp
c010457f:	a1 70 3f 12 c0       	mov    0xc0123f70,%eax
c0104584:	8b 40 08             	mov    0x8(%eax),%eax
c0104587:	8b 55 08             	mov    0x8(%ebp),%edx
c010458a:	89 14 24             	mov    %edx,(%esp)
c010458d:	ff d0                	call   *%eax
c010458f:	c9                   	leave  
c0104590:	c3                   	ret    

c0104591 <swap_tick_event>:
c0104591:	55                   	push   %ebp
c0104592:	89 e5                	mov    %esp,%ebp
c0104594:	83 ec 18             	sub    $0x18,%esp
c0104597:	a1 70 3f 12 c0       	mov    0xc0123f70,%eax
c010459c:	8b 40 0c             	mov    0xc(%eax),%eax
c010459f:	8b 55 08             	mov    0x8(%ebp),%edx
c01045a2:	89 14 24             	mov    %edx,(%esp)
c01045a5:	ff d0                	call   *%eax
c01045a7:	c9                   	leave  
c01045a8:	c3                   	ret    

c01045a9 <swap_map_swappable>:
c01045a9:	55                   	push   %ebp
c01045aa:	89 e5                	mov    %esp,%ebp
c01045ac:	83 ec 18             	sub    $0x18,%esp
c01045af:	a1 70 3f 12 c0       	mov    0xc0123f70,%eax
c01045b4:	8b 40 10             	mov    0x10(%eax),%eax
c01045b7:	8b 55 14             	mov    0x14(%ebp),%edx
c01045ba:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01045be:	8b 55 10             	mov    0x10(%ebp),%edx
c01045c1:	89 54 24 08          	mov    %edx,0x8(%esp)
c01045c5:	8b 55 0c             	mov    0xc(%ebp),%edx
c01045c8:	89 54 24 04          	mov    %edx,0x4(%esp)
c01045cc:	8b 55 08             	mov    0x8(%ebp),%edx
c01045cf:	89 14 24             	mov    %edx,(%esp)
c01045d2:	ff d0                	call   *%eax
c01045d4:	c9                   	leave  
c01045d5:	c3                   	ret    

c01045d6 <swap_set_unswappable>:
c01045d6:	55                   	push   %ebp
c01045d7:	89 e5                	mov    %esp,%ebp
c01045d9:	83 ec 18             	sub    $0x18,%esp
c01045dc:	a1 70 3f 12 c0       	mov    0xc0123f70,%eax
c01045e1:	8b 40 14             	mov    0x14(%eax),%eax
c01045e4:	8b 55 0c             	mov    0xc(%ebp),%edx
c01045e7:	89 54 24 04          	mov    %edx,0x4(%esp)
c01045eb:	8b 55 08             	mov    0x8(%ebp),%edx
c01045ee:	89 14 24             	mov    %edx,(%esp)
c01045f1:	ff d0                	call   *%eax
c01045f3:	c9                   	leave  
c01045f4:	c3                   	ret    

c01045f5 <swap_out>:
c01045f5:	55                   	push   %ebp
c01045f6:	89 e5                	mov    %esp,%ebp
c01045f8:	83 ec 38             	sub    $0x38,%esp
c01045fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104602:	e9 5a 01 00 00       	jmp    c0104761 <swap_out+0x16c>
c0104607:	a1 70 3f 12 c0       	mov    0xc0123f70,%eax
c010460c:	8b 40 18             	mov    0x18(%eax),%eax
c010460f:	8b 55 10             	mov    0x10(%ebp),%edx
c0104612:	89 54 24 08          	mov    %edx,0x8(%esp)
c0104616:	8d 55 e4             	lea    -0x1c(%ebp),%edx
c0104619:	89 54 24 04          	mov    %edx,0x4(%esp)
c010461d:	8b 55 08             	mov    0x8(%ebp),%edx
c0104620:	89 14 24             	mov    %edx,(%esp)
c0104623:	ff d0                	call   *%eax
c0104625:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104628:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010462c:	74 18                	je     c0104646 <swap_out+0x51>
c010462e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104631:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104635:	c7 04 24 c0 9b 10 c0 	movl   $0xc0109bc0,(%esp)
c010463c:	e8 60 bc ff ff       	call   c01002a1 <cprintf>
c0104641:	e9 27 01 00 00       	jmp    c010476d <swap_out+0x178>
c0104646:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104649:	8b 40 1c             	mov    0x1c(%eax),%eax
c010464c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010464f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104652:	8b 40 0c             	mov    0xc(%eax),%eax
c0104655:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c010465c:	00 
c010465d:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104660:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104664:	89 04 24             	mov    %eax,(%esp)
c0104667:	e8 5c 26 00 00       	call   c0106cc8 <get_pte>
c010466c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010466f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104672:	8b 00                	mov    (%eax),%eax
c0104674:	83 e0 01             	and    $0x1,%eax
c0104677:	85 c0                	test   %eax,%eax
c0104679:	75 24                	jne    c010469f <swap_out+0xaa>
c010467b:	c7 44 24 0c ed 9b 10 	movl   $0xc0109bed,0xc(%esp)
c0104682:	c0 
c0104683:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c010468a:	c0 
c010468b:	c7 44 24 04 65 00 00 	movl   $0x65,0x4(%esp)
c0104692:	00 
c0104693:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c010469a:	e8 59 bd ff ff       	call   c01003f8 <__panic>
c010469f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01046a2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01046a5:	8b 52 1c             	mov    0x1c(%edx),%edx
c01046a8:	c1 ea 0c             	shr    $0xc,%edx
c01046ab:	83 c2 01             	add    $0x1,%edx
c01046ae:	c1 e2 08             	shl    $0x8,%edx
c01046b1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01046b5:	89 14 24             	mov    %edx,(%esp)
c01046b8:	e8 48 39 00 00       	call   c0108005 <swapfs_write>
c01046bd:	85 c0                	test   %eax,%eax
c01046bf:	74 34                	je     c01046f5 <swap_out+0x100>
c01046c1:	c7 04 24 17 9c 10 c0 	movl   $0xc0109c17,(%esp)
c01046c8:	e8 d4 bb ff ff       	call   c01002a1 <cprintf>
c01046cd:	a1 70 3f 12 c0       	mov    0xc0123f70,%eax
c01046d2:	8b 40 10             	mov    0x10(%eax),%eax
c01046d5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01046d8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01046df:	00 
c01046e0:	89 54 24 08          	mov    %edx,0x8(%esp)
c01046e4:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01046e7:	89 54 24 04          	mov    %edx,0x4(%esp)
c01046eb:	8b 55 08             	mov    0x8(%ebp),%edx
c01046ee:	89 14 24             	mov    %edx,(%esp)
c01046f1:	ff d0                	call   *%eax
c01046f3:	eb 68                	jmp    c010475d <swap_out+0x168>
c01046f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01046f8:	8b 40 1c             	mov    0x1c(%eax),%eax
c01046fb:	c1 e8 0c             	shr    $0xc,%eax
c01046fe:	83 c0 01             	add    $0x1,%eax
c0104701:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0104705:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104708:	89 44 24 08          	mov    %eax,0x8(%esp)
c010470c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010470f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104713:	c7 04 24 30 9c 10 c0 	movl   $0xc0109c30,(%esp)
c010471a:	e8 82 bb ff ff       	call   c01002a1 <cprintf>
c010471f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104722:	8b 40 1c             	mov    0x1c(%eax),%eax
c0104725:	c1 e8 0c             	shr    $0xc,%eax
c0104728:	83 c0 01             	add    $0x1,%eax
c010472b:	c1 e0 08             	shl    $0x8,%eax
c010472e:	89 c2                	mov    %eax,%edx
c0104730:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104733:	89 10                	mov    %edx,(%eax)
c0104735:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104738:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010473f:	00 
c0104740:	89 04 24             	mov    %eax,(%esp)
c0104743:	e8 0c 1f 00 00       	call   c0106654 <free_pages>
c0104748:	8b 45 08             	mov    0x8(%ebp),%eax
c010474b:	8b 40 0c             	mov    0xc(%eax),%eax
c010474e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104751:	89 54 24 04          	mov    %edx,0x4(%esp)
c0104755:	89 04 24             	mov    %eax,(%esp)
c0104758:	e8 5a 28 00 00       	call   c0106fb7 <tlb_invalidate>
c010475d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104761:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104764:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0104767:	0f 85 9a fe ff ff    	jne    c0104607 <swap_out+0x12>
c010476d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104770:	c9                   	leave  
c0104771:	c3                   	ret    

c0104772 <swap_in>:
c0104772:	55                   	push   %ebp
c0104773:	89 e5                	mov    %esp,%ebp
c0104775:	83 ec 28             	sub    $0x28,%esp
c0104778:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c010477f:	e8 65 1e 00 00       	call   c01065e9 <alloc_pages>
c0104784:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104787:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010478b:	75 24                	jne    c01047b1 <swap_in+0x3f>
c010478d:	c7 44 24 0c 70 9c 10 	movl   $0xc0109c70,0xc(%esp)
c0104794:	c0 
c0104795:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c010479c:	c0 
c010479d:	c7 44 24 04 7b 00 00 	movl   $0x7b,0x4(%esp)
c01047a4:	00 
c01047a5:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c01047ac:	e8 47 bc ff ff       	call   c01003f8 <__panic>
c01047b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01047b4:	8b 40 0c             	mov    0xc(%eax),%eax
c01047b7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01047be:	00 
c01047bf:	8b 55 0c             	mov    0xc(%ebp),%edx
c01047c2:	89 54 24 04          	mov    %edx,0x4(%esp)
c01047c6:	89 04 24             	mov    %eax,(%esp)
c01047c9:	e8 fa 24 00 00       	call   c0106cc8 <get_pte>
c01047ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01047d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01047d4:	8b 00                	mov    (%eax),%eax
c01047d6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01047d9:	89 54 24 04          	mov    %edx,0x4(%esp)
c01047dd:	89 04 24             	mov    %eax,(%esp)
c01047e0:	e8 ae 37 00 00       	call   c0107f93 <swapfs_read>
c01047e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01047e8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01047ec:	74 2a                	je     c0104818 <swap_in+0xa6>
c01047ee:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01047f2:	75 24                	jne    c0104818 <swap_in+0xa6>
c01047f4:	c7 44 24 0c 7d 9c 10 	movl   $0xc0109c7d,0xc(%esp)
c01047fb:	c0 
c01047fc:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104803:	c0 
c0104804:	c7 44 24 04 83 00 00 	movl   $0x83,0x4(%esp)
c010480b:	00 
c010480c:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104813:	e8 e0 bb ff ff       	call   c01003f8 <__panic>
c0104818:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010481b:	8b 00                	mov    (%eax),%eax
c010481d:	c1 e8 08             	shr    $0x8,%eax
c0104820:	89 c2                	mov    %eax,%edx
c0104822:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104825:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104829:	89 54 24 04          	mov    %edx,0x4(%esp)
c010482d:	c7 04 24 84 9c 10 c0 	movl   $0xc0109c84,(%esp)
c0104834:	e8 68 ba ff ff       	call   c01002a1 <cprintf>
c0104839:	8b 45 10             	mov    0x10(%ebp),%eax
c010483c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010483f:	89 10                	mov    %edx,(%eax)
c0104841:	b8 00 00 00 00       	mov    $0x0,%eax
c0104846:	c9                   	leave  
c0104847:	c3                   	ret    

c0104848 <check_content_set>:
c0104848:	55                   	push   %ebp
c0104849:	89 e5                	mov    %esp,%ebp
c010484b:	83 ec 18             	sub    $0x18,%esp
c010484e:	b8 00 10 00 00       	mov    $0x1000,%eax
c0104853:	c6 00 0a             	movb   $0xa,(%eax)
c0104856:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c010485b:	83 f8 01             	cmp    $0x1,%eax
c010485e:	74 24                	je     c0104884 <check_content_set+0x3c>
c0104860:	c7 44 24 0c c2 9c 10 	movl   $0xc0109cc2,0xc(%esp)
c0104867:	c0 
c0104868:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c010486f:	c0 
c0104870:	c7 44 24 04 90 00 00 	movl   $0x90,0x4(%esp)
c0104877:	00 
c0104878:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c010487f:	e8 74 bb ff ff       	call   c01003f8 <__panic>
c0104884:	b8 10 10 00 00       	mov    $0x1010,%eax
c0104889:	c6 00 0a             	movb   $0xa,(%eax)
c010488c:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c0104891:	83 f8 01             	cmp    $0x1,%eax
c0104894:	74 24                	je     c01048ba <check_content_set+0x72>
c0104896:	c7 44 24 0c c2 9c 10 	movl   $0xc0109cc2,0xc(%esp)
c010489d:	c0 
c010489e:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c01048a5:	c0 
c01048a6:	c7 44 24 04 92 00 00 	movl   $0x92,0x4(%esp)
c01048ad:	00 
c01048ae:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c01048b5:	e8 3e bb ff ff       	call   c01003f8 <__panic>
c01048ba:	b8 00 20 00 00       	mov    $0x2000,%eax
c01048bf:	c6 00 0b             	movb   $0xb,(%eax)
c01048c2:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c01048c7:	83 f8 02             	cmp    $0x2,%eax
c01048ca:	74 24                	je     c01048f0 <check_content_set+0xa8>
c01048cc:	c7 44 24 0c d1 9c 10 	movl   $0xc0109cd1,0xc(%esp)
c01048d3:	c0 
c01048d4:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c01048db:	c0 
c01048dc:	c7 44 24 04 94 00 00 	movl   $0x94,0x4(%esp)
c01048e3:	00 
c01048e4:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c01048eb:	e8 08 bb ff ff       	call   c01003f8 <__panic>
c01048f0:	b8 10 20 00 00       	mov    $0x2010,%eax
c01048f5:	c6 00 0b             	movb   $0xb,(%eax)
c01048f8:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c01048fd:	83 f8 02             	cmp    $0x2,%eax
c0104900:	74 24                	je     c0104926 <check_content_set+0xde>
c0104902:	c7 44 24 0c d1 9c 10 	movl   $0xc0109cd1,0xc(%esp)
c0104909:	c0 
c010490a:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104911:	c0 
c0104912:	c7 44 24 04 96 00 00 	movl   $0x96,0x4(%esp)
c0104919:	00 
c010491a:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104921:	e8 d2 ba ff ff       	call   c01003f8 <__panic>
c0104926:	b8 00 30 00 00       	mov    $0x3000,%eax
c010492b:	c6 00 0c             	movb   $0xc,(%eax)
c010492e:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c0104933:	83 f8 03             	cmp    $0x3,%eax
c0104936:	74 24                	je     c010495c <check_content_set+0x114>
c0104938:	c7 44 24 0c e0 9c 10 	movl   $0xc0109ce0,0xc(%esp)
c010493f:	c0 
c0104940:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104947:	c0 
c0104948:	c7 44 24 04 98 00 00 	movl   $0x98,0x4(%esp)
c010494f:	00 
c0104950:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104957:	e8 9c ba ff ff       	call   c01003f8 <__panic>
c010495c:	b8 10 30 00 00       	mov    $0x3010,%eax
c0104961:	c6 00 0c             	movb   $0xc,(%eax)
c0104964:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c0104969:	83 f8 03             	cmp    $0x3,%eax
c010496c:	74 24                	je     c0104992 <check_content_set+0x14a>
c010496e:	c7 44 24 0c e0 9c 10 	movl   $0xc0109ce0,0xc(%esp)
c0104975:	c0 
c0104976:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c010497d:	c0 
c010497e:	c7 44 24 04 9a 00 00 	movl   $0x9a,0x4(%esp)
c0104985:	00 
c0104986:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c010498d:	e8 66 ba ff ff       	call   c01003f8 <__panic>
c0104992:	b8 00 40 00 00       	mov    $0x4000,%eax
c0104997:	c6 00 0d             	movb   $0xd,(%eax)
c010499a:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c010499f:	83 f8 04             	cmp    $0x4,%eax
c01049a2:	74 24                	je     c01049c8 <check_content_set+0x180>
c01049a4:	c7 44 24 0c ef 9c 10 	movl   $0xc0109cef,0xc(%esp)
c01049ab:	c0 
c01049ac:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c01049b3:	c0 
c01049b4:	c7 44 24 04 9c 00 00 	movl   $0x9c,0x4(%esp)
c01049bb:	00 
c01049bc:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c01049c3:	e8 30 ba ff ff       	call   c01003f8 <__panic>
c01049c8:	b8 10 40 00 00       	mov    $0x4010,%eax
c01049cd:	c6 00 0d             	movb   $0xd,(%eax)
c01049d0:	a1 64 3f 12 c0       	mov    0xc0123f64,%eax
c01049d5:	83 f8 04             	cmp    $0x4,%eax
c01049d8:	74 24                	je     c01049fe <check_content_set+0x1b6>
c01049da:	c7 44 24 0c ef 9c 10 	movl   $0xc0109cef,0xc(%esp)
c01049e1:	c0 
c01049e2:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c01049e9:	c0 
c01049ea:	c7 44 24 04 9e 00 00 	movl   $0x9e,0x4(%esp)
c01049f1:	00 
c01049f2:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c01049f9:	e8 fa b9 ff ff       	call   c01003f8 <__panic>
c01049fe:	c9                   	leave  
c01049ff:	c3                   	ret    

c0104a00 <check_content_access>:
c0104a00:	55                   	push   %ebp
c0104a01:	89 e5                	mov    %esp,%ebp
c0104a03:	83 ec 18             	sub    $0x18,%esp
c0104a06:	a1 70 3f 12 c0       	mov    0xc0123f70,%eax
c0104a0b:	8b 40 1c             	mov    0x1c(%eax),%eax
c0104a0e:	ff d0                	call   *%eax
c0104a10:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104a13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a16:	c9                   	leave  
c0104a17:	c3                   	ret    

c0104a18 <check_swap>:
c0104a18:	55                   	push   %ebp
c0104a19:	89 e5                	mov    %esp,%ebp
c0104a1b:	53                   	push   %ebx
c0104a1c:	83 ec 74             	sub    $0x74,%esp
c0104a1f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104a26:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104a2d:	c7 45 e8 e4 40 12 c0 	movl   $0xc01240e4,-0x18(%ebp)
c0104a34:	eb 6b                	jmp    c0104aa1 <check_swap+0x89>
c0104a36:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104a39:	83 e8 0c             	sub    $0xc,%eax
c0104a3c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104a3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104a42:	83 c0 04             	add    $0x4,%eax
c0104a45:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
c0104a4c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104a4f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0104a52:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0104a55:	0f a3 10             	bt     %edx,(%eax)
c0104a58:	19 c0                	sbb    %eax,%eax
c0104a5a:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104a5d:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0104a61:	0f 95 c0             	setne  %al
c0104a64:	0f b6 c0             	movzbl %al,%eax
c0104a67:	85 c0                	test   %eax,%eax
c0104a69:	75 24                	jne    c0104a8f <check_swap+0x77>
c0104a6b:	c7 44 24 0c fe 9c 10 	movl   $0xc0109cfe,0xc(%esp)
c0104a72:	c0 
c0104a73:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104a7a:	c0 
c0104a7b:	c7 44 24 04 b9 00 00 	movl   $0xb9,0x4(%esp)
c0104a82:	00 
c0104a83:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104a8a:	e8 69 b9 ff ff       	call   c01003f8 <__panic>
c0104a8f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104a93:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104a96:	8b 50 08             	mov    0x8(%eax),%edx
c0104a99:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104a9c:	01 d0                	add    %edx,%eax
c0104a9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104aa1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104aa4:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0104aa7:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0104aaa:	8b 40 04             	mov    0x4(%eax),%eax
c0104aad:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104ab0:	81 7d e8 e4 40 12 c0 	cmpl   $0xc01240e4,-0x18(%ebp)
c0104ab7:	0f 85 79 ff ff ff    	jne    c0104a36 <check_swap+0x1e>
c0104abd:	8b 5d f0             	mov    -0x10(%ebp),%ebx
c0104ac0:	e8 c1 1b 00 00       	call   c0106686 <nr_free_pages>
c0104ac5:	39 c3                	cmp    %eax,%ebx
c0104ac7:	74 24                	je     c0104aed <check_swap+0xd5>
c0104ac9:	c7 44 24 0c 0e 9d 10 	movl   $0xc0109d0e,0xc(%esp)
c0104ad0:	c0 
c0104ad1:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104ad8:	c0 
c0104ad9:	c7 44 24 04 bc 00 00 	movl   $0xbc,0x4(%esp)
c0104ae0:	00 
c0104ae1:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104ae8:	e8 0b b9 ff ff       	call   c01003f8 <__panic>
c0104aed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104af0:	89 44 24 08          	mov    %eax,0x8(%esp)
c0104af4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104af7:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104afb:	c7 04 24 28 9d 10 c0 	movl   $0xc0109d28,(%esp)
c0104b02:	e8 9a b7 ff ff       	call   c01002a1 <cprintf>
c0104b07:	e8 57 e7 ff ff       	call   c0103263 <mm_create>
c0104b0c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104b0f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0104b13:	75 24                	jne    c0104b39 <check_swap+0x121>
c0104b15:	c7 44 24 0c 4e 9d 10 	movl   $0xc0109d4e,0xc(%esp)
c0104b1c:	c0 
c0104b1d:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104b24:	c0 
c0104b25:	c7 44 24 04 c1 00 00 	movl   $0xc1,0x4(%esp)
c0104b2c:	00 
c0104b2d:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104b34:	e8 bf b8 ff ff       	call   c01003f8 <__panic>
c0104b39:	a1 10 40 12 c0       	mov    0xc0124010,%eax
c0104b3e:	85 c0                	test   %eax,%eax
c0104b40:	74 24                	je     c0104b66 <check_swap+0x14e>
c0104b42:	c7 44 24 0c 59 9d 10 	movl   $0xc0109d59,0xc(%esp)
c0104b49:	c0 
c0104b4a:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104b51:	c0 
c0104b52:	c7 44 24 04 c4 00 00 	movl   $0xc4,0x4(%esp)
c0104b59:	00 
c0104b5a:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104b61:	e8 92 b8 ff ff       	call   c01003f8 <__panic>
c0104b66:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104b69:	a3 10 40 12 c0       	mov    %eax,0xc0124010
c0104b6e:	8b 15 00 0a 12 c0    	mov    0xc0120a00,%edx
c0104b74:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104b77:	89 50 0c             	mov    %edx,0xc(%eax)
c0104b7a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104b7d:	8b 40 0c             	mov    0xc(%eax),%eax
c0104b80:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0104b83:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104b86:	8b 00                	mov    (%eax),%eax
c0104b88:	85 c0                	test   %eax,%eax
c0104b8a:	74 24                	je     c0104bb0 <check_swap+0x198>
c0104b8c:	c7 44 24 0c 71 9d 10 	movl   $0xc0109d71,0xc(%esp)
c0104b93:	c0 
c0104b94:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104b9b:	c0 
c0104b9c:	c7 44 24 04 c9 00 00 	movl   $0xc9,0x4(%esp)
c0104ba3:	00 
c0104ba4:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104bab:	e8 48 b8 ff ff       	call   c01003f8 <__panic>
c0104bb0:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
c0104bb7:	00 
c0104bb8:	c7 44 24 04 00 60 00 	movl   $0x6000,0x4(%esp)
c0104bbf:	00 
c0104bc0:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
c0104bc7:	e8 0f e7 ff ff       	call   c01032db <vma_create>
c0104bcc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104bcf:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0104bd3:	75 24                	jne    c0104bf9 <check_swap+0x1e1>
c0104bd5:	c7 44 24 0c 7f 9d 10 	movl   $0xc0109d7f,0xc(%esp)
c0104bdc:	c0 
c0104bdd:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104be4:	c0 
c0104be5:	c7 44 24 04 cc 00 00 	movl   $0xcc,0x4(%esp)
c0104bec:	00 
c0104bed:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104bf4:	e8 ff b7 ff ff       	call   c01003f8 <__panic>
c0104bf9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bfc:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104c00:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104c03:	89 04 24             	mov    %eax,(%esp)
c0104c06:	e8 60 e8 ff ff       	call   c010346b <insert_vma_struct>
c0104c0b:	c7 04 24 8c 9d 10 c0 	movl   $0xc0109d8c,(%esp)
c0104c12:	e8 8a b6 ff ff       	call   c01002a1 <cprintf>
c0104c17:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0104c1e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104c21:	8b 40 0c             	mov    0xc(%eax),%eax
c0104c24:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0104c2b:	00 
c0104c2c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c0104c33:	00 
c0104c34:	89 04 24             	mov    %eax,(%esp)
c0104c37:	e8 8c 20 00 00       	call   c0106cc8 <get_pte>
c0104c3c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104c3f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
c0104c43:	75 24                	jne    c0104c69 <check_swap+0x251>
c0104c45:	c7 44 24 0c c0 9d 10 	movl   $0xc0109dc0,0xc(%esp)
c0104c4c:	c0 
c0104c4d:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104c54:	c0 
c0104c55:	c7 44 24 04 d4 00 00 	movl   $0xd4,0x4(%esp)
c0104c5c:	00 
c0104c5d:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104c64:	e8 8f b7 ff ff       	call   c01003f8 <__panic>
c0104c69:	c7 04 24 d4 9d 10 c0 	movl   $0xc0109dd4,(%esp)
c0104c70:	e8 2c b6 ff ff       	call   c01002a1 <cprintf>
c0104c75:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104c7c:	e9 a3 00 00 00       	jmp    c0104d24 <check_swap+0x30c>
c0104c81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0104c88:	e8 5c 19 00 00       	call   c01065e9 <alloc_pages>
c0104c8d:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104c90:	89 04 95 20 40 12 c0 	mov    %eax,-0x3fedbfe0(,%edx,4)
c0104c97:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104c9a:	8b 04 85 20 40 12 c0 	mov    -0x3fedbfe0(,%eax,4),%eax
c0104ca1:	85 c0                	test   %eax,%eax
c0104ca3:	75 24                	jne    c0104cc9 <check_swap+0x2b1>
c0104ca5:	c7 44 24 0c f8 9d 10 	movl   $0xc0109df8,0xc(%esp)
c0104cac:	c0 
c0104cad:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104cb4:	c0 
c0104cb5:	c7 44 24 04 d9 00 00 	movl   $0xd9,0x4(%esp)
c0104cbc:	00 
c0104cbd:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104cc4:	e8 2f b7 ff ff       	call   c01003f8 <__panic>
c0104cc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104ccc:	8b 04 85 20 40 12 c0 	mov    -0x3fedbfe0(,%eax,4),%eax
c0104cd3:	83 c0 04             	add    $0x4,%eax
c0104cd6:	c7 45 b4 01 00 00 00 	movl   $0x1,-0x4c(%ebp)
c0104cdd:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0104ce0:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0104ce3:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0104ce6:	0f a3 10             	bt     %edx,(%eax)
c0104ce9:	19 c0                	sbb    %eax,%eax
c0104ceb:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0104cee:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0104cf2:	0f 95 c0             	setne  %al
c0104cf5:	0f b6 c0             	movzbl %al,%eax
c0104cf8:	85 c0                	test   %eax,%eax
c0104cfa:	74 24                	je     c0104d20 <check_swap+0x308>
c0104cfc:	c7 44 24 0c 0c 9e 10 	movl   $0xc0109e0c,0xc(%esp)
c0104d03:	c0 
c0104d04:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104d0b:	c0 
c0104d0c:	c7 44 24 04 da 00 00 	movl   $0xda,0x4(%esp)
c0104d13:	00 
c0104d14:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104d1b:	e8 d8 b6 ff ff       	call   c01003f8 <__panic>
c0104d20:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104d24:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
c0104d28:	0f 8e 53 ff ff ff    	jle    c0104c81 <check_swap+0x269>
c0104d2e:	a1 e4 40 12 c0       	mov    0xc01240e4,%eax
c0104d33:	8b 15 e8 40 12 c0    	mov    0xc01240e8,%edx
c0104d39:	89 45 98             	mov    %eax,-0x68(%ebp)
c0104d3c:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0104d3f:	c7 45 a8 e4 40 12 c0 	movl   $0xc01240e4,-0x58(%ebp)
c0104d46:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104d49:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0104d4c:	89 50 04             	mov    %edx,0x4(%eax)
c0104d4f:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104d52:	8b 50 04             	mov    0x4(%eax),%edx
c0104d55:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0104d58:	89 10                	mov    %edx,(%eax)
c0104d5a:	c7 45 a4 e4 40 12 c0 	movl   $0xc01240e4,-0x5c(%ebp)
c0104d61:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0104d64:	8b 40 04             	mov    0x4(%eax),%eax
c0104d67:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
c0104d6a:	0f 94 c0             	sete   %al
c0104d6d:	0f b6 c0             	movzbl %al,%eax
c0104d70:	85 c0                	test   %eax,%eax
c0104d72:	75 24                	jne    c0104d98 <check_swap+0x380>
c0104d74:	c7 44 24 0c 27 9e 10 	movl   $0xc0109e27,0xc(%esp)
c0104d7b:	c0 
c0104d7c:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104d83:	c0 
c0104d84:	c7 44 24 04 de 00 00 	movl   $0xde,0x4(%esp)
c0104d8b:	00 
c0104d8c:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104d93:	e8 60 b6 ff ff       	call   c01003f8 <__panic>
c0104d98:	a1 ec 40 12 c0       	mov    0xc01240ec,%eax
c0104d9d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104da0:	c7 05 ec 40 12 c0 00 	movl   $0x0,0xc01240ec
c0104da7:	00 00 00 
c0104daa:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104db1:	eb 1e                	jmp    c0104dd1 <check_swap+0x3b9>
c0104db3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104db6:	8b 04 85 20 40 12 c0 	mov    -0x3fedbfe0(,%eax,4),%eax
c0104dbd:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0104dc4:	00 
c0104dc5:	89 04 24             	mov    %eax,(%esp)
c0104dc8:	e8 87 18 00 00       	call   c0106654 <free_pages>
c0104dcd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104dd1:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
c0104dd5:	7e dc                	jle    c0104db3 <check_swap+0x39b>
c0104dd7:	a1 ec 40 12 c0       	mov    0xc01240ec,%eax
c0104ddc:	83 f8 04             	cmp    $0x4,%eax
c0104ddf:	74 24                	je     c0104e05 <check_swap+0x3ed>
c0104de1:	c7 44 24 0c 40 9e 10 	movl   $0xc0109e40,0xc(%esp)
c0104de8:	c0 
c0104de9:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104df0:	c0 
c0104df1:	c7 44 24 04 e7 00 00 	movl   $0xe7,0x4(%esp)
c0104df8:	00 
c0104df9:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104e00:	e8 f3 b5 ff ff       	call   c01003f8 <__panic>
c0104e05:	c7 04 24 64 9e 10 c0 	movl   $0xc0109e64,(%esp)
c0104e0c:	e8 90 b4 ff ff       	call   c01002a1 <cprintf>
c0104e11:	c7 05 64 3f 12 c0 00 	movl   $0x0,0xc0123f64
c0104e18:	00 00 00 
c0104e1b:	e8 28 fa ff ff       	call   c0104848 <check_content_set>
c0104e20:	a1 ec 40 12 c0       	mov    0xc01240ec,%eax
c0104e25:	85 c0                	test   %eax,%eax
c0104e27:	74 24                	je     c0104e4d <check_swap+0x435>
c0104e29:	c7 44 24 0c 8b 9e 10 	movl   $0xc0109e8b,0xc(%esp)
c0104e30:	c0 
c0104e31:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104e38:	c0 
c0104e39:	c7 44 24 04 f0 00 00 	movl   $0xf0,0x4(%esp)
c0104e40:	00 
c0104e41:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104e48:	e8 ab b5 ff ff       	call   c01003f8 <__panic>
c0104e4d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104e54:	eb 26                	jmp    c0104e7c <check_swap+0x464>
c0104e56:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104e59:	c7 04 85 40 40 12 c0 	movl   $0xffffffff,-0x3fedbfc0(,%eax,4)
c0104e60:	ff ff ff ff 
c0104e64:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104e67:	8b 14 85 40 40 12 c0 	mov    -0x3fedbfc0(,%eax,4),%edx
c0104e6e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104e71:	89 14 85 80 40 12 c0 	mov    %edx,-0x3fedbf80(,%eax,4)
c0104e78:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104e7c:	83 7d ec 09          	cmpl   $0x9,-0x14(%ebp)
c0104e80:	7e d4                	jle    c0104e56 <check_swap+0x43e>
c0104e82:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104e89:	e9 eb 00 00 00       	jmp    c0104f79 <check_swap+0x561>
c0104e8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104e91:	c7 04 85 d4 40 12 c0 	movl   $0x0,-0x3fedbf2c(,%eax,4)
c0104e98:	00 00 00 00 
c0104e9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104e9f:	83 c0 01             	add    $0x1,%eax
c0104ea2:	c1 e0 0c             	shl    $0xc,%eax
c0104ea5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c0104eac:	00 
c0104ead:	89 44 24 04          	mov    %eax,0x4(%esp)
c0104eb1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104eb4:	89 04 24             	mov    %eax,(%esp)
c0104eb7:	e8 0c 1e 00 00       	call   c0106cc8 <get_pte>
c0104ebc:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104ebf:	89 04 95 d4 40 12 c0 	mov    %eax,-0x3fedbf2c(,%edx,4)
c0104ec6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104ec9:	8b 04 85 d4 40 12 c0 	mov    -0x3fedbf2c(,%eax,4),%eax
c0104ed0:	85 c0                	test   %eax,%eax
c0104ed2:	75 24                	jne    c0104ef8 <check_swap+0x4e0>
c0104ed4:	c7 44 24 0c 98 9e 10 	movl   $0xc0109e98,0xc(%esp)
c0104edb:	c0 
c0104edc:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104ee3:	c0 
c0104ee4:	c7 44 24 04 f8 00 00 	movl   $0xf8,0x4(%esp)
c0104eeb:	00 
c0104eec:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104ef3:	e8 00 b5 ff ff       	call   c01003f8 <__panic>
c0104ef8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104efb:	8b 04 85 d4 40 12 c0 	mov    -0x3fedbf2c(,%eax,4),%eax
c0104f02:	8b 00                	mov    (%eax),%eax
c0104f04:	89 04 24             	mov    %eax,(%esp)
c0104f07:	e8 9f f5 ff ff       	call   c01044ab <pte2page>
c0104f0c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104f0f:	8b 14 95 20 40 12 c0 	mov    -0x3fedbfe0(,%edx,4),%edx
c0104f16:	39 d0                	cmp    %edx,%eax
c0104f18:	74 24                	je     c0104f3e <check_swap+0x526>
c0104f1a:	c7 44 24 0c b0 9e 10 	movl   $0xc0109eb0,0xc(%esp)
c0104f21:	c0 
c0104f22:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104f29:	c0 
c0104f2a:	c7 44 24 04 f9 00 00 	movl   $0xf9,0x4(%esp)
c0104f31:	00 
c0104f32:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104f39:	e8 ba b4 ff ff       	call   c01003f8 <__panic>
c0104f3e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104f41:	8b 04 85 d4 40 12 c0 	mov    -0x3fedbf2c(,%eax,4),%eax
c0104f48:	8b 00                	mov    (%eax),%eax
c0104f4a:	83 e0 01             	and    $0x1,%eax
c0104f4d:	85 c0                	test   %eax,%eax
c0104f4f:	75 24                	jne    c0104f75 <check_swap+0x55d>
c0104f51:	c7 44 24 0c d8 9e 10 	movl   $0xc0109ed8,0xc(%esp)
c0104f58:	c0 
c0104f59:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104f60:	c0 
c0104f61:	c7 44 24 04 fa 00 00 	movl   $0xfa,0x4(%esp)
c0104f68:	00 
c0104f69:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104f70:	e8 83 b4 ff ff       	call   c01003f8 <__panic>
c0104f75:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104f79:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
c0104f7d:	0f 8e 0b ff ff ff    	jle    c0104e8e <check_swap+0x476>
c0104f83:	c7 04 24 f4 9e 10 c0 	movl   $0xc0109ef4,(%esp)
c0104f8a:	e8 12 b3 ff ff       	call   c01002a1 <cprintf>
c0104f8f:	e8 6c fa ff ff       	call   c0104a00 <check_content_access>
c0104f94:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104f97:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0104f9b:	74 24                	je     c0104fc1 <check_swap+0x5a9>
c0104f9d:	c7 44 24 0c 1a 9f 10 	movl   $0xc0109f1a,0xc(%esp)
c0104fa4:	c0 
c0104fa5:	c7 44 24 08 02 9c 10 	movl   $0xc0109c02,0x8(%esp)
c0104fac:	c0 
c0104fad:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
c0104fb4:	00 
c0104fb5:	c7 04 24 9c 9b 10 c0 	movl   $0xc0109b9c,(%esp)
c0104fbc:	e8 37 b4 ff ff       	call   c01003f8 <__panic>
c0104fc1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104fc8:	eb 1e                	jmp    c0104fe8 <check_swap+0x5d0>
c0104fca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104fcd:	8b 04 85 20 40 12 c0 	mov    -0x3fedbfe0(,%eax,4),%eax
c0104fd4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0104fdb:	00 
c0104fdc:	89 04 24             	mov    %eax,(%esp)
c0104fdf:	e8 70 16 00 00       	call   c0106654 <free_pages>
c0104fe4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104fe8:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
c0104fec:	7e dc                	jle    c0104fca <check_swap+0x5b2>
c0104fee:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104ff1:	89 04 24             	mov    %eax,(%esp)
c0104ff4:	e8 a2 e5 ff ff       	call   c010359b <mm_destroy>
c0104ff9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104ffc:	a3 ec 40 12 c0       	mov    %eax,0xc01240ec
c0105001:	8b 45 98             	mov    -0x68(%ebp),%eax
c0105004:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0105007:	a3 e4 40 12 c0       	mov    %eax,0xc01240e4
c010500c:	89 15 e8 40 12 c0    	mov    %edx,0xc01240e8
c0105012:	c7 45 e8 e4 40 12 c0 	movl   $0xc01240e4,-0x18(%ebp)
c0105019:	eb 1d                	jmp    c0105038 <check_swap+0x620>
c010501b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010501e:	83 e8 0c             	sub    $0xc,%eax
c0105021:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0105024:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0105028:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010502b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010502e:	8b 40 08             	mov    0x8(%eax),%eax
c0105031:	29 c2                	sub    %eax,%edx
c0105033:	89 d0                	mov    %edx,%eax
c0105035:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105038:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010503b:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010503e:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0105041:	8b 40 04             	mov    0x4(%eax),%eax
c0105044:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105047:	81 7d e8 e4 40 12 c0 	cmpl   $0xc01240e4,-0x18(%ebp)
c010504e:	75 cb                	jne    c010501b <check_swap+0x603>
c0105050:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105053:	89 44 24 08          	mov    %eax,0x8(%esp)
c0105057:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010505a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010505e:	c7 04 24 21 9f 10 c0 	movl   $0xc0109f21,(%esp)
c0105065:	e8 37 b2 ff ff       	call   c01002a1 <cprintf>
c010506a:	c7 04 24 3b 9f 10 c0 	movl   $0xc0109f3b,(%esp)
c0105071:	e8 2b b2 ff ff       	call   c01002a1 <cprintf>
c0105076:	83 c4 74             	add    $0x74,%esp
c0105079:	5b                   	pop    %ebx
c010507a:	5d                   	pop    %ebp
c010507b:	c3                   	ret    

c010507c <page2ppn>:
c010507c:	55                   	push   %ebp
c010507d:	89 e5                	mov    %esp,%ebp
c010507f:	8b 55 08             	mov    0x8(%ebp),%edx
c0105082:	a1 f8 40 12 c0       	mov    0xc01240f8,%eax
c0105087:	29 c2                	sub    %eax,%edx
c0105089:	89 d0                	mov    %edx,%eax
c010508b:	c1 f8 05             	sar    $0x5,%eax
c010508e:	5d                   	pop    %ebp
c010508f:	c3                   	ret    

c0105090 <page2pa>:
c0105090:	55                   	push   %ebp
c0105091:	89 e5                	mov    %esp,%ebp
c0105093:	83 ec 04             	sub    $0x4,%esp
c0105096:	8b 45 08             	mov    0x8(%ebp),%eax
c0105099:	89 04 24             	mov    %eax,(%esp)
c010509c:	e8 db ff ff ff       	call   c010507c <page2ppn>
c01050a1:	c1 e0 0c             	shl    $0xc,%eax
c01050a4:	c9                   	leave  
c01050a5:	c3                   	ret    

c01050a6 <page_ref>:
c01050a6:	55                   	push   %ebp
c01050a7:	89 e5                	mov    %esp,%ebp
c01050a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01050ac:	8b 00                	mov    (%eax),%eax
c01050ae:	5d                   	pop    %ebp
c01050af:	c3                   	ret    

c01050b0 <set_page_ref>:
c01050b0:	55                   	push   %ebp
c01050b1:	89 e5                	mov    %esp,%ebp
c01050b3:	8b 45 08             	mov    0x8(%ebp),%eax
c01050b6:	8b 55 0c             	mov    0xc(%ebp),%edx
c01050b9:	89 10                	mov    %edx,(%eax)
c01050bb:	5d                   	pop    %ebp
c01050bc:	c3                   	ret    

c01050bd <default_init>:
c01050bd:	55                   	push   %ebp
c01050be:	89 e5                	mov    %esp,%ebp
c01050c0:	83 ec 10             	sub    $0x10,%esp
c01050c3:	c7 45 fc e4 40 12 c0 	movl   $0xc01240e4,-0x4(%ebp)
c01050ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01050cd:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01050d0:	89 50 04             	mov    %edx,0x4(%eax)
c01050d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01050d6:	8b 50 04             	mov    0x4(%eax),%edx
c01050d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01050dc:	89 10                	mov    %edx,(%eax)
c01050de:	c7 05 ec 40 12 c0 00 	movl   $0x0,0xc01240ec
c01050e5:	00 00 00 
c01050e8:	c9                   	leave  
c01050e9:	c3                   	ret    

c01050ea <default_init_memmap>:
c01050ea:	55                   	push   %ebp
c01050eb:	89 e5                	mov    %esp,%ebp
c01050ed:	83 ec 48             	sub    $0x48,%esp
c01050f0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01050f4:	75 24                	jne    c010511a <default_init_memmap+0x30>
c01050f6:	c7 44 24 0c 54 9f 10 	movl   $0xc0109f54,0xc(%esp)
c01050fd:	c0 
c01050fe:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105105:	c0 
c0105106:	c7 44 24 04 6d 00 00 	movl   $0x6d,0x4(%esp)
c010510d:	00 
c010510e:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105115:	e8 de b2 ff ff       	call   c01003f8 <__panic>
c010511a:	8b 45 08             	mov    0x8(%ebp),%eax
c010511d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105120:	eb 7d                	jmp    c010519f <default_init_memmap+0xb5>
c0105122:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105125:	83 c0 04             	add    $0x4,%eax
c0105128:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010512f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105132:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105135:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105138:	0f a3 10             	bt     %edx,(%eax)
c010513b:	19 c0                	sbb    %eax,%eax
c010513d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105140:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105144:	0f 95 c0             	setne  %al
c0105147:	0f b6 c0             	movzbl %al,%eax
c010514a:	85 c0                	test   %eax,%eax
c010514c:	75 24                	jne    c0105172 <default_init_memmap+0x88>
c010514e:	c7 44 24 0c 85 9f 10 	movl   $0xc0109f85,0xc(%esp)
c0105155:	c0 
c0105156:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c010515d:	c0 
c010515e:	c7 44 24 04 70 00 00 	movl   $0x70,0x4(%esp)
c0105165:	00 
c0105166:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c010516d:	e8 86 b2 ff ff       	call   c01003f8 <__panic>
c0105172:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105175:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010517c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010517f:	8b 50 08             	mov    0x8(%eax),%edx
c0105182:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105185:	89 50 04             	mov    %edx,0x4(%eax)
c0105188:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c010518f:	00 
c0105190:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105193:	89 04 24             	mov    %eax,(%esp)
c0105196:	e8 15 ff ff ff       	call   c01050b0 <set_page_ref>
c010519b:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
c010519f:	8b 45 0c             	mov    0xc(%ebp),%eax
c01051a2:	c1 e0 05             	shl    $0x5,%eax
c01051a5:	89 c2                	mov    %eax,%edx
c01051a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01051aa:	01 d0                	add    %edx,%eax
c01051ac:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c01051af:	0f 85 6d ff ff ff    	jne    c0105122 <default_init_memmap+0x38>
c01051b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01051b8:	8b 55 0c             	mov    0xc(%ebp),%edx
c01051bb:	89 50 08             	mov    %edx,0x8(%eax)
c01051be:	8b 45 08             	mov    0x8(%ebp),%eax
c01051c1:	83 c0 04             	add    $0x4,%eax
c01051c4:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c01051cb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01051ce:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01051d1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01051d4:	0f ab 10             	bts    %edx,(%eax)
c01051d7:	8b 15 ec 40 12 c0    	mov    0xc01240ec,%edx
c01051dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01051e0:	01 d0                	add    %edx,%eax
c01051e2:	a3 ec 40 12 c0       	mov    %eax,0xc01240ec
c01051e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01051ea:	83 c0 0c             	add    $0xc,%eax
c01051ed:	c7 45 dc e4 40 12 c0 	movl   $0xc01240e4,-0x24(%ebp)
c01051f4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01051f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01051fa:	8b 00                	mov    (%eax),%eax
c01051fc:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01051ff:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0105202:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105205:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105208:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010520b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010520e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0105211:	89 10                	mov    %edx,(%eax)
c0105213:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105216:	8b 10                	mov    (%eax),%edx
c0105218:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010521b:	89 50 04             	mov    %edx,0x4(%eax)
c010521e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105221:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0105224:	89 50 04             	mov    %edx,0x4(%eax)
c0105227:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010522a:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010522d:	89 10                	mov    %edx,(%eax)
c010522f:	c9                   	leave  
c0105230:	c3                   	ret    

c0105231 <default_alloc_pages>:
c0105231:	55                   	push   %ebp
c0105232:	89 e5                	mov    %esp,%ebp
c0105234:	83 ec 68             	sub    $0x68,%esp
c0105237:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010523b:	75 24                	jne    c0105261 <default_alloc_pages+0x30>
c010523d:	c7 44 24 0c 54 9f 10 	movl   $0xc0109f54,0xc(%esp)
c0105244:	c0 
c0105245:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c010524c:	c0 
c010524d:	c7 44 24 04 7c 00 00 	movl   $0x7c,0x4(%esp)
c0105254:	00 
c0105255:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c010525c:	e8 97 b1 ff ff       	call   c01003f8 <__panic>
c0105261:	a1 ec 40 12 c0       	mov    0xc01240ec,%eax
c0105266:	3b 45 08             	cmp    0x8(%ebp),%eax
c0105269:	73 0a                	jae    c0105275 <default_alloc_pages+0x44>
c010526b:	b8 00 00 00 00       	mov    $0x0,%eax
c0105270:	e9 61 01 00 00       	jmp    c01053d6 <default_alloc_pages+0x1a5>
c0105275:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010527c:	c7 45 f0 e4 40 12 c0 	movl   $0xc01240e4,-0x10(%ebp)
c0105283:	eb 1c                	jmp    c01052a1 <default_alloc_pages+0x70>
c0105285:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105288:	83 e8 0c             	sub    $0xc,%eax
c010528b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010528e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105291:	8b 40 08             	mov    0x8(%eax),%eax
c0105294:	3b 45 08             	cmp    0x8(%ebp),%eax
c0105297:	72 08                	jb     c01052a1 <default_alloc_pages+0x70>
c0105299:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010529c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010529f:	eb 18                	jmp    c01052b9 <default_alloc_pages+0x88>
c01052a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01052a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01052a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01052aa:	8b 40 04             	mov    0x4(%eax),%eax
c01052ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01052b0:	81 7d f0 e4 40 12 c0 	cmpl   $0xc01240e4,-0x10(%ebp)
c01052b7:	75 cc                	jne    c0105285 <default_alloc_pages+0x54>
c01052b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01052bd:	0f 84 10 01 00 00    	je     c01053d3 <default_alloc_pages+0x1a2>
c01052c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01052c6:	83 c0 0c             	add    $0xc,%eax
c01052c9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01052cc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01052cf:	8b 40 04             	mov    0x4(%eax),%eax
c01052d2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01052d5:	8b 12                	mov    (%edx),%edx
c01052d7:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01052da:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01052dd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01052e0:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01052e3:	89 50 04             	mov    %edx,0x4(%eax)
c01052e6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01052e9:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01052ec:	89 10                	mov    %edx,(%eax)
c01052ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01052f1:	8b 40 08             	mov    0x8(%eax),%eax
c01052f4:	3b 45 08             	cmp    0x8(%ebp),%eax
c01052f7:	0f 86 85 00 00 00    	jbe    c0105382 <default_alloc_pages+0x151>
c01052fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0105300:	c1 e0 05             	shl    $0x5,%eax
c0105303:	89 c2                	mov    %eax,%edx
c0105305:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105308:	01 d0                	add    %edx,%eax
c010530a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010530d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105310:	8b 40 08             	mov    0x8(%eax),%eax
c0105313:	2b 45 08             	sub    0x8(%ebp),%eax
c0105316:	89 c2                	mov    %eax,%edx
c0105318:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010531b:	89 50 08             	mov    %edx,0x8(%eax)
c010531e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105321:	83 c0 04             	add    $0x4,%eax
c0105324:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c010532b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010532e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105331:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0105334:	0f ab 10             	bts    %edx,(%eax)
c0105337:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010533a:	83 c0 0c             	add    $0xc,%eax
c010533d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105340:	83 c2 0c             	add    $0xc,%edx
c0105343:	89 55 cc             	mov    %edx,-0x34(%ebp)
c0105346:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0105349:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010534c:	8b 40 04             	mov    0x4(%eax),%eax
c010534f:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0105352:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0105355:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0105358:	89 55 c0             	mov    %edx,-0x40(%ebp)
c010535b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010535e:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0105361:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0105364:	89 10                	mov    %edx,(%eax)
c0105366:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0105369:	8b 10                	mov    (%eax),%edx
c010536b:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010536e:	89 50 04             	mov    %edx,0x4(%eax)
c0105371:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0105374:	8b 55 bc             	mov    -0x44(%ebp),%edx
c0105377:	89 50 04             	mov    %edx,0x4(%eax)
c010537a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010537d:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0105380:	89 10                	mov    %edx,(%eax)
c0105382:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105385:	83 c0 0c             	add    $0xc,%eax
c0105388:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010538b:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010538e:	8b 40 04             	mov    0x4(%eax),%eax
c0105391:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0105394:	8b 12                	mov    (%edx),%edx
c0105396:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0105399:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010539c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010539f:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01053a2:	89 50 04             	mov    %edx,0x4(%eax)
c01053a5:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01053a8:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c01053ab:	89 10                	mov    %edx,(%eax)
c01053ad:	a1 ec 40 12 c0       	mov    0xc01240ec,%eax
c01053b2:	2b 45 08             	sub    0x8(%ebp),%eax
c01053b5:	a3 ec 40 12 c0       	mov    %eax,0xc01240ec
c01053ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01053bd:	83 c0 04             	add    $0x4,%eax
c01053c0:	c7 45 ac 01 00 00 00 	movl   $0x1,-0x54(%ebp)
c01053c7:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01053ca:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01053cd:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01053d0:	0f b3 10             	btr    %edx,(%eax)
c01053d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01053d6:	c9                   	leave  
c01053d7:	c3                   	ret    

c01053d8 <default_free_pages>:
c01053d8:	55                   	push   %ebp
c01053d9:	89 e5                	mov    %esp,%ebp
c01053db:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01053e1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01053e5:	75 24                	jne    c010540b <default_free_pages+0x33>
c01053e7:	c7 44 24 0c 54 9f 10 	movl   $0xc0109f54,0xc(%esp)
c01053ee:	c0 
c01053ef:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c01053f6:	c0 
c01053f7:	c7 44 24 04 9a 00 00 	movl   $0x9a,0x4(%esp)
c01053fe:	00 
c01053ff:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105406:	e8 ed af ff ff       	call   c01003f8 <__panic>
c010540b:	8b 45 08             	mov    0x8(%ebp),%eax
c010540e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105411:	e9 9d 00 00 00       	jmp    c01054b3 <default_free_pages+0xdb>
c0105416:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105419:	83 c0 04             	add    $0x4,%eax
c010541c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105423:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105426:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105429:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010542c:	0f a3 10             	bt     %edx,(%eax)
c010542f:	19 c0                	sbb    %eax,%eax
c0105431:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105434:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105438:	0f 95 c0             	setne  %al
c010543b:	0f b6 c0             	movzbl %al,%eax
c010543e:	85 c0                	test   %eax,%eax
c0105440:	75 2c                	jne    c010546e <default_free_pages+0x96>
c0105442:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105445:	83 c0 04             	add    $0x4,%eax
c0105448:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c010544f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105452:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105455:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105458:	0f a3 10             	bt     %edx,(%eax)
c010545b:	19 c0                	sbb    %eax,%eax
c010545d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105460:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0105464:	0f 95 c0             	setne  %al
c0105467:	0f b6 c0             	movzbl %al,%eax
c010546a:	85 c0                	test   %eax,%eax
c010546c:	74 24                	je     c0105492 <default_free_pages+0xba>
c010546e:	c7 44 24 0c 98 9f 10 	movl   $0xc0109f98,0xc(%esp)
c0105475:	c0 
c0105476:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c010547d:	c0 
c010547e:	c7 44 24 04 9d 00 00 	movl   $0x9d,0x4(%esp)
c0105485:	00 
c0105486:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c010548d:	e8 66 af ff ff       	call   c01003f8 <__panic>
c0105492:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105495:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010549c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c01054a3:	00 
c01054a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01054a7:	89 04 24             	mov    %eax,(%esp)
c01054aa:	e8 01 fc ff ff       	call   c01050b0 <set_page_ref>
c01054af:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
c01054b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01054b6:	c1 e0 05             	shl    $0x5,%eax
c01054b9:	89 c2                	mov    %eax,%edx
c01054bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01054be:	01 d0                	add    %edx,%eax
c01054c0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c01054c3:	0f 85 4d ff ff ff    	jne    c0105416 <default_free_pages+0x3e>
c01054c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01054cc:	8b 55 0c             	mov    0xc(%ebp),%edx
c01054cf:	89 50 08             	mov    %edx,0x8(%eax)
c01054d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01054d5:	83 c0 04             	add    $0x4,%eax
c01054d8:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c01054df:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01054e2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01054e5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01054e8:	0f ab 10             	bts    %edx,(%eax)
c01054eb:	c7 45 cc e4 40 12 c0 	movl   $0xc01240e4,-0x34(%ebp)
c01054f2:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01054f5:	8b 40 04             	mov    0x4(%eax),%eax
c01054f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01054fb:	e9 fa 00 00 00       	jmp    c01055fa <default_free_pages+0x222>
c0105500:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105503:	83 e8 0c             	sub    $0xc,%eax
c0105506:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105509:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010550c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010550f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0105512:	8b 40 04             	mov    0x4(%eax),%eax
c0105515:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105518:	8b 45 08             	mov    0x8(%ebp),%eax
c010551b:	8b 40 08             	mov    0x8(%eax),%eax
c010551e:	c1 e0 05             	shl    $0x5,%eax
c0105521:	89 c2                	mov    %eax,%edx
c0105523:	8b 45 08             	mov    0x8(%ebp),%eax
c0105526:	01 d0                	add    %edx,%eax
c0105528:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c010552b:	75 5a                	jne    c0105587 <default_free_pages+0x1af>
c010552d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105530:	8b 50 08             	mov    0x8(%eax),%edx
c0105533:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105536:	8b 40 08             	mov    0x8(%eax),%eax
c0105539:	01 c2                	add    %eax,%edx
c010553b:	8b 45 08             	mov    0x8(%ebp),%eax
c010553e:	89 50 08             	mov    %edx,0x8(%eax)
c0105541:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105544:	83 c0 04             	add    $0x4,%eax
c0105547:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
c010554e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0105551:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0105554:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0105557:	0f b3 10             	btr    %edx,(%eax)
c010555a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010555d:	83 c0 0c             	add    $0xc,%eax
c0105560:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0105563:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0105566:	8b 40 04             	mov    0x4(%eax),%eax
c0105569:	8b 55 bc             	mov    -0x44(%ebp),%edx
c010556c:	8b 12                	mov    (%edx),%edx
c010556e:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0105571:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105574:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105577:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c010557a:	89 50 04             	mov    %edx,0x4(%eax)
c010557d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0105580:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0105583:	89 10                	mov    %edx,(%eax)
c0105585:	eb 73                	jmp    c01055fa <default_free_pages+0x222>
c0105587:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010558a:	8b 40 08             	mov    0x8(%eax),%eax
c010558d:	c1 e0 05             	shl    $0x5,%eax
c0105590:	89 c2                	mov    %eax,%edx
c0105592:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105595:	01 d0                	add    %edx,%eax
c0105597:	3b 45 08             	cmp    0x8(%ebp),%eax
c010559a:	75 5e                	jne    c01055fa <default_free_pages+0x222>
c010559c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010559f:	8b 50 08             	mov    0x8(%eax),%edx
c01055a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01055a5:	8b 40 08             	mov    0x8(%eax),%eax
c01055a8:	01 c2                	add    %eax,%edx
c01055aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01055ad:	89 50 08             	mov    %edx,0x8(%eax)
c01055b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01055b3:	83 c0 04             	add    $0x4,%eax
c01055b6:	c7 45 b0 01 00 00 00 	movl   $0x1,-0x50(%ebp)
c01055bd:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01055c0:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01055c3:	8b 55 b0             	mov    -0x50(%ebp),%edx
c01055c6:	0f b3 10             	btr    %edx,(%eax)
c01055c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01055cc:	89 45 08             	mov    %eax,0x8(%ebp)
c01055cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01055d2:	83 c0 0c             	add    $0xc,%eax
c01055d5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01055d8:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01055db:	8b 40 04             	mov    0x4(%eax),%eax
c01055de:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01055e1:	8b 12                	mov    (%edx),%edx
c01055e3:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c01055e6:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01055e9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01055ec:	8b 55 a0             	mov    -0x60(%ebp),%edx
c01055ef:	89 50 04             	mov    %edx,0x4(%eax)
c01055f2:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01055f5:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c01055f8:	89 10                	mov    %edx,(%eax)
c01055fa:	81 7d f0 e4 40 12 c0 	cmpl   $0xc01240e4,-0x10(%ebp)
c0105601:	0f 85 f9 fe ff ff    	jne    c0105500 <default_free_pages+0x128>
c0105607:	8b 15 ec 40 12 c0    	mov    0xc01240ec,%edx
c010560d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105610:	01 d0                	add    %edx,%eax
c0105612:	a3 ec 40 12 c0       	mov    %eax,0xc01240ec
c0105617:	c7 45 9c e4 40 12 c0 	movl   $0xc01240e4,-0x64(%ebp)
c010561e:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0105621:	8b 40 04             	mov    0x4(%eax),%eax
c0105624:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105627:	eb 68                	jmp    c0105691 <default_free_pages+0x2b9>
c0105629:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010562c:	83 e8 0c             	sub    $0xc,%eax
c010562f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105632:	8b 45 08             	mov    0x8(%ebp),%eax
c0105635:	8b 40 08             	mov    0x8(%eax),%eax
c0105638:	c1 e0 05             	shl    $0x5,%eax
c010563b:	89 c2                	mov    %eax,%edx
c010563d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105640:	01 d0                	add    %edx,%eax
c0105642:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0105645:	77 3b                	ja     c0105682 <default_free_pages+0x2aa>
c0105647:	8b 45 08             	mov    0x8(%ebp),%eax
c010564a:	8b 40 08             	mov    0x8(%eax),%eax
c010564d:	c1 e0 05             	shl    $0x5,%eax
c0105650:	89 c2                	mov    %eax,%edx
c0105652:	8b 45 08             	mov    0x8(%ebp),%eax
c0105655:	01 d0                	add    %edx,%eax
c0105657:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c010565a:	75 24                	jne    c0105680 <default_free_pages+0x2a8>
c010565c:	c7 44 24 0c bd 9f 10 	movl   $0xc0109fbd,0xc(%esp)
c0105663:	c0 
c0105664:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c010566b:	c0 
c010566c:	c7 44 24 04 b8 00 00 	movl   $0xb8,0x4(%esp)
c0105673:	00 
c0105674:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c010567b:	e8 78 ad ff ff       	call   c01003f8 <__panic>
c0105680:	eb 18                	jmp    c010569a <default_free_pages+0x2c2>
c0105682:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105685:	89 45 98             	mov    %eax,-0x68(%ebp)
c0105688:	8b 45 98             	mov    -0x68(%ebp),%eax
c010568b:	8b 40 04             	mov    0x4(%eax),%eax
c010568e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105691:	81 7d f0 e4 40 12 c0 	cmpl   $0xc01240e4,-0x10(%ebp)
c0105698:	75 8f                	jne    c0105629 <default_free_pages+0x251>
c010569a:	8b 45 08             	mov    0x8(%ebp),%eax
c010569d:	8d 50 0c             	lea    0xc(%eax),%edx
c01056a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056a3:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01056a6:	89 55 90             	mov    %edx,-0x70(%ebp)
c01056a9:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01056ac:	8b 00                	mov    (%eax),%eax
c01056ae:	8b 55 90             	mov    -0x70(%ebp),%edx
c01056b1:	89 55 8c             	mov    %edx,-0x74(%ebp)
c01056b4:	89 45 88             	mov    %eax,-0x78(%ebp)
c01056b7:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01056ba:	89 45 84             	mov    %eax,-0x7c(%ebp)
c01056bd:	8b 45 84             	mov    -0x7c(%ebp),%eax
c01056c0:	8b 55 8c             	mov    -0x74(%ebp),%edx
c01056c3:	89 10                	mov    %edx,(%eax)
c01056c5:	8b 45 84             	mov    -0x7c(%ebp),%eax
c01056c8:	8b 10                	mov    (%eax),%edx
c01056ca:	8b 45 88             	mov    -0x78(%ebp),%eax
c01056cd:	89 50 04             	mov    %edx,0x4(%eax)
c01056d0:	8b 45 8c             	mov    -0x74(%ebp),%eax
c01056d3:	8b 55 84             	mov    -0x7c(%ebp),%edx
c01056d6:	89 50 04             	mov    %edx,0x4(%eax)
c01056d9:	8b 45 8c             	mov    -0x74(%ebp),%eax
c01056dc:	8b 55 88             	mov    -0x78(%ebp),%edx
c01056df:	89 10                	mov    %edx,(%eax)
c01056e1:	c9                   	leave  
c01056e2:	c3                   	ret    

c01056e3 <default_nr_free_pages>:
c01056e3:	55                   	push   %ebp
c01056e4:	89 e5                	mov    %esp,%ebp
c01056e6:	a1 ec 40 12 c0       	mov    0xc01240ec,%eax
c01056eb:	5d                   	pop    %ebp
c01056ec:	c3                   	ret    

c01056ed <basic_check>:
c01056ed:	55                   	push   %ebp
c01056ee:	89 e5                	mov    %esp,%ebp
c01056f0:	83 ec 48             	sub    $0x48,%esp
c01056f3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01056fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01056fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105700:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105703:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105706:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c010570d:	e8 d7 0e 00 00       	call   c01065e9 <alloc_pages>
c0105712:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105715:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105719:	75 24                	jne    c010573f <basic_check+0x52>
c010571b:	c7 44 24 0c d8 9f 10 	movl   $0xc0109fd8,0xc(%esp)
c0105722:	c0 
c0105723:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c010572a:	c0 
c010572b:	c7 44 24 04 c9 00 00 	movl   $0xc9,0x4(%esp)
c0105732:	00 
c0105733:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c010573a:	e8 b9 ac ff ff       	call   c01003f8 <__panic>
c010573f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0105746:	e8 9e 0e 00 00       	call   c01065e9 <alloc_pages>
c010574b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010574e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0105752:	75 24                	jne    c0105778 <basic_check+0x8b>
c0105754:	c7 44 24 0c f4 9f 10 	movl   $0xc0109ff4,0xc(%esp)
c010575b:	c0 
c010575c:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105763:	c0 
c0105764:	c7 44 24 04 ca 00 00 	movl   $0xca,0x4(%esp)
c010576b:	00 
c010576c:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105773:	e8 80 ac ff ff       	call   c01003f8 <__panic>
c0105778:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c010577f:	e8 65 0e 00 00       	call   c01065e9 <alloc_pages>
c0105784:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105787:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010578b:	75 24                	jne    c01057b1 <basic_check+0xc4>
c010578d:	c7 44 24 0c 10 a0 10 	movl   $0xc010a010,0xc(%esp)
c0105794:	c0 
c0105795:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c010579c:	c0 
c010579d:	c7 44 24 04 cb 00 00 	movl   $0xcb,0x4(%esp)
c01057a4:	00 
c01057a5:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c01057ac:	e8 47 ac ff ff       	call   c01003f8 <__panic>
c01057b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01057b4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c01057b7:	74 10                	je     c01057c9 <basic_check+0xdc>
c01057b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01057bc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c01057bf:	74 08                	je     c01057c9 <basic_check+0xdc>
c01057c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057c4:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c01057c7:	75 24                	jne    c01057ed <basic_check+0x100>
c01057c9:	c7 44 24 0c 2c a0 10 	movl   $0xc010a02c,0xc(%esp)
c01057d0:	c0 
c01057d1:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c01057d8:	c0 
c01057d9:	c7 44 24 04 cd 00 00 	movl   $0xcd,0x4(%esp)
c01057e0:	00 
c01057e1:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c01057e8:	e8 0b ac ff ff       	call   c01003f8 <__panic>
c01057ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01057f0:	89 04 24             	mov    %eax,(%esp)
c01057f3:	e8 ae f8 ff ff       	call   c01050a6 <page_ref>
c01057f8:	85 c0                	test   %eax,%eax
c01057fa:	75 1e                	jne    c010581a <basic_check+0x12d>
c01057fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057ff:	89 04 24             	mov    %eax,(%esp)
c0105802:	e8 9f f8 ff ff       	call   c01050a6 <page_ref>
c0105807:	85 c0                	test   %eax,%eax
c0105809:	75 0f                	jne    c010581a <basic_check+0x12d>
c010580b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010580e:	89 04 24             	mov    %eax,(%esp)
c0105811:	e8 90 f8 ff ff       	call   c01050a6 <page_ref>
c0105816:	85 c0                	test   %eax,%eax
c0105818:	74 24                	je     c010583e <basic_check+0x151>
c010581a:	c7 44 24 0c 50 a0 10 	movl   $0xc010a050,0xc(%esp)
c0105821:	c0 
c0105822:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105829:	c0 
c010582a:	c7 44 24 04 ce 00 00 	movl   $0xce,0x4(%esp)
c0105831:	00 
c0105832:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105839:	e8 ba ab ff ff       	call   c01003f8 <__panic>
c010583e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105841:	89 04 24             	mov    %eax,(%esp)
c0105844:	e8 47 f8 ff ff       	call   c0105090 <page2pa>
c0105849:	8b 15 80 3f 12 c0    	mov    0xc0123f80,%edx
c010584f:	c1 e2 0c             	shl    $0xc,%edx
c0105852:	39 d0                	cmp    %edx,%eax
c0105854:	72 24                	jb     c010587a <basic_check+0x18d>
c0105856:	c7 44 24 0c 8c a0 10 	movl   $0xc010a08c,0xc(%esp)
c010585d:	c0 
c010585e:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105865:	c0 
c0105866:	c7 44 24 04 d0 00 00 	movl   $0xd0,0x4(%esp)
c010586d:	00 
c010586e:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105875:	e8 7e ab ff ff       	call   c01003f8 <__panic>
c010587a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010587d:	89 04 24             	mov    %eax,(%esp)
c0105880:	e8 0b f8 ff ff       	call   c0105090 <page2pa>
c0105885:	8b 15 80 3f 12 c0    	mov    0xc0123f80,%edx
c010588b:	c1 e2 0c             	shl    $0xc,%edx
c010588e:	39 d0                	cmp    %edx,%eax
c0105890:	72 24                	jb     c01058b6 <basic_check+0x1c9>
c0105892:	c7 44 24 0c a9 a0 10 	movl   $0xc010a0a9,0xc(%esp)
c0105899:	c0 
c010589a:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c01058a1:	c0 
c01058a2:	c7 44 24 04 d1 00 00 	movl   $0xd1,0x4(%esp)
c01058a9:	00 
c01058aa:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c01058b1:	e8 42 ab ff ff       	call   c01003f8 <__panic>
c01058b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01058b9:	89 04 24             	mov    %eax,(%esp)
c01058bc:	e8 cf f7 ff ff       	call   c0105090 <page2pa>
c01058c1:	8b 15 80 3f 12 c0    	mov    0xc0123f80,%edx
c01058c7:	c1 e2 0c             	shl    $0xc,%edx
c01058ca:	39 d0                	cmp    %edx,%eax
c01058cc:	72 24                	jb     c01058f2 <basic_check+0x205>
c01058ce:	c7 44 24 0c c6 a0 10 	movl   $0xc010a0c6,0xc(%esp)
c01058d5:	c0 
c01058d6:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c01058dd:	c0 
c01058de:	c7 44 24 04 d2 00 00 	movl   $0xd2,0x4(%esp)
c01058e5:	00 
c01058e6:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c01058ed:	e8 06 ab ff ff       	call   c01003f8 <__panic>
c01058f2:	a1 e4 40 12 c0       	mov    0xc01240e4,%eax
c01058f7:	8b 15 e8 40 12 c0    	mov    0xc01240e8,%edx
c01058fd:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105900:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0105903:	c7 45 e0 e4 40 12 c0 	movl   $0xc01240e4,-0x20(%ebp)
c010590a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010590d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105910:	89 50 04             	mov    %edx,0x4(%eax)
c0105913:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105916:	8b 50 04             	mov    0x4(%eax),%edx
c0105919:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010591c:	89 10                	mov    %edx,(%eax)
c010591e:	c7 45 dc e4 40 12 c0 	movl   $0xc01240e4,-0x24(%ebp)
c0105925:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105928:	8b 40 04             	mov    0x4(%eax),%eax
c010592b:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c010592e:	0f 94 c0             	sete   %al
c0105931:	0f b6 c0             	movzbl %al,%eax
c0105934:	85 c0                	test   %eax,%eax
c0105936:	75 24                	jne    c010595c <basic_check+0x26f>
c0105938:	c7 44 24 0c e3 a0 10 	movl   $0xc010a0e3,0xc(%esp)
c010593f:	c0 
c0105940:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105947:	c0 
c0105948:	c7 44 24 04 d6 00 00 	movl   $0xd6,0x4(%esp)
c010594f:	00 
c0105950:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105957:	e8 9c aa ff ff       	call   c01003f8 <__panic>
c010595c:	a1 ec 40 12 c0       	mov    0xc01240ec,%eax
c0105961:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105964:	c7 05 ec 40 12 c0 00 	movl   $0x0,0xc01240ec
c010596b:	00 00 00 
c010596e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0105975:	e8 6f 0c 00 00       	call   c01065e9 <alloc_pages>
c010597a:	85 c0                	test   %eax,%eax
c010597c:	74 24                	je     c01059a2 <basic_check+0x2b5>
c010597e:	c7 44 24 0c fa a0 10 	movl   $0xc010a0fa,0xc(%esp)
c0105985:	c0 
c0105986:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c010598d:	c0 
c010598e:	c7 44 24 04 db 00 00 	movl   $0xdb,0x4(%esp)
c0105995:	00 
c0105996:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c010599d:	e8 56 aa ff ff       	call   c01003f8 <__panic>
c01059a2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01059a9:	00 
c01059aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01059ad:	89 04 24             	mov    %eax,(%esp)
c01059b0:	e8 9f 0c 00 00       	call   c0106654 <free_pages>
c01059b5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01059bc:	00 
c01059bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01059c0:	89 04 24             	mov    %eax,(%esp)
c01059c3:	e8 8c 0c 00 00       	call   c0106654 <free_pages>
c01059c8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01059cf:	00 
c01059d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01059d3:	89 04 24             	mov    %eax,(%esp)
c01059d6:	e8 79 0c 00 00       	call   c0106654 <free_pages>
c01059db:	a1 ec 40 12 c0       	mov    0xc01240ec,%eax
c01059e0:	83 f8 03             	cmp    $0x3,%eax
c01059e3:	74 24                	je     c0105a09 <basic_check+0x31c>
c01059e5:	c7 44 24 0c 0f a1 10 	movl   $0xc010a10f,0xc(%esp)
c01059ec:	c0 
c01059ed:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c01059f4:	c0 
c01059f5:	c7 44 24 04 e0 00 00 	movl   $0xe0,0x4(%esp)
c01059fc:	00 
c01059fd:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105a04:	e8 ef a9 ff ff       	call   c01003f8 <__panic>
c0105a09:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0105a10:	e8 d4 0b 00 00       	call   c01065e9 <alloc_pages>
c0105a15:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a18:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105a1c:	75 24                	jne    c0105a42 <basic_check+0x355>
c0105a1e:	c7 44 24 0c d8 9f 10 	movl   $0xc0109fd8,0xc(%esp)
c0105a25:	c0 
c0105a26:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105a2d:	c0 
c0105a2e:	c7 44 24 04 e2 00 00 	movl   $0xe2,0x4(%esp)
c0105a35:	00 
c0105a36:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105a3d:	e8 b6 a9 ff ff       	call   c01003f8 <__panic>
c0105a42:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0105a49:	e8 9b 0b 00 00       	call   c01065e9 <alloc_pages>
c0105a4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105a51:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0105a55:	75 24                	jne    c0105a7b <basic_check+0x38e>
c0105a57:	c7 44 24 0c f4 9f 10 	movl   $0xc0109ff4,0xc(%esp)
c0105a5e:	c0 
c0105a5f:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105a66:	c0 
c0105a67:	c7 44 24 04 e3 00 00 	movl   $0xe3,0x4(%esp)
c0105a6e:	00 
c0105a6f:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105a76:	e8 7d a9 ff ff       	call   c01003f8 <__panic>
c0105a7b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0105a82:	e8 62 0b 00 00       	call   c01065e9 <alloc_pages>
c0105a87:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a8a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105a8e:	75 24                	jne    c0105ab4 <basic_check+0x3c7>
c0105a90:	c7 44 24 0c 10 a0 10 	movl   $0xc010a010,0xc(%esp)
c0105a97:	c0 
c0105a98:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105a9f:	c0 
c0105aa0:	c7 44 24 04 e4 00 00 	movl   $0xe4,0x4(%esp)
c0105aa7:	00 
c0105aa8:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105aaf:	e8 44 a9 ff ff       	call   c01003f8 <__panic>
c0105ab4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0105abb:	e8 29 0b 00 00       	call   c01065e9 <alloc_pages>
c0105ac0:	85 c0                	test   %eax,%eax
c0105ac2:	74 24                	je     c0105ae8 <basic_check+0x3fb>
c0105ac4:	c7 44 24 0c fa a0 10 	movl   $0xc010a0fa,0xc(%esp)
c0105acb:	c0 
c0105acc:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105ad3:	c0 
c0105ad4:	c7 44 24 04 e6 00 00 	movl   $0xe6,0x4(%esp)
c0105adb:	00 
c0105adc:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105ae3:	e8 10 a9 ff ff       	call   c01003f8 <__panic>
c0105ae8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105aef:	00 
c0105af0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105af3:	89 04 24             	mov    %eax,(%esp)
c0105af6:	e8 59 0b 00 00       	call   c0106654 <free_pages>
c0105afb:	c7 45 d8 e4 40 12 c0 	movl   $0xc01240e4,-0x28(%ebp)
c0105b02:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105b05:	8b 40 04             	mov    0x4(%eax),%eax
c0105b08:	39 45 d8             	cmp    %eax,-0x28(%ebp)
c0105b0b:	0f 94 c0             	sete   %al
c0105b0e:	0f b6 c0             	movzbl %al,%eax
c0105b11:	85 c0                	test   %eax,%eax
c0105b13:	74 24                	je     c0105b39 <basic_check+0x44c>
c0105b15:	c7 44 24 0c 1c a1 10 	movl   $0xc010a11c,0xc(%esp)
c0105b1c:	c0 
c0105b1d:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105b24:	c0 
c0105b25:	c7 44 24 04 e9 00 00 	movl   $0xe9,0x4(%esp)
c0105b2c:	00 
c0105b2d:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105b34:	e8 bf a8 ff ff       	call   c01003f8 <__panic>
c0105b39:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0105b40:	e8 a4 0a 00 00       	call   c01065e9 <alloc_pages>
c0105b45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105b48:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105b4b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0105b4e:	74 24                	je     c0105b74 <basic_check+0x487>
c0105b50:	c7 44 24 0c 34 a1 10 	movl   $0xc010a134,0xc(%esp)
c0105b57:	c0 
c0105b58:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105b5f:	c0 
c0105b60:	c7 44 24 04 ec 00 00 	movl   $0xec,0x4(%esp)
c0105b67:	00 
c0105b68:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105b6f:	e8 84 a8 ff ff       	call   c01003f8 <__panic>
c0105b74:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0105b7b:	e8 69 0a 00 00       	call   c01065e9 <alloc_pages>
c0105b80:	85 c0                	test   %eax,%eax
c0105b82:	74 24                	je     c0105ba8 <basic_check+0x4bb>
c0105b84:	c7 44 24 0c fa a0 10 	movl   $0xc010a0fa,0xc(%esp)
c0105b8b:	c0 
c0105b8c:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105b93:	c0 
c0105b94:	c7 44 24 04 ed 00 00 	movl   $0xed,0x4(%esp)
c0105b9b:	00 
c0105b9c:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105ba3:	e8 50 a8 ff ff       	call   c01003f8 <__panic>
c0105ba8:	a1 ec 40 12 c0       	mov    0xc01240ec,%eax
c0105bad:	85 c0                	test   %eax,%eax
c0105baf:	74 24                	je     c0105bd5 <basic_check+0x4e8>
c0105bb1:	c7 44 24 0c 4d a1 10 	movl   $0xc010a14d,0xc(%esp)
c0105bb8:	c0 
c0105bb9:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105bc0:	c0 
c0105bc1:	c7 44 24 04 ef 00 00 	movl   $0xef,0x4(%esp)
c0105bc8:	00 
c0105bc9:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105bd0:	e8 23 a8 ff ff       	call   c01003f8 <__panic>
c0105bd5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105bd8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0105bdb:	a3 e4 40 12 c0       	mov    %eax,0xc01240e4
c0105be0:	89 15 e8 40 12 c0    	mov    %edx,0xc01240e8
c0105be6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105be9:	a3 ec 40 12 c0       	mov    %eax,0xc01240ec
c0105bee:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105bf5:	00 
c0105bf6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105bf9:	89 04 24             	mov    %eax,(%esp)
c0105bfc:	e8 53 0a 00 00       	call   c0106654 <free_pages>
c0105c01:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105c08:	00 
c0105c09:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c0c:	89 04 24             	mov    %eax,(%esp)
c0105c0f:	e8 40 0a 00 00       	call   c0106654 <free_pages>
c0105c14:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105c1b:	00 
c0105c1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c1f:	89 04 24             	mov    %eax,(%esp)
c0105c22:	e8 2d 0a 00 00       	call   c0106654 <free_pages>
c0105c27:	c9                   	leave  
c0105c28:	c3                   	ret    

c0105c29 <default_check>:
c0105c29:	55                   	push   %ebp
c0105c2a:	89 e5                	mov    %esp,%ebp
c0105c2c:	53                   	push   %ebx
c0105c2d:	81 ec 94 00 00 00    	sub    $0x94,%esp
c0105c33:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105c3a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105c41:	c7 45 ec e4 40 12 c0 	movl   $0xc01240e4,-0x14(%ebp)
c0105c48:	eb 6b                	jmp    c0105cb5 <default_check+0x8c>
c0105c4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c4d:	83 e8 0c             	sub    $0xc,%eax
c0105c50:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c53:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105c56:	83 c0 04             	add    $0x4,%eax
c0105c59:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%ebp)
c0105c60:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105c63:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105c66:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0105c69:	0f a3 10             	bt     %edx,(%eax)
c0105c6c:	19 c0                	sbb    %eax,%eax
c0105c6e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0105c71:	83 7d c8 00          	cmpl   $0x0,-0x38(%ebp)
c0105c75:	0f 95 c0             	setne  %al
c0105c78:	0f b6 c0             	movzbl %al,%eax
c0105c7b:	85 c0                	test   %eax,%eax
c0105c7d:	75 24                	jne    c0105ca3 <default_check+0x7a>
c0105c7f:	c7 44 24 0c 5a a1 10 	movl   $0xc010a15a,0xc(%esp)
c0105c86:	c0 
c0105c87:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105c8e:	c0 
c0105c8f:	c7 44 24 04 00 01 00 	movl   $0x100,0x4(%esp)
c0105c96:	00 
c0105c97:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105c9e:	e8 55 a7 ff ff       	call   c01003f8 <__panic>
c0105ca3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105ca7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105caa:	8b 50 08             	mov    0x8(%eax),%edx
c0105cad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cb0:	01 d0                	add    %edx,%eax
c0105cb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105cb5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105cb8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105cbb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0105cbe:	8b 40 04             	mov    0x4(%eax),%eax
c0105cc1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105cc4:	81 7d ec e4 40 12 c0 	cmpl   $0xc01240e4,-0x14(%ebp)
c0105ccb:	0f 85 79 ff ff ff    	jne    c0105c4a <default_check+0x21>
c0105cd1:	8b 5d f0             	mov    -0x10(%ebp),%ebx
c0105cd4:	e8 ad 09 00 00       	call   c0106686 <nr_free_pages>
c0105cd9:	39 c3                	cmp    %eax,%ebx
c0105cdb:	74 24                	je     c0105d01 <default_check+0xd8>
c0105cdd:	c7 44 24 0c 6a a1 10 	movl   $0xc010a16a,0xc(%esp)
c0105ce4:	c0 
c0105ce5:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105cec:	c0 
c0105ced:	c7 44 24 04 03 01 00 	movl   $0x103,0x4(%esp)
c0105cf4:	00 
c0105cf5:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105cfc:	e8 f7 a6 ff ff       	call   c01003f8 <__panic>
c0105d01:	e8 e7 f9 ff ff       	call   c01056ed <basic_check>
c0105d06:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
c0105d0d:	e8 d7 08 00 00       	call   c01065e9 <alloc_pages>
c0105d12:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d15:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105d19:	75 24                	jne    c0105d3f <default_check+0x116>
c0105d1b:	c7 44 24 0c 83 a1 10 	movl   $0xc010a183,0xc(%esp)
c0105d22:	c0 
c0105d23:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105d2a:	c0 
c0105d2b:	c7 44 24 04 08 01 00 	movl   $0x108,0x4(%esp)
c0105d32:	00 
c0105d33:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105d3a:	e8 b9 a6 ff ff       	call   c01003f8 <__panic>
c0105d3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105d42:	83 c0 04             	add    $0x4,%eax
c0105d45:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0105d4c:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0105d4f:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0105d52:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0105d55:	0f a3 10             	bt     %edx,(%eax)
c0105d58:	19 c0                	sbb    %eax,%eax
c0105d5a:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0105d5d:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
c0105d61:	0f 95 c0             	setne  %al
c0105d64:	0f b6 c0             	movzbl %al,%eax
c0105d67:	85 c0                	test   %eax,%eax
c0105d69:	74 24                	je     c0105d8f <default_check+0x166>
c0105d6b:	c7 44 24 0c 8e a1 10 	movl   $0xc010a18e,0xc(%esp)
c0105d72:	c0 
c0105d73:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105d7a:	c0 
c0105d7b:	c7 44 24 04 09 01 00 	movl   $0x109,0x4(%esp)
c0105d82:	00 
c0105d83:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105d8a:	e8 69 a6 ff ff       	call   c01003f8 <__panic>
c0105d8f:	a1 e4 40 12 c0       	mov    0xc01240e4,%eax
c0105d94:	8b 15 e8 40 12 c0    	mov    0xc01240e8,%edx
c0105d9a:	89 45 80             	mov    %eax,-0x80(%ebp)
c0105d9d:	89 55 84             	mov    %edx,-0x7c(%ebp)
c0105da0:	c7 45 b4 e4 40 12 c0 	movl   $0xc01240e4,-0x4c(%ebp)
c0105da7:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0105daa:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0105dad:	89 50 04             	mov    %edx,0x4(%eax)
c0105db0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0105db3:	8b 50 04             	mov    0x4(%eax),%edx
c0105db6:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0105db9:	89 10                	mov    %edx,(%eax)
c0105dbb:	c7 45 b0 e4 40 12 c0 	movl   $0xc01240e4,-0x50(%ebp)
c0105dc2:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105dc5:	8b 40 04             	mov    0x4(%eax),%eax
c0105dc8:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0105dcb:	0f 94 c0             	sete   %al
c0105dce:	0f b6 c0             	movzbl %al,%eax
c0105dd1:	85 c0                	test   %eax,%eax
c0105dd3:	75 24                	jne    c0105df9 <default_check+0x1d0>
c0105dd5:	c7 44 24 0c e3 a0 10 	movl   $0xc010a0e3,0xc(%esp)
c0105ddc:	c0 
c0105ddd:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105de4:	c0 
c0105de5:	c7 44 24 04 0d 01 00 	movl   $0x10d,0x4(%esp)
c0105dec:	00 
c0105ded:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105df4:	e8 ff a5 ff ff       	call   c01003f8 <__panic>
c0105df9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0105e00:	e8 e4 07 00 00       	call   c01065e9 <alloc_pages>
c0105e05:	85 c0                	test   %eax,%eax
c0105e07:	74 24                	je     c0105e2d <default_check+0x204>
c0105e09:	c7 44 24 0c fa a0 10 	movl   $0xc010a0fa,0xc(%esp)
c0105e10:	c0 
c0105e11:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105e18:	c0 
c0105e19:	c7 44 24 04 0e 01 00 	movl   $0x10e,0x4(%esp)
c0105e20:	00 
c0105e21:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105e28:	e8 cb a5 ff ff       	call   c01003f8 <__panic>
c0105e2d:	a1 ec 40 12 c0       	mov    0xc01240ec,%eax
c0105e32:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105e35:	c7 05 ec 40 12 c0 00 	movl   $0x0,0xc01240ec
c0105e3c:	00 00 00 
c0105e3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105e42:	83 c0 40             	add    $0x40,%eax
c0105e45:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0105e4c:	00 
c0105e4d:	89 04 24             	mov    %eax,(%esp)
c0105e50:	e8 ff 07 00 00       	call   c0106654 <free_pages>
c0105e55:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
c0105e5c:	e8 88 07 00 00       	call   c01065e9 <alloc_pages>
c0105e61:	85 c0                	test   %eax,%eax
c0105e63:	74 24                	je     c0105e89 <default_check+0x260>
c0105e65:	c7 44 24 0c a0 a1 10 	movl   $0xc010a1a0,0xc(%esp)
c0105e6c:	c0 
c0105e6d:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105e74:	c0 
c0105e75:	c7 44 24 04 14 01 00 	movl   $0x114,0x4(%esp)
c0105e7c:	00 
c0105e7d:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105e84:	e8 6f a5 ff ff       	call   c01003f8 <__panic>
c0105e89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105e8c:	83 c0 40             	add    $0x40,%eax
c0105e8f:	83 c0 04             	add    $0x4,%eax
c0105e92:	c7 45 ac 01 00 00 00 	movl   $0x1,-0x54(%ebp)
c0105e99:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0105e9c:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0105e9f:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0105ea2:	0f a3 10             	bt     %edx,(%eax)
c0105ea5:	19 c0                	sbb    %eax,%eax
c0105ea7:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0105eaa:	83 7d a4 00          	cmpl   $0x0,-0x5c(%ebp)
c0105eae:	0f 95 c0             	setne  %al
c0105eb1:	0f b6 c0             	movzbl %al,%eax
c0105eb4:	85 c0                	test   %eax,%eax
c0105eb6:	74 0e                	je     c0105ec6 <default_check+0x29d>
c0105eb8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105ebb:	83 c0 40             	add    $0x40,%eax
c0105ebe:	8b 40 08             	mov    0x8(%eax),%eax
c0105ec1:	83 f8 03             	cmp    $0x3,%eax
c0105ec4:	74 24                	je     c0105eea <default_check+0x2c1>
c0105ec6:	c7 44 24 0c b8 a1 10 	movl   $0xc010a1b8,0xc(%esp)
c0105ecd:	c0 
c0105ece:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105ed5:	c0 
c0105ed6:	c7 44 24 04 15 01 00 	movl   $0x115,0x4(%esp)
c0105edd:	00 
c0105ede:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105ee5:	e8 0e a5 ff ff       	call   c01003f8 <__panic>
c0105eea:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
c0105ef1:	e8 f3 06 00 00       	call   c01065e9 <alloc_pages>
c0105ef6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105ef9:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0105efd:	75 24                	jne    c0105f23 <default_check+0x2fa>
c0105eff:	c7 44 24 0c e4 a1 10 	movl   $0xc010a1e4,0xc(%esp)
c0105f06:	c0 
c0105f07:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105f0e:	c0 
c0105f0f:	c7 44 24 04 16 01 00 	movl   $0x116,0x4(%esp)
c0105f16:	00 
c0105f17:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105f1e:	e8 d5 a4 ff ff       	call   c01003f8 <__panic>
c0105f23:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0105f2a:	e8 ba 06 00 00       	call   c01065e9 <alloc_pages>
c0105f2f:	85 c0                	test   %eax,%eax
c0105f31:	74 24                	je     c0105f57 <default_check+0x32e>
c0105f33:	c7 44 24 0c fa a0 10 	movl   $0xc010a0fa,0xc(%esp)
c0105f3a:	c0 
c0105f3b:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105f42:	c0 
c0105f43:	c7 44 24 04 17 01 00 	movl   $0x117,0x4(%esp)
c0105f4a:	00 
c0105f4b:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105f52:	e8 a1 a4 ff ff       	call   c01003f8 <__panic>
c0105f57:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f5a:	83 c0 40             	add    $0x40,%eax
c0105f5d:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0105f60:	74 24                	je     c0105f86 <default_check+0x35d>
c0105f62:	c7 44 24 0c 02 a2 10 	movl   $0xc010a202,0xc(%esp)
c0105f69:	c0 
c0105f6a:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105f71:	c0 
c0105f72:	c7 44 24 04 18 01 00 	movl   $0x118,0x4(%esp)
c0105f79:	00 
c0105f7a:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0105f81:	e8 72 a4 ff ff       	call   c01003f8 <__panic>
c0105f86:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f89:	83 c0 20             	add    $0x20,%eax
c0105f8c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105f8f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0105f96:	00 
c0105f97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f9a:	89 04 24             	mov    %eax,(%esp)
c0105f9d:	e8 b2 06 00 00       	call   c0106654 <free_pages>
c0105fa2:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
c0105fa9:	00 
c0105faa:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105fad:	89 04 24             	mov    %eax,(%esp)
c0105fb0:	e8 9f 06 00 00       	call   c0106654 <free_pages>
c0105fb5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105fb8:	83 c0 04             	add    $0x4,%eax
c0105fbb:	c7 45 a0 01 00 00 00 	movl   $0x1,-0x60(%ebp)
c0105fc2:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0105fc5:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0105fc8:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0105fcb:	0f a3 10             	bt     %edx,(%eax)
c0105fce:	19 c0                	sbb    %eax,%eax
c0105fd0:	89 45 98             	mov    %eax,-0x68(%ebp)
c0105fd3:	83 7d 98 00          	cmpl   $0x0,-0x68(%ebp)
c0105fd7:	0f 95 c0             	setne  %al
c0105fda:	0f b6 c0             	movzbl %al,%eax
c0105fdd:	85 c0                	test   %eax,%eax
c0105fdf:	74 0b                	je     c0105fec <default_check+0x3c3>
c0105fe1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105fe4:	8b 40 08             	mov    0x8(%eax),%eax
c0105fe7:	83 f8 01             	cmp    $0x1,%eax
c0105fea:	74 24                	je     c0106010 <default_check+0x3e7>
c0105fec:	c7 44 24 0c 10 a2 10 	movl   $0xc010a210,0xc(%esp)
c0105ff3:	c0 
c0105ff4:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0105ffb:	c0 
c0105ffc:	c7 44 24 04 1d 01 00 	movl   $0x11d,0x4(%esp)
c0106003:	00 
c0106004:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c010600b:	e8 e8 a3 ff ff       	call   c01003f8 <__panic>
c0106010:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106013:	83 c0 04             	add    $0x4,%eax
c0106016:	c7 45 94 01 00 00 00 	movl   $0x1,-0x6c(%ebp)
c010601d:	89 45 90             	mov    %eax,-0x70(%ebp)
c0106020:	8b 45 90             	mov    -0x70(%ebp),%eax
c0106023:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0106026:	0f a3 10             	bt     %edx,(%eax)
c0106029:	19 c0                	sbb    %eax,%eax
c010602b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010602e:	83 7d 8c 00          	cmpl   $0x0,-0x74(%ebp)
c0106032:	0f 95 c0             	setne  %al
c0106035:	0f b6 c0             	movzbl %al,%eax
c0106038:	85 c0                	test   %eax,%eax
c010603a:	74 0b                	je     c0106047 <default_check+0x41e>
c010603c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010603f:	8b 40 08             	mov    0x8(%eax),%eax
c0106042:	83 f8 03             	cmp    $0x3,%eax
c0106045:	74 24                	je     c010606b <default_check+0x442>
c0106047:	c7 44 24 0c 38 a2 10 	movl   $0xc010a238,0xc(%esp)
c010604e:	c0 
c010604f:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0106056:	c0 
c0106057:	c7 44 24 04 1e 01 00 	movl   $0x11e,0x4(%esp)
c010605e:	00 
c010605f:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0106066:	e8 8d a3 ff ff       	call   c01003f8 <__panic>
c010606b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0106072:	e8 72 05 00 00       	call   c01065e9 <alloc_pages>
c0106077:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010607a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010607d:	83 e8 20             	sub    $0x20,%eax
c0106080:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0106083:	74 24                	je     c01060a9 <default_check+0x480>
c0106085:	c7 44 24 0c 5e a2 10 	movl   $0xc010a25e,0xc(%esp)
c010608c:	c0 
c010608d:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0106094:	c0 
c0106095:	c7 44 24 04 20 01 00 	movl   $0x120,0x4(%esp)
c010609c:	00 
c010609d:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c01060a4:	e8 4f a3 ff ff       	call   c01003f8 <__panic>
c01060a9:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c01060b0:	00 
c01060b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01060b4:	89 04 24             	mov    %eax,(%esp)
c01060b7:	e8 98 05 00 00       	call   c0106654 <free_pages>
c01060bc:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
c01060c3:	e8 21 05 00 00       	call   c01065e9 <alloc_pages>
c01060c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01060cb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01060ce:	83 c0 20             	add    $0x20,%eax
c01060d1:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01060d4:	74 24                	je     c01060fa <default_check+0x4d1>
c01060d6:	c7 44 24 0c 7c a2 10 	movl   $0xc010a27c,0xc(%esp)
c01060dd:	c0 
c01060de:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c01060e5:	c0 
c01060e6:	c7 44 24 04 22 01 00 	movl   $0x122,0x4(%esp)
c01060ed:	00 
c01060ee:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c01060f5:	e8 fe a2 ff ff       	call   c01003f8 <__panic>
c01060fa:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
c0106101:	00 
c0106102:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106105:	89 04 24             	mov    %eax,(%esp)
c0106108:	e8 47 05 00 00       	call   c0106654 <free_pages>
c010610d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0106114:	00 
c0106115:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106118:	89 04 24             	mov    %eax,(%esp)
c010611b:	e8 34 05 00 00       	call   c0106654 <free_pages>
c0106120:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
c0106127:	e8 bd 04 00 00       	call   c01065e9 <alloc_pages>
c010612c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010612f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0106133:	75 24                	jne    c0106159 <default_check+0x530>
c0106135:	c7 44 24 0c 9c a2 10 	movl   $0xc010a29c,0xc(%esp)
c010613c:	c0 
c010613d:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0106144:	c0 
c0106145:	c7 44 24 04 27 01 00 	movl   $0x127,0x4(%esp)
c010614c:	00 
c010614d:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0106154:	e8 9f a2 ff ff       	call   c01003f8 <__panic>
c0106159:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0106160:	e8 84 04 00 00       	call   c01065e9 <alloc_pages>
c0106165:	85 c0                	test   %eax,%eax
c0106167:	74 24                	je     c010618d <default_check+0x564>
c0106169:	c7 44 24 0c fa a0 10 	movl   $0xc010a0fa,0xc(%esp)
c0106170:	c0 
c0106171:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0106178:	c0 
c0106179:	c7 44 24 04 28 01 00 	movl   $0x128,0x4(%esp)
c0106180:	00 
c0106181:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0106188:	e8 6b a2 ff ff       	call   c01003f8 <__panic>
c010618d:	a1 ec 40 12 c0       	mov    0xc01240ec,%eax
c0106192:	85 c0                	test   %eax,%eax
c0106194:	74 24                	je     c01061ba <default_check+0x591>
c0106196:	c7 44 24 0c 4d a1 10 	movl   $0xc010a14d,0xc(%esp)
c010619d:	c0 
c010619e:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c01061a5:	c0 
c01061a6:	c7 44 24 04 2a 01 00 	movl   $0x12a,0x4(%esp)
c01061ad:	00 
c01061ae:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c01061b5:	e8 3e a2 ff ff       	call   c01003f8 <__panic>
c01061ba:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01061bd:	a3 ec 40 12 c0       	mov    %eax,0xc01240ec
c01061c2:	8b 45 80             	mov    -0x80(%ebp),%eax
c01061c5:	8b 55 84             	mov    -0x7c(%ebp),%edx
c01061c8:	a3 e4 40 12 c0       	mov    %eax,0xc01240e4
c01061cd:	89 15 e8 40 12 c0    	mov    %edx,0xc01240e8
c01061d3:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
c01061da:	00 
c01061db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01061de:	89 04 24             	mov    %eax,(%esp)
c01061e1:	e8 6e 04 00 00       	call   c0106654 <free_pages>
c01061e6:	c7 45 ec e4 40 12 c0 	movl   $0xc01240e4,-0x14(%ebp)
c01061ed:	eb 1d                	jmp    c010620c <default_check+0x5e3>
c01061ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01061f2:	83 e8 0c             	sub    $0xc,%eax
c01061f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01061f8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c01061fc:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01061ff:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106202:	8b 40 08             	mov    0x8(%eax),%eax
c0106205:	29 c2                	sub    %eax,%edx
c0106207:	89 d0                	mov    %edx,%eax
c0106209:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010620c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010620f:	89 45 88             	mov    %eax,-0x78(%ebp)
c0106212:	8b 45 88             	mov    -0x78(%ebp),%eax
c0106215:	8b 40 04             	mov    0x4(%eax),%eax
c0106218:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010621b:	81 7d ec e4 40 12 c0 	cmpl   $0xc01240e4,-0x14(%ebp)
c0106222:	75 cb                	jne    c01061ef <default_check+0x5c6>
c0106224:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106228:	74 24                	je     c010624e <default_check+0x625>
c010622a:	c7 44 24 0c ba a2 10 	movl   $0xc010a2ba,0xc(%esp)
c0106231:	c0 
c0106232:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0106239:	c0 
c010623a:	c7 44 24 04 35 01 00 	movl   $0x135,0x4(%esp)
c0106241:	00 
c0106242:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0106249:	e8 aa a1 ff ff       	call   c01003f8 <__panic>
c010624e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106252:	74 24                	je     c0106278 <default_check+0x64f>
c0106254:	c7 44 24 0c c5 a2 10 	movl   $0xc010a2c5,0xc(%esp)
c010625b:	c0 
c010625c:	c7 44 24 08 5a 9f 10 	movl   $0xc0109f5a,0x8(%esp)
c0106263:	c0 
c0106264:	c7 44 24 04 36 01 00 	movl   $0x136,0x4(%esp)
c010626b:	00 
c010626c:	c7 04 24 6f 9f 10 c0 	movl   $0xc0109f6f,(%esp)
c0106273:	e8 80 a1 ff ff       	call   c01003f8 <__panic>
c0106278:	81 c4 94 00 00 00    	add    $0x94,%esp
c010627e:	5b                   	pop    %ebx
c010627f:	5d                   	pop    %ebp
c0106280:	c3                   	ret    

c0106281 <page2ppn>:
c0106281:	55                   	push   %ebp
c0106282:	89 e5                	mov    %esp,%ebp
c0106284:	8b 55 08             	mov    0x8(%ebp),%edx
c0106287:	a1 f8 40 12 c0       	mov    0xc01240f8,%eax
c010628c:	29 c2                	sub    %eax,%edx
c010628e:	89 d0                	mov    %edx,%eax
c0106290:	c1 f8 05             	sar    $0x5,%eax
c0106293:	5d                   	pop    %ebp
c0106294:	c3                   	ret    

c0106295 <page2pa>:
c0106295:	55                   	push   %ebp
c0106296:	89 e5                	mov    %esp,%ebp
c0106298:	83 ec 04             	sub    $0x4,%esp
c010629b:	8b 45 08             	mov    0x8(%ebp),%eax
c010629e:	89 04 24             	mov    %eax,(%esp)
c01062a1:	e8 db ff ff ff       	call   c0106281 <page2ppn>
c01062a6:	c1 e0 0c             	shl    $0xc,%eax
c01062a9:	c9                   	leave  
c01062aa:	c3                   	ret    

c01062ab <pa2page>:
c01062ab:	55                   	push   %ebp
c01062ac:	89 e5                	mov    %esp,%ebp
c01062ae:	83 ec 18             	sub    $0x18,%esp
c01062b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01062b4:	c1 e8 0c             	shr    $0xc,%eax
c01062b7:	89 c2                	mov    %eax,%edx
c01062b9:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c01062be:	39 c2                	cmp    %eax,%edx
c01062c0:	72 1c                	jb     c01062de <pa2page+0x33>
c01062c2:	c7 44 24 08 00 a3 10 	movl   $0xc010a300,0x8(%esp)
c01062c9:	c0 
c01062ca:	c7 44 24 04 5b 00 00 	movl   $0x5b,0x4(%esp)
c01062d1:	00 
c01062d2:	c7 04 24 1f a3 10 c0 	movl   $0xc010a31f,(%esp)
c01062d9:	e8 1a a1 ff ff       	call   c01003f8 <__panic>
c01062de:	a1 f8 40 12 c0       	mov    0xc01240f8,%eax
c01062e3:	8b 55 08             	mov    0x8(%ebp),%edx
c01062e6:	c1 ea 0c             	shr    $0xc,%edx
c01062e9:	c1 e2 05             	shl    $0x5,%edx
c01062ec:	01 d0                	add    %edx,%eax
c01062ee:	c9                   	leave  
c01062ef:	c3                   	ret    

c01062f0 <page2kva>:
c01062f0:	55                   	push   %ebp
c01062f1:	89 e5                	mov    %esp,%ebp
c01062f3:	83 ec 28             	sub    $0x28,%esp
c01062f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01062f9:	89 04 24             	mov    %eax,(%esp)
c01062fc:	e8 94 ff ff ff       	call   c0106295 <page2pa>
c0106301:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106304:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106307:	c1 e8 0c             	shr    $0xc,%eax
c010630a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010630d:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c0106312:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0106315:	72 23                	jb     c010633a <page2kva+0x4a>
c0106317:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010631a:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010631e:	c7 44 24 08 30 a3 10 	movl   $0xc010a330,0x8(%esp)
c0106325:	c0 
c0106326:	c7 44 24 04 62 00 00 	movl   $0x62,0x4(%esp)
c010632d:	00 
c010632e:	c7 04 24 1f a3 10 c0 	movl   $0xc010a31f,(%esp)
c0106335:	e8 be a0 ff ff       	call   c01003f8 <__panic>
c010633a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010633d:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106342:	c9                   	leave  
c0106343:	c3                   	ret    

c0106344 <kva2page>:
c0106344:	55                   	push   %ebp
c0106345:	89 e5                	mov    %esp,%ebp
c0106347:	83 ec 28             	sub    $0x28,%esp
c010634a:	8b 45 08             	mov    0x8(%ebp),%eax
c010634d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106350:	81 7d f4 ff ff ff bf 	cmpl   $0xbfffffff,-0xc(%ebp)
c0106357:	77 23                	ja     c010637c <kva2page+0x38>
c0106359:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010635c:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0106360:	c7 44 24 08 54 a3 10 	movl   $0xc010a354,0x8(%esp)
c0106367:	c0 
c0106368:	c7 44 24 04 67 00 00 	movl   $0x67,0x4(%esp)
c010636f:	00 
c0106370:	c7 04 24 1f a3 10 c0 	movl   $0xc010a31f,(%esp)
c0106377:	e8 7c a0 ff ff       	call   c01003f8 <__panic>
c010637c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010637f:	05 00 00 00 40       	add    $0x40000000,%eax
c0106384:	89 04 24             	mov    %eax,(%esp)
c0106387:	e8 1f ff ff ff       	call   c01062ab <pa2page>
c010638c:	c9                   	leave  
c010638d:	c3                   	ret    

c010638e <pte2page>:
c010638e:	55                   	push   %ebp
c010638f:	89 e5                	mov    %esp,%ebp
c0106391:	83 ec 18             	sub    $0x18,%esp
c0106394:	8b 45 08             	mov    0x8(%ebp),%eax
c0106397:	83 e0 01             	and    $0x1,%eax
c010639a:	85 c0                	test   %eax,%eax
c010639c:	75 1c                	jne    c01063ba <pte2page+0x2c>
c010639e:	c7 44 24 08 78 a3 10 	movl   $0xc010a378,0x8(%esp)
c01063a5:	c0 
c01063a6:	c7 44 24 04 6d 00 00 	movl   $0x6d,0x4(%esp)
c01063ad:	00 
c01063ae:	c7 04 24 1f a3 10 c0 	movl   $0xc010a31f,(%esp)
c01063b5:	e8 3e a0 ff ff       	call   c01003f8 <__panic>
c01063ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01063bd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01063c2:	89 04 24             	mov    %eax,(%esp)
c01063c5:	e8 e1 fe ff ff       	call   c01062ab <pa2page>
c01063ca:	c9                   	leave  
c01063cb:	c3                   	ret    

c01063cc <pde2page>:
c01063cc:	55                   	push   %ebp
c01063cd:	89 e5                	mov    %esp,%ebp
c01063cf:	83 ec 18             	sub    $0x18,%esp
c01063d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01063d5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01063da:	89 04 24             	mov    %eax,(%esp)
c01063dd:	e8 c9 fe ff ff       	call   c01062ab <pa2page>
c01063e2:	c9                   	leave  
c01063e3:	c3                   	ret    

c01063e4 <page_ref>:
c01063e4:	55                   	push   %ebp
c01063e5:	89 e5                	mov    %esp,%ebp
c01063e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01063ea:	8b 00                	mov    (%eax),%eax
c01063ec:	5d                   	pop    %ebp
c01063ed:	c3                   	ret    

c01063ee <set_page_ref>:
c01063ee:	55                   	push   %ebp
c01063ef:	89 e5                	mov    %esp,%ebp
c01063f1:	8b 45 08             	mov    0x8(%ebp),%eax
c01063f4:	8b 55 0c             	mov    0xc(%ebp),%edx
c01063f7:	89 10                	mov    %edx,(%eax)
c01063f9:	5d                   	pop    %ebp
c01063fa:	c3                   	ret    

c01063fb <page_ref_inc>:
c01063fb:	55                   	push   %ebp
c01063fc:	89 e5                	mov    %esp,%ebp
c01063fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0106401:	8b 00                	mov    (%eax),%eax
c0106403:	8d 50 01             	lea    0x1(%eax),%edx
c0106406:	8b 45 08             	mov    0x8(%ebp),%eax
c0106409:	89 10                	mov    %edx,(%eax)
c010640b:	8b 45 08             	mov    0x8(%ebp),%eax
c010640e:	8b 00                	mov    (%eax),%eax
c0106410:	5d                   	pop    %ebp
c0106411:	c3                   	ret    

c0106412 <page_ref_dec>:
c0106412:	55                   	push   %ebp
c0106413:	89 e5                	mov    %esp,%ebp
c0106415:	8b 45 08             	mov    0x8(%ebp),%eax
c0106418:	8b 00                	mov    (%eax),%eax
c010641a:	8d 50 ff             	lea    -0x1(%eax),%edx
c010641d:	8b 45 08             	mov    0x8(%ebp),%eax
c0106420:	89 10                	mov    %edx,(%eax)
c0106422:	8b 45 08             	mov    0x8(%ebp),%eax
c0106425:	8b 00                	mov    (%eax),%eax
c0106427:	5d                   	pop    %ebp
c0106428:	c3                   	ret    

c0106429 <__intr_save>:
c0106429:	55                   	push   %ebp
c010642a:	89 e5                	mov    %esp,%ebp
c010642c:	83 ec 18             	sub    $0x18,%esp
c010642f:	9c                   	pushf  
c0106430:	58                   	pop    %eax
c0106431:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106434:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106437:	25 00 02 00 00       	and    $0x200,%eax
c010643c:	85 c0                	test   %eax,%eax
c010643e:	74 0c                	je     c010644c <__intr_save+0x23>
c0106440:	e8 c6 bc ff ff       	call   c010210b <intr_disable>
c0106445:	b8 01 00 00 00       	mov    $0x1,%eax
c010644a:	eb 05                	jmp    c0106451 <__intr_save+0x28>
c010644c:	b8 00 00 00 00       	mov    $0x0,%eax
c0106451:	c9                   	leave  
c0106452:	c3                   	ret    

c0106453 <__intr_restore>:
c0106453:	55                   	push   %ebp
c0106454:	89 e5                	mov    %esp,%ebp
c0106456:	83 ec 08             	sub    $0x8,%esp
c0106459:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010645d:	74 05                	je     c0106464 <__intr_restore+0x11>
c010645f:	e8 a1 bc ff ff       	call   c0102105 <intr_enable>
c0106464:	c9                   	leave  
c0106465:	c3                   	ret    

c0106466 <lgdt>:
c0106466:	55                   	push   %ebp
c0106467:	89 e5                	mov    %esp,%ebp
c0106469:	8b 45 08             	mov    0x8(%ebp),%eax
c010646c:	0f 01 10             	lgdtl  (%eax)
c010646f:	b8 23 00 00 00       	mov    $0x23,%eax
c0106474:	8e e8                	mov    %eax,%gs
c0106476:	b8 23 00 00 00       	mov    $0x23,%eax
c010647b:	8e e0                	mov    %eax,%fs
c010647d:	b8 10 00 00 00       	mov    $0x10,%eax
c0106482:	8e c0                	mov    %eax,%es
c0106484:	b8 10 00 00 00       	mov    $0x10,%eax
c0106489:	8e d8                	mov    %eax,%ds
c010648b:	b8 10 00 00 00       	mov    $0x10,%eax
c0106490:	8e d0                	mov    %eax,%ss
c0106492:	ea 99 64 10 c0 08 00 	ljmp   $0x8,$0xc0106499
c0106499:	5d                   	pop    %ebp
c010649a:	c3                   	ret    

c010649b <load_esp0>:
c010649b:	55                   	push   %ebp
c010649c:	89 e5                	mov    %esp,%ebp
c010649e:	8b 45 08             	mov    0x8(%ebp),%eax
c01064a1:	a3 a4 3f 12 c0       	mov    %eax,0xc0123fa4
c01064a6:	5d                   	pop    %ebp
c01064a7:	c3                   	ret    

c01064a8 <gdt_init>:
c01064a8:	55                   	push   %ebp
c01064a9:	89 e5                	mov    %esp,%ebp
c01064ab:	83 ec 14             	sub    $0x14,%esp
c01064ae:	b8 00 00 12 c0       	mov    $0xc0120000,%eax
c01064b3:	89 04 24             	mov    %eax,(%esp)
c01064b6:	e8 e0 ff ff ff       	call   c010649b <load_esp0>
c01064bb:	66 c7 05 a8 3f 12 c0 	movw   $0x10,0xc0123fa8
c01064c2:	10 00 
c01064c4:	66 c7 05 48 0a 12 c0 	movw   $0x68,0xc0120a48
c01064cb:	68 00 
c01064cd:	b8 a0 3f 12 c0       	mov    $0xc0123fa0,%eax
c01064d2:	66 a3 4a 0a 12 c0    	mov    %ax,0xc0120a4a
c01064d8:	b8 a0 3f 12 c0       	mov    $0xc0123fa0,%eax
c01064dd:	c1 e8 10             	shr    $0x10,%eax
c01064e0:	a2 4c 0a 12 c0       	mov    %al,0xc0120a4c
c01064e5:	0f b6 05 4d 0a 12 c0 	movzbl 0xc0120a4d,%eax
c01064ec:	83 e0 f0             	and    $0xfffffff0,%eax
c01064ef:	83 c8 09             	or     $0x9,%eax
c01064f2:	a2 4d 0a 12 c0       	mov    %al,0xc0120a4d
c01064f7:	0f b6 05 4d 0a 12 c0 	movzbl 0xc0120a4d,%eax
c01064fe:	83 e0 ef             	and    $0xffffffef,%eax
c0106501:	a2 4d 0a 12 c0       	mov    %al,0xc0120a4d
c0106506:	0f b6 05 4d 0a 12 c0 	movzbl 0xc0120a4d,%eax
c010650d:	83 e0 9f             	and    $0xffffff9f,%eax
c0106510:	a2 4d 0a 12 c0       	mov    %al,0xc0120a4d
c0106515:	0f b6 05 4d 0a 12 c0 	movzbl 0xc0120a4d,%eax
c010651c:	83 c8 80             	or     $0xffffff80,%eax
c010651f:	a2 4d 0a 12 c0       	mov    %al,0xc0120a4d
c0106524:	0f b6 05 4e 0a 12 c0 	movzbl 0xc0120a4e,%eax
c010652b:	83 e0 f0             	and    $0xfffffff0,%eax
c010652e:	a2 4e 0a 12 c0       	mov    %al,0xc0120a4e
c0106533:	0f b6 05 4e 0a 12 c0 	movzbl 0xc0120a4e,%eax
c010653a:	83 e0 ef             	and    $0xffffffef,%eax
c010653d:	a2 4e 0a 12 c0       	mov    %al,0xc0120a4e
c0106542:	0f b6 05 4e 0a 12 c0 	movzbl 0xc0120a4e,%eax
c0106549:	83 e0 df             	and    $0xffffffdf,%eax
c010654c:	a2 4e 0a 12 c0       	mov    %al,0xc0120a4e
c0106551:	0f b6 05 4e 0a 12 c0 	movzbl 0xc0120a4e,%eax
c0106558:	83 c8 40             	or     $0x40,%eax
c010655b:	a2 4e 0a 12 c0       	mov    %al,0xc0120a4e
c0106560:	0f b6 05 4e 0a 12 c0 	movzbl 0xc0120a4e,%eax
c0106567:	83 e0 7f             	and    $0x7f,%eax
c010656a:	a2 4e 0a 12 c0       	mov    %al,0xc0120a4e
c010656f:	b8 a0 3f 12 c0       	mov    $0xc0123fa0,%eax
c0106574:	c1 e8 18             	shr    $0x18,%eax
c0106577:	a2 4f 0a 12 c0       	mov    %al,0xc0120a4f
c010657c:	c7 04 24 50 0a 12 c0 	movl   $0xc0120a50,(%esp)
c0106583:	e8 de fe ff ff       	call   c0106466 <lgdt>
c0106588:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
c010658e:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
c0106592:	0f 00 d8             	ltr    %ax
c0106595:	c9                   	leave  
c0106596:	c3                   	ret    

c0106597 <init_pmm_manager>:
c0106597:	55                   	push   %ebp
c0106598:	89 e5                	mov    %esp,%ebp
c010659a:	83 ec 18             	sub    $0x18,%esp
c010659d:	c7 05 f0 40 12 c0 e4 	movl   $0xc010a2e4,0xc01240f0
c01065a4:	a2 10 c0 
c01065a7:	a1 f0 40 12 c0       	mov    0xc01240f0,%eax
c01065ac:	8b 00                	mov    (%eax),%eax
c01065ae:	89 44 24 04          	mov    %eax,0x4(%esp)
c01065b2:	c7 04 24 a4 a3 10 c0 	movl   $0xc010a3a4,(%esp)
c01065b9:	e8 e3 9c ff ff       	call   c01002a1 <cprintf>
c01065be:	a1 f0 40 12 c0       	mov    0xc01240f0,%eax
c01065c3:	8b 40 04             	mov    0x4(%eax),%eax
c01065c6:	ff d0                	call   *%eax
c01065c8:	c9                   	leave  
c01065c9:	c3                   	ret    

c01065ca <init_memmap>:
c01065ca:	55                   	push   %ebp
c01065cb:	89 e5                	mov    %esp,%ebp
c01065cd:	83 ec 18             	sub    $0x18,%esp
c01065d0:	a1 f0 40 12 c0       	mov    0xc01240f0,%eax
c01065d5:	8b 40 08             	mov    0x8(%eax),%eax
c01065d8:	8b 55 0c             	mov    0xc(%ebp),%edx
c01065db:	89 54 24 04          	mov    %edx,0x4(%esp)
c01065df:	8b 55 08             	mov    0x8(%ebp),%edx
c01065e2:	89 14 24             	mov    %edx,(%esp)
c01065e5:	ff d0                	call   *%eax
c01065e7:	c9                   	leave  
c01065e8:	c3                   	ret    

c01065e9 <alloc_pages>:
c01065e9:	55                   	push   %ebp
c01065ea:	89 e5                	mov    %esp,%ebp
c01065ec:	83 ec 28             	sub    $0x28,%esp
c01065ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01065f6:	e8 2e fe ff ff       	call   c0106429 <__intr_save>
c01065fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01065fe:	a1 f0 40 12 c0       	mov    0xc01240f0,%eax
c0106603:	8b 40 0c             	mov    0xc(%eax),%eax
c0106606:	8b 55 08             	mov    0x8(%ebp),%edx
c0106609:	89 14 24             	mov    %edx,(%esp)
c010660c:	ff d0                	call   *%eax
c010660e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106611:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106614:	89 04 24             	mov    %eax,(%esp)
c0106617:	e8 37 fe ff ff       	call   c0106453 <__intr_restore>
c010661c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106620:	75 2d                	jne    c010664f <alloc_pages+0x66>
c0106622:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0106626:	77 27                	ja     c010664f <alloc_pages+0x66>
c0106628:	a1 68 3f 12 c0       	mov    0xc0123f68,%eax
c010662d:	85 c0                	test   %eax,%eax
c010662f:	74 1e                	je     c010664f <alloc_pages+0x66>
c0106631:	8b 55 08             	mov    0x8(%ebp),%edx
c0106634:	a1 10 40 12 c0       	mov    0xc0124010,%eax
c0106639:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c0106640:	00 
c0106641:	89 54 24 04          	mov    %edx,0x4(%esp)
c0106645:	89 04 24             	mov    %eax,(%esp)
c0106648:	e8 a8 df ff ff       	call   c01045f5 <swap_out>
c010664d:	eb a7                	jmp    c01065f6 <alloc_pages+0xd>
c010664f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106652:	c9                   	leave  
c0106653:	c3                   	ret    

c0106654 <free_pages>:
c0106654:	55                   	push   %ebp
c0106655:	89 e5                	mov    %esp,%ebp
c0106657:	83 ec 28             	sub    $0x28,%esp
c010665a:	e8 ca fd ff ff       	call   c0106429 <__intr_save>
c010665f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106662:	a1 f0 40 12 c0       	mov    0xc01240f0,%eax
c0106667:	8b 40 10             	mov    0x10(%eax),%eax
c010666a:	8b 55 0c             	mov    0xc(%ebp),%edx
c010666d:	89 54 24 04          	mov    %edx,0x4(%esp)
c0106671:	8b 55 08             	mov    0x8(%ebp),%edx
c0106674:	89 14 24             	mov    %edx,(%esp)
c0106677:	ff d0                	call   *%eax
c0106679:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010667c:	89 04 24             	mov    %eax,(%esp)
c010667f:	e8 cf fd ff ff       	call   c0106453 <__intr_restore>
c0106684:	c9                   	leave  
c0106685:	c3                   	ret    

c0106686 <nr_free_pages>:
c0106686:	55                   	push   %ebp
c0106687:	89 e5                	mov    %esp,%ebp
c0106689:	83 ec 28             	sub    $0x28,%esp
c010668c:	e8 98 fd ff ff       	call   c0106429 <__intr_save>
c0106691:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106694:	a1 f0 40 12 c0       	mov    0xc01240f0,%eax
c0106699:	8b 40 14             	mov    0x14(%eax),%eax
c010669c:	ff d0                	call   *%eax
c010669e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01066a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01066a4:	89 04 24             	mov    %eax,(%esp)
c01066a7:	e8 a7 fd ff ff       	call   c0106453 <__intr_restore>
c01066ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01066af:	c9                   	leave  
c01066b0:	c3                   	ret    

c01066b1 <page_init>:
c01066b1:	55                   	push   %ebp
c01066b2:	89 e5                	mov    %esp,%ebp
c01066b4:	57                   	push   %edi
c01066b5:	56                   	push   %esi
c01066b6:	53                   	push   %ebx
c01066b7:	81 ec 9c 00 00 00    	sub    $0x9c,%esp
c01066bd:	c7 45 c4 00 80 00 c0 	movl   $0xc0008000,-0x3c(%ebp)
c01066c4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01066cb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01066d2:	c7 04 24 bb a3 10 c0 	movl   $0xc010a3bb,(%esp)
c01066d9:	e8 c3 9b ff ff       	call   c01002a1 <cprintf>
c01066de:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c01066e5:	e9 15 01 00 00       	jmp    c01067ff <page_init+0x14e>
c01066ea:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
c01066ed:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01066f0:	89 d0                	mov    %edx,%eax
c01066f2:	c1 e0 02             	shl    $0x2,%eax
c01066f5:	01 d0                	add    %edx,%eax
c01066f7:	c1 e0 02             	shl    $0x2,%eax
c01066fa:	01 c8                	add    %ecx,%eax
c01066fc:	8b 50 08             	mov    0x8(%eax),%edx
c01066ff:	8b 40 04             	mov    0x4(%eax),%eax
c0106702:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106705:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0106708:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
c010670b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010670e:	89 d0                	mov    %edx,%eax
c0106710:	c1 e0 02             	shl    $0x2,%eax
c0106713:	01 d0                	add    %edx,%eax
c0106715:	c1 e0 02             	shl    $0x2,%eax
c0106718:	01 c8                	add    %ecx,%eax
c010671a:	8b 48 0c             	mov    0xc(%eax),%ecx
c010671d:	8b 58 10             	mov    0x10(%eax),%ebx
c0106720:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0106723:	8b 55 bc             	mov    -0x44(%ebp),%edx
c0106726:	01 c8                	add    %ecx,%eax
c0106728:	11 da                	adc    %ebx,%edx
c010672a:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010672d:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106730:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
c0106733:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0106736:	89 d0                	mov    %edx,%eax
c0106738:	c1 e0 02             	shl    $0x2,%eax
c010673b:	01 d0                	add    %edx,%eax
c010673d:	c1 e0 02             	shl    $0x2,%eax
c0106740:	01 c8                	add    %ecx,%eax
c0106742:	83 c0 14             	add    $0x14,%eax
c0106745:	8b 00                	mov    (%eax),%eax
c0106747:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010674d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0106750:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0106753:	83 c0 ff             	add    $0xffffffff,%eax
c0106756:	83 d2 ff             	adc    $0xffffffff,%edx
c0106759:	89 c6                	mov    %eax,%esi
c010675b:	89 d7                	mov    %edx,%edi
c010675d:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
c0106760:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0106763:	89 d0                	mov    %edx,%eax
c0106765:	c1 e0 02             	shl    $0x2,%eax
c0106768:	01 d0                	add    %edx,%eax
c010676a:	c1 e0 02             	shl    $0x2,%eax
c010676d:	01 c8                	add    %ecx,%eax
c010676f:	8b 48 0c             	mov    0xc(%eax),%ecx
c0106772:	8b 58 10             	mov    0x10(%eax),%ebx
c0106775:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c010677b:	89 44 24 1c          	mov    %eax,0x1c(%esp)
c010677f:	89 74 24 14          	mov    %esi,0x14(%esp)
c0106783:	89 7c 24 18          	mov    %edi,0x18(%esp)
c0106787:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010678a:	8b 55 bc             	mov    -0x44(%ebp),%edx
c010678d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0106791:	89 54 24 10          	mov    %edx,0x10(%esp)
c0106795:	89 4c 24 04          	mov    %ecx,0x4(%esp)
c0106799:	89 5c 24 08          	mov    %ebx,0x8(%esp)
c010679d:	c7 04 24 c8 a3 10 c0 	movl   $0xc010a3c8,(%esp)
c01067a4:	e8 f8 9a ff ff       	call   c01002a1 <cprintf>
c01067a9:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
c01067ac:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01067af:	89 d0                	mov    %edx,%eax
c01067b1:	c1 e0 02             	shl    $0x2,%eax
c01067b4:	01 d0                	add    %edx,%eax
c01067b6:	c1 e0 02             	shl    $0x2,%eax
c01067b9:	01 c8                	add    %ecx,%eax
c01067bb:	83 c0 14             	add    $0x14,%eax
c01067be:	8b 00                	mov    (%eax),%eax
c01067c0:	83 f8 01             	cmp    $0x1,%eax
c01067c3:	75 36                	jne    c01067fb <page_init+0x14a>
c01067c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01067c8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01067cb:	3b 55 b4             	cmp    -0x4c(%ebp),%edx
c01067ce:	77 2b                	ja     c01067fb <page_init+0x14a>
c01067d0:	3b 55 b4             	cmp    -0x4c(%ebp),%edx
c01067d3:	72 05                	jb     c01067da <page_init+0x129>
c01067d5:	3b 45 b0             	cmp    -0x50(%ebp),%eax
c01067d8:	73 21                	jae    c01067fb <page_init+0x14a>
c01067da:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c01067de:	77 1b                	ja     c01067fb <page_init+0x14a>
c01067e0:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c01067e4:	72 09                	jb     c01067ef <page_init+0x13e>
c01067e6:	81 7d b8 ff ff ff 37 	cmpl   $0x37ffffff,-0x48(%ebp)
c01067ed:	77 0c                	ja     c01067fb <page_init+0x14a>
c01067ef:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01067f2:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c01067f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01067f8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01067fb:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c01067ff:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106802:	8b 00                	mov    (%eax),%eax
c0106804:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0106807:	0f 8f dd fe ff ff    	jg     c01066ea <page_init+0x39>
c010680d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0106811:	72 1d                	jb     c0106830 <page_init+0x17f>
c0106813:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0106817:	77 09                	ja     c0106822 <page_init+0x171>
c0106819:	81 7d e0 00 00 00 38 	cmpl   $0x38000000,-0x20(%ebp)
c0106820:	76 0e                	jbe    c0106830 <page_init+0x17f>
c0106822:	c7 45 e0 00 00 00 38 	movl   $0x38000000,-0x20(%ebp)
c0106829:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106830:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106833:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106836:	0f ac d0 0c          	shrd   $0xc,%edx,%eax
c010683a:	c1 ea 0c             	shr    $0xc,%edx
c010683d:	a3 80 3f 12 c0       	mov    %eax,0xc0123f80
c0106842:	c7 45 ac 00 10 00 00 	movl   $0x1000,-0x54(%ebp)
c0106849:	b8 fc 40 12 c0       	mov    $0xc01240fc,%eax
c010684e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106851:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0106854:	01 d0                	add    %edx,%eax
c0106856:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106859:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010685c:	ba 00 00 00 00       	mov    $0x0,%edx
c0106861:	f7 75 ac             	divl   -0x54(%ebp)
c0106864:	89 d0                	mov    %edx,%eax
c0106866:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0106869:	29 c2                	sub    %eax,%edx
c010686b:	89 d0                	mov    %edx,%eax
c010686d:	a3 f8 40 12 c0       	mov    %eax,0xc01240f8
c0106872:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0106879:	eb 27                	jmp    c01068a2 <page_init+0x1f1>
c010687b:	a1 f8 40 12 c0       	mov    0xc01240f8,%eax
c0106880:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0106883:	c1 e2 05             	shl    $0x5,%edx
c0106886:	01 d0                	add    %edx,%eax
c0106888:	83 c0 04             	add    $0x4,%eax
c010688b:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
c0106892:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0106895:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0106898:	8b 55 90             	mov    -0x70(%ebp),%edx
c010689b:	0f ab 10             	bts    %edx,(%eax)
c010689e:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c01068a2:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01068a5:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c01068aa:	39 c2                	cmp    %eax,%edx
c01068ac:	72 cd                	jb     c010687b <page_init+0x1ca>
c01068ae:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c01068b3:	c1 e0 05             	shl    $0x5,%eax
c01068b6:	89 c2                	mov    %eax,%edx
c01068b8:	a1 f8 40 12 c0       	mov    0xc01240f8,%eax
c01068bd:	01 d0                	add    %edx,%eax
c01068bf:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01068c2:	81 7d a4 ff ff ff bf 	cmpl   $0xbfffffff,-0x5c(%ebp)
c01068c9:	77 23                	ja     c01068ee <page_init+0x23d>
c01068cb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01068ce:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01068d2:	c7 44 24 08 54 a3 10 	movl   $0xc010a354,0x8(%esp)
c01068d9:	c0 
c01068da:	c7 44 24 04 e9 00 00 	movl   $0xe9,0x4(%esp)
c01068e1:	00 
c01068e2:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01068e9:	e8 0a 9b ff ff       	call   c01003f8 <__panic>
c01068ee:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01068f1:	05 00 00 00 40       	add    $0x40000000,%eax
c01068f6:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01068f9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0106900:	e9 74 01 00 00       	jmp    c0106a79 <page_init+0x3c8>
c0106905:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
c0106908:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010690b:	89 d0                	mov    %edx,%eax
c010690d:	c1 e0 02             	shl    $0x2,%eax
c0106910:	01 d0                	add    %edx,%eax
c0106912:	c1 e0 02             	shl    $0x2,%eax
c0106915:	01 c8                	add    %ecx,%eax
c0106917:	8b 50 08             	mov    0x8(%eax),%edx
c010691a:	8b 40 04             	mov    0x4(%eax),%eax
c010691d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106920:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0106923:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
c0106926:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0106929:	89 d0                	mov    %edx,%eax
c010692b:	c1 e0 02             	shl    $0x2,%eax
c010692e:	01 d0                	add    %edx,%eax
c0106930:	c1 e0 02             	shl    $0x2,%eax
c0106933:	01 c8                	add    %ecx,%eax
c0106935:	8b 48 0c             	mov    0xc(%eax),%ecx
c0106938:	8b 58 10             	mov    0x10(%eax),%ebx
c010693b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010693e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0106941:	01 c8                	add    %ecx,%eax
c0106943:	11 da                	adc    %ebx,%edx
c0106945:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106948:	89 55 cc             	mov    %edx,-0x34(%ebp)
c010694b:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
c010694e:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0106951:	89 d0                	mov    %edx,%eax
c0106953:	c1 e0 02             	shl    $0x2,%eax
c0106956:	01 d0                	add    %edx,%eax
c0106958:	c1 e0 02             	shl    $0x2,%eax
c010695b:	01 c8                	add    %ecx,%eax
c010695d:	83 c0 14             	add    $0x14,%eax
c0106960:	8b 00                	mov    (%eax),%eax
c0106962:	83 f8 01             	cmp    $0x1,%eax
c0106965:	0f 85 0a 01 00 00    	jne    c0106a75 <page_init+0x3c4>
c010696b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010696e:	ba 00 00 00 00       	mov    $0x0,%edx
c0106973:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
c0106976:	72 17                	jb     c010698f <page_init+0x2de>
c0106978:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
c010697b:	77 05                	ja     c0106982 <page_init+0x2d1>
c010697d:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c0106980:	76 0d                	jbe    c010698f <page_init+0x2de>
c0106982:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0106985:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106988:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c010698f:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0106993:	72 1d                	jb     c01069b2 <page_init+0x301>
c0106995:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0106999:	77 09                	ja     c01069a4 <page_init+0x2f3>
c010699b:	81 7d c8 00 00 00 38 	cmpl   $0x38000000,-0x38(%ebp)
c01069a2:	76 0e                	jbe    c01069b2 <page_init+0x301>
c01069a4:	c7 45 c8 00 00 00 38 	movl   $0x38000000,-0x38(%ebp)
c01069ab:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01069b2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01069b5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01069b8:	3b 55 cc             	cmp    -0x34(%ebp),%edx
c01069bb:	0f 87 b4 00 00 00    	ja     c0106a75 <page_init+0x3c4>
c01069c1:	3b 55 cc             	cmp    -0x34(%ebp),%edx
c01069c4:	72 09                	jb     c01069cf <page_init+0x31e>
c01069c6:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c01069c9:	0f 83 a6 00 00 00    	jae    c0106a75 <page_init+0x3c4>
c01069cf:	c7 45 9c 00 10 00 00 	movl   $0x1000,-0x64(%ebp)
c01069d6:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01069d9:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01069dc:	01 d0                	add    %edx,%eax
c01069de:	83 e8 01             	sub    $0x1,%eax
c01069e1:	89 45 98             	mov    %eax,-0x68(%ebp)
c01069e4:	8b 45 98             	mov    -0x68(%ebp),%eax
c01069e7:	ba 00 00 00 00       	mov    $0x0,%edx
c01069ec:	f7 75 9c             	divl   -0x64(%ebp)
c01069ef:	89 d0                	mov    %edx,%eax
c01069f1:	8b 55 98             	mov    -0x68(%ebp),%edx
c01069f4:	29 c2                	sub    %eax,%edx
c01069f6:	89 d0                	mov    %edx,%eax
c01069f8:	ba 00 00 00 00       	mov    $0x0,%edx
c01069fd:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106a00:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0106a03:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0106a06:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0106a09:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0106a0c:	ba 00 00 00 00       	mov    $0x0,%edx
c0106a11:	89 c7                	mov    %eax,%edi
c0106a13:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
c0106a19:	89 7d 80             	mov    %edi,-0x80(%ebp)
c0106a1c:	89 d0                	mov    %edx,%eax
c0106a1e:	83 e0 00             	and    $0x0,%eax
c0106a21:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0106a24:	8b 45 80             	mov    -0x80(%ebp),%eax
c0106a27:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0106a2a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106a2d:	89 55 cc             	mov    %edx,-0x34(%ebp)
c0106a30:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106a33:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0106a36:	3b 55 cc             	cmp    -0x34(%ebp),%edx
c0106a39:	77 3a                	ja     c0106a75 <page_init+0x3c4>
c0106a3b:	3b 55 cc             	cmp    -0x34(%ebp),%edx
c0106a3e:	72 05                	jb     c0106a45 <page_init+0x394>
c0106a40:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0106a43:	73 30                	jae    c0106a75 <page_init+0x3c4>
c0106a45:	8b 4d d0             	mov    -0x30(%ebp),%ecx
c0106a48:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
c0106a4b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0106a4e:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0106a51:	29 c8                	sub    %ecx,%eax
c0106a53:	19 da                	sbb    %ebx,%edx
c0106a55:	0f ac d0 0c          	shrd   $0xc,%edx,%eax
c0106a59:	c1 ea 0c             	shr    $0xc,%edx
c0106a5c:	89 c3                	mov    %eax,%ebx
c0106a5e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106a61:	89 04 24             	mov    %eax,(%esp)
c0106a64:	e8 42 f8 ff ff       	call   c01062ab <pa2page>
c0106a69:	89 5c 24 04          	mov    %ebx,0x4(%esp)
c0106a6d:	89 04 24             	mov    %eax,(%esp)
c0106a70:	e8 55 fb ff ff       	call   c01065ca <init_memmap>
c0106a75:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0106a79:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106a7c:	8b 00                	mov    (%eax),%eax
c0106a7e:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0106a81:	0f 8f 7e fe ff ff    	jg     c0106905 <page_init+0x254>
c0106a87:	81 c4 9c 00 00 00    	add    $0x9c,%esp
c0106a8d:	5b                   	pop    %ebx
c0106a8e:	5e                   	pop    %esi
c0106a8f:	5f                   	pop    %edi
c0106a90:	5d                   	pop    %ebp
c0106a91:	c3                   	ret    

c0106a92 <boot_map_segment>:
c0106a92:	55                   	push   %ebp
c0106a93:	89 e5                	mov    %esp,%ebp
c0106a95:	83 ec 38             	sub    $0x38,%esp
c0106a98:	8b 45 14             	mov    0x14(%ebp),%eax
c0106a9b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106a9e:	31 d0                	xor    %edx,%eax
c0106aa0:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106aa5:	85 c0                	test   %eax,%eax
c0106aa7:	74 24                	je     c0106acd <boot_map_segment+0x3b>
c0106aa9:	c7 44 24 0c 06 a4 10 	movl   $0xc010a406,0xc(%esp)
c0106ab0:	c0 
c0106ab1:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0106ab8:	c0 
c0106ab9:	c7 44 24 04 07 01 00 	movl   $0x107,0x4(%esp)
c0106ac0:	00 
c0106ac1:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0106ac8:	e8 2b 99 ff ff       	call   c01003f8 <__panic>
c0106acd:	c7 45 f0 00 10 00 00 	movl   $0x1000,-0x10(%ebp)
c0106ad4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106ad7:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106adc:	89 c2                	mov    %eax,%edx
c0106ade:	8b 45 10             	mov    0x10(%ebp),%eax
c0106ae1:	01 c2                	add    %eax,%edx
c0106ae3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106ae6:	01 d0                	add    %edx,%eax
c0106ae8:	83 e8 01             	sub    $0x1,%eax
c0106aeb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106aee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106af1:	ba 00 00 00 00       	mov    $0x0,%edx
c0106af6:	f7 75 f0             	divl   -0x10(%ebp)
c0106af9:	89 d0                	mov    %edx,%eax
c0106afb:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106afe:	29 c2                	sub    %eax,%edx
c0106b00:	89 d0                	mov    %edx,%eax
c0106b02:	c1 e8 0c             	shr    $0xc,%eax
c0106b05:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106b08:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106b0b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106b0e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106b11:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106b16:	89 45 0c             	mov    %eax,0xc(%ebp)
c0106b19:	8b 45 14             	mov    0x14(%ebp),%eax
c0106b1c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106b1f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106b22:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106b27:	89 45 14             	mov    %eax,0x14(%ebp)
c0106b2a:	eb 6b                	jmp    c0106b97 <boot_map_segment+0x105>
c0106b2c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0106b33:	00 
c0106b34:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106b37:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106b3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106b3e:	89 04 24             	mov    %eax,(%esp)
c0106b41:	e8 82 01 00 00       	call   c0106cc8 <get_pte>
c0106b46:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106b49:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0106b4d:	75 24                	jne    c0106b73 <boot_map_segment+0xe1>
c0106b4f:	c7 44 24 0c 32 a4 10 	movl   $0xc010a432,0xc(%esp)
c0106b56:	c0 
c0106b57:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0106b5e:	c0 
c0106b5f:	c7 44 24 04 0d 01 00 	movl   $0x10d,0x4(%esp)
c0106b66:	00 
c0106b67:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0106b6e:	e8 85 98 ff ff       	call   c01003f8 <__panic>
c0106b73:	8b 45 18             	mov    0x18(%ebp),%eax
c0106b76:	8b 55 14             	mov    0x14(%ebp),%edx
c0106b79:	09 d0                	or     %edx,%eax
c0106b7b:	83 c8 01             	or     $0x1,%eax
c0106b7e:	89 c2                	mov    %eax,%edx
c0106b80:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106b83:	89 10                	mov    %edx,(%eax)
c0106b85:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0106b89:	81 45 0c 00 10 00 00 	addl   $0x1000,0xc(%ebp)
c0106b90:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
c0106b97:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106b9b:	75 8f                	jne    c0106b2c <boot_map_segment+0x9a>
c0106b9d:	c9                   	leave  
c0106b9e:	c3                   	ret    

c0106b9f <boot_alloc_page>:
c0106b9f:	55                   	push   %ebp
c0106ba0:	89 e5                	mov    %esp,%ebp
c0106ba2:	83 ec 28             	sub    $0x28,%esp
c0106ba5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0106bac:	e8 38 fa ff ff       	call   c01065e9 <alloc_pages>
c0106bb1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106bb4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106bb8:	75 1c                	jne    c0106bd6 <boot_alloc_page+0x37>
c0106bba:	c7 44 24 08 3f a4 10 	movl   $0xc010a43f,0x8(%esp)
c0106bc1:	c0 
c0106bc2:	c7 44 24 04 19 01 00 	movl   $0x119,0x4(%esp)
c0106bc9:	00 
c0106bca:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0106bd1:	e8 22 98 ff ff       	call   c01003f8 <__panic>
c0106bd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106bd9:	89 04 24             	mov    %eax,(%esp)
c0106bdc:	e8 0f f7 ff ff       	call   c01062f0 <page2kva>
c0106be1:	c9                   	leave  
c0106be2:	c3                   	ret    

c0106be3 <pmm_init>:
c0106be3:	55                   	push   %ebp
c0106be4:	89 e5                	mov    %esp,%ebp
c0106be6:	83 ec 38             	sub    $0x38,%esp
c0106be9:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0106bee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106bf1:	81 7d f4 ff ff ff bf 	cmpl   $0xbfffffff,-0xc(%ebp)
c0106bf8:	77 23                	ja     c0106c1d <pmm_init+0x3a>
c0106bfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106bfd:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0106c01:	c7 44 24 08 54 a3 10 	movl   $0xc010a354,0x8(%esp)
c0106c08:	c0 
c0106c09:	c7 44 24 04 23 01 00 	movl   $0x123,0x4(%esp)
c0106c10:	00 
c0106c11:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0106c18:	e8 db 97 ff ff       	call   c01003f8 <__panic>
c0106c1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c20:	05 00 00 00 40       	add    $0x40000000,%eax
c0106c25:	a3 f4 40 12 c0       	mov    %eax,0xc01240f4
c0106c2a:	e8 68 f9 ff ff       	call   c0106597 <init_pmm_manager>
c0106c2f:	e8 7d fa ff ff       	call   c01066b1 <page_init>
c0106c34:	e8 a6 04 00 00       	call   c01070df <check_alloc_page>
c0106c39:	e8 bf 04 00 00       	call   c01070fd <check_pgdir>
c0106c3e:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0106c43:	8d 90 ac 0f 00 00    	lea    0xfac(%eax),%edx
c0106c49:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0106c4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106c51:	81 7d f0 ff ff ff bf 	cmpl   $0xbfffffff,-0x10(%ebp)
c0106c58:	77 23                	ja     c0106c7d <pmm_init+0x9a>
c0106c5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106c5d:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0106c61:	c7 44 24 08 54 a3 10 	movl   $0xc010a354,0x8(%esp)
c0106c68:	c0 
c0106c69:	c7 44 24 04 39 01 00 	movl   $0x139,0x4(%esp)
c0106c70:	00 
c0106c71:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0106c78:	e8 7b 97 ff ff       	call   c01003f8 <__panic>
c0106c7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106c80:	05 00 00 00 40       	add    $0x40000000,%eax
c0106c85:	83 c8 03             	or     $0x3,%eax
c0106c88:	89 02                	mov    %eax,(%edx)
c0106c8a:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0106c8f:	c7 44 24 10 02 00 00 	movl   $0x2,0x10(%esp)
c0106c96:	00 
c0106c97:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0106c9e:	00 
c0106c9f:	c7 44 24 08 00 00 00 	movl   $0x38000000,0x8(%esp)
c0106ca6:	38 
c0106ca7:	c7 44 24 04 00 00 00 	movl   $0xc0000000,0x4(%esp)
c0106cae:	c0 
c0106caf:	89 04 24             	mov    %eax,(%esp)
c0106cb2:	e8 db fd ff ff       	call   c0106a92 <boot_map_segment>
c0106cb7:	e8 ec f7 ff ff       	call   c01064a8 <gdt_init>
c0106cbc:	e8 d7 0a 00 00       	call   c0107798 <check_boot_pgdir>
c0106cc1:	e8 5f 0f 00 00       	call   c0107c25 <print_pgdir>
c0106cc6:	c9                   	leave  
c0106cc7:	c3                   	ret    

c0106cc8 <get_pte>:
c0106cc8:	55                   	push   %ebp
c0106cc9:	89 e5                	mov    %esp,%ebp
c0106ccb:	83 ec 38             	sub    $0x38,%esp
c0106cce:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106cd1:	c1 e8 16             	shr    $0x16,%eax
c0106cd4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0106cdb:	8b 45 08             	mov    0x8(%ebp),%eax
c0106cde:	01 d0                	add    %edx,%eax
c0106ce0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106ce3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ce6:	8b 00                	mov    (%eax),%eax
c0106ce8:	83 e0 01             	and    $0x1,%eax
c0106ceb:	85 c0                	test   %eax,%eax
c0106ced:	0f 85 af 00 00 00    	jne    c0106da2 <get_pte+0xda>
c0106cf3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0106cf7:	74 15                	je     c0106d0e <get_pte+0x46>
c0106cf9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0106d00:	e8 e4 f8 ff ff       	call   c01065e9 <alloc_pages>
c0106d05:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106d08:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106d0c:	75 0a                	jne    c0106d18 <get_pte+0x50>
c0106d0e:	b8 00 00 00 00       	mov    $0x0,%eax
c0106d13:	e9 e6 00 00 00       	jmp    c0106dfe <get_pte+0x136>
c0106d18:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0106d1f:	00 
c0106d20:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106d23:	89 04 24             	mov    %eax,(%esp)
c0106d26:	e8 c3 f6 ff ff       	call   c01063ee <set_page_ref>
c0106d2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106d2e:	89 04 24             	mov    %eax,(%esp)
c0106d31:	e8 5f f5 ff ff       	call   c0106295 <page2pa>
c0106d36:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106d39:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106d3c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106d3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106d42:	c1 e8 0c             	shr    $0xc,%eax
c0106d45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106d48:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c0106d4d:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0106d50:	72 23                	jb     c0106d75 <get_pte+0xad>
c0106d52:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106d55:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0106d59:	c7 44 24 08 30 a3 10 	movl   $0xc010a330,0x8(%esp)
c0106d60:	c0 
c0106d61:	c7 44 24 04 7f 01 00 	movl   $0x17f,0x4(%esp)
c0106d68:	00 
c0106d69:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0106d70:	e8 83 96 ff ff       	call   c01003f8 <__panic>
c0106d75:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106d78:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106d7d:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c0106d84:	00 
c0106d85:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0106d8c:	00 
c0106d8d:	89 04 24             	mov    %eax,(%esp)
c0106d90:	e8 11 16 00 00       	call   c01083a6 <memset>
c0106d95:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106d98:	83 c8 07             	or     $0x7,%eax
c0106d9b:	89 c2                	mov    %eax,%edx
c0106d9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106da0:	89 10                	mov    %edx,(%eax)
c0106da2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106da5:	8b 00                	mov    (%eax),%eax
c0106da7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106dac:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106daf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106db2:	c1 e8 0c             	shr    $0xc,%eax
c0106db5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106db8:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c0106dbd:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0106dc0:	72 23                	jb     c0106de5 <get_pte+0x11d>
c0106dc2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106dc5:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0106dc9:	c7 44 24 08 30 a3 10 	movl   $0xc010a330,0x8(%esp)
c0106dd0:	c0 
c0106dd1:	c7 44 24 04 82 01 00 	movl   $0x182,0x4(%esp)
c0106dd8:	00 
c0106dd9:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0106de0:	e8 13 96 ff ff       	call   c01003f8 <__panic>
c0106de5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106de8:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106ded:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106df0:	c1 ea 0c             	shr    $0xc,%edx
c0106df3:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
c0106df9:	c1 e2 02             	shl    $0x2,%edx
c0106dfc:	01 d0                	add    %edx,%eax
c0106dfe:	c9                   	leave  
c0106dff:	c3                   	ret    

c0106e00 <get_page>:
c0106e00:	55                   	push   %ebp
c0106e01:	89 e5                	mov    %esp,%ebp
c0106e03:	83 ec 28             	sub    $0x28,%esp
c0106e06:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c0106e0d:	00 
c0106e0e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106e11:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106e15:	8b 45 08             	mov    0x8(%ebp),%eax
c0106e18:	89 04 24             	mov    %eax,(%esp)
c0106e1b:	e8 a8 fe ff ff       	call   c0106cc8 <get_pte>
c0106e20:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106e23:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0106e27:	74 08                	je     c0106e31 <get_page+0x31>
c0106e29:	8b 45 10             	mov    0x10(%ebp),%eax
c0106e2c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106e2f:	89 10                	mov    %edx,(%eax)
c0106e31:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106e35:	74 1b                	je     c0106e52 <get_page+0x52>
c0106e37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e3a:	8b 00                	mov    (%eax),%eax
c0106e3c:	83 e0 01             	and    $0x1,%eax
c0106e3f:	85 c0                	test   %eax,%eax
c0106e41:	74 0f                	je     c0106e52 <get_page+0x52>
c0106e43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e46:	8b 00                	mov    (%eax),%eax
c0106e48:	89 04 24             	mov    %eax,(%esp)
c0106e4b:	e8 3e f5 ff ff       	call   c010638e <pte2page>
c0106e50:	eb 05                	jmp    c0106e57 <get_page+0x57>
c0106e52:	b8 00 00 00 00       	mov    $0x0,%eax
c0106e57:	c9                   	leave  
c0106e58:	c3                   	ret    

c0106e59 <page_remove_pte>:
c0106e59:	55                   	push   %ebp
c0106e5a:	89 e5                	mov    %esp,%ebp
c0106e5c:	83 ec 28             	sub    $0x28,%esp
c0106e5f:	8b 45 10             	mov    0x10(%ebp),%eax
c0106e62:	8b 00                	mov    (%eax),%eax
c0106e64:	83 e0 01             	and    $0x1,%eax
c0106e67:	85 c0                	test   %eax,%eax
c0106e69:	74 4d                	je     c0106eb8 <page_remove_pte+0x5f>
c0106e6b:	8b 45 10             	mov    0x10(%ebp),%eax
c0106e6e:	8b 00                	mov    (%eax),%eax
c0106e70:	89 04 24             	mov    %eax,(%esp)
c0106e73:	e8 16 f5 ff ff       	call   c010638e <pte2page>
c0106e78:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106e7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e7e:	89 04 24             	mov    %eax,(%esp)
c0106e81:	e8 8c f5 ff ff       	call   c0106412 <page_ref_dec>
c0106e86:	85 c0                	test   %eax,%eax
c0106e88:	75 13                	jne    c0106e9d <page_remove_pte+0x44>
c0106e8a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0106e91:	00 
c0106e92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e95:	89 04 24             	mov    %eax,(%esp)
c0106e98:	e8 b7 f7 ff ff       	call   c0106654 <free_pages>
c0106e9d:	8b 45 10             	mov    0x10(%ebp),%eax
c0106ea0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106ea6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106ea9:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ead:	8b 45 08             	mov    0x8(%ebp),%eax
c0106eb0:	89 04 24             	mov    %eax,(%esp)
c0106eb3:	e8 ff 00 00 00       	call   c0106fb7 <tlb_invalidate>
c0106eb8:	c9                   	leave  
c0106eb9:	c3                   	ret    

c0106eba <page_remove>:
c0106eba:	55                   	push   %ebp
c0106ebb:	89 e5                	mov    %esp,%ebp
c0106ebd:	83 ec 28             	sub    $0x28,%esp
c0106ec0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c0106ec7:	00 
c0106ec8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106ecb:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ecf:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ed2:	89 04 24             	mov    %eax,(%esp)
c0106ed5:	e8 ee fd ff ff       	call   c0106cc8 <get_pte>
c0106eda:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106edd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106ee1:	74 19                	je     c0106efc <page_remove+0x42>
c0106ee3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ee6:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106eea:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106eed:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106ef1:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ef4:	89 04 24             	mov    %eax,(%esp)
c0106ef7:	e8 5d ff ff ff       	call   c0106e59 <page_remove_pte>
c0106efc:	c9                   	leave  
c0106efd:	c3                   	ret    

c0106efe <page_insert>:
c0106efe:	55                   	push   %ebp
c0106eff:	89 e5                	mov    %esp,%ebp
c0106f01:	83 ec 28             	sub    $0x28,%esp
c0106f04:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
c0106f0b:	00 
c0106f0c:	8b 45 10             	mov    0x10(%ebp),%eax
c0106f0f:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106f13:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f16:	89 04 24             	mov    %eax,(%esp)
c0106f19:	e8 aa fd ff ff       	call   c0106cc8 <get_pte>
c0106f1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106f21:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106f25:	75 0a                	jne    c0106f31 <page_insert+0x33>
c0106f27:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
c0106f2c:	e9 84 00 00 00       	jmp    c0106fb5 <page_insert+0xb7>
c0106f31:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f34:	89 04 24             	mov    %eax,(%esp)
c0106f37:	e8 bf f4 ff ff       	call   c01063fb <page_ref_inc>
c0106f3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f3f:	8b 00                	mov    (%eax),%eax
c0106f41:	83 e0 01             	and    $0x1,%eax
c0106f44:	85 c0                	test   %eax,%eax
c0106f46:	74 3e                	je     c0106f86 <page_insert+0x88>
c0106f48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f4b:	8b 00                	mov    (%eax),%eax
c0106f4d:	89 04 24             	mov    %eax,(%esp)
c0106f50:	e8 39 f4 ff ff       	call   c010638e <pte2page>
c0106f55:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106f58:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106f5b:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0106f5e:	75 0d                	jne    c0106f6d <page_insert+0x6f>
c0106f60:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f63:	89 04 24             	mov    %eax,(%esp)
c0106f66:	e8 a7 f4 ff ff       	call   c0106412 <page_ref_dec>
c0106f6b:	eb 19                	jmp    c0106f86 <page_insert+0x88>
c0106f6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f70:	89 44 24 08          	mov    %eax,0x8(%esp)
c0106f74:	8b 45 10             	mov    0x10(%ebp),%eax
c0106f77:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106f7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f7e:	89 04 24             	mov    %eax,(%esp)
c0106f81:	e8 d3 fe ff ff       	call   c0106e59 <page_remove_pte>
c0106f86:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106f89:	89 04 24             	mov    %eax,(%esp)
c0106f8c:	e8 04 f3 ff ff       	call   c0106295 <page2pa>
c0106f91:	0b 45 14             	or     0x14(%ebp),%eax
c0106f94:	83 c8 01             	or     $0x1,%eax
c0106f97:	89 c2                	mov    %eax,%edx
c0106f99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f9c:	89 10                	mov    %edx,(%eax)
c0106f9e:	8b 45 10             	mov    0x10(%ebp),%eax
c0106fa1:	89 44 24 04          	mov    %eax,0x4(%esp)
c0106fa5:	8b 45 08             	mov    0x8(%ebp),%eax
c0106fa8:	89 04 24             	mov    %eax,(%esp)
c0106fab:	e8 07 00 00 00       	call   c0106fb7 <tlb_invalidate>
c0106fb0:	b8 00 00 00 00       	mov    $0x0,%eax
c0106fb5:	c9                   	leave  
c0106fb6:	c3                   	ret    

c0106fb7 <tlb_invalidate>:
c0106fb7:	55                   	push   %ebp
c0106fb8:	89 e5                	mov    %esp,%ebp
c0106fba:	83 ec 28             	sub    $0x28,%esp
c0106fbd:	0f 20 d8             	mov    %cr3,%eax
c0106fc0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106fc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106fc6:	89 c2                	mov    %eax,%edx
c0106fc8:	8b 45 08             	mov    0x8(%ebp),%eax
c0106fcb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106fce:	81 7d f4 ff ff ff bf 	cmpl   $0xbfffffff,-0xc(%ebp)
c0106fd5:	77 23                	ja     c0106ffa <tlb_invalidate+0x43>
c0106fd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106fda:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0106fde:	c7 44 24 08 54 a3 10 	movl   $0xc010a354,0x8(%esp)
c0106fe5:	c0 
c0106fe6:	c7 44 24 04 e4 01 00 	movl   $0x1e4,0x4(%esp)
c0106fed:	00 
c0106fee:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0106ff5:	e8 fe 93 ff ff       	call   c01003f8 <__panic>
c0106ffa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ffd:	05 00 00 00 40       	add    $0x40000000,%eax
c0107002:	39 c2                	cmp    %eax,%edx
c0107004:	75 0c                	jne    c0107012 <tlb_invalidate+0x5b>
c0107006:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107009:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010700c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010700f:	0f 01 38             	invlpg (%eax)
c0107012:	c9                   	leave  
c0107013:	c3                   	ret    

c0107014 <pgdir_alloc_page>:
c0107014:	55                   	push   %ebp
c0107015:	89 e5                	mov    %esp,%ebp
c0107017:	83 ec 28             	sub    $0x28,%esp
c010701a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0107021:	e8 c3 f5 ff ff       	call   c01065e9 <alloc_pages>
c0107026:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107029:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010702d:	0f 84 a7 00 00 00    	je     c01070da <pgdir_alloc_page+0xc6>
c0107033:	8b 45 10             	mov    0x10(%ebp),%eax
c0107036:	89 44 24 0c          	mov    %eax,0xc(%esp)
c010703a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010703d:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107041:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107044:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107048:	8b 45 08             	mov    0x8(%ebp),%eax
c010704b:	89 04 24             	mov    %eax,(%esp)
c010704e:	e8 ab fe ff ff       	call   c0106efe <page_insert>
c0107053:	85 c0                	test   %eax,%eax
c0107055:	74 1a                	je     c0107071 <pgdir_alloc_page+0x5d>
c0107057:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c010705e:	00 
c010705f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107062:	89 04 24             	mov    %eax,(%esp)
c0107065:	e8 ea f5 ff ff       	call   c0106654 <free_pages>
c010706a:	b8 00 00 00 00       	mov    $0x0,%eax
c010706f:	eb 6c                	jmp    c01070dd <pgdir_alloc_page+0xc9>
c0107071:	a1 68 3f 12 c0       	mov    0xc0123f68,%eax
c0107076:	85 c0                	test   %eax,%eax
c0107078:	74 60                	je     c01070da <pgdir_alloc_page+0xc6>
c010707a:	a1 10 40 12 c0       	mov    0xc0124010,%eax
c010707f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c0107086:	00 
c0107087:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010708a:	89 54 24 08          	mov    %edx,0x8(%esp)
c010708e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0107091:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107095:	89 04 24             	mov    %eax,(%esp)
c0107098:	e8 0c d5 ff ff       	call   c01045a9 <swap_map_swappable>
c010709d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01070a0:	8b 55 0c             	mov    0xc(%ebp),%edx
c01070a3:	89 50 1c             	mov    %edx,0x1c(%eax)
c01070a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01070a9:	89 04 24             	mov    %eax,(%esp)
c01070ac:	e8 33 f3 ff ff       	call   c01063e4 <page_ref>
c01070b1:	83 f8 01             	cmp    $0x1,%eax
c01070b4:	74 24                	je     c01070da <pgdir_alloc_page+0xc6>
c01070b6:	c7 44 24 0c 58 a4 10 	movl   $0xc010a458,0xc(%esp)
c01070bd:	c0 
c01070be:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01070c5:	c0 
c01070c6:	c7 44 24 04 f7 01 00 	movl   $0x1f7,0x4(%esp)
c01070cd:	00 
c01070ce:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01070d5:	e8 1e 93 ff ff       	call   c01003f8 <__panic>
c01070da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01070dd:	c9                   	leave  
c01070de:	c3                   	ret    

c01070df <check_alloc_page>:
c01070df:	55                   	push   %ebp
c01070e0:	89 e5                	mov    %esp,%ebp
c01070e2:	83 ec 18             	sub    $0x18,%esp
c01070e5:	a1 f0 40 12 c0       	mov    0xc01240f0,%eax
c01070ea:	8b 40 18             	mov    0x18(%eax),%eax
c01070ed:	ff d0                	call   *%eax
c01070ef:	c7 04 24 6c a4 10 c0 	movl   $0xc010a46c,(%esp)
c01070f6:	e8 a6 91 ff ff       	call   c01002a1 <cprintf>
c01070fb:	c9                   	leave  
c01070fc:	c3                   	ret    

c01070fd <check_pgdir>:
c01070fd:	55                   	push   %ebp
c01070fe:	89 e5                	mov    %esp,%ebp
c0107100:	83 ec 38             	sub    $0x38,%esp
c0107103:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c0107108:	3d 00 80 03 00       	cmp    $0x38000,%eax
c010710d:	76 24                	jbe    c0107133 <check_pgdir+0x36>
c010710f:	c7 44 24 0c 8b a4 10 	movl   $0xc010a48b,0xc(%esp)
c0107116:	c0 
c0107117:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c010711e:	c0 
c010711f:	c7 44 24 04 08 02 00 	movl   $0x208,0x4(%esp)
c0107126:	00 
c0107127:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c010712e:	e8 c5 92 ff ff       	call   c01003f8 <__panic>
c0107133:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107138:	85 c0                	test   %eax,%eax
c010713a:	74 0e                	je     c010714a <check_pgdir+0x4d>
c010713c:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107141:	25 ff 0f 00 00       	and    $0xfff,%eax
c0107146:	85 c0                	test   %eax,%eax
c0107148:	74 24                	je     c010716e <check_pgdir+0x71>
c010714a:	c7 44 24 0c a8 a4 10 	movl   $0xc010a4a8,0xc(%esp)
c0107151:	c0 
c0107152:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107159:	c0 
c010715a:	c7 44 24 04 09 02 00 	movl   $0x209,0x4(%esp)
c0107161:	00 
c0107162:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107169:	e8 8a 92 ff ff       	call   c01003f8 <__panic>
c010716e:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107173:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c010717a:	00 
c010717b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107182:	00 
c0107183:	89 04 24             	mov    %eax,(%esp)
c0107186:	e8 75 fc ff ff       	call   c0106e00 <get_page>
c010718b:	85 c0                	test   %eax,%eax
c010718d:	74 24                	je     c01071b3 <check_pgdir+0xb6>
c010718f:	c7 44 24 0c e0 a4 10 	movl   $0xc010a4e0,0xc(%esp)
c0107196:	c0 
c0107197:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c010719e:	c0 
c010719f:	c7 44 24 04 0a 02 00 	movl   $0x20a,0x4(%esp)
c01071a6:	00 
c01071a7:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01071ae:	e8 45 92 ff ff       	call   c01003f8 <__panic>
c01071b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c01071ba:	e8 2a f4 ff ff       	call   c01065e9 <alloc_pages>
c01071bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01071c2:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c01071c7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01071ce:	00 
c01071cf:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01071d6:	00 
c01071d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01071da:	89 54 24 04          	mov    %edx,0x4(%esp)
c01071de:	89 04 24             	mov    %eax,(%esp)
c01071e1:	e8 18 fd ff ff       	call   c0106efe <page_insert>
c01071e6:	85 c0                	test   %eax,%eax
c01071e8:	74 24                	je     c010720e <check_pgdir+0x111>
c01071ea:	c7 44 24 0c 08 a5 10 	movl   $0xc010a508,0xc(%esp)
c01071f1:	c0 
c01071f2:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01071f9:	c0 
c01071fa:	c7 44 24 04 0e 02 00 	movl   $0x20e,0x4(%esp)
c0107201:	00 
c0107202:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107209:	e8 ea 91 ff ff       	call   c01003f8 <__panic>
c010720e:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107213:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c010721a:	00 
c010721b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107222:	00 
c0107223:	89 04 24             	mov    %eax,(%esp)
c0107226:	e8 9d fa ff ff       	call   c0106cc8 <get_pte>
c010722b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010722e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0107232:	75 24                	jne    c0107258 <check_pgdir+0x15b>
c0107234:	c7 44 24 0c 34 a5 10 	movl   $0xc010a534,0xc(%esp)
c010723b:	c0 
c010723c:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107243:	c0 
c0107244:	c7 44 24 04 11 02 00 	movl   $0x211,0x4(%esp)
c010724b:	00 
c010724c:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107253:	e8 a0 91 ff ff       	call   c01003f8 <__panic>
c0107258:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010725b:	8b 00                	mov    (%eax),%eax
c010725d:	89 04 24             	mov    %eax,(%esp)
c0107260:	e8 29 f1 ff ff       	call   c010638e <pte2page>
c0107265:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0107268:	74 24                	je     c010728e <check_pgdir+0x191>
c010726a:	c7 44 24 0c 61 a5 10 	movl   $0xc010a561,0xc(%esp)
c0107271:	c0 
c0107272:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107279:	c0 
c010727a:	c7 44 24 04 12 02 00 	movl   $0x212,0x4(%esp)
c0107281:	00 
c0107282:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107289:	e8 6a 91 ff ff       	call   c01003f8 <__panic>
c010728e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107291:	89 04 24             	mov    %eax,(%esp)
c0107294:	e8 4b f1 ff ff       	call   c01063e4 <page_ref>
c0107299:	83 f8 01             	cmp    $0x1,%eax
c010729c:	74 24                	je     c01072c2 <check_pgdir+0x1c5>
c010729e:	c7 44 24 0c 77 a5 10 	movl   $0xc010a577,0xc(%esp)
c01072a5:	c0 
c01072a6:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01072ad:	c0 
c01072ae:	c7 44 24 04 13 02 00 	movl   $0x213,0x4(%esp)
c01072b5:	00 
c01072b6:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01072bd:	e8 36 91 ff ff       	call   c01003f8 <__panic>
c01072c2:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c01072c7:	8b 00                	mov    (%eax),%eax
c01072c9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01072ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01072d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01072d4:	c1 e8 0c             	shr    $0xc,%eax
c01072d7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01072da:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c01072df:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c01072e2:	72 23                	jb     c0107307 <check_pgdir+0x20a>
c01072e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01072e7:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01072eb:	c7 44 24 08 30 a3 10 	movl   $0xc010a330,0x8(%esp)
c01072f2:	c0 
c01072f3:	c7 44 24 04 15 02 00 	movl   $0x215,0x4(%esp)
c01072fa:	00 
c01072fb:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107302:	e8 f1 90 ff ff       	call   c01003f8 <__panic>
c0107307:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010730a:	2d 00 00 00 40       	sub    $0x40000000,%eax
c010730f:	83 c0 04             	add    $0x4,%eax
c0107312:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107315:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c010731a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c0107321:	00 
c0107322:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c0107329:	00 
c010732a:	89 04 24             	mov    %eax,(%esp)
c010732d:	e8 96 f9 ff ff       	call   c0106cc8 <get_pte>
c0107332:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0107335:	74 24                	je     c010735b <check_pgdir+0x25e>
c0107337:	c7 44 24 0c 8c a5 10 	movl   $0xc010a58c,0xc(%esp)
c010733e:	c0 
c010733f:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107346:	c0 
c0107347:	c7 44 24 04 16 02 00 	movl   $0x216,0x4(%esp)
c010734e:	00 
c010734f:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107356:	e8 9d 90 ff ff       	call   c01003f8 <__panic>
c010735b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0107362:	e8 82 f2 ff ff       	call   c01065e9 <alloc_pages>
c0107367:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010736a:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c010736f:	c7 44 24 0c 06 00 00 	movl   $0x6,0xc(%esp)
c0107376:	00 
c0107377:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c010737e:	00 
c010737f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0107382:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107386:	89 04 24             	mov    %eax,(%esp)
c0107389:	e8 70 fb ff ff       	call   c0106efe <page_insert>
c010738e:	85 c0                	test   %eax,%eax
c0107390:	74 24                	je     c01073b6 <check_pgdir+0x2b9>
c0107392:	c7 44 24 0c b4 a5 10 	movl   $0xc010a5b4,0xc(%esp)
c0107399:	c0 
c010739a:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01073a1:	c0 
c01073a2:	c7 44 24 04 19 02 00 	movl   $0x219,0x4(%esp)
c01073a9:	00 
c01073aa:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01073b1:	e8 42 90 ff ff       	call   c01003f8 <__panic>
c01073b6:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c01073bb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01073c2:	00 
c01073c3:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c01073ca:	00 
c01073cb:	89 04 24             	mov    %eax,(%esp)
c01073ce:	e8 f5 f8 ff ff       	call   c0106cc8 <get_pte>
c01073d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01073d6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01073da:	75 24                	jne    c0107400 <check_pgdir+0x303>
c01073dc:	c7 44 24 0c ec a5 10 	movl   $0xc010a5ec,0xc(%esp)
c01073e3:	c0 
c01073e4:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01073eb:	c0 
c01073ec:	c7 44 24 04 1a 02 00 	movl   $0x21a,0x4(%esp)
c01073f3:	00 
c01073f4:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01073fb:	e8 f8 8f ff ff       	call   c01003f8 <__panic>
c0107400:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0107403:	8b 00                	mov    (%eax),%eax
c0107405:	83 e0 04             	and    $0x4,%eax
c0107408:	85 c0                	test   %eax,%eax
c010740a:	75 24                	jne    c0107430 <check_pgdir+0x333>
c010740c:	c7 44 24 0c 1c a6 10 	movl   $0xc010a61c,0xc(%esp)
c0107413:	c0 
c0107414:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c010741b:	c0 
c010741c:	c7 44 24 04 1b 02 00 	movl   $0x21b,0x4(%esp)
c0107423:	00 
c0107424:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c010742b:	e8 c8 8f ff ff       	call   c01003f8 <__panic>
c0107430:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0107433:	8b 00                	mov    (%eax),%eax
c0107435:	83 e0 02             	and    $0x2,%eax
c0107438:	85 c0                	test   %eax,%eax
c010743a:	75 24                	jne    c0107460 <check_pgdir+0x363>
c010743c:	c7 44 24 0c 2a a6 10 	movl   $0xc010a62a,0xc(%esp)
c0107443:	c0 
c0107444:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c010744b:	c0 
c010744c:	c7 44 24 04 1c 02 00 	movl   $0x21c,0x4(%esp)
c0107453:	00 
c0107454:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c010745b:	e8 98 8f ff ff       	call   c01003f8 <__panic>
c0107460:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107465:	8b 00                	mov    (%eax),%eax
c0107467:	83 e0 04             	and    $0x4,%eax
c010746a:	85 c0                	test   %eax,%eax
c010746c:	75 24                	jne    c0107492 <check_pgdir+0x395>
c010746e:	c7 44 24 0c 38 a6 10 	movl   $0xc010a638,0xc(%esp)
c0107475:	c0 
c0107476:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c010747d:	c0 
c010747e:	c7 44 24 04 1d 02 00 	movl   $0x21d,0x4(%esp)
c0107485:	00 
c0107486:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c010748d:	e8 66 8f ff ff       	call   c01003f8 <__panic>
c0107492:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107495:	89 04 24             	mov    %eax,(%esp)
c0107498:	e8 47 ef ff ff       	call   c01063e4 <page_ref>
c010749d:	83 f8 01             	cmp    $0x1,%eax
c01074a0:	74 24                	je     c01074c6 <check_pgdir+0x3c9>
c01074a2:	c7 44 24 0c 4e a6 10 	movl   $0xc010a64e,0xc(%esp)
c01074a9:	c0 
c01074aa:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01074b1:	c0 
c01074b2:	c7 44 24 04 1e 02 00 	movl   $0x21e,0x4(%esp)
c01074b9:	00 
c01074ba:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01074c1:	e8 32 8f ff ff       	call   c01003f8 <__panic>
c01074c6:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c01074cb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
c01074d2:	00 
c01074d3:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
c01074da:	00 
c01074db:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01074de:	89 54 24 04          	mov    %edx,0x4(%esp)
c01074e2:	89 04 24             	mov    %eax,(%esp)
c01074e5:	e8 14 fa ff ff       	call   c0106efe <page_insert>
c01074ea:	85 c0                	test   %eax,%eax
c01074ec:	74 24                	je     c0107512 <check_pgdir+0x415>
c01074ee:	c7 44 24 0c 60 a6 10 	movl   $0xc010a660,0xc(%esp)
c01074f5:	c0 
c01074f6:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01074fd:	c0 
c01074fe:	c7 44 24 04 20 02 00 	movl   $0x220,0x4(%esp)
c0107505:	00 
c0107506:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c010750d:	e8 e6 8e ff ff       	call   c01003f8 <__panic>
c0107512:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107515:	89 04 24             	mov    %eax,(%esp)
c0107518:	e8 c7 ee ff ff       	call   c01063e4 <page_ref>
c010751d:	83 f8 02             	cmp    $0x2,%eax
c0107520:	74 24                	je     c0107546 <check_pgdir+0x449>
c0107522:	c7 44 24 0c 8c a6 10 	movl   $0xc010a68c,0xc(%esp)
c0107529:	c0 
c010752a:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107531:	c0 
c0107532:	c7 44 24 04 21 02 00 	movl   $0x221,0x4(%esp)
c0107539:	00 
c010753a:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107541:	e8 b2 8e ff ff       	call   c01003f8 <__panic>
c0107546:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107549:	89 04 24             	mov    %eax,(%esp)
c010754c:	e8 93 ee ff ff       	call   c01063e4 <page_ref>
c0107551:	85 c0                	test   %eax,%eax
c0107553:	74 24                	je     c0107579 <check_pgdir+0x47c>
c0107555:	c7 44 24 0c 9e a6 10 	movl   $0xc010a69e,0xc(%esp)
c010755c:	c0 
c010755d:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107564:	c0 
c0107565:	c7 44 24 04 22 02 00 	movl   $0x222,0x4(%esp)
c010756c:	00 
c010756d:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107574:	e8 7f 8e ff ff       	call   c01003f8 <__panic>
c0107579:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c010757e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c0107585:	00 
c0107586:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c010758d:	00 
c010758e:	89 04 24             	mov    %eax,(%esp)
c0107591:	e8 32 f7 ff ff       	call   c0106cc8 <get_pte>
c0107596:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107599:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010759d:	75 24                	jne    c01075c3 <check_pgdir+0x4c6>
c010759f:	c7 44 24 0c ec a5 10 	movl   $0xc010a5ec,0xc(%esp)
c01075a6:	c0 
c01075a7:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01075ae:	c0 
c01075af:	c7 44 24 04 23 02 00 	movl   $0x223,0x4(%esp)
c01075b6:	00 
c01075b7:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01075be:	e8 35 8e ff ff       	call   c01003f8 <__panic>
c01075c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01075c6:	8b 00                	mov    (%eax),%eax
c01075c8:	89 04 24             	mov    %eax,(%esp)
c01075cb:	e8 be ed ff ff       	call   c010638e <pte2page>
c01075d0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c01075d3:	74 24                	je     c01075f9 <check_pgdir+0x4fc>
c01075d5:	c7 44 24 0c 61 a5 10 	movl   $0xc010a561,0xc(%esp)
c01075dc:	c0 
c01075dd:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01075e4:	c0 
c01075e5:	c7 44 24 04 24 02 00 	movl   $0x224,0x4(%esp)
c01075ec:	00 
c01075ed:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01075f4:	e8 ff 8d ff ff       	call   c01003f8 <__panic>
c01075f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01075fc:	8b 00                	mov    (%eax),%eax
c01075fe:	83 e0 04             	and    $0x4,%eax
c0107601:	85 c0                	test   %eax,%eax
c0107603:	74 24                	je     c0107629 <check_pgdir+0x52c>
c0107605:	c7 44 24 0c b0 a6 10 	movl   $0xc010a6b0,0xc(%esp)
c010760c:	c0 
c010760d:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107614:	c0 
c0107615:	c7 44 24 04 25 02 00 	movl   $0x225,0x4(%esp)
c010761c:	00 
c010761d:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107624:	e8 cf 8d ff ff       	call   c01003f8 <__panic>
c0107629:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c010762e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
c0107635:	00 
c0107636:	89 04 24             	mov    %eax,(%esp)
c0107639:	e8 7c f8 ff ff       	call   c0106eba <page_remove>
c010763e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107641:	89 04 24             	mov    %eax,(%esp)
c0107644:	e8 9b ed ff ff       	call   c01063e4 <page_ref>
c0107649:	83 f8 01             	cmp    $0x1,%eax
c010764c:	74 24                	je     c0107672 <check_pgdir+0x575>
c010764e:	c7 44 24 0c 77 a5 10 	movl   $0xc010a577,0xc(%esp)
c0107655:	c0 
c0107656:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c010765d:	c0 
c010765e:	c7 44 24 04 28 02 00 	movl   $0x228,0x4(%esp)
c0107665:	00 
c0107666:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c010766d:	e8 86 8d ff ff       	call   c01003f8 <__panic>
c0107672:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107675:	89 04 24             	mov    %eax,(%esp)
c0107678:	e8 67 ed ff ff       	call   c01063e4 <page_ref>
c010767d:	85 c0                	test   %eax,%eax
c010767f:	74 24                	je     c01076a5 <check_pgdir+0x5a8>
c0107681:	c7 44 24 0c 9e a6 10 	movl   $0xc010a69e,0xc(%esp)
c0107688:	c0 
c0107689:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107690:	c0 
c0107691:	c7 44 24 04 29 02 00 	movl   $0x229,0x4(%esp)
c0107698:	00 
c0107699:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01076a0:	e8 53 8d ff ff       	call   c01003f8 <__panic>
c01076a5:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c01076aa:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
c01076b1:	00 
c01076b2:	89 04 24             	mov    %eax,(%esp)
c01076b5:	e8 00 f8 ff ff       	call   c0106eba <page_remove>
c01076ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01076bd:	89 04 24             	mov    %eax,(%esp)
c01076c0:	e8 1f ed ff ff       	call   c01063e4 <page_ref>
c01076c5:	85 c0                	test   %eax,%eax
c01076c7:	74 24                	je     c01076ed <check_pgdir+0x5f0>
c01076c9:	c7 44 24 0c c5 a6 10 	movl   $0xc010a6c5,0xc(%esp)
c01076d0:	c0 
c01076d1:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01076d8:	c0 
c01076d9:	c7 44 24 04 2c 02 00 	movl   $0x22c,0x4(%esp)
c01076e0:	00 
c01076e1:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01076e8:	e8 0b 8d ff ff       	call   c01003f8 <__panic>
c01076ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01076f0:	89 04 24             	mov    %eax,(%esp)
c01076f3:	e8 ec ec ff ff       	call   c01063e4 <page_ref>
c01076f8:	85 c0                	test   %eax,%eax
c01076fa:	74 24                	je     c0107720 <check_pgdir+0x623>
c01076fc:	c7 44 24 0c 9e a6 10 	movl   $0xc010a69e,0xc(%esp)
c0107703:	c0 
c0107704:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c010770b:	c0 
c010770c:	c7 44 24 04 2d 02 00 	movl   $0x22d,0x4(%esp)
c0107713:	00 
c0107714:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c010771b:	e8 d8 8c ff ff       	call   c01003f8 <__panic>
c0107720:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107725:	8b 00                	mov    (%eax),%eax
c0107727:	89 04 24             	mov    %eax,(%esp)
c010772a:	e8 9d ec ff ff       	call   c01063cc <pde2page>
c010772f:	89 04 24             	mov    %eax,(%esp)
c0107732:	e8 ad ec ff ff       	call   c01063e4 <page_ref>
c0107737:	83 f8 01             	cmp    $0x1,%eax
c010773a:	74 24                	je     c0107760 <check_pgdir+0x663>
c010773c:	c7 44 24 0c d8 a6 10 	movl   $0xc010a6d8,0xc(%esp)
c0107743:	c0 
c0107744:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c010774b:	c0 
c010774c:	c7 44 24 04 2f 02 00 	movl   $0x22f,0x4(%esp)
c0107753:	00 
c0107754:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c010775b:	e8 98 8c ff ff       	call   c01003f8 <__panic>
c0107760:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107765:	8b 00                	mov    (%eax),%eax
c0107767:	89 04 24             	mov    %eax,(%esp)
c010776a:	e8 5d ec ff ff       	call   c01063cc <pde2page>
c010776f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0107776:	00 
c0107777:	89 04 24             	mov    %eax,(%esp)
c010777a:	e8 d5 ee ff ff       	call   c0106654 <free_pages>
c010777f:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107784:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010778a:	c7 04 24 ff a6 10 c0 	movl   $0xc010a6ff,(%esp)
c0107791:	e8 0b 8b ff ff       	call   c01002a1 <cprintf>
c0107796:	c9                   	leave  
c0107797:	c3                   	ret    

c0107798 <check_boot_pgdir>:
c0107798:	55                   	push   %ebp
c0107799:	89 e5                	mov    %esp,%ebp
c010779b:	83 ec 38             	sub    $0x38,%esp
c010779e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01077a5:	e9 ca 00 00 00       	jmp    c0107874 <check_boot_pgdir+0xdc>
c01077aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01077ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01077b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01077b3:	c1 e8 0c             	shr    $0xc,%eax
c01077b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01077b9:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c01077be:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01077c1:	72 23                	jb     c01077e6 <check_boot_pgdir+0x4e>
c01077c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01077c6:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01077ca:	c7 44 24 08 30 a3 10 	movl   $0xc010a330,0x8(%esp)
c01077d1:	c0 
c01077d2:	c7 44 24 04 3b 02 00 	movl   $0x23b,0x4(%esp)
c01077d9:	00 
c01077da:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01077e1:	e8 12 8c ff ff       	call   c01003f8 <__panic>
c01077e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01077e9:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01077ee:	89 c2                	mov    %eax,%edx
c01077f0:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c01077f5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
c01077fc:	00 
c01077fd:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107801:	89 04 24             	mov    %eax,(%esp)
c0107804:	e8 bf f4 ff ff       	call   c0106cc8 <get_pte>
c0107809:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010780c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107810:	75 24                	jne    c0107836 <check_boot_pgdir+0x9e>
c0107812:	c7 44 24 0c 1c a7 10 	movl   $0xc010a71c,0xc(%esp)
c0107819:	c0 
c010781a:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107821:	c0 
c0107822:	c7 44 24 04 3b 02 00 	movl   $0x23b,0x4(%esp)
c0107829:	00 
c010782a:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107831:	e8 c2 8b ff ff       	call   c01003f8 <__panic>
c0107836:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107839:	8b 00                	mov    (%eax),%eax
c010783b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0107840:	89 c2                	mov    %eax,%edx
c0107842:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107845:	39 c2                	cmp    %eax,%edx
c0107847:	74 24                	je     c010786d <check_boot_pgdir+0xd5>
c0107849:	c7 44 24 0c 59 a7 10 	movl   $0xc010a759,0xc(%esp)
c0107850:	c0 
c0107851:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107858:	c0 
c0107859:	c7 44 24 04 3c 02 00 	movl   $0x23c,0x4(%esp)
c0107860:	00 
c0107861:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107868:	e8 8b 8b ff ff       	call   c01003f8 <__panic>
c010786d:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0107874:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0107877:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c010787c:	39 c2                	cmp    %eax,%edx
c010787e:	0f 82 26 ff ff ff    	jb     c01077aa <check_boot_pgdir+0x12>
c0107884:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107889:	05 ac 0f 00 00       	add    $0xfac,%eax
c010788e:	8b 00                	mov    (%eax),%eax
c0107890:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0107895:	89 c2                	mov    %eax,%edx
c0107897:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c010789c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010789f:	81 7d e4 ff ff ff bf 	cmpl   $0xbfffffff,-0x1c(%ebp)
c01078a6:	77 23                	ja     c01078cb <check_boot_pgdir+0x133>
c01078a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01078ab:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01078af:	c7 44 24 08 54 a3 10 	movl   $0xc010a354,0x8(%esp)
c01078b6:	c0 
c01078b7:	c7 44 24 04 3f 02 00 	movl   $0x23f,0x4(%esp)
c01078be:	00 
c01078bf:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01078c6:	e8 2d 8b ff ff       	call   c01003f8 <__panic>
c01078cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01078ce:	05 00 00 00 40       	add    $0x40000000,%eax
c01078d3:	39 c2                	cmp    %eax,%edx
c01078d5:	74 24                	je     c01078fb <check_boot_pgdir+0x163>
c01078d7:	c7 44 24 0c 70 a7 10 	movl   $0xc010a770,0xc(%esp)
c01078de:	c0 
c01078df:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01078e6:	c0 
c01078e7:	c7 44 24 04 3f 02 00 	movl   $0x23f,0x4(%esp)
c01078ee:	00 
c01078ef:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01078f6:	e8 fd 8a ff ff       	call   c01003f8 <__panic>
c01078fb:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107900:	8b 00                	mov    (%eax),%eax
c0107902:	85 c0                	test   %eax,%eax
c0107904:	74 24                	je     c010792a <check_boot_pgdir+0x192>
c0107906:	c7 44 24 0c a4 a7 10 	movl   $0xc010a7a4,0xc(%esp)
c010790d:	c0 
c010790e:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107915:	c0 
c0107916:	c7 44 24 04 41 02 00 	movl   $0x241,0x4(%esp)
c010791d:	00 
c010791e:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107925:	e8 ce 8a ff ff       	call   c01003f8 <__panic>
c010792a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0107931:	e8 b3 ec ff ff       	call   c01065e9 <alloc_pages>
c0107936:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0107939:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c010793e:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
c0107945:	00 
c0107946:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
c010794d:	00 
c010794e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0107951:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107955:	89 04 24             	mov    %eax,(%esp)
c0107958:	e8 a1 f5 ff ff       	call   c0106efe <page_insert>
c010795d:	85 c0                	test   %eax,%eax
c010795f:	74 24                	je     c0107985 <check_boot_pgdir+0x1ed>
c0107961:	c7 44 24 0c b8 a7 10 	movl   $0xc010a7b8,0xc(%esp)
c0107968:	c0 
c0107969:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107970:	c0 
c0107971:	c7 44 24 04 45 02 00 	movl   $0x245,0x4(%esp)
c0107978:	00 
c0107979:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107980:	e8 73 8a ff ff       	call   c01003f8 <__panic>
c0107985:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0107988:	89 04 24             	mov    %eax,(%esp)
c010798b:	e8 54 ea ff ff       	call   c01063e4 <page_ref>
c0107990:	83 f8 01             	cmp    $0x1,%eax
c0107993:	74 24                	je     c01079b9 <check_boot_pgdir+0x221>
c0107995:	c7 44 24 0c e6 a7 10 	movl   $0xc010a7e6,0xc(%esp)
c010799c:	c0 
c010799d:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01079a4:	c0 
c01079a5:	c7 44 24 04 46 02 00 	movl   $0x246,0x4(%esp)
c01079ac:	00 
c01079ad:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c01079b4:	e8 3f 8a ff ff       	call   c01003f8 <__panic>
c01079b9:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c01079be:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
c01079c5:	00 
c01079c6:	c7 44 24 08 00 11 00 	movl   $0x1100,0x8(%esp)
c01079cd:	00 
c01079ce:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01079d1:	89 54 24 04          	mov    %edx,0x4(%esp)
c01079d5:	89 04 24             	mov    %eax,(%esp)
c01079d8:	e8 21 f5 ff ff       	call   c0106efe <page_insert>
c01079dd:	85 c0                	test   %eax,%eax
c01079df:	74 24                	je     c0107a05 <check_boot_pgdir+0x26d>
c01079e1:	c7 44 24 0c f8 a7 10 	movl   $0xc010a7f8,0xc(%esp)
c01079e8:	c0 
c01079e9:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c01079f0:	c0 
c01079f1:	c7 44 24 04 47 02 00 	movl   $0x247,0x4(%esp)
c01079f8:	00 
c01079f9:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107a00:	e8 f3 89 ff ff       	call   c01003f8 <__panic>
c0107a05:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0107a08:	89 04 24             	mov    %eax,(%esp)
c0107a0b:	e8 d4 e9 ff ff       	call   c01063e4 <page_ref>
c0107a10:	83 f8 02             	cmp    $0x2,%eax
c0107a13:	74 24                	je     c0107a39 <check_boot_pgdir+0x2a1>
c0107a15:	c7 44 24 0c 2f a8 10 	movl   $0xc010a82f,0xc(%esp)
c0107a1c:	c0 
c0107a1d:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107a24:	c0 
c0107a25:	c7 44 24 04 48 02 00 	movl   $0x248,0x4(%esp)
c0107a2c:	00 
c0107a2d:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107a34:	e8 bf 89 ff ff       	call   c01003f8 <__panic>
c0107a39:	c7 45 dc 40 a8 10 c0 	movl   $0xc010a840,-0x24(%ebp)
c0107a40:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0107a43:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107a47:	c7 04 24 00 01 00 00 	movl   $0x100,(%esp)
c0107a4e:	e8 7c 06 00 00       	call   c01080cf <strcpy>
c0107a53:	c7 44 24 04 00 11 00 	movl   $0x1100,0x4(%esp)
c0107a5a:	00 
c0107a5b:	c7 04 24 00 01 00 00 	movl   $0x100,(%esp)
c0107a62:	e8 e1 06 00 00       	call   c0108148 <strcmp>
c0107a67:	85 c0                	test   %eax,%eax
c0107a69:	74 24                	je     c0107a8f <check_boot_pgdir+0x2f7>
c0107a6b:	c7 44 24 0c 58 a8 10 	movl   $0xc010a858,0xc(%esp)
c0107a72:	c0 
c0107a73:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107a7a:	c0 
c0107a7b:	c7 44 24 04 4c 02 00 	movl   $0x24c,0x4(%esp)
c0107a82:	00 
c0107a83:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107a8a:	e8 69 89 ff ff       	call   c01003f8 <__panic>
c0107a8f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0107a92:	89 04 24             	mov    %eax,(%esp)
c0107a95:	e8 56 e8 ff ff       	call   c01062f0 <page2kva>
c0107a9a:	05 00 01 00 00       	add    $0x100,%eax
c0107a9f:	c6 00 00             	movb   $0x0,(%eax)
c0107aa2:	c7 04 24 00 01 00 00 	movl   $0x100,(%esp)
c0107aa9:	e8 c9 05 00 00       	call   c0108077 <strlen>
c0107aae:	85 c0                	test   %eax,%eax
c0107ab0:	74 24                	je     c0107ad6 <check_boot_pgdir+0x33e>
c0107ab2:	c7 44 24 0c 90 a8 10 	movl   $0xc010a890,0xc(%esp)
c0107ab9:	c0 
c0107aba:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107ac1:	c0 
c0107ac2:	c7 44 24 04 4f 02 00 	movl   $0x24f,0x4(%esp)
c0107ac9:	00 
c0107aca:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107ad1:	e8 22 89 ff ff       	call   c01003f8 <__panic>
c0107ad6:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0107add:	00 
c0107ade:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0107ae1:	89 04 24             	mov    %eax,(%esp)
c0107ae4:	e8 6b eb ff ff       	call   c0106654 <free_pages>
c0107ae9:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107aee:	8b 00                	mov    (%eax),%eax
c0107af0:	89 04 24             	mov    %eax,(%esp)
c0107af3:	e8 d4 e8 ff ff       	call   c01063cc <pde2page>
c0107af8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
c0107aff:	00 
c0107b00:	89 04 24             	mov    %eax,(%esp)
c0107b03:	e8 4c eb ff ff       	call   c0106654 <free_pages>
c0107b08:	a1 00 0a 12 c0       	mov    0xc0120a00,%eax
c0107b0d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0107b13:	c7 04 24 b4 a8 10 c0 	movl   $0xc010a8b4,(%esp)
c0107b1a:	e8 82 87 ff ff       	call   c01002a1 <cprintf>
c0107b1f:	c9                   	leave  
c0107b20:	c3                   	ret    

c0107b21 <perm2str>:
c0107b21:	55                   	push   %ebp
c0107b22:	89 e5                	mov    %esp,%ebp
c0107b24:	8b 45 08             	mov    0x8(%ebp),%eax
c0107b27:	83 e0 04             	and    $0x4,%eax
c0107b2a:	85 c0                	test   %eax,%eax
c0107b2c:	74 07                	je     c0107b35 <perm2str+0x14>
c0107b2e:	b8 75 00 00 00       	mov    $0x75,%eax
c0107b33:	eb 05                	jmp    c0107b3a <perm2str+0x19>
c0107b35:	b8 2d 00 00 00       	mov    $0x2d,%eax
c0107b3a:	a2 08 40 12 c0       	mov    %al,0xc0124008
c0107b3f:	c6 05 09 40 12 c0 72 	movb   $0x72,0xc0124009
c0107b46:	8b 45 08             	mov    0x8(%ebp),%eax
c0107b49:	83 e0 02             	and    $0x2,%eax
c0107b4c:	85 c0                	test   %eax,%eax
c0107b4e:	74 07                	je     c0107b57 <perm2str+0x36>
c0107b50:	b8 77 00 00 00       	mov    $0x77,%eax
c0107b55:	eb 05                	jmp    c0107b5c <perm2str+0x3b>
c0107b57:	b8 2d 00 00 00       	mov    $0x2d,%eax
c0107b5c:	a2 0a 40 12 c0       	mov    %al,0xc012400a
c0107b61:	c6 05 0b 40 12 c0 00 	movb   $0x0,0xc012400b
c0107b68:	b8 08 40 12 c0       	mov    $0xc0124008,%eax
c0107b6d:	5d                   	pop    %ebp
c0107b6e:	c3                   	ret    

c0107b6f <get_pgtable_items>:
c0107b6f:	55                   	push   %ebp
c0107b70:	89 e5                	mov    %esp,%ebp
c0107b72:	83 ec 10             	sub    $0x10,%esp
c0107b75:	8b 45 10             	mov    0x10(%ebp),%eax
c0107b78:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0107b7b:	72 0a                	jb     c0107b87 <get_pgtable_items+0x18>
c0107b7d:	b8 00 00 00 00       	mov    $0x0,%eax
c0107b82:	e9 9c 00 00 00       	jmp    c0107c23 <get_pgtable_items+0xb4>
c0107b87:	eb 04                	jmp    c0107b8d <get_pgtable_items+0x1e>
c0107b89:	83 45 10 01          	addl   $0x1,0x10(%ebp)
c0107b8d:	8b 45 10             	mov    0x10(%ebp),%eax
c0107b90:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0107b93:	73 18                	jae    c0107bad <get_pgtable_items+0x3e>
c0107b95:	8b 45 10             	mov    0x10(%ebp),%eax
c0107b98:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0107b9f:	8b 45 14             	mov    0x14(%ebp),%eax
c0107ba2:	01 d0                	add    %edx,%eax
c0107ba4:	8b 00                	mov    (%eax),%eax
c0107ba6:	83 e0 01             	and    $0x1,%eax
c0107ba9:	85 c0                	test   %eax,%eax
c0107bab:	74 dc                	je     c0107b89 <get_pgtable_items+0x1a>
c0107bad:	8b 45 10             	mov    0x10(%ebp),%eax
c0107bb0:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0107bb3:	73 69                	jae    c0107c1e <get_pgtable_items+0xaf>
c0107bb5:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
c0107bb9:	74 08                	je     c0107bc3 <get_pgtable_items+0x54>
c0107bbb:	8b 45 18             	mov    0x18(%ebp),%eax
c0107bbe:	8b 55 10             	mov    0x10(%ebp),%edx
c0107bc1:	89 10                	mov    %edx,(%eax)
c0107bc3:	8b 45 10             	mov    0x10(%ebp),%eax
c0107bc6:	8d 50 01             	lea    0x1(%eax),%edx
c0107bc9:	89 55 10             	mov    %edx,0x10(%ebp)
c0107bcc:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0107bd3:	8b 45 14             	mov    0x14(%ebp),%eax
c0107bd6:	01 d0                	add    %edx,%eax
c0107bd8:	8b 00                	mov    (%eax),%eax
c0107bda:	83 e0 07             	and    $0x7,%eax
c0107bdd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0107be0:	eb 04                	jmp    c0107be6 <get_pgtable_items+0x77>
c0107be2:	83 45 10 01          	addl   $0x1,0x10(%ebp)
c0107be6:	8b 45 10             	mov    0x10(%ebp),%eax
c0107be9:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0107bec:	73 1d                	jae    c0107c0b <get_pgtable_items+0x9c>
c0107bee:	8b 45 10             	mov    0x10(%ebp),%eax
c0107bf1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
c0107bf8:	8b 45 14             	mov    0x14(%ebp),%eax
c0107bfb:	01 d0                	add    %edx,%eax
c0107bfd:	8b 00                	mov    (%eax),%eax
c0107bff:	83 e0 07             	and    $0x7,%eax
c0107c02:	89 c2                	mov    %eax,%edx
c0107c04:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107c07:	39 c2                	cmp    %eax,%edx
c0107c09:	74 d7                	je     c0107be2 <get_pgtable_items+0x73>
c0107c0b:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
c0107c0f:	74 08                	je     c0107c19 <get_pgtable_items+0xaa>
c0107c11:	8b 45 1c             	mov    0x1c(%ebp),%eax
c0107c14:	8b 55 10             	mov    0x10(%ebp),%edx
c0107c17:	89 10                	mov    %edx,(%eax)
c0107c19:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107c1c:	eb 05                	jmp    c0107c23 <get_pgtable_items+0xb4>
c0107c1e:	b8 00 00 00 00       	mov    $0x0,%eax
c0107c23:	c9                   	leave  
c0107c24:	c3                   	ret    

c0107c25 <print_pgdir>:
c0107c25:	55                   	push   %ebp
c0107c26:	89 e5                	mov    %esp,%ebp
c0107c28:	57                   	push   %edi
c0107c29:	56                   	push   %esi
c0107c2a:	53                   	push   %ebx
c0107c2b:	83 ec 4c             	sub    $0x4c,%esp
c0107c2e:	c7 04 24 d4 a8 10 c0 	movl   $0xc010a8d4,(%esp)
c0107c35:	e8 67 86 ff ff       	call   c01002a1 <cprintf>
c0107c3a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0107c41:	e9 fa 00 00 00       	jmp    c0107d40 <print_pgdir+0x11b>
c0107c46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107c49:	89 04 24             	mov    %eax,(%esp)
c0107c4c:	e8 d0 fe ff ff       	call   c0107b21 <perm2str>
c0107c51:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0107c54:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0107c57:	29 d1                	sub    %edx,%ecx
c0107c59:	89 ca                	mov    %ecx,%edx
c0107c5b:	89 d6                	mov    %edx,%esi
c0107c5d:	c1 e6 16             	shl    $0x16,%esi
c0107c60:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0107c63:	89 d3                	mov    %edx,%ebx
c0107c65:	c1 e3 16             	shl    $0x16,%ebx
c0107c68:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0107c6b:	89 d1                	mov    %edx,%ecx
c0107c6d:	c1 e1 16             	shl    $0x16,%ecx
c0107c70:	8b 7d dc             	mov    -0x24(%ebp),%edi
c0107c73:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0107c76:	29 d7                	sub    %edx,%edi
c0107c78:	89 fa                	mov    %edi,%edx
c0107c7a:	89 44 24 14          	mov    %eax,0x14(%esp)
c0107c7e:	89 74 24 10          	mov    %esi,0x10(%esp)
c0107c82:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c0107c86:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0107c8a:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107c8e:	c7 04 24 05 a9 10 c0 	movl   $0xc010a905,(%esp)
c0107c95:	e8 07 86 ff ff       	call   c01002a1 <cprintf>
c0107c9a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0107c9d:	c1 e0 0a             	shl    $0xa,%eax
c0107ca0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107ca3:	eb 54                	jmp    c0107cf9 <print_pgdir+0xd4>
c0107ca5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107ca8:	89 04 24             	mov    %eax,(%esp)
c0107cab:	e8 71 fe ff ff       	call   c0107b21 <perm2str>
c0107cb0:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
c0107cb3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0107cb6:	29 d1                	sub    %edx,%ecx
c0107cb8:	89 ca                	mov    %ecx,%edx
c0107cba:	89 d6                	mov    %edx,%esi
c0107cbc:	c1 e6 0c             	shl    $0xc,%esi
c0107cbf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0107cc2:	89 d3                	mov    %edx,%ebx
c0107cc4:	c1 e3 0c             	shl    $0xc,%ebx
c0107cc7:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0107cca:	c1 e2 0c             	shl    $0xc,%edx
c0107ccd:	89 d1                	mov    %edx,%ecx
c0107ccf:	8b 7d d4             	mov    -0x2c(%ebp),%edi
c0107cd2:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0107cd5:	29 d7                	sub    %edx,%edi
c0107cd7:	89 fa                	mov    %edi,%edx
c0107cd9:	89 44 24 14          	mov    %eax,0x14(%esp)
c0107cdd:	89 74 24 10          	mov    %esi,0x10(%esp)
c0107ce1:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c0107ce5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
c0107ce9:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107ced:	c7 04 24 24 a9 10 c0 	movl   $0xc010a924,(%esp)
c0107cf4:	e8 a8 85 ff ff       	call   c01002a1 <cprintf>
c0107cf9:	ba 00 00 c0 fa       	mov    $0xfac00000,%edx
c0107cfe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0107d01:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0107d04:	89 ce                	mov    %ecx,%esi
c0107d06:	c1 e6 0a             	shl    $0xa,%esi
c0107d09:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0107d0c:	89 cb                	mov    %ecx,%ebx
c0107d0e:	c1 e3 0a             	shl    $0xa,%ebx
c0107d11:	8d 4d d4             	lea    -0x2c(%ebp),%ecx
c0107d14:	89 4c 24 14          	mov    %ecx,0x14(%esp)
c0107d18:	8d 4d d8             	lea    -0x28(%ebp),%ecx
c0107d1b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0107d1f:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0107d23:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107d27:	89 74 24 04          	mov    %esi,0x4(%esp)
c0107d2b:	89 1c 24             	mov    %ebx,(%esp)
c0107d2e:	e8 3c fe ff ff       	call   c0107b6f <get_pgtable_items>
c0107d33:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107d36:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0107d3a:	0f 85 65 ff ff ff    	jne    c0107ca5 <print_pgdir+0x80>
c0107d40:	ba 00 b0 fe fa       	mov    $0xfafeb000,%edx
c0107d45:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0107d48:	8d 4d dc             	lea    -0x24(%ebp),%ecx
c0107d4b:	89 4c 24 14          	mov    %ecx,0x14(%esp)
c0107d4f:	8d 4d e0             	lea    -0x20(%ebp),%ecx
c0107d52:	89 4c 24 10          	mov    %ecx,0x10(%esp)
c0107d56:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0107d5a:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107d5e:	c7 44 24 04 00 04 00 	movl   $0x400,0x4(%esp)
c0107d65:	00 
c0107d66:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
c0107d6d:	e8 fd fd ff ff       	call   c0107b6f <get_pgtable_items>
c0107d72:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107d75:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0107d79:	0f 85 c7 fe ff ff    	jne    c0107c46 <print_pgdir+0x21>
c0107d7f:	c7 04 24 48 a9 10 c0 	movl   $0xc010a948,(%esp)
c0107d86:	e8 16 85 ff ff       	call   c01002a1 <cprintf>
c0107d8b:	83 c4 4c             	add    $0x4c,%esp
c0107d8e:	5b                   	pop    %ebx
c0107d8f:	5e                   	pop    %esi
c0107d90:	5f                   	pop    %edi
c0107d91:	5d                   	pop    %ebp
c0107d92:	c3                   	ret    

c0107d93 <kmalloc>:
c0107d93:	55                   	push   %ebp
c0107d94:	89 e5                	mov    %esp,%ebp
c0107d96:	83 ec 28             	sub    $0x28,%esp
c0107d99:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107da0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0107da7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0107dab:	74 09                	je     c0107db6 <kmalloc+0x23>
c0107dad:	81 7d 08 ff 4f 01 00 	cmpl   $0x14fff,0x8(%ebp)
c0107db4:	76 24                	jbe    c0107dda <kmalloc+0x47>
c0107db6:	c7 44 24 0c 79 a9 10 	movl   $0xc010a979,0xc(%esp)
c0107dbd:	c0 
c0107dbe:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107dc5:	c0 
c0107dc6:	c7 44 24 04 9b 02 00 	movl   $0x29b,0x4(%esp)
c0107dcd:	00 
c0107dce:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107dd5:	e8 1e 86 ff ff       	call   c01003f8 <__panic>
c0107dda:	8b 45 08             	mov    0x8(%ebp),%eax
c0107ddd:	05 ff 0f 00 00       	add    $0xfff,%eax
c0107de2:	c1 e8 0c             	shr    $0xc,%eax
c0107de5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107de8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107deb:	89 04 24             	mov    %eax,(%esp)
c0107dee:	e8 f6 e7 ff ff       	call   c01065e9 <alloc_pages>
c0107df3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107df6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0107dfa:	75 24                	jne    c0107e20 <kmalloc+0x8d>
c0107dfc:	c7 44 24 0c 90 a9 10 	movl   $0xc010a990,0xc(%esp)
c0107e03:	c0 
c0107e04:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107e0b:	c0 
c0107e0c:	c7 44 24 04 9e 02 00 	movl   $0x29e,0x4(%esp)
c0107e13:	00 
c0107e14:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107e1b:	e8 d8 85 ff ff       	call   c01003f8 <__panic>
c0107e20:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0107e23:	89 04 24             	mov    %eax,(%esp)
c0107e26:	e8 c5 e4 ff ff       	call   c01062f0 <page2kva>
c0107e2b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107e2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107e31:	c9                   	leave  
c0107e32:	c3                   	ret    

c0107e33 <kfree>:
c0107e33:	55                   	push   %ebp
c0107e34:	89 e5                	mov    %esp,%ebp
c0107e36:	83 ec 28             	sub    $0x28,%esp
c0107e39:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0107e3d:	74 09                	je     c0107e48 <kfree+0x15>
c0107e3f:	81 7d 0c ff 4f 01 00 	cmpl   $0x14fff,0xc(%ebp)
c0107e46:	76 24                	jbe    c0107e6c <kfree+0x39>
c0107e48:	c7 44 24 0c 79 a9 10 	movl   $0xc010a979,0xc(%esp)
c0107e4f:	c0 
c0107e50:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107e57:	c0 
c0107e58:	c7 44 24 04 a5 02 00 	movl   $0x2a5,0x4(%esp)
c0107e5f:	00 
c0107e60:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107e67:	e8 8c 85 ff ff       	call   c01003f8 <__panic>
c0107e6c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0107e70:	75 24                	jne    c0107e96 <kfree+0x63>
c0107e72:	c7 44 24 0c 9d a9 10 	movl   $0xc010a99d,0xc(%esp)
c0107e79:	c0 
c0107e7a:	c7 44 24 08 1d a4 10 	movl   $0xc010a41d,0x8(%esp)
c0107e81:	c0 
c0107e82:	c7 44 24 04 a6 02 00 	movl   $0x2a6,0x4(%esp)
c0107e89:	00 
c0107e8a:	c7 04 24 f8 a3 10 c0 	movl   $0xc010a3f8,(%esp)
c0107e91:	e8 62 85 ff ff       	call   c01003f8 <__panic>
c0107e96:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107e9d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107ea0:	05 ff 0f 00 00       	add    $0xfff,%eax
c0107ea5:	c1 e8 0c             	shr    $0xc,%eax
c0107ea8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107eab:	8b 45 08             	mov    0x8(%ebp),%eax
c0107eae:	89 04 24             	mov    %eax,(%esp)
c0107eb1:	e8 8e e4 ff ff       	call   c0106344 <kva2page>
c0107eb6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107eb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0107ebc:	89 44 24 04          	mov    %eax,0x4(%esp)
c0107ec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107ec3:	89 04 24             	mov    %eax,(%esp)
c0107ec6:	e8 89 e7 ff ff       	call   c0106654 <free_pages>
c0107ecb:	c9                   	leave  
c0107ecc:	c3                   	ret    

c0107ecd <page2ppn>:
c0107ecd:	55                   	push   %ebp
c0107ece:	89 e5                	mov    %esp,%ebp
c0107ed0:	8b 55 08             	mov    0x8(%ebp),%edx
c0107ed3:	a1 f8 40 12 c0       	mov    0xc01240f8,%eax
c0107ed8:	29 c2                	sub    %eax,%edx
c0107eda:	89 d0                	mov    %edx,%eax
c0107edc:	c1 f8 05             	sar    $0x5,%eax
c0107edf:	5d                   	pop    %ebp
c0107ee0:	c3                   	ret    

c0107ee1 <page2pa>:
c0107ee1:	55                   	push   %ebp
c0107ee2:	89 e5                	mov    %esp,%ebp
c0107ee4:	83 ec 04             	sub    $0x4,%esp
c0107ee7:	8b 45 08             	mov    0x8(%ebp),%eax
c0107eea:	89 04 24             	mov    %eax,(%esp)
c0107eed:	e8 db ff ff ff       	call   c0107ecd <page2ppn>
c0107ef2:	c1 e0 0c             	shl    $0xc,%eax
c0107ef5:	c9                   	leave  
c0107ef6:	c3                   	ret    

c0107ef7 <page2kva>:
c0107ef7:	55                   	push   %ebp
c0107ef8:	89 e5                	mov    %esp,%ebp
c0107efa:	83 ec 28             	sub    $0x28,%esp
c0107efd:	8b 45 08             	mov    0x8(%ebp),%eax
c0107f00:	89 04 24             	mov    %eax,(%esp)
c0107f03:	e8 d9 ff ff ff       	call   c0107ee1 <page2pa>
c0107f08:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107f0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107f0e:	c1 e8 0c             	shr    $0xc,%eax
c0107f11:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107f14:	a1 80 3f 12 c0       	mov    0xc0123f80,%eax
c0107f19:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0107f1c:	72 23                	jb     c0107f41 <page2kva+0x4a>
c0107f1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107f21:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0107f25:	c7 44 24 08 ac a9 10 	movl   $0xc010a9ac,0x8(%esp)
c0107f2c:	c0 
c0107f2d:	c7 44 24 04 62 00 00 	movl   $0x62,0x4(%esp)
c0107f34:	00 
c0107f35:	c7 04 24 cf a9 10 c0 	movl   $0xc010a9cf,(%esp)
c0107f3c:	e8 b7 84 ff ff       	call   c01003f8 <__panic>
c0107f41:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107f44:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0107f49:	c9                   	leave  
c0107f4a:	c3                   	ret    

c0107f4b <swapfs_init>:
c0107f4b:	55                   	push   %ebp
c0107f4c:	89 e5                	mov    %esp,%ebp
c0107f4e:	83 ec 18             	sub    $0x18,%esp
c0107f51:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0107f58:	e8 c4 91 ff ff       	call   c0101121 <ide_device_valid>
c0107f5d:	85 c0                	test   %eax,%eax
c0107f5f:	75 1c                	jne    c0107f7d <swapfs_init+0x32>
c0107f61:	c7 44 24 08 dd a9 10 	movl   $0xc010a9dd,0x8(%esp)
c0107f68:	c0 
c0107f69:	c7 44 24 04 0d 00 00 	movl   $0xd,0x4(%esp)
c0107f70:	00 
c0107f71:	c7 04 24 f7 a9 10 c0 	movl   $0xc010a9f7,(%esp)
c0107f78:	e8 7b 84 ff ff       	call   c01003f8 <__panic>
c0107f7d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0107f84:	e8 d7 91 ff ff       	call   c0101160 <ide_device_size>
c0107f89:	c1 e8 03             	shr    $0x3,%eax
c0107f8c:	a3 bc 40 12 c0       	mov    %eax,0xc01240bc
c0107f91:	c9                   	leave  
c0107f92:	c3                   	ret    

c0107f93 <swapfs_read>:
c0107f93:	55                   	push   %ebp
c0107f94:	89 e5                	mov    %esp,%ebp
c0107f96:	83 ec 28             	sub    $0x28,%esp
c0107f99:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107f9c:	89 04 24             	mov    %eax,(%esp)
c0107f9f:	e8 53 ff ff ff       	call   c0107ef7 <page2kva>
c0107fa4:	8b 55 08             	mov    0x8(%ebp),%edx
c0107fa7:	c1 ea 08             	shr    $0x8,%edx
c0107faa:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107fad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0107fb1:	74 0b                	je     c0107fbe <swapfs_read+0x2b>
c0107fb3:	8b 15 bc 40 12 c0    	mov    0xc01240bc,%edx
c0107fb9:	39 55 f4             	cmp    %edx,-0xc(%ebp)
c0107fbc:	72 23                	jb     c0107fe1 <swapfs_read+0x4e>
c0107fbe:	8b 45 08             	mov    0x8(%ebp),%eax
c0107fc1:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0107fc5:	c7 44 24 08 08 aa 10 	movl   $0xc010aa08,0x8(%esp)
c0107fcc:	c0 
c0107fcd:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
c0107fd4:	00 
c0107fd5:	c7 04 24 f7 a9 10 c0 	movl   $0xc010a9f7,(%esp)
c0107fdc:	e8 17 84 ff ff       	call   c01003f8 <__panic>
c0107fe1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0107fe4:	c1 e2 03             	shl    $0x3,%edx
c0107fe7:	c7 44 24 0c 08 00 00 	movl   $0x8,0xc(%esp)
c0107fee:	00 
c0107fef:	89 44 24 08          	mov    %eax,0x8(%esp)
c0107ff3:	89 54 24 04          	mov    %edx,0x4(%esp)
c0107ff7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0107ffe:	e8 9c 91 ff ff       	call   c010119f <ide_read_secs>
c0108003:	c9                   	leave  
c0108004:	c3                   	ret    

c0108005 <swapfs_write>:
c0108005:	55                   	push   %ebp
c0108006:	89 e5                	mov    %esp,%ebp
c0108008:	83 ec 28             	sub    $0x28,%esp
c010800b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010800e:	89 04 24             	mov    %eax,(%esp)
c0108011:	e8 e1 fe ff ff       	call   c0107ef7 <page2kva>
c0108016:	8b 55 08             	mov    0x8(%ebp),%edx
c0108019:	c1 ea 08             	shr    $0x8,%edx
c010801c:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010801f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0108023:	74 0b                	je     c0108030 <swapfs_write+0x2b>
c0108025:	8b 15 bc 40 12 c0    	mov    0xc01240bc,%edx
c010802b:	39 55 f4             	cmp    %edx,-0xc(%ebp)
c010802e:	72 23                	jb     c0108053 <swapfs_write+0x4e>
c0108030:	8b 45 08             	mov    0x8(%ebp),%eax
c0108033:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0108037:	c7 44 24 08 08 aa 10 	movl   $0xc010aa08,0x8(%esp)
c010803e:	c0 
c010803f:	c7 44 24 04 19 00 00 	movl   $0x19,0x4(%esp)
c0108046:	00 
c0108047:	c7 04 24 f7 a9 10 c0 	movl   $0xc010a9f7,(%esp)
c010804e:	e8 a5 83 ff ff       	call   c01003f8 <__panic>
c0108053:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0108056:	c1 e2 03             	shl    $0x3,%edx
c0108059:	c7 44 24 0c 08 00 00 	movl   $0x8,0xc(%esp)
c0108060:	00 
c0108061:	89 44 24 08          	mov    %eax,0x8(%esp)
c0108065:	89 54 24 04          	mov    %edx,0x4(%esp)
c0108069:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
c0108070:	e8 6c 93 ff ff       	call   c01013e1 <ide_write_secs>
c0108075:	c9                   	leave  
c0108076:	c3                   	ret    

c0108077 <strlen>:
c0108077:	55                   	push   %ebp
c0108078:	89 e5                	mov    %esp,%ebp
c010807a:	83 ec 10             	sub    $0x10,%esp
c010807d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0108084:	eb 04                	jmp    c010808a <strlen+0x13>
c0108086:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010808a:	8b 45 08             	mov    0x8(%ebp),%eax
c010808d:	8d 50 01             	lea    0x1(%eax),%edx
c0108090:	89 55 08             	mov    %edx,0x8(%ebp)
c0108093:	0f b6 00             	movzbl (%eax),%eax
c0108096:	84 c0                	test   %al,%al
c0108098:	75 ec                	jne    c0108086 <strlen+0xf>
c010809a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010809d:	c9                   	leave  
c010809e:	c3                   	ret    

c010809f <strnlen>:
c010809f:	55                   	push   %ebp
c01080a0:	89 e5                	mov    %esp,%ebp
c01080a2:	83 ec 10             	sub    $0x10,%esp
c01080a5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01080ac:	eb 04                	jmp    c01080b2 <strnlen+0x13>
c01080ae:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01080b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01080b5:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01080b8:	73 10                	jae    c01080ca <strnlen+0x2b>
c01080ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01080bd:	8d 50 01             	lea    0x1(%eax),%edx
c01080c0:	89 55 08             	mov    %edx,0x8(%ebp)
c01080c3:	0f b6 00             	movzbl (%eax),%eax
c01080c6:	84 c0                	test   %al,%al
c01080c8:	75 e4                	jne    c01080ae <strnlen+0xf>
c01080ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01080cd:	c9                   	leave  
c01080ce:	c3                   	ret    

c01080cf <strcpy>:
c01080cf:	55                   	push   %ebp
c01080d0:	89 e5                	mov    %esp,%ebp
c01080d2:	57                   	push   %edi
c01080d3:	56                   	push   %esi
c01080d4:	83 ec 20             	sub    $0x20,%esp
c01080d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01080da:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01080dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01080e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01080e3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01080e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01080e9:	89 d1                	mov    %edx,%ecx
c01080eb:	89 c2                	mov    %eax,%edx
c01080ed:	89 ce                	mov    %ecx,%esi
c01080ef:	89 d7                	mov    %edx,%edi
c01080f1:	ac                   	lods   %ds:(%esi),%al
c01080f2:	aa                   	stos   %al,%es:(%edi)
c01080f3:	84 c0                	test   %al,%al
c01080f5:	75 fa                	jne    c01080f1 <strcpy+0x22>
c01080f7:	89 fa                	mov    %edi,%edx
c01080f9:	89 f1                	mov    %esi,%ecx
c01080fb:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c01080fe:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0108101:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108104:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108107:	83 c4 20             	add    $0x20,%esp
c010810a:	5e                   	pop    %esi
c010810b:	5f                   	pop    %edi
c010810c:	5d                   	pop    %ebp
c010810d:	c3                   	ret    

c010810e <strncpy>:
c010810e:	55                   	push   %ebp
c010810f:	89 e5                	mov    %esp,%ebp
c0108111:	83 ec 10             	sub    $0x10,%esp
c0108114:	8b 45 08             	mov    0x8(%ebp),%eax
c0108117:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010811a:	eb 21                	jmp    c010813d <strncpy+0x2f>
c010811c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010811f:	0f b6 10             	movzbl (%eax),%edx
c0108122:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108125:	88 10                	mov    %dl,(%eax)
c0108127:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010812a:	0f b6 00             	movzbl (%eax),%eax
c010812d:	84 c0                	test   %al,%al
c010812f:	74 04                	je     c0108135 <strncpy+0x27>
c0108131:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0108135:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0108139:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c010813d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0108141:	75 d9                	jne    c010811c <strncpy+0xe>
c0108143:	8b 45 08             	mov    0x8(%ebp),%eax
c0108146:	c9                   	leave  
c0108147:	c3                   	ret    

c0108148 <strcmp>:
c0108148:	55                   	push   %ebp
c0108149:	89 e5                	mov    %esp,%ebp
c010814b:	57                   	push   %edi
c010814c:	56                   	push   %esi
c010814d:	83 ec 20             	sub    $0x20,%esp
c0108150:	8b 45 08             	mov    0x8(%ebp),%eax
c0108153:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108156:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108159:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010815c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010815f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108162:	89 d1                	mov    %edx,%ecx
c0108164:	89 c2                	mov    %eax,%edx
c0108166:	89 ce                	mov    %ecx,%esi
c0108168:	89 d7                	mov    %edx,%edi
c010816a:	ac                   	lods   %ds:(%esi),%al
c010816b:	ae                   	scas   %es:(%edi),%al
c010816c:	75 08                	jne    c0108176 <strcmp+0x2e>
c010816e:	84 c0                	test   %al,%al
c0108170:	75 f8                	jne    c010816a <strcmp+0x22>
c0108172:	31 c0                	xor    %eax,%eax
c0108174:	eb 04                	jmp    c010817a <strcmp+0x32>
c0108176:	19 c0                	sbb    %eax,%eax
c0108178:	0c 01                	or     $0x1,%al
c010817a:	89 fa                	mov    %edi,%edx
c010817c:	89 f1                	mov    %esi,%ecx
c010817e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108181:	89 4d e8             	mov    %ecx,-0x18(%ebp)
c0108184:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0108187:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010818a:	83 c4 20             	add    $0x20,%esp
c010818d:	5e                   	pop    %esi
c010818e:	5f                   	pop    %edi
c010818f:	5d                   	pop    %ebp
c0108190:	c3                   	ret    

c0108191 <strncmp>:
c0108191:	55                   	push   %ebp
c0108192:	89 e5                	mov    %esp,%ebp
c0108194:	eb 0c                	jmp    c01081a2 <strncmp+0x11>
c0108196:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c010819a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c010819e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01081a2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01081a6:	74 1a                	je     c01081c2 <strncmp+0x31>
c01081a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01081ab:	0f b6 00             	movzbl (%eax),%eax
c01081ae:	84 c0                	test   %al,%al
c01081b0:	74 10                	je     c01081c2 <strncmp+0x31>
c01081b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01081b5:	0f b6 10             	movzbl (%eax),%edx
c01081b8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01081bb:	0f b6 00             	movzbl (%eax),%eax
c01081be:	38 c2                	cmp    %al,%dl
c01081c0:	74 d4                	je     c0108196 <strncmp+0x5>
c01081c2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01081c6:	74 18                	je     c01081e0 <strncmp+0x4f>
c01081c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01081cb:	0f b6 00             	movzbl (%eax),%eax
c01081ce:	0f b6 d0             	movzbl %al,%edx
c01081d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01081d4:	0f b6 00             	movzbl (%eax),%eax
c01081d7:	0f b6 c0             	movzbl %al,%eax
c01081da:	29 c2                	sub    %eax,%edx
c01081dc:	89 d0                	mov    %edx,%eax
c01081de:	eb 05                	jmp    c01081e5 <strncmp+0x54>
c01081e0:	b8 00 00 00 00       	mov    $0x0,%eax
c01081e5:	5d                   	pop    %ebp
c01081e6:	c3                   	ret    

c01081e7 <strchr>:
c01081e7:	55                   	push   %ebp
c01081e8:	89 e5                	mov    %esp,%ebp
c01081ea:	83 ec 04             	sub    $0x4,%esp
c01081ed:	8b 45 0c             	mov    0xc(%ebp),%eax
c01081f0:	88 45 fc             	mov    %al,-0x4(%ebp)
c01081f3:	eb 14                	jmp    c0108209 <strchr+0x22>
c01081f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01081f8:	0f b6 00             	movzbl (%eax),%eax
c01081fb:	3a 45 fc             	cmp    -0x4(%ebp),%al
c01081fe:	75 05                	jne    c0108205 <strchr+0x1e>
c0108200:	8b 45 08             	mov    0x8(%ebp),%eax
c0108203:	eb 13                	jmp    c0108218 <strchr+0x31>
c0108205:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0108209:	8b 45 08             	mov    0x8(%ebp),%eax
c010820c:	0f b6 00             	movzbl (%eax),%eax
c010820f:	84 c0                	test   %al,%al
c0108211:	75 e2                	jne    c01081f5 <strchr+0xe>
c0108213:	b8 00 00 00 00       	mov    $0x0,%eax
c0108218:	c9                   	leave  
c0108219:	c3                   	ret    

c010821a <strfind>:
c010821a:	55                   	push   %ebp
c010821b:	89 e5                	mov    %esp,%ebp
c010821d:	83 ec 04             	sub    $0x4,%esp
c0108220:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108223:	88 45 fc             	mov    %al,-0x4(%ebp)
c0108226:	eb 11                	jmp    c0108239 <strfind+0x1f>
c0108228:	8b 45 08             	mov    0x8(%ebp),%eax
c010822b:	0f b6 00             	movzbl (%eax),%eax
c010822e:	3a 45 fc             	cmp    -0x4(%ebp),%al
c0108231:	75 02                	jne    c0108235 <strfind+0x1b>
c0108233:	eb 0e                	jmp    c0108243 <strfind+0x29>
c0108235:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0108239:	8b 45 08             	mov    0x8(%ebp),%eax
c010823c:	0f b6 00             	movzbl (%eax),%eax
c010823f:	84 c0                	test   %al,%al
c0108241:	75 e5                	jne    c0108228 <strfind+0xe>
c0108243:	8b 45 08             	mov    0x8(%ebp),%eax
c0108246:	c9                   	leave  
c0108247:	c3                   	ret    

c0108248 <strtol>:
c0108248:	55                   	push   %ebp
c0108249:	89 e5                	mov    %esp,%ebp
c010824b:	83 ec 10             	sub    $0x10,%esp
c010824e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0108255:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c010825c:	eb 04                	jmp    c0108262 <strtol+0x1a>
c010825e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0108262:	8b 45 08             	mov    0x8(%ebp),%eax
c0108265:	0f b6 00             	movzbl (%eax),%eax
c0108268:	3c 20                	cmp    $0x20,%al
c010826a:	74 f2                	je     c010825e <strtol+0x16>
c010826c:	8b 45 08             	mov    0x8(%ebp),%eax
c010826f:	0f b6 00             	movzbl (%eax),%eax
c0108272:	3c 09                	cmp    $0x9,%al
c0108274:	74 e8                	je     c010825e <strtol+0x16>
c0108276:	8b 45 08             	mov    0x8(%ebp),%eax
c0108279:	0f b6 00             	movzbl (%eax),%eax
c010827c:	3c 2b                	cmp    $0x2b,%al
c010827e:	75 06                	jne    c0108286 <strtol+0x3e>
c0108280:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0108284:	eb 15                	jmp    c010829b <strtol+0x53>
c0108286:	8b 45 08             	mov    0x8(%ebp),%eax
c0108289:	0f b6 00             	movzbl (%eax),%eax
c010828c:	3c 2d                	cmp    $0x2d,%al
c010828e:	75 0b                	jne    c010829b <strtol+0x53>
c0108290:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0108294:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
c010829b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010829f:	74 06                	je     c01082a7 <strtol+0x5f>
c01082a1:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
c01082a5:	75 24                	jne    c01082cb <strtol+0x83>
c01082a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01082aa:	0f b6 00             	movzbl (%eax),%eax
c01082ad:	3c 30                	cmp    $0x30,%al
c01082af:	75 1a                	jne    c01082cb <strtol+0x83>
c01082b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01082b4:	83 c0 01             	add    $0x1,%eax
c01082b7:	0f b6 00             	movzbl (%eax),%eax
c01082ba:	3c 78                	cmp    $0x78,%al
c01082bc:	75 0d                	jne    c01082cb <strtol+0x83>
c01082be:	83 45 08 02          	addl   $0x2,0x8(%ebp)
c01082c2:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
c01082c9:	eb 2a                	jmp    c01082f5 <strtol+0xad>
c01082cb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01082cf:	75 17                	jne    c01082e8 <strtol+0xa0>
c01082d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01082d4:	0f b6 00             	movzbl (%eax),%eax
c01082d7:	3c 30                	cmp    $0x30,%al
c01082d9:	75 0d                	jne    c01082e8 <strtol+0xa0>
c01082db:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c01082df:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
c01082e6:	eb 0d                	jmp    c01082f5 <strtol+0xad>
c01082e8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01082ec:	75 07                	jne    c01082f5 <strtol+0xad>
c01082ee:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)
c01082f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01082f8:	0f b6 00             	movzbl (%eax),%eax
c01082fb:	3c 2f                	cmp    $0x2f,%al
c01082fd:	7e 1b                	jle    c010831a <strtol+0xd2>
c01082ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0108302:	0f b6 00             	movzbl (%eax),%eax
c0108305:	3c 39                	cmp    $0x39,%al
c0108307:	7f 11                	jg     c010831a <strtol+0xd2>
c0108309:	8b 45 08             	mov    0x8(%ebp),%eax
c010830c:	0f b6 00             	movzbl (%eax),%eax
c010830f:	0f be c0             	movsbl %al,%eax
c0108312:	83 e8 30             	sub    $0x30,%eax
c0108315:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108318:	eb 48                	jmp    c0108362 <strtol+0x11a>
c010831a:	8b 45 08             	mov    0x8(%ebp),%eax
c010831d:	0f b6 00             	movzbl (%eax),%eax
c0108320:	3c 60                	cmp    $0x60,%al
c0108322:	7e 1b                	jle    c010833f <strtol+0xf7>
c0108324:	8b 45 08             	mov    0x8(%ebp),%eax
c0108327:	0f b6 00             	movzbl (%eax),%eax
c010832a:	3c 7a                	cmp    $0x7a,%al
c010832c:	7f 11                	jg     c010833f <strtol+0xf7>
c010832e:	8b 45 08             	mov    0x8(%ebp),%eax
c0108331:	0f b6 00             	movzbl (%eax),%eax
c0108334:	0f be c0             	movsbl %al,%eax
c0108337:	83 e8 57             	sub    $0x57,%eax
c010833a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010833d:	eb 23                	jmp    c0108362 <strtol+0x11a>
c010833f:	8b 45 08             	mov    0x8(%ebp),%eax
c0108342:	0f b6 00             	movzbl (%eax),%eax
c0108345:	3c 40                	cmp    $0x40,%al
c0108347:	7e 3d                	jle    c0108386 <strtol+0x13e>
c0108349:	8b 45 08             	mov    0x8(%ebp),%eax
c010834c:	0f b6 00             	movzbl (%eax),%eax
c010834f:	3c 5a                	cmp    $0x5a,%al
c0108351:	7f 33                	jg     c0108386 <strtol+0x13e>
c0108353:	8b 45 08             	mov    0x8(%ebp),%eax
c0108356:	0f b6 00             	movzbl (%eax),%eax
c0108359:	0f be c0             	movsbl %al,%eax
c010835c:	83 e8 37             	sub    $0x37,%eax
c010835f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108362:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108365:	3b 45 10             	cmp    0x10(%ebp),%eax
c0108368:	7c 02                	jl     c010836c <strtol+0x124>
c010836a:	eb 1a                	jmp    c0108386 <strtol+0x13e>
c010836c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
c0108370:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0108373:	0f af 45 10          	imul   0x10(%ebp),%eax
c0108377:	89 c2                	mov    %eax,%edx
c0108379:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010837c:	01 d0                	add    %edx,%eax
c010837e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0108381:	e9 6f ff ff ff       	jmp    c01082f5 <strtol+0xad>
c0108386:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010838a:	74 08                	je     c0108394 <strtol+0x14c>
c010838c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010838f:	8b 55 08             	mov    0x8(%ebp),%edx
c0108392:	89 10                	mov    %edx,(%eax)
c0108394:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0108398:	74 07                	je     c01083a1 <strtol+0x159>
c010839a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010839d:	f7 d8                	neg    %eax
c010839f:	eb 03                	jmp    c01083a4 <strtol+0x15c>
c01083a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01083a4:	c9                   	leave  
c01083a5:	c3                   	ret    

c01083a6 <memset>:
c01083a6:	55                   	push   %ebp
c01083a7:	89 e5                	mov    %esp,%ebp
c01083a9:	57                   	push   %edi
c01083aa:	83 ec 24             	sub    $0x24,%esp
c01083ad:	8b 45 0c             	mov    0xc(%ebp),%eax
c01083b0:	88 45 d8             	mov    %al,-0x28(%ebp)
c01083b3:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
c01083b7:	8b 55 08             	mov    0x8(%ebp),%edx
c01083ba:	89 55 f8             	mov    %edx,-0x8(%ebp)
c01083bd:	88 45 f7             	mov    %al,-0x9(%ebp)
c01083c0:	8b 45 10             	mov    0x10(%ebp),%eax
c01083c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01083c6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c01083c9:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01083cd:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01083d0:	89 d7                	mov    %edx,%edi
c01083d2:	f3 aa                	rep stos %al,%es:(%edi)
c01083d4:	89 fa                	mov    %edi,%edx
c01083d6:	89 4d ec             	mov    %ecx,-0x14(%ebp)
c01083d9:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01083dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01083df:	83 c4 24             	add    $0x24,%esp
c01083e2:	5f                   	pop    %edi
c01083e3:	5d                   	pop    %ebp
c01083e4:	c3                   	ret    

c01083e5 <memmove>:
c01083e5:	55                   	push   %ebp
c01083e6:	89 e5                	mov    %esp,%ebp
c01083e8:	57                   	push   %edi
c01083e9:	56                   	push   %esi
c01083ea:	53                   	push   %ebx
c01083eb:	83 ec 30             	sub    $0x30,%esp
c01083ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01083f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01083f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01083f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01083fa:	8b 45 10             	mov    0x10(%ebp),%eax
c01083fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108400:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108403:	3b 45 ec             	cmp    -0x14(%ebp),%eax
c0108406:	73 42                	jae    c010844a <memmove+0x65>
c0108408:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010840b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010840e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108411:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0108414:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108417:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010841a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010841d:	c1 e8 02             	shr    $0x2,%eax
c0108420:	89 c1                	mov    %eax,%ecx
c0108422:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108425:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0108428:	89 d7                	mov    %edx,%edi
c010842a:	89 c6                	mov    %eax,%esi
c010842c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010842e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
c0108431:	83 e1 03             	and    $0x3,%ecx
c0108434:	74 02                	je     c0108438 <memmove+0x53>
c0108436:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c0108438:	89 f0                	mov    %esi,%eax
c010843a:	89 fa                	mov    %edi,%edx
c010843c:	89 4d d8             	mov    %ecx,-0x28(%ebp)
c010843f:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0108442:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108445:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108448:	eb 36                	jmp    c0108480 <memmove+0x9b>
c010844a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010844d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0108450:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108453:	01 c2                	add    %eax,%edx
c0108455:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108458:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010845b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010845e:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
c0108461:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108464:	89 c1                	mov    %eax,%ecx
c0108466:	89 d8                	mov    %ebx,%eax
c0108468:	89 d6                	mov    %edx,%esi
c010846a:	89 c7                	mov    %eax,%edi
c010846c:	fd                   	std    
c010846d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c010846f:	fc                   	cld    
c0108470:	89 f8                	mov    %edi,%eax
c0108472:	89 f2                	mov    %esi,%edx
c0108474:	89 4d cc             	mov    %ecx,-0x34(%ebp)
c0108477:	89 55 c8             	mov    %edx,-0x38(%ebp)
c010847a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010847d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108480:	83 c4 30             	add    $0x30,%esp
c0108483:	5b                   	pop    %ebx
c0108484:	5e                   	pop    %esi
c0108485:	5f                   	pop    %edi
c0108486:	5d                   	pop    %ebp
c0108487:	c3                   	ret    

c0108488 <memcpy>:
c0108488:	55                   	push   %ebp
c0108489:	89 e5                	mov    %esp,%ebp
c010848b:	57                   	push   %edi
c010848c:	56                   	push   %esi
c010848d:	83 ec 20             	sub    $0x20,%esp
c0108490:	8b 45 08             	mov    0x8(%ebp),%eax
c0108493:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108496:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108499:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010849c:	8b 45 10             	mov    0x10(%ebp),%eax
c010849f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01084a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01084a5:	c1 e8 02             	shr    $0x2,%eax
c01084a8:	89 c1                	mov    %eax,%ecx
c01084aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01084ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01084b0:	89 d7                	mov    %edx,%edi
c01084b2:	89 c6                	mov    %eax,%esi
c01084b4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01084b6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
c01084b9:	83 e1 03             	and    $0x3,%ecx
c01084bc:	74 02                	je     c01084c0 <memcpy+0x38>
c01084be:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
c01084c0:	89 f0                	mov    %esi,%eax
c01084c2:	89 fa                	mov    %edi,%edx
c01084c4:	89 4d e8             	mov    %ecx,-0x18(%ebp)
c01084c7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01084ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01084cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01084d0:	83 c4 20             	add    $0x20,%esp
c01084d3:	5e                   	pop    %esi
c01084d4:	5f                   	pop    %edi
c01084d5:	5d                   	pop    %ebp
c01084d6:	c3                   	ret    

c01084d7 <memcmp>:
c01084d7:	55                   	push   %ebp
c01084d8:	89 e5                	mov    %esp,%ebp
c01084da:	83 ec 10             	sub    $0x10,%esp
c01084dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01084e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01084e3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01084e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01084e9:	eb 30                	jmp    c010851b <memcmp+0x44>
c01084eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01084ee:	0f b6 10             	movzbl (%eax),%edx
c01084f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01084f4:	0f b6 00             	movzbl (%eax),%eax
c01084f7:	38 c2                	cmp    %al,%dl
c01084f9:	74 18                	je     c0108513 <memcmp+0x3c>
c01084fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01084fe:	0f b6 00             	movzbl (%eax),%eax
c0108501:	0f b6 d0             	movzbl %al,%edx
c0108504:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0108507:	0f b6 00             	movzbl (%eax),%eax
c010850a:	0f b6 c0             	movzbl %al,%eax
c010850d:	29 c2                	sub    %eax,%edx
c010850f:	89 d0                	mov    %edx,%eax
c0108511:	eb 1a                	jmp    c010852d <memcmp+0x56>
c0108513:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0108517:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010851b:	8b 45 10             	mov    0x10(%ebp),%eax
c010851e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0108521:	89 55 10             	mov    %edx,0x10(%ebp)
c0108524:	85 c0                	test   %eax,%eax
c0108526:	75 c3                	jne    c01084eb <memcmp+0x14>
c0108528:	b8 00 00 00 00       	mov    $0x0,%eax
c010852d:	c9                   	leave  
c010852e:	c3                   	ret    

c010852f <printnum>:
c010852f:	55                   	push   %ebp
c0108530:	89 e5                	mov    %esp,%ebp
c0108532:	83 ec 58             	sub    $0x58,%esp
c0108535:	8b 45 10             	mov    0x10(%ebp),%eax
c0108538:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010853b:	8b 45 14             	mov    0x14(%ebp),%eax
c010853e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108541:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0108544:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108547:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010854a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c010854d:	8b 45 18             	mov    0x18(%ebp),%eax
c0108550:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108553:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108556:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0108559:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010855c:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010855f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108562:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108565:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108569:	74 1c                	je     c0108587 <printnum+0x58>
c010856b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010856e:	ba 00 00 00 00       	mov    $0x0,%edx
c0108573:	f7 75 e4             	divl   -0x1c(%ebp)
c0108576:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0108579:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010857c:	ba 00 00 00 00       	mov    $0x0,%edx
c0108581:	f7 75 e4             	divl   -0x1c(%ebp)
c0108584:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108587:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010858a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010858d:	f7 75 e4             	divl   -0x1c(%ebp)
c0108590:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0108593:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0108596:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0108599:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010859c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010859f:	89 55 ec             	mov    %edx,-0x14(%ebp)
c01085a2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01085a5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01085a8:	8b 45 18             	mov    0x18(%ebp),%eax
c01085ab:	ba 00 00 00 00       	mov    $0x0,%edx
c01085b0:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
c01085b3:	77 56                	ja     c010860b <printnum+0xdc>
c01085b5:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
c01085b8:	72 05                	jb     c01085bf <printnum+0x90>
c01085ba:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c01085bd:	77 4c                	ja     c010860b <printnum+0xdc>
c01085bf:	8b 45 1c             	mov    0x1c(%ebp),%eax
c01085c2:	8d 50 ff             	lea    -0x1(%eax),%edx
c01085c5:	8b 45 20             	mov    0x20(%ebp),%eax
c01085c8:	89 44 24 18          	mov    %eax,0x18(%esp)
c01085cc:	89 54 24 14          	mov    %edx,0x14(%esp)
c01085d0:	8b 45 18             	mov    0x18(%ebp),%eax
c01085d3:	89 44 24 10          	mov    %eax,0x10(%esp)
c01085d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01085da:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01085dd:	89 44 24 08          	mov    %eax,0x8(%esp)
c01085e1:	89 54 24 0c          	mov    %edx,0xc(%esp)
c01085e5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01085e8:	89 44 24 04          	mov    %eax,0x4(%esp)
c01085ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01085ef:	89 04 24             	mov    %eax,(%esp)
c01085f2:	e8 38 ff ff ff       	call   c010852f <printnum>
c01085f7:	eb 1c                	jmp    c0108615 <printnum+0xe6>
c01085f9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01085fc:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108600:	8b 45 20             	mov    0x20(%ebp),%eax
c0108603:	89 04 24             	mov    %eax,(%esp)
c0108606:	8b 45 08             	mov    0x8(%ebp),%eax
c0108609:	ff d0                	call   *%eax
c010860b:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
c010860f:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
c0108613:	7f e4                	jg     c01085f9 <printnum+0xca>
c0108615:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0108618:	05 a8 aa 10 c0       	add    $0xc010aaa8,%eax
c010861d:	0f b6 00             	movzbl (%eax),%eax
c0108620:	0f be c0             	movsbl %al,%eax
c0108623:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108626:	89 54 24 04          	mov    %edx,0x4(%esp)
c010862a:	89 04 24             	mov    %eax,(%esp)
c010862d:	8b 45 08             	mov    0x8(%ebp),%eax
c0108630:	ff d0                	call   *%eax
c0108632:	c9                   	leave  
c0108633:	c3                   	ret    

c0108634 <getuint>:
c0108634:	55                   	push   %ebp
c0108635:	89 e5                	mov    %esp,%ebp
c0108637:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c010863b:	7e 14                	jle    c0108651 <getuint+0x1d>
c010863d:	8b 45 08             	mov    0x8(%ebp),%eax
c0108640:	8b 00                	mov    (%eax),%eax
c0108642:	8d 48 08             	lea    0x8(%eax),%ecx
c0108645:	8b 55 08             	mov    0x8(%ebp),%edx
c0108648:	89 0a                	mov    %ecx,(%edx)
c010864a:	8b 50 04             	mov    0x4(%eax),%edx
c010864d:	8b 00                	mov    (%eax),%eax
c010864f:	eb 30                	jmp    c0108681 <getuint+0x4d>
c0108651:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108655:	74 16                	je     c010866d <getuint+0x39>
c0108657:	8b 45 08             	mov    0x8(%ebp),%eax
c010865a:	8b 00                	mov    (%eax),%eax
c010865c:	8d 48 04             	lea    0x4(%eax),%ecx
c010865f:	8b 55 08             	mov    0x8(%ebp),%edx
c0108662:	89 0a                	mov    %ecx,(%edx)
c0108664:	8b 00                	mov    (%eax),%eax
c0108666:	ba 00 00 00 00       	mov    $0x0,%edx
c010866b:	eb 14                	jmp    c0108681 <getuint+0x4d>
c010866d:	8b 45 08             	mov    0x8(%ebp),%eax
c0108670:	8b 00                	mov    (%eax),%eax
c0108672:	8d 48 04             	lea    0x4(%eax),%ecx
c0108675:	8b 55 08             	mov    0x8(%ebp),%edx
c0108678:	89 0a                	mov    %ecx,(%edx)
c010867a:	8b 00                	mov    (%eax),%eax
c010867c:	ba 00 00 00 00       	mov    $0x0,%edx
c0108681:	5d                   	pop    %ebp
c0108682:	c3                   	ret    

c0108683 <getint>:
c0108683:	55                   	push   %ebp
c0108684:	89 e5                	mov    %esp,%ebp
c0108686:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
c010868a:	7e 14                	jle    c01086a0 <getint+0x1d>
c010868c:	8b 45 08             	mov    0x8(%ebp),%eax
c010868f:	8b 00                	mov    (%eax),%eax
c0108691:	8d 48 08             	lea    0x8(%eax),%ecx
c0108694:	8b 55 08             	mov    0x8(%ebp),%edx
c0108697:	89 0a                	mov    %ecx,(%edx)
c0108699:	8b 50 04             	mov    0x4(%eax),%edx
c010869c:	8b 00                	mov    (%eax),%eax
c010869e:	eb 28                	jmp    c01086c8 <getint+0x45>
c01086a0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01086a4:	74 12                	je     c01086b8 <getint+0x35>
c01086a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01086a9:	8b 00                	mov    (%eax),%eax
c01086ab:	8d 48 04             	lea    0x4(%eax),%ecx
c01086ae:	8b 55 08             	mov    0x8(%ebp),%edx
c01086b1:	89 0a                	mov    %ecx,(%edx)
c01086b3:	8b 00                	mov    (%eax),%eax
c01086b5:	99                   	cltd   
c01086b6:	eb 10                	jmp    c01086c8 <getint+0x45>
c01086b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01086bb:	8b 00                	mov    (%eax),%eax
c01086bd:	8d 48 04             	lea    0x4(%eax),%ecx
c01086c0:	8b 55 08             	mov    0x8(%ebp),%edx
c01086c3:	89 0a                	mov    %ecx,(%edx)
c01086c5:	8b 00                	mov    (%eax),%eax
c01086c7:	99                   	cltd   
c01086c8:	5d                   	pop    %ebp
c01086c9:	c3                   	ret    

c01086ca <printfmt>:
c01086ca:	55                   	push   %ebp
c01086cb:	89 e5                	mov    %esp,%ebp
c01086cd:	83 ec 28             	sub    $0x28,%esp
c01086d0:	8d 45 14             	lea    0x14(%ebp),%eax
c01086d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01086d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01086d9:	89 44 24 0c          	mov    %eax,0xc(%esp)
c01086dd:	8b 45 10             	mov    0x10(%ebp),%eax
c01086e0:	89 44 24 08          	mov    %eax,0x8(%esp)
c01086e4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01086e7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01086eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01086ee:	89 04 24             	mov    %eax,(%esp)
c01086f1:	e8 02 00 00 00       	call   c01086f8 <vprintfmt>
c01086f6:	c9                   	leave  
c01086f7:	c3                   	ret    

c01086f8 <vprintfmt>:
c01086f8:	55                   	push   %ebp
c01086f9:	89 e5                	mov    %esp,%ebp
c01086fb:	56                   	push   %esi
c01086fc:	53                   	push   %ebx
c01086fd:	83 ec 40             	sub    $0x40,%esp
c0108700:	eb 18                	jmp    c010871a <vprintfmt+0x22>
c0108702:	85 db                	test   %ebx,%ebx
c0108704:	75 05                	jne    c010870b <vprintfmt+0x13>
c0108706:	e9 d1 03 00 00       	jmp    c0108adc <vprintfmt+0x3e4>
c010870b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010870e:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108712:	89 1c 24             	mov    %ebx,(%esp)
c0108715:	8b 45 08             	mov    0x8(%ebp),%eax
c0108718:	ff d0                	call   *%eax
c010871a:	8b 45 10             	mov    0x10(%ebp),%eax
c010871d:	8d 50 01             	lea    0x1(%eax),%edx
c0108720:	89 55 10             	mov    %edx,0x10(%ebp)
c0108723:	0f b6 00             	movzbl (%eax),%eax
c0108726:	0f b6 d8             	movzbl %al,%ebx
c0108729:	83 fb 25             	cmp    $0x25,%ebx
c010872c:	75 d4                	jne    c0108702 <vprintfmt+0xa>
c010872e:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
c0108732:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0108739:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010873c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010873f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0108746:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0108749:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010874c:	8b 45 10             	mov    0x10(%ebp),%eax
c010874f:	8d 50 01             	lea    0x1(%eax),%edx
c0108752:	89 55 10             	mov    %edx,0x10(%ebp)
c0108755:	0f b6 00             	movzbl (%eax),%eax
c0108758:	0f b6 d8             	movzbl %al,%ebx
c010875b:	8d 43 dd             	lea    -0x23(%ebx),%eax
c010875e:	83 f8 55             	cmp    $0x55,%eax
c0108761:	0f 87 44 03 00 00    	ja     c0108aab <vprintfmt+0x3b3>
c0108767:	8b 04 85 cc aa 10 c0 	mov    -0x3fef5534(,%eax,4),%eax
c010876e:	ff e0                	jmp    *%eax
c0108770:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
c0108774:	eb d6                	jmp    c010874c <vprintfmt+0x54>
c0108776:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
c010877a:	eb d0                	jmp    c010874c <vprintfmt+0x54>
c010877c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0108783:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108786:	89 d0                	mov    %edx,%eax
c0108788:	c1 e0 02             	shl    $0x2,%eax
c010878b:	01 d0                	add    %edx,%eax
c010878d:	01 c0                	add    %eax,%eax
c010878f:	01 d8                	add    %ebx,%eax
c0108791:	83 e8 30             	sub    $0x30,%eax
c0108794:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108797:	8b 45 10             	mov    0x10(%ebp),%eax
c010879a:	0f b6 00             	movzbl (%eax),%eax
c010879d:	0f be d8             	movsbl %al,%ebx
c01087a0:	83 fb 2f             	cmp    $0x2f,%ebx
c01087a3:	7e 0b                	jle    c01087b0 <vprintfmt+0xb8>
c01087a5:	83 fb 39             	cmp    $0x39,%ebx
c01087a8:	7f 06                	jg     c01087b0 <vprintfmt+0xb8>
c01087aa:	83 45 10 01          	addl   $0x1,0x10(%ebp)
c01087ae:	eb d3                	jmp    c0108783 <vprintfmt+0x8b>
c01087b0:	eb 33                	jmp    c01087e5 <vprintfmt+0xed>
c01087b2:	8b 45 14             	mov    0x14(%ebp),%eax
c01087b5:	8d 50 04             	lea    0x4(%eax),%edx
c01087b8:	89 55 14             	mov    %edx,0x14(%ebp)
c01087bb:	8b 00                	mov    (%eax),%eax
c01087bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01087c0:	eb 23                	jmp    c01087e5 <vprintfmt+0xed>
c01087c2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01087c6:	79 0c                	jns    c01087d4 <vprintfmt+0xdc>
c01087c8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01087cf:	e9 78 ff ff ff       	jmp    c010874c <vprintfmt+0x54>
c01087d4:	e9 73 ff ff ff       	jmp    c010874c <vprintfmt+0x54>
c01087d9:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
c01087e0:	e9 67 ff ff ff       	jmp    c010874c <vprintfmt+0x54>
c01087e5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01087e9:	79 12                	jns    c01087fd <vprintfmt+0x105>
c01087eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01087ee:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01087f1:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c01087f8:	e9 4f ff ff ff       	jmp    c010874c <vprintfmt+0x54>
c01087fd:	e9 4a ff ff ff       	jmp    c010874c <vprintfmt+0x54>
c0108802:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0108806:	e9 41 ff ff ff       	jmp    c010874c <vprintfmt+0x54>
c010880b:	8b 45 14             	mov    0x14(%ebp),%eax
c010880e:	8d 50 04             	lea    0x4(%eax),%edx
c0108811:	89 55 14             	mov    %edx,0x14(%ebp)
c0108814:	8b 00                	mov    (%eax),%eax
c0108816:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108819:	89 54 24 04          	mov    %edx,0x4(%esp)
c010881d:	89 04 24             	mov    %eax,(%esp)
c0108820:	8b 45 08             	mov    0x8(%ebp),%eax
c0108823:	ff d0                	call   *%eax
c0108825:	e9 ac 02 00 00       	jmp    c0108ad6 <vprintfmt+0x3de>
c010882a:	8b 45 14             	mov    0x14(%ebp),%eax
c010882d:	8d 50 04             	lea    0x4(%eax),%edx
c0108830:	89 55 14             	mov    %edx,0x14(%ebp)
c0108833:	8b 18                	mov    (%eax),%ebx
c0108835:	85 db                	test   %ebx,%ebx
c0108837:	79 02                	jns    c010883b <vprintfmt+0x143>
c0108839:	f7 db                	neg    %ebx
c010883b:	83 fb 06             	cmp    $0x6,%ebx
c010883e:	7f 0b                	jg     c010884b <vprintfmt+0x153>
c0108840:	8b 34 9d 8c aa 10 c0 	mov    -0x3fef5574(,%ebx,4),%esi
c0108847:	85 f6                	test   %esi,%esi
c0108849:	75 23                	jne    c010886e <vprintfmt+0x176>
c010884b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
c010884f:	c7 44 24 08 b9 aa 10 	movl   $0xc010aab9,0x8(%esp)
c0108856:	c0 
c0108857:	8b 45 0c             	mov    0xc(%ebp),%eax
c010885a:	89 44 24 04          	mov    %eax,0x4(%esp)
c010885e:	8b 45 08             	mov    0x8(%ebp),%eax
c0108861:	89 04 24             	mov    %eax,(%esp)
c0108864:	e8 61 fe ff ff       	call   c01086ca <printfmt>
c0108869:	e9 68 02 00 00       	jmp    c0108ad6 <vprintfmt+0x3de>
c010886e:	89 74 24 0c          	mov    %esi,0xc(%esp)
c0108872:	c7 44 24 08 c2 aa 10 	movl   $0xc010aac2,0x8(%esp)
c0108879:	c0 
c010887a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010887d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108881:	8b 45 08             	mov    0x8(%ebp),%eax
c0108884:	89 04 24             	mov    %eax,(%esp)
c0108887:	e8 3e fe ff ff       	call   c01086ca <printfmt>
c010888c:	e9 45 02 00 00       	jmp    c0108ad6 <vprintfmt+0x3de>
c0108891:	8b 45 14             	mov    0x14(%ebp),%eax
c0108894:	8d 50 04             	lea    0x4(%eax),%edx
c0108897:	89 55 14             	mov    %edx,0x14(%ebp)
c010889a:	8b 30                	mov    (%eax),%esi
c010889c:	85 f6                	test   %esi,%esi
c010889e:	75 05                	jne    c01088a5 <vprintfmt+0x1ad>
c01088a0:	be c5 aa 10 c0       	mov    $0xc010aac5,%esi
c01088a5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01088a9:	7e 3e                	jle    c01088e9 <vprintfmt+0x1f1>
c01088ab:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
c01088af:	74 38                	je     c01088e9 <vprintfmt+0x1f1>
c01088b1:	8b 5d e8             	mov    -0x18(%ebp),%ebx
c01088b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01088b7:	89 44 24 04          	mov    %eax,0x4(%esp)
c01088bb:	89 34 24             	mov    %esi,(%esp)
c01088be:	e8 dc f7 ff ff       	call   c010809f <strnlen>
c01088c3:	29 c3                	sub    %eax,%ebx
c01088c5:	89 d8                	mov    %ebx,%eax
c01088c7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01088ca:	eb 17                	jmp    c01088e3 <vprintfmt+0x1eb>
c01088cc:	0f be 45 db          	movsbl -0x25(%ebp),%eax
c01088d0:	8b 55 0c             	mov    0xc(%ebp),%edx
c01088d3:	89 54 24 04          	mov    %edx,0x4(%esp)
c01088d7:	89 04 24             	mov    %eax,(%esp)
c01088da:	8b 45 08             	mov    0x8(%ebp),%eax
c01088dd:	ff d0                	call   *%eax
c01088df:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
c01088e3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01088e7:	7f e3                	jg     c01088cc <vprintfmt+0x1d4>
c01088e9:	eb 38                	jmp    c0108923 <vprintfmt+0x22b>
c01088eb:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01088ef:	74 1f                	je     c0108910 <vprintfmt+0x218>
c01088f1:	83 fb 1f             	cmp    $0x1f,%ebx
c01088f4:	7e 05                	jle    c01088fb <vprintfmt+0x203>
c01088f6:	83 fb 7e             	cmp    $0x7e,%ebx
c01088f9:	7e 15                	jle    c0108910 <vprintfmt+0x218>
c01088fb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01088fe:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108902:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
c0108909:	8b 45 08             	mov    0x8(%ebp),%eax
c010890c:	ff d0                	call   *%eax
c010890e:	eb 0f                	jmp    c010891f <vprintfmt+0x227>
c0108910:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108913:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108917:	89 1c 24             	mov    %ebx,(%esp)
c010891a:	8b 45 08             	mov    0x8(%ebp),%eax
c010891d:	ff d0                	call   *%eax
c010891f:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
c0108923:	89 f0                	mov    %esi,%eax
c0108925:	8d 70 01             	lea    0x1(%eax),%esi
c0108928:	0f b6 00             	movzbl (%eax),%eax
c010892b:	0f be d8             	movsbl %al,%ebx
c010892e:	85 db                	test   %ebx,%ebx
c0108930:	74 10                	je     c0108942 <vprintfmt+0x24a>
c0108932:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108936:	78 b3                	js     c01088eb <vprintfmt+0x1f3>
c0108938:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
c010893c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108940:	79 a9                	jns    c01088eb <vprintfmt+0x1f3>
c0108942:	eb 17                	jmp    c010895b <vprintfmt+0x263>
c0108944:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108947:	89 44 24 04          	mov    %eax,0x4(%esp)
c010894b:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
c0108952:	8b 45 08             	mov    0x8(%ebp),%eax
c0108955:	ff d0                	call   *%eax
c0108957:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
c010895b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010895f:	7f e3                	jg     c0108944 <vprintfmt+0x24c>
c0108961:	e9 70 01 00 00       	jmp    c0108ad6 <vprintfmt+0x3de>
c0108966:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0108969:	89 44 24 04          	mov    %eax,0x4(%esp)
c010896d:	8d 45 14             	lea    0x14(%ebp),%eax
c0108970:	89 04 24             	mov    %eax,(%esp)
c0108973:	e8 0b fd ff ff       	call   c0108683 <getint>
c0108978:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010897b:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010897e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108981:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0108984:	85 d2                	test   %edx,%edx
c0108986:	79 26                	jns    c01089ae <vprintfmt+0x2b6>
c0108988:	8b 45 0c             	mov    0xc(%ebp),%eax
c010898b:	89 44 24 04          	mov    %eax,0x4(%esp)
c010898f:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
c0108996:	8b 45 08             	mov    0x8(%ebp),%eax
c0108999:	ff d0                	call   *%eax
c010899b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010899e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01089a1:	f7 d8                	neg    %eax
c01089a3:	83 d2 00             	adc    $0x0,%edx
c01089a6:	f7 da                	neg    %edx
c01089a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01089ab:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01089ae:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
c01089b5:	e9 a8 00 00 00       	jmp    c0108a62 <vprintfmt+0x36a>
c01089ba:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01089bd:	89 44 24 04          	mov    %eax,0x4(%esp)
c01089c1:	8d 45 14             	lea    0x14(%ebp),%eax
c01089c4:	89 04 24             	mov    %eax,(%esp)
c01089c7:	e8 68 fc ff ff       	call   c0108634 <getuint>
c01089cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01089cf:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01089d2:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
c01089d9:	e9 84 00 00 00       	jmp    c0108a62 <vprintfmt+0x36a>
c01089de:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01089e1:	89 44 24 04          	mov    %eax,0x4(%esp)
c01089e5:	8d 45 14             	lea    0x14(%ebp),%eax
c01089e8:	89 04 24             	mov    %eax,(%esp)
c01089eb:	e8 44 fc ff ff       	call   c0108634 <getuint>
c01089f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01089f3:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01089f6:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
c01089fd:	eb 63                	jmp    c0108a62 <vprintfmt+0x36a>
c01089ff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108a02:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108a06:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
c0108a0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0108a10:	ff d0                	call   *%eax
c0108a12:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108a15:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108a19:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
c0108a20:	8b 45 08             	mov    0x8(%ebp),%eax
c0108a23:	ff d0                	call   *%eax
c0108a25:	8b 45 14             	mov    0x14(%ebp),%eax
c0108a28:	8d 50 04             	lea    0x4(%eax),%edx
c0108a2b:	89 55 14             	mov    %edx,0x14(%ebp)
c0108a2e:	8b 00                	mov    (%eax),%eax
c0108a30:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108a33:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108a3a:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
c0108a41:	eb 1f                	jmp    c0108a62 <vprintfmt+0x36a>
c0108a43:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0108a46:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108a4a:	8d 45 14             	lea    0x14(%ebp),%eax
c0108a4d:	89 04 24             	mov    %eax,(%esp)
c0108a50:	e8 df fb ff ff       	call   c0108634 <getuint>
c0108a55:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108a58:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0108a5b:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
c0108a62:	0f be 55 db          	movsbl -0x25(%ebp),%edx
c0108a66:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108a69:	89 54 24 18          	mov    %edx,0x18(%esp)
c0108a6d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0108a70:	89 54 24 14          	mov    %edx,0x14(%esp)
c0108a74:	89 44 24 10          	mov    %eax,0x10(%esp)
c0108a78:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108a7b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0108a7e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0108a82:	89 54 24 0c          	mov    %edx,0xc(%esp)
c0108a86:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108a89:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108a8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0108a90:	89 04 24             	mov    %eax,(%esp)
c0108a93:	e8 97 fa ff ff       	call   c010852f <printnum>
c0108a98:	eb 3c                	jmp    c0108ad6 <vprintfmt+0x3de>
c0108a9a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108a9d:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108aa1:	89 1c 24             	mov    %ebx,(%esp)
c0108aa4:	8b 45 08             	mov    0x8(%ebp),%eax
c0108aa7:	ff d0                	call   *%eax
c0108aa9:	eb 2b                	jmp    c0108ad6 <vprintfmt+0x3de>
c0108aab:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108aae:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108ab2:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
c0108ab9:	8b 45 08             	mov    0x8(%ebp),%eax
c0108abc:	ff d0                	call   *%eax
c0108abe:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0108ac2:	eb 04                	jmp    c0108ac8 <vprintfmt+0x3d0>
c0108ac4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
c0108ac8:	8b 45 10             	mov    0x10(%ebp),%eax
c0108acb:	83 e8 01             	sub    $0x1,%eax
c0108ace:	0f b6 00             	movzbl (%eax),%eax
c0108ad1:	3c 25                	cmp    $0x25,%al
c0108ad3:	75 ef                	jne    c0108ac4 <vprintfmt+0x3cc>
c0108ad5:	90                   	nop
c0108ad6:	90                   	nop
c0108ad7:	e9 3e fc ff ff       	jmp    c010871a <vprintfmt+0x22>
c0108adc:	83 c4 40             	add    $0x40,%esp
c0108adf:	5b                   	pop    %ebx
c0108ae0:	5e                   	pop    %esi
c0108ae1:	5d                   	pop    %ebp
c0108ae2:	c3                   	ret    

c0108ae3 <sprintputch>:
c0108ae3:	55                   	push   %ebp
c0108ae4:	89 e5                	mov    %esp,%ebp
c0108ae6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108ae9:	8b 40 08             	mov    0x8(%eax),%eax
c0108aec:	8d 50 01             	lea    0x1(%eax),%edx
c0108aef:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108af2:	89 50 08             	mov    %edx,0x8(%eax)
c0108af5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108af8:	8b 10                	mov    (%eax),%edx
c0108afa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108afd:	8b 40 04             	mov    0x4(%eax),%eax
c0108b00:	39 c2                	cmp    %eax,%edx
c0108b02:	73 12                	jae    c0108b16 <sprintputch+0x33>
c0108b04:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108b07:	8b 00                	mov    (%eax),%eax
c0108b09:	8d 48 01             	lea    0x1(%eax),%ecx
c0108b0c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108b0f:	89 0a                	mov    %ecx,(%edx)
c0108b11:	8b 55 08             	mov    0x8(%ebp),%edx
c0108b14:	88 10                	mov    %dl,(%eax)
c0108b16:	5d                   	pop    %ebp
c0108b17:	c3                   	ret    

c0108b18 <snprintf>:
c0108b18:	55                   	push   %ebp
c0108b19:	89 e5                	mov    %esp,%ebp
c0108b1b:	83 ec 28             	sub    $0x28,%esp
c0108b1e:	8d 45 14             	lea    0x14(%ebp),%eax
c0108b21:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108b24:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b27:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0108b2b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b2e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0108b32:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108b35:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108b39:	8b 45 08             	mov    0x8(%ebp),%eax
c0108b3c:	89 04 24             	mov    %eax,(%esp)
c0108b3f:	e8 08 00 00 00       	call   c0108b4c <vsnprintf>
c0108b44:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108b47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108b4a:	c9                   	leave  
c0108b4b:	c3                   	ret    

c0108b4c <vsnprintf>:
c0108b4c:	55                   	push   %ebp
c0108b4d:	89 e5                	mov    %esp,%ebp
c0108b4f:	83 ec 28             	sub    $0x28,%esp
c0108b52:	8b 45 08             	mov    0x8(%ebp),%eax
c0108b55:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108b58:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108b5b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0108b5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0108b61:	01 d0                	add    %edx,%eax
c0108b63:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108b66:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108b6d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0108b71:	74 0a                	je     c0108b7d <vsnprintf+0x31>
c0108b73:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0108b76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b79:	39 c2                	cmp    %eax,%edx
c0108b7b:	76 07                	jbe    c0108b84 <vsnprintf+0x38>
c0108b7d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
c0108b82:	eb 2a                	jmp    c0108bae <vsnprintf+0x62>
c0108b84:	8b 45 14             	mov    0x14(%ebp),%eax
c0108b87:	89 44 24 0c          	mov    %eax,0xc(%esp)
c0108b8b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b8e:	89 44 24 08          	mov    %eax,0x8(%esp)
c0108b92:	8d 45 ec             	lea    -0x14(%ebp),%eax
c0108b95:	89 44 24 04          	mov    %eax,0x4(%esp)
c0108b99:	c7 04 24 e3 8a 10 c0 	movl   $0xc0108ae3,(%esp)
c0108ba0:	e8 53 fb ff ff       	call   c01086f8 <vprintfmt>
c0108ba5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108ba8:	c6 00 00             	movb   $0x0,(%eax)
c0108bab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108bae:	c9                   	leave  
c0108baf:	c3                   	ret    

c0108bb0 <rand>:
c0108bb0:	55                   	push   %ebp
c0108bb1:	89 e5                	mov    %esp,%ebp
c0108bb3:	57                   	push   %edi
c0108bb4:	56                   	push   %esi
c0108bb5:	53                   	push   %ebx
c0108bb6:	83 ec 24             	sub    $0x24,%esp
c0108bb9:	a1 58 0a 12 c0       	mov    0xc0120a58,%eax
c0108bbe:	8b 15 5c 0a 12 c0    	mov    0xc0120a5c,%edx
c0108bc4:	69 fa 6d e6 ec de    	imul   $0xdeece66d,%edx,%edi
c0108bca:	6b f0 05             	imul   $0x5,%eax,%esi
c0108bcd:	01 f7                	add    %esi,%edi
c0108bcf:	be 6d e6 ec de       	mov    $0xdeece66d,%esi
c0108bd4:	f7 e6                	mul    %esi
c0108bd6:	8d 34 17             	lea    (%edi,%edx,1),%esi
c0108bd9:	89 f2                	mov    %esi,%edx
c0108bdb:	83 c0 0b             	add    $0xb,%eax
c0108bde:	83 d2 00             	adc    $0x0,%edx
c0108be1:	89 c7                	mov    %eax,%edi
c0108be3:	83 e7 ff             	and    $0xffffffff,%edi
c0108be6:	89 f9                	mov    %edi,%ecx
c0108be8:	0f b7 da             	movzwl %dx,%ebx
c0108beb:	89 0d 58 0a 12 c0    	mov    %ecx,0xc0120a58
c0108bf1:	89 1d 5c 0a 12 c0    	mov    %ebx,0xc0120a5c
c0108bf7:	a1 58 0a 12 c0       	mov    0xc0120a58,%eax
c0108bfc:	8b 15 5c 0a 12 c0    	mov    0xc0120a5c,%edx
c0108c02:	0f ac d0 0c          	shrd   $0xc,%edx,%eax
c0108c06:	c1 ea 0c             	shr    $0xc,%edx
c0108c09:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0108c0c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0108c0f:	c7 45 dc 00 00 00 80 	movl   $0x80000000,-0x24(%ebp)
c0108c16:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0108c19:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108c1c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108c1f:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0108c22:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c25:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108c28:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108c2c:	74 1c                	je     c0108c4a <rand+0x9a>
c0108c2e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c31:	ba 00 00 00 00       	mov    $0x0,%edx
c0108c36:	f7 75 dc             	divl   -0x24(%ebp)
c0108c39:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0108c3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c3f:	ba 00 00 00 00       	mov    $0x0,%edx
c0108c44:	f7 75 dc             	divl   -0x24(%ebp)
c0108c47:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108c4a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0108c4d:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0108c50:	f7 75 dc             	divl   -0x24(%ebp)
c0108c53:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108c56:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0108c59:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0108c5c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0108c5f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0108c62:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0108c65:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108c68:	83 c4 24             	add    $0x24,%esp
c0108c6b:	5b                   	pop    %ebx
c0108c6c:	5e                   	pop    %esi
c0108c6d:	5f                   	pop    %edi
c0108c6e:	5d                   	pop    %ebp
c0108c6f:	c3                   	ret    

c0108c70 <srand>:
c0108c70:	55                   	push   %ebp
c0108c71:	89 e5                	mov    %esp,%ebp
c0108c73:	8b 45 08             	mov    0x8(%ebp),%eax
c0108c76:	ba 00 00 00 00       	mov    $0x0,%edx
c0108c7b:	a3 58 0a 12 c0       	mov    %eax,0xc0120a58
c0108c80:	89 15 5c 0a 12 c0    	mov    %edx,0xc0120a5c
c0108c86:	5d                   	pop    %ebp
c0108c87:	c3                   	ret    
