
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400a28 <_init>:
  400a28:	48 83 ec 08          	sub    $0x8,%rsp
  400a2c:	e8 0b 02 00 00       	callq  400c3c <call_gmon_start>
  400a31:	e8 8a 02 00 00       	callq  400cc0 <frame_dummy>
  400a36:	e8 a5 1a 00 00       	callq  4024e0 <__do_global_ctors_aux>
  400a3b:	48 83 c4 08          	add    $0x8,%rsp
  400a3f:	c3                   	retq   

Disassembly of section .plt:

0000000000400a40 <printf@plt-0x10>:
  400a40:	ff 35 0a 29 20 00    	pushq  0x20290a(%rip)        # 603350 <_GLOBAL_OFFSET_TABLE_+0x8>
  400a46:	ff 25 0c 29 20 00    	jmpq   *0x20290c(%rip)        # 603358 <_GLOBAL_OFFSET_TABLE_+0x10>
  400a4c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400a50 <printf@plt>:
  400a50:	ff 25 0a 29 20 00    	jmpq   *0x20290a(%rip)        # 603360 <_GLOBAL_OFFSET_TABLE_+0x18>
  400a56:	68 00 00 00 00       	pushq  $0x0
  400a5b:	e9 e0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a60 <memset@plt>:
  400a60:	ff 25 02 29 20 00    	jmpq   *0x202902(%rip)        # 603368 <_GLOBAL_OFFSET_TABLE_+0x20>
  400a66:	68 01 00 00 00       	pushq  $0x1
  400a6b:	e9 d0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a70 <close@plt>:
  400a70:	ff 25 fa 28 20 00    	jmpq   *0x2028fa(%rip)        # 603370 <_GLOBAL_OFFSET_TABLE_+0x28>
  400a76:	68 02 00 00 00       	pushq  $0x2
  400a7b:	e9 c0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a80 <gethostbyname@plt>:
  400a80:	ff 25 f2 28 20 00    	jmpq   *0x2028f2(%rip)        # 603378 <_GLOBAL_OFFSET_TABLE_+0x30>
  400a86:	68 03 00 00 00       	pushq  $0x3
  400a8b:	e9 b0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a90 <puts@plt>:
  400a90:	ff 25 ea 28 20 00    	jmpq   *0x2028ea(%rip)        # 603380 <_GLOBAL_OFFSET_TABLE_+0x38>
  400a96:	68 04 00 00 00       	pushq  $0x4
  400a9b:	e9 a0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400aa0 <exit@plt>:
  400aa0:	ff 25 e2 28 20 00    	jmpq   *0x2028e2(%rip)        # 603388 <_GLOBAL_OFFSET_TABLE_+0x40>
  400aa6:	68 05 00 00 00       	pushq  $0x5
  400aab:	e9 90 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ab0 <strcasecmp@plt>:
  400ab0:	ff 25 da 28 20 00    	jmpq   *0x2028da(%rip)        # 603390 <_GLOBAL_OFFSET_TABLE_+0x48>
  400ab6:	68 06 00 00 00       	pushq  $0x6
  400abb:	e9 80 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ac0 <read@plt>:
  400ac0:	ff 25 d2 28 20 00    	jmpq   *0x2028d2(%rip)        # 603398 <_GLOBAL_OFFSET_TABLE_+0x50>
  400ac6:	68 07 00 00 00       	pushq  $0x7
  400acb:	e9 70 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ad0 <fopen@plt>:
  400ad0:	ff 25 ca 28 20 00    	jmpq   *0x2028ca(%rip)        # 6033a0 <_GLOBAL_OFFSET_TABLE_+0x58>
  400ad6:	68 08 00 00 00       	pushq  $0x8
  400adb:	e9 60 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ae0 <__libc_start_main@plt>:
  400ae0:	ff 25 c2 28 20 00    	jmpq   *0x2028c2(%rip)        # 6033a8 <_GLOBAL_OFFSET_TABLE_+0x60>
  400ae6:	68 09 00 00 00       	pushq  $0x9
  400aeb:	e9 50 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400af0 <fgets@plt>:
  400af0:	ff 25 ba 28 20 00    	jmpq   *0x2028ba(%rip)        # 6033b0 <_GLOBAL_OFFSET_TABLE_+0x68>
  400af6:	68 0a 00 00 00       	pushq  $0xa
  400afb:	e9 40 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b00 <bcopy@plt>:
  400b00:	ff 25 b2 28 20 00    	jmpq   *0x2028b2(%rip)        # 6033b8 <_GLOBAL_OFFSET_TABLE_+0x70>
  400b06:	68 0b 00 00 00       	pushq  $0xb
  400b0b:	e9 30 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b10 <__ctype_b_loc@plt>:
  400b10:	ff 25 aa 28 20 00    	jmpq   *0x2028aa(%rip)        # 6033c0 <_GLOBAL_OFFSET_TABLE_+0x78>
  400b16:	68 0c 00 00 00       	pushq  $0xc
  400b1b:	e9 20 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b20 <sprintf@plt>:
  400b20:	ff 25 a2 28 20 00    	jmpq   *0x2028a2(%rip)        # 6033c8 <_GLOBAL_OFFSET_TABLE_+0x80>
  400b26:	68 0d 00 00 00       	pushq  $0xd
  400b2b:	e9 10 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b30 <__strtol_internal@plt>:
  400b30:	ff 25 9a 28 20 00    	jmpq   *0x20289a(%rip)        # 6033d0 <_GLOBAL_OFFSET_TABLE_+0x88>
  400b36:	68 0e 00 00 00       	pushq  $0xe
  400b3b:	e9 00 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b40 <sscanf@plt>:
  400b40:	ff 25 92 28 20 00    	jmpq   *0x202892(%rip)        # 6033d8 <_GLOBAL_OFFSET_TABLE_+0x90>
  400b46:	68 0f 00 00 00       	pushq  $0xf
  400b4b:	e9 f0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b50 <sleep@plt>:
  400b50:	ff 25 8a 28 20 00    	jmpq   *0x20288a(%rip)        # 6033e0 <_GLOBAL_OFFSET_TABLE_+0x98>
  400b56:	68 10 00 00 00       	pushq  $0x10
  400b5b:	e9 e0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b60 <connect@plt>:
  400b60:	ff 25 82 28 20 00    	jmpq   *0x202882(%rip)        # 6033e8 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400b66:	68 11 00 00 00       	pushq  $0x11
  400b6b:	e9 d0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b70 <gethostname@plt>:
  400b70:	ff 25 7a 28 20 00    	jmpq   *0x20287a(%rip)        # 6033f0 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400b76:	68 12 00 00 00       	pushq  $0x12
  400b7b:	e9 c0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b80 <signal@plt>:
  400b80:	ff 25 72 28 20 00    	jmpq   *0x202872(%rip)        # 6033f8 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400b86:	68 13 00 00 00       	pushq  $0x13
  400b8b:	e9 b0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b90 <socket@plt>:
  400b90:	ff 25 6a 28 20 00    	jmpq   *0x20286a(%rip)        # 603400 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400b96:	68 14 00 00 00       	pushq  $0x14
  400b9b:	e9 a0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ba0 <getenv@plt>:
  400ba0:	ff 25 62 28 20 00    	jmpq   *0x202862(%rip)        # 603408 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400ba6:	68 15 00 00 00       	pushq  $0x15
  400bab:	e9 90 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bb0 <alarm@plt>:
  400bb0:	ff 25 5a 28 20 00    	jmpq   *0x20285a(%rip)        # 603410 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400bb6:	68 16 00 00 00       	pushq  $0x16
  400bbb:	e9 80 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bc0 <__errno_location@plt>:
  400bc0:	ff 25 52 28 20 00    	jmpq   *0x202852(%rip)        # 603418 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400bc6:	68 17 00 00 00       	pushq  $0x17
  400bcb:	e9 70 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bd0 <strcpy@plt>:
  400bd0:	ff 25 4a 28 20 00    	jmpq   *0x20284a(%rip)        # 603420 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400bd6:	68 18 00 00 00       	pushq  $0x18
  400bdb:	e9 60 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400be0 <fprintf@plt>:
  400be0:	ff 25 42 28 20 00    	jmpq   *0x202842(%rip)        # 603428 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400be6:	68 19 00 00 00       	pushq  $0x19
  400beb:	e9 50 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bf0 <write@plt>:
  400bf0:	ff 25 3a 28 20 00    	jmpq   *0x20283a(%rip)        # 603430 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400bf6:	68 1a 00 00 00       	pushq  $0x1a
  400bfb:	e9 40 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400c00 <fflush@plt>:
  400c00:	ff 25 32 28 20 00    	jmpq   *0x202832(%rip)        # 603438 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400c06:	68 1b 00 00 00       	pushq  $0x1b
  400c0b:	e9 30 fe ff ff       	jmpq   400a40 <_init+0x18>

Disassembly of section .text:

0000000000400c10 <_start>:
  400c10:	31 ed                	xor    %ebp,%ebp
  400c12:	49 89 d1             	mov    %rdx,%r9
  400c15:	5e                   	pop    %rsi
  400c16:	48 89 e2             	mov    %rsp,%rdx
  400c19:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400c1d:	50                   	push   %rax
  400c1e:	54                   	push   %rsp
  400c1f:	49 c7 c0 40 24 40 00 	mov    $0x402440,%r8
  400c26:	48 c7 c1 50 24 40 00 	mov    $0x402450,%rcx
  400c2d:	48 c7 c7 e8 0c 40 00 	mov    $0x400ce8,%rdi
  400c34:	e8 a7 fe ff ff       	callq  400ae0 <__libc_start_main@plt>
  400c39:	f4                   	hlt    
  400c3a:	90                   	nop
  400c3b:	90                   	nop

0000000000400c3c <call_gmon_start>:
  400c3c:	48 83 ec 08          	sub    $0x8,%rsp
  400c40:	48 8b 05 f9 26 20 00 	mov    0x2026f9(%rip),%rax        # 603340 <_DYNAMIC+0x190>
  400c47:	48 85 c0             	test   %rax,%rax
  400c4a:	74 02                	je     400c4e <call_gmon_start+0x12>
  400c4c:	ff d0                	callq  *%rax
  400c4e:	48 83 c4 08          	add    $0x8,%rsp
  400c52:	c3                   	retq   
  400c53:	90                   	nop
  400c54:	90                   	nop
  400c55:	90                   	nop
  400c56:	90                   	nop
  400c57:	90                   	nop
  400c58:	90                   	nop
  400c59:	90                   	nop
  400c5a:	90                   	nop
  400c5b:	90                   	nop
  400c5c:	90                   	nop
  400c5d:	90                   	nop
  400c5e:	90                   	nop
  400c5f:	90                   	nop

0000000000400c60 <__do_global_dtors_aux>:
  400c60:	55                   	push   %rbp
  400c61:	48 89 e5             	mov    %rsp,%rbp
  400c64:	53                   	push   %rbx
  400c65:	48 83 ec 08          	sub    $0x8,%rsp
  400c69:	80 3d f0 30 20 00 00 	cmpb   $0x0,0x2030f0(%rip)        # 603d60 <completed.6145>
  400c70:	75 44                	jne    400cb6 <__do_global_dtors_aux+0x56>
  400c72:	b8 a0 31 60 00       	mov    $0x6031a0,%eax
  400c77:	48 2d 98 31 60 00    	sub    $0x603198,%rax
  400c7d:	48 c1 f8 03          	sar    $0x3,%rax
  400c81:	48 8d 58 ff          	lea    -0x1(%rax),%rbx
  400c85:	48 8b 05 cc 30 20 00 	mov    0x2030cc(%rip),%rax        # 603d58 <dtor_idx.6147>
  400c8c:	48 39 c3             	cmp    %rax,%rbx
  400c8f:	76 1e                	jbe    400caf <__do_global_dtors_aux+0x4f>
  400c91:	48 83 c0 01          	add    $0x1,%rax
  400c95:	48 89 05 bc 30 20 00 	mov    %rax,0x2030bc(%rip)        # 603d58 <dtor_idx.6147>
  400c9c:	ff 14 c5 98 31 60 00 	callq  *0x603198(,%rax,8)
  400ca3:	48 8b 05 ae 30 20 00 	mov    0x2030ae(%rip),%rax        # 603d58 <dtor_idx.6147>
  400caa:	48 39 c3             	cmp    %rax,%rbx
  400cad:	77 e2                	ja     400c91 <__do_global_dtors_aux+0x31>
  400caf:	c6 05 aa 30 20 00 01 	movb   $0x1,0x2030aa(%rip)        # 603d60 <completed.6145>
  400cb6:	48 83 c4 08          	add    $0x8,%rsp
  400cba:	5b                   	pop    %rbx
  400cbb:	c9                   	leaveq 
  400cbc:	c3                   	retq   
  400cbd:	0f 1f 00             	nopl   (%rax)

0000000000400cc0 <frame_dummy>:
  400cc0:	55                   	push   %rbp
  400cc1:	48 83 3d df 24 20 00 	cmpq   $0x0,0x2024df(%rip)        # 6031a8 <__JCR_END__>
  400cc8:	00 
  400cc9:	48 89 e5             	mov    %rsp,%rbp
  400ccc:	74 16                	je     400ce4 <frame_dummy+0x24>
  400cce:	b8 00 00 00 00       	mov    $0x0,%eax
  400cd3:	48 85 c0             	test   %rax,%rax
  400cd6:	74 0c                	je     400ce4 <frame_dummy+0x24>
  400cd8:	bf a8 31 60 00       	mov    $0x6031a8,%edi
  400cdd:	49 89 c3             	mov    %rax,%r11
  400ce0:	c9                   	leaveq 
  400ce1:	41 ff e3             	jmpq   *%r11
  400ce4:	c9                   	leaveq 
  400ce5:	c3                   	retq   
  400ce6:	90                   	nop
  400ce7:	90                   	nop

0000000000400ce8 <main>:
  400ce8:	53                   	push   %rbx
  400ce9:	48 89 f3             	mov    %rsi,%rbx
  400cec:	83 ff 01             	cmp    $0x1,%edi
  400cef:	75 10                	jne    400d01 <main+0x19>
  400cf1:	48 8b 05 48 30 20 00 	mov    0x203048(%rip),%rax        # 603d40 <__bss_start>
  400cf8:	48 89 05 69 30 20 00 	mov    %rax,0x203069(%rip)        # 603d68 <infile>
  400cff:	eb 56                	jmp    400d57 <main+0x6f>
  400d01:	83 ff 02             	cmp    $0x2,%edi
  400d04:	75 35                	jne    400d3b <main+0x53>
  400d06:	be 50 25 40 00       	mov    $0x402550,%esi
  400d0b:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  400d0f:	e8 bc fd ff ff       	callq  400ad0 <fopen@plt>
  400d14:	48 89 05 4d 30 20 00 	mov    %rax,0x20304d(%rip)        # 603d68 <infile>
  400d1b:	48 85 c0             	test   %rax,%rax
  400d1e:	75 37                	jne    400d57 <main+0x6f>
  400d20:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400d24:	48 8b 33             	mov    (%rbx),%rsi
  400d27:	bf 52 25 40 00       	mov    $0x402552,%edi
  400d2c:	e8 1f fd ff ff       	callq  400a50 <printf@plt>
  400d31:	bf 08 00 00 00       	mov    $0x8,%edi
  400d36:	e8 65 fd ff ff       	callq  400aa0 <exit@plt>
  400d3b:	48 8b 36             	mov    (%rsi),%rsi
  400d3e:	bf 6f 25 40 00       	mov    $0x40256f,%edi
  400d43:	b8 00 00 00 00       	mov    $0x0,%eax
  400d48:	e8 03 fd ff ff       	callq  400a50 <printf@plt>
  400d4d:	bf 08 00 00 00       	mov    $0x8,%edi
  400d52:	e8 49 fd ff ff       	callq  400aa0 <exit@plt>
  400d57:	e8 25 09 00 00       	callq  401681 <initialize_bomb>
  400d5c:	bf d8 25 40 00       	mov    $0x4025d8,%edi
  400d61:	e8 2a fd ff ff       	callq  400a90 <puts@plt>
  400d66:	bf 18 26 40 00       	mov    $0x402618,%edi
  400d6b:	e8 20 fd ff ff       	callq  400a90 <puts@plt>
  400d70:	e8 e2 07 00 00       	callq  401557 <read_line>
  400d75:	48 89 c7             	mov    %rax,%rdi
  400d78:	e8 c4 04 00 00       	callq  401241 <phase_1>
  400d7d:	e8 53 06 00 00       	callq  4013d5 <phase_defused>
  400d82:	bf 48 26 40 00       	mov    $0x402648,%edi
  400d87:	e8 04 fd ff ff       	callq  400a90 <puts@plt>
  400d8c:	e8 c6 07 00 00       	callq  401557 <read_line>
  400d91:	48 89 c7             	mov    %rax,%rdi
  400d94:	e8 82 02 00 00       	callq  40101b <phase_2>
  400d99:	e8 37 06 00 00       	callq  4013d5 <phase_defused>
  400d9e:	bf 89 25 40 00       	mov    $0x402589,%edi
  400da3:	e8 e8 fc ff ff       	callq  400a90 <puts@plt>
  400da8:	e8 aa 07 00 00       	callq  401557 <read_line>
  400dad:	48 89 c7             	mov    %rax,%rdi
  400db0:	e8 44 03 00 00       	callq  4010f9 <phase_3>
  400db5:	e8 1b 06 00 00       	callq  4013d5 <phase_defused>
  400dba:	bf a7 25 40 00       	mov    $0x4025a7,%edi
  400dbf:	e8 cc fc ff ff       	callq  400a90 <puts@plt>
  400dc4:	e8 8e 07 00 00       	callq  401557 <read_line>
  400dc9:	48 89 c7             	mov    %rax,%rdi
  400dcc:	e8 d5 02 00 00       	callq  4010a6 <phase_4>
  400dd1:	e8 ff 05 00 00       	callq  4013d5 <phase_defused>
  400dd6:	bf 78 26 40 00       	mov    $0x402678,%edi
  400ddb:	e8 b0 fc ff ff       	callq  400a90 <puts@plt>
  400de0:	e8 72 07 00 00       	callq  401557 <read_line>
  400de5:	48 89 c7             	mov    %rax,%rdi
  400de8:	e8 77 02 00 00       	callq  401064 <phase_5>
  400ded:	e8 e3 05 00 00       	callq  4013d5 <phase_defused>
  400df2:	bf b6 25 40 00       	mov    $0x4025b6,%edi
  400df7:	e8 94 fc ff ff       	callq  400a90 <puts@plt>
  400dfc:	e8 56 07 00 00       	callq  401557 <read_line>
  400e01:	48 89 c7             	mov    %rax,%rdi
  400e04:	e8 fc 00 00 00       	callq  400f05 <phase_6>
  400e09:	e8 c7 05 00 00       	callq  4013d5 <phase_defused>
  400e0e:	b8 00 00 00 00       	mov    $0x0,%eax
  400e13:	5b                   	pop    %rbx
  400e14:	c3                   	retq   
  400e15:	90                   	nop
  400e16:	90                   	nop
  400e17:	90                   	nop
  400e18:	90                   	nop
  400e19:	90                   	nop
  400e1a:	90                   	nop
  400e1b:	90                   	nop
  400e1c:	90                   	nop
  400e1d:	90                   	nop
  400e1e:	90                   	nop
  400e1f:	90                   	nop

0000000000400e20 <func4>:
  400e20:	48 89 5c 24 e8       	mov    %rbx,-0x18(%rsp)
  400e25:	48 89 6c 24 f0       	mov    %rbp,-0x10(%rsp)
  400e2a:	4c 89 64 24 f8       	mov    %r12,-0x8(%rsp)
  400e2f:	48 83 ec 18          	sub    $0x18,%rsp
  400e33:	89 fd                	mov    %edi,%ebp
  400e35:	41 89 f4             	mov    %esi,%r12d
  400e38:	85 ff                	test   %edi,%edi
  400e3a:	7f 08                	jg     400e44 <func4+0x24>
  400e3c:	41 bc 00 00 00 00    	mov    $0x0,%r12d
  400e42:	eb 23                	jmp    400e67 <func4+0x47>
  400e44:	83 ff 01             	cmp    $0x1,%edi
  400e47:	74 1e                	je     400e67 <func4+0x47>
  400e49:	8d 7d ff             	lea    -0x1(%rbp),%edi
  400e4c:	0f 1f 40 00          	nopl   0x0(%rax)
  400e50:	e8 cb ff ff ff       	callq  400e20 <func4>
  400e55:	89 c3                	mov    %eax,%ebx
  400e57:	8d 7d fe             	lea    -0x2(%rbp),%edi
  400e5a:	44 89 e6             	mov    %r12d,%esi
  400e5d:	e8 be ff ff ff       	callq  400e20 <func4>
  400e62:	01 d8                	add    %ebx,%eax
  400e64:	41 01 c4             	add    %eax,%r12d
  400e67:	44 89 e0             	mov    %r12d,%eax
  400e6a:	48 8b 1c 24          	mov    (%rsp),%rbx
  400e6e:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
  400e73:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  400e78:	48 83 c4 18          	add    $0x18,%rsp
  400e7c:	c3                   	retq   

0000000000400e7d <fun7>:
  400e7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  400e82:	48 85 ff             	test   %rdi,%rdi
  400e85:	74 28                	je     400eaf <fun7+0x32>
  400e87:	8b 17                	mov    (%rdi),%edx
  400e89:	39 f2                	cmp    %esi,%edx
  400e8b:	7e 0c                	jle    400e99 <fun7+0x1c>
  400e8d:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  400e91:	e8 e7 ff ff ff       	callq  400e7d <fun7>
  400e96:	01 c0                	add    %eax,%eax
  400e98:	c3                   	retq   
  400e99:	b8 00 00 00 00       	mov    $0x0,%eax
  400e9e:	39 f2                	cmp    %esi,%edx
  400ea0:	74 0d                	je     400eaf <fun7+0x32>
  400ea2:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  400ea6:	e8 d2 ff ff ff       	callq  400e7d <fun7>
  400eab:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  400eaf:	f3 c3                	repz retq 

0000000000400eb1 <secret_phase>:
  400eb1:	53                   	push   %rbx
  400eb2:	e8 a0 06 00 00       	callq  401557 <read_line>
  400eb7:	48 89 c7             	mov    %rax,%rdi
  400eba:	b9 00 00 00 00       	mov    $0x0,%ecx
  400ebf:	ba 0a 00 00 00       	mov    $0xa,%edx
  400ec4:	be 00 00 00 00       	mov    $0x0,%esi
  400ec9:	e8 62 fc ff ff       	callq  400b30 <__strtol_internal@plt>
  400ece:	89 c3                	mov    %eax,%ebx
  400ed0:	8d 40 ff             	lea    -0x1(%rax),%eax
  400ed3:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  400ed8:	76 05                	jbe    400edf <secret_phase+0x2e>
  400eda:	e8 82 05 00 00       	callq  401461 <explode_bomb>
  400edf:	89 de                	mov    %ebx,%esi
  400ee1:	bf a0 3a 60 00       	mov    $0x603aa0,%edi
  400ee6:	e8 92 ff ff ff       	callq  400e7d <fun7>
  400eeb:	85 c0                	test   %eax,%eax
  400eed:	74 05                	je     400ef4 <secret_phase+0x43>
  400eef:	e8 6d 05 00 00       	callq  401461 <explode_bomb>
  400ef4:	bf a0 26 40 00       	mov    $0x4026a0,%edi
  400ef9:	e8 92 fb ff ff       	callq  400a90 <puts@plt>
  400efe:	e8 d2 04 00 00       	callq  4013d5 <phase_defused>
  400f03:	5b                   	pop    %rbx
  400f04:	c3                   	retq   

0000000000400f05 <phase_6>:
  400f05:	41 57                	push   %r15
  400f07:	41 56                	push   %r14
  400f09:	41 55                	push   %r13
  400f0b:	41 54                	push   %r12
  400f0d:	55                   	push   %rbp
  400f0e:	53                   	push   %rbx
  400f0f:	48 83 ec 58          	sub    $0x58,%rsp
  400f13:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  400f18:	e8 7a 05 00 00       	callq  401497 <read_six_numbers>
  400f1d:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  400f23:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
  400f28:	4d 89 f7             	mov    %r14,%r15
  400f2b:	4d 89 ec             	mov    %r13,%r12
  400f2e:	43 8b 04 ae          	mov    (%r14,%r13,4),%eax
  400f32:	83 e8 01             	sub    $0x1,%eax
  400f35:	83 f8 05             	cmp    $0x5,%eax
  400f38:	76 05                	jbe    400f3f <phase_6+0x3a>
  400f3a:	e8 22 05 00 00       	callq  401461 <explode_bomb>
  400f3f:	41 8d 5d 01          	lea    0x1(%r13),%ebx
  400f43:	49 83 fd 05          	cmp    $0x5,%r13
  400f47:	0f 84 ab 00 00 00    	je     400ff8 <phase_6+0xf3>
  400f4d:	4c 89 fd             	mov    %r15,%rbp
  400f50:	48 63 d3             	movslq %ebx,%rdx
  400f53:	42 8b 44 a5 00       	mov    0x0(%rbp,%r12,4),%eax
  400f58:	3b 44 94 30          	cmp    0x30(%rsp,%rdx,4),%eax
  400f5c:	75 05                	jne    400f63 <phase_6+0x5e>
  400f5e:	e8 fe 04 00 00       	callq  401461 <explode_bomb>
  400f63:	83 c3 01             	add    $0x1,%ebx
  400f66:	83 fb 05             	cmp    $0x5,%ebx
  400f69:	7e e5                	jle    400f50 <phase_6+0x4b>
  400f6b:	49 83 c5 01          	add    $0x1,%r13
  400f6f:	90                   	nop
  400f70:	eb b9                	jmp    400f2b <phase_6+0x26>
  400f72:	48 8b 76 08          	mov    0x8(%rsi),%rsi
  400f76:	83 c2 01             	add    $0x1,%edx
  400f79:	48 63 c1             	movslq %ecx,%rax
  400f7c:	3b 54 84 30          	cmp    0x30(%rsp,%rax,4),%edx
  400f80:	7c f0                	jl     400f72 <phase_6+0x6d>
  400f82:	48 89 34 c4          	mov    %rsi,(%rsp,%rax,8)
  400f86:	83 c1 01             	add    $0x1,%ecx
  400f89:	83 f9 05             	cmp    $0x5,%ecx
  400f8c:	7f 0c                	jg     400f9a <phase_6+0x95>
  400f8e:	be d0 38 60 00       	mov    $0x6038d0,%esi
  400f93:	ba 01 00 00 00       	mov    $0x1,%edx
  400f98:	eb df                	jmp    400f79 <phase_6+0x74>
  400f9a:	48 8b 0c 24          	mov    (%rsp),%rcx
  400f9e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  400fa3:	48 89 41 08          	mov    %rax,0x8(%rcx)
  400fa7:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  400fac:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400fb0:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  400fb5:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400fb9:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  400fbe:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400fc2:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  400fc7:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400fcb:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  400fd2:	00 
  400fd3:	48 89 cb             	mov    %rcx,%rbx
  400fd6:	bd 00 00 00 00       	mov    $0x0,%ebp
  400fdb:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400fdf:	8b 03                	mov    (%rbx),%eax
  400fe1:	3b 02                	cmp    (%rdx),%eax
  400fe3:	7e 05                	jle    400fea <phase_6+0xe5>
  400fe5:	e8 77 04 00 00       	callq  401461 <explode_bomb>
  400fea:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  400fee:	83 c5 01             	add    $0x1,%ebp
  400ff1:	83 fd 05             	cmp    $0x5,%ebp
  400ff4:	74 16                	je     40100c <phase_6+0x107>
  400ff6:	eb e3                	jmp    400fdb <phase_6+0xd6>
  400ff8:	be d0 38 60 00       	mov    $0x6038d0,%esi
  400ffd:	ba 01 00 00 00       	mov    $0x1,%edx
  401002:	b9 00 00 00 00       	mov    $0x0,%ecx
  401007:	e9 6d ff ff ff       	jmpq   400f79 <phase_6+0x74>
  40100c:	48 83 c4 58          	add    $0x58,%rsp
  401010:	5b                   	pop    %rbx
  401011:	5d                   	pop    %rbp
  401012:	41 5c                	pop    %r12
  401014:	41 5d                	pop    %r13
  401016:	41 5e                	pop    %r14
  401018:	41 5f                	pop    %r15
  40101a:	c3                   	retq   

000000000040101b <phase_2>:
  40101b:	55                   	push   %rbp
  40101c:	53                   	push   %rbx
  40101d:	48 83 ec 28          	sub    $0x28,%rsp
  401021:	48 89 e6             	mov    %rsp,%rsi
  401024:	e8 6e 04 00 00       	callq  401497 <read_six_numbers>
  401029:	83 3c 24 00          	cmpl   $0x0,(%rsp)
  40102d:	75 07                	jne    401036 <phase_2+0x1b>
  40102f:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
  401034:	74 05                	je     40103b <phase_2+0x20>
  401036:	e8 26 04 00 00       	callq  401461 <explode_bomb>
  40103b:	48 8d 5c 24 08       	lea    0x8(%rsp),%rbx
  401040:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
  401045:	8b 43 f8             	mov    -0x8(%rbx),%eax
  401048:	03 43 fc             	add    -0x4(%rbx),%eax
  40104b:	39 03                	cmp    %eax,(%rbx)
  40104d:	74 05                	je     401054 <phase_2+0x39>
  40104f:	e8 0d 04 00 00       	callq  401461 <explode_bomb>
  401054:	48 83 c3 04          	add    $0x4,%rbx
  401058:	48 39 eb             	cmp    %rbp,%rbx
  40105b:	75 e8                	jne    401045 <phase_2+0x2a>
  40105d:	48 83 c4 28          	add    $0x28,%rsp
  401061:	5b                   	pop    %rbx
  401062:	5d                   	pop    %rbp
  401063:	c3                   	retq   

0000000000401064 <phase_5>:
  401064:	53                   	push   %rbx
  401065:	48 89 fb             	mov    %rdi,%rbx
  401068:	e8 03 02 00 00       	callq  401270 <string_length>
  40106d:	83 f8 06             	cmp    $0x6,%eax
  401070:	74 05                	je     401077 <phase_5+0x13>
  401072:	e8 ea 03 00 00       	callq  401461 <explode_bomb>
  401077:	b9 00 00 00 00       	mov    $0x0,%ecx
  40107c:	ba 00 00 00 00       	mov    $0x0,%edx
  401081:	48 0f be 04 1a       	movsbq (%rdx,%rbx,1),%rax
  401086:	83 e0 0f             	and    $0xf,%eax
  401089:	03 0c 85 60 27 40 00 	add    0x402760(,%rax,4),%ecx
  401090:	48 83 c2 01          	add    $0x1,%rdx
  401094:	48 83 fa 06          	cmp    $0x6,%rdx
  401098:	75 e7                	jne    401081 <phase_5+0x1d>
  40109a:	83 f9 38             	cmp    $0x38,%ecx
  40109d:	74 05                	je     4010a4 <phase_5+0x40>
  40109f:	e8 bd 03 00 00       	callq  401461 <explode_bomb>
  4010a4:	5b                   	pop    %rbx
  4010a5:	c3                   	retq   

00000000004010a6 <phase_4>:
  4010a6:	48 83 ec 18          	sub    $0x18,%rsp
  4010aa:	48 8d 4c 24 14       	lea    0x14(%rsp),%rcx
  4010af:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
  4010b4:	be 0d 28 40 00       	mov    $0x40280d,%esi
  4010b9:	b8 00 00 00 00       	mov    $0x0,%eax
  4010be:	e8 7d fa ff ff       	callq  400b40 <sscanf@plt>
  4010c3:	83 f8 02             	cmp    $0x2,%eax
  4010c6:	75 0e                	jne    4010d6 <phase_4+0x30>
  4010c8:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4010cc:	83 f8 01             	cmp    $0x1,%eax
  4010cf:	7e 05                	jle    4010d6 <phase_4+0x30>
  4010d1:	83 f8 04             	cmp    $0x4,%eax
  4010d4:	7e 05                	jle    4010db <phase_4+0x35>
  4010d6:	e8 86 03 00 00       	callq  401461 <explode_bomb>
  4010db:	8b 74 24 14          	mov    0x14(%rsp),%esi
  4010df:	bf 09 00 00 00       	mov    $0x9,%edi
  4010e4:	e8 37 fd ff ff       	callq  400e20 <func4>
  4010e9:	3b 44 24 10          	cmp    0x10(%rsp),%eax
  4010ed:	74 05                	je     4010f4 <phase_4+0x4e>
  4010ef:	e8 6d 03 00 00       	callq  401461 <explode_bomb>
  4010f4:	48 83 c4 18          	add    $0x18,%rsp
  4010f8:	c3                   	retq   

00000000004010f9 <phase_3>:
  4010f9:	48 83 ec 18          	sub    $0x18,%rsp
  4010fd:	48 8d 4c 24 0f       	lea    0xf(%rsp),%rcx
  401102:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  401107:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  40110c:	be f9 26 40 00       	mov    $0x4026f9,%esi
  401111:	b8 00 00 00 00       	mov    $0x0,%eax
  401116:	e8 25 fa ff ff       	callq  400b40 <sscanf@plt>
  40111b:	83 f8 02             	cmp    $0x2,%eax
  40111e:	7f 05                	jg     401125 <phase_3+0x2c>
  401120:	e8 3c 03 00 00       	callq  401461 <explode_bomb>
  401125:	83 7c 24 14 07       	cmpl   $0x7,0x14(%rsp)
  40112a:	0f 87 ef 00 00 00    	ja     40121f <phase_3+0x126>
  401130:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401134:	ff 24 c5 20 27 40 00 	jmpq   *0x402720(,%rax,8)
  40113b:	81 7c 24 10 2d 03 00 	cmpl   $0x32d,0x10(%rsp)
  401142:	00 
  401143:	0f 84 e3 00 00 00    	je     40122c <phase_3+0x133>
  401149:	e8 13 03 00 00       	callq  401461 <explode_bomb>
  40114e:	b8 69 00 00 00       	mov    $0x69,%eax
  401153:	e9 d9 00 00 00       	jmpq   401231 <phase_3+0x138>
  401158:	b8 64 00 00 00       	mov    $0x64,%eax
  40115d:	83 7c 24 10 57       	cmpl   $0x57,0x10(%rsp)
  401162:	0f 84 c9 00 00 00    	je     401231 <phase_3+0x138>
  401168:	e8 f4 02 00 00       	callq  401461 <explode_bomb>
  40116d:	b8 64 00 00 00       	mov    $0x64,%eax
  401172:	e9 ba 00 00 00       	jmpq   401231 <phase_3+0x138>
  401177:	b8 67 00 00 00       	mov    $0x67,%eax
  40117c:	81 7c 24 10 68 01 00 	cmpl   $0x168,0x10(%rsp)
  401183:	00 
  401184:	0f 84 a7 00 00 00    	je     401231 <phase_3+0x138>
  40118a:	e8 d2 02 00 00       	callq  401461 <explode_bomb>
  40118f:	b8 67 00 00 00       	mov    $0x67,%eax
  401194:	e9 98 00 00 00       	jmpq   401231 <phase_3+0x138>
  401199:	b8 72 00 00 00       	mov    $0x72,%eax
  40119e:	81 7c 24 10 3d 03 00 	cmpl   $0x33d,0x10(%rsp)
  4011a5:	00 
  4011a6:	0f 84 85 00 00 00    	je     401231 <phase_3+0x138>
  4011ac:	e8 b0 02 00 00       	callq  401461 <explode_bomb>
  4011b1:	b8 72 00 00 00       	mov    $0x72,%eax
  4011b6:	eb 79                	jmp    401231 <phase_3+0x138>
  4011b8:	83 7c 24 10 45       	cmpl   $0x45,0x10(%rsp)
  4011bd:	0f 1f 00             	nopl   (%rax)
  4011c0:	74 6a                	je     40122c <phase_3+0x133>
  4011c2:	e8 9a 02 00 00       	callq  401461 <explode_bomb>
  4011c7:	b8 69 00 00 00       	mov    $0x69,%eax
  4011cc:	eb 63                	jmp    401231 <phase_3+0x138>
  4011ce:	b8 76 00 00 00       	mov    $0x76,%eax
  4011d3:	81 7c 24 10 88 03 00 	cmpl   $0x388,0x10(%rsp)
  4011da:	00 
  4011db:	74 54                	je     401231 <phase_3+0x138>
  4011dd:	e8 7f 02 00 00       	callq  401461 <explode_bomb>
  4011e2:	b8 76 00 00 00       	mov    $0x76,%eax
  4011e7:	eb 48                	jmp    401231 <phase_3+0x138>
  4011e9:	b8 61 00 00 00       	mov    $0x61,%eax
  4011ee:	81 7c 24 10 de 03 00 	cmpl   $0x3de,0x10(%rsp)
  4011f5:	00 
  4011f6:	74 39                	je     401231 <phase_3+0x138>
  4011f8:	e8 64 02 00 00       	callq  401461 <explode_bomb>
  4011fd:	b8 61 00 00 00       	mov    $0x61,%eax
  401202:	eb 2d                	jmp    401231 <phase_3+0x138>
  401204:	b8 6d 00 00 00       	mov    $0x6d,%eax
  401209:	81 7c 24 10 f0 02 00 	cmpl   $0x2f0,0x10(%rsp)
  401210:	00 
  401211:	74 1e                	je     401231 <phase_3+0x138>
  401213:	e8 49 02 00 00       	callq  401461 <explode_bomb>
  401218:	b8 6d 00 00 00       	mov    $0x6d,%eax
  40121d:	eb 12                	jmp    401231 <phase_3+0x138>
  40121f:	90                   	nop
  401220:	e8 3c 02 00 00       	callq  401461 <explode_bomb>
  401225:	b8 70 00 00 00       	mov    $0x70,%eax
  40122a:	eb 05                	jmp    401231 <phase_3+0x138>
  40122c:	b8 69 00 00 00       	mov    $0x69,%eax
  401231:	3a 44 24 0f          	cmp    0xf(%rsp),%al
  401235:	74 05                	je     40123c <phase_3+0x143>
  401237:	e8 25 02 00 00       	callq  401461 <explode_bomb>
  40123c:	48 83 c4 18          	add    $0x18,%rsp
  401240:	c3                   	retq   

0000000000401241 <phase_1>:
  401241:	48 83 ec 08          	sub    $0x8,%rsp
  401245:	be c8 26 40 00       	mov    $0x4026c8,%esi
  40124a:	e8 40 00 00 00       	callq  40128f <strings_not_equal>
  40124f:	85 c0                	test   %eax,%eax
  401251:	74 05                	je     401258 <phase_1+0x17>
  401253:	e8 09 02 00 00       	callq  401461 <explode_bomb>
  401258:	48 83 c4 08          	add    $0x8,%rsp
  40125c:	0f 1f 40 00          	nopl   0x0(%rax)
  401260:	c3                   	retq   
  401261:	90                   	nop
  401262:	90                   	nop
  401263:	90                   	nop
  401264:	90                   	nop
  401265:	90                   	nop
  401266:	90                   	nop
  401267:	90                   	nop
  401268:	90                   	nop
  401269:	90                   	nop
  40126a:	90                   	nop
  40126b:	90                   	nop
  40126c:	90                   	nop
  40126d:	90                   	nop
  40126e:	90                   	nop
  40126f:	90                   	nop

0000000000401270 <string_length>:
  401270:	b8 00 00 00 00       	mov    $0x0,%eax
  401275:	80 3f 00             	cmpb   $0x0,(%rdi)
  401278:	74 13                	je     40128d <string_length+0x1d>
  40127a:	48 89 fa             	mov    %rdi,%rdx
  40127d:	0f b6 42 01          	movzbl 0x1(%rdx),%eax
  401281:	48 83 c2 01          	add    $0x1,%rdx
  401285:	84 c0                	test   %al,%al
  401287:	75 f4                	jne    40127d <string_length+0xd>
  401289:	89 d0                	mov    %edx,%eax
  40128b:	29 f8                	sub    %edi,%eax
  40128d:	f3 c3                	repz retq 

000000000040128f <strings_not_equal>:
  40128f:	41 54                	push   %r12
  401291:	55                   	push   %rbp
  401292:	53                   	push   %rbx
  401293:	48 89 fd             	mov    %rdi,%rbp
  401296:	49 89 f4             	mov    %rsi,%r12
  401299:	e8 d2 ff ff ff       	callq  401270 <string_length>
  40129e:	89 c3                	mov    %eax,%ebx
  4012a0:	4c 89 e7             	mov    %r12,%rdi
  4012a3:	e8 c8 ff ff ff       	callq  401270 <string_length>
  4012a8:	39 c3                	cmp    %eax,%ebx
  4012aa:	75 32                	jne    4012de <strings_not_equal+0x4f>
  4012ac:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  4012b0:	84 c0                	test   %al,%al
  4012b2:	74 31                	je     4012e5 <strings_not_equal+0x56>
  4012b4:	48 89 e9             	mov    %rbp,%rcx
  4012b7:	4c 89 e2             	mov    %r12,%rdx
  4012ba:	41 3a 04 24          	cmp    (%r12),%al
  4012be:	74 13                	je     4012d3 <strings_not_equal+0x44>
  4012c0:	eb 1c                	jmp    4012de <strings_not_equal+0x4f>
  4012c2:	0f b6 42 01          	movzbl 0x1(%rdx),%eax
  4012c6:	48 83 c1 01          	add    $0x1,%rcx
  4012ca:	48 83 c2 01          	add    $0x1,%rdx
  4012ce:	40 38 c6             	cmp    %al,%sil
  4012d1:	75 0b                	jne    4012de <strings_not_equal+0x4f>
  4012d3:	0f b6 71 01          	movzbl 0x1(%rcx),%esi
  4012d7:	40 84 f6             	test   %sil,%sil
  4012da:	75 e6                	jne    4012c2 <strings_not_equal+0x33>
  4012dc:	eb 07                	jmp    4012e5 <strings_not_equal+0x56>
  4012de:	b8 01 00 00 00       	mov    $0x1,%eax
  4012e3:	eb 05                	jmp    4012ea <strings_not_equal+0x5b>
  4012e5:	b8 00 00 00 00       	mov    $0x0,%eax
  4012ea:	5b                   	pop    %rbx
  4012eb:	5d                   	pop    %rbp
  4012ec:	41 5c                	pop    %r12
  4012ee:	66 90                	xchg   %ax,%ax
  4012f0:	c3                   	retq   

00000000004012f1 <initialize_bomb_solve>:
  4012f1:	f3 c3                	repz retq 

00000000004012f3 <invalid_phase>:
  4012f3:	48 83 ec 08          	sub    $0x8,%rsp
  4012f7:	48 89 fe             	mov    %rdi,%rsi
  4012fa:	bf a0 27 40 00       	mov    $0x4027a0,%edi
  4012ff:	b8 00 00 00 00       	mov    $0x0,%eax
  401304:	e8 47 f7 ff ff       	callq  400a50 <printf@plt>
  401309:	bf 08 00 00 00       	mov    $0x8,%edi
  40130e:	e8 8d f7 ff ff       	callq  400aa0 <exit@plt>

0000000000401313 <send_msg>:
  401313:	55                   	push   %rbp
  401314:	53                   	push   %rbx
  401315:	48 81 ec 08 40 00 00 	sub    $0x4008,%rsp
  40131c:	89 fe                	mov    %edi,%esi
  40131e:	44 8b 05 3f 2a 20 00 	mov    0x202a3f(%rip),%r8d        # 603d64 <num_input_strings>
  401325:	49 63 c0             	movslq %r8d,%rax
  401328:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  40132c:	48 c1 e0 04          	shl    $0x4,%rax
  401330:	48 8d 90 30 3d 60 00 	lea    0x603d30(%rax),%rdx
  401337:	48 89 d7             	mov    %rdx,%rdi
  40133a:	fc                   	cld    
  40133b:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401342:	b8 00 00 00 00       	mov    $0x0,%eax
  401347:	f2 ae                	repnz scas %es:(%rdi),%al
  401349:	48 f7 d1             	not    %rcx
  40134c:	48 83 c1 63          	add    $0x63,%rcx
  401350:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  401357:	76 14                	jbe    40136d <send_msg+0x5a>
  401359:	bf 88 29 40 00       	mov    $0x402988,%edi
  40135e:	e8 ed f6 ff ff       	callq  400a50 <printf@plt>
  401363:	bf 08 00 00 00       	mov    $0x8,%edi
  401368:	e8 33 f7 ff ff       	callq  400aa0 <exit@plt>
  40136d:	85 f6                	test   %esi,%esi
  40136f:	b9 b9 27 40 00       	mov    $0x4027b9,%ecx
  401374:	b8 b1 27 40 00       	mov    $0x4027b1,%eax
  401379:	48 0f 45 c8          	cmovne %rax,%rcx
  40137d:	48 8d 9c 24 00 20 00 	lea    0x2000(%rsp),%rbx
  401384:	00 
  401385:	49 89 d1             	mov    %rdx,%r9
  401388:	8b 15 d2 20 20 00    	mov    0x2020d2(%rip),%edx        # 603460 <bomb_id>
  40138e:	be c2 27 40 00       	mov    $0x4027c2,%esi
  401393:	48 89 df             	mov    %rbx,%rdi
  401396:	b8 00 00 00 00       	mov    $0x0,%eax
  40139b:	e8 80 f7 ff ff       	callq  400b20 <sprintf@plt>
  4013a0:	48 89 e1             	mov    %rsp,%rcx
  4013a3:	ba 00 00 00 00       	mov    $0x0,%edx
  4013a8:	48 89 de             	mov    %rbx,%rsi
  4013ab:	bf 80 34 60 00       	mov    $0x603480,%edi
  4013b0:	e8 db 0f 00 00       	callq  402390 <driver_post>
  4013b5:	85 c0                	test   %eax,%eax
  4013b7:	79 12                	jns    4013cb <send_msg+0xb8>
  4013b9:	48 89 e7             	mov    %rsp,%rdi
  4013bc:	e8 cf f6 ff ff       	callq  400a90 <puts@plt>
  4013c1:	bf 00 00 00 00       	mov    $0x0,%edi
  4013c6:	e8 d5 f6 ff ff       	callq  400aa0 <exit@plt>
  4013cb:	48 81 c4 08 40 00 00 	add    $0x4008,%rsp
  4013d2:	5b                   	pop    %rbx
  4013d3:	5d                   	pop    %rbp
  4013d4:	c3                   	retq   

00000000004013d5 <phase_defused>:
  4013d5:	53                   	push   %rbx
  4013d6:	48 83 ec 60          	sub    $0x60,%rsp
  4013da:	bf 01 00 00 00       	mov    $0x1,%edi
  4013df:	e8 2f ff ff ff       	callq  401313 <send_msg>
  4013e4:	83 3d 79 29 20 00 06 	cmpl   $0x6,0x202979(%rip)        # 603d64 <num_input_strings>
  4013eb:	75 6e                	jne    40145b <phase_defused+0x86>
  4013ed:	48 8d 5c 24 10       	lea    0x10(%rsp),%rbx
  4013f2:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  4013f7:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  4013fc:	49 89 d8             	mov    %rbx,%r8
  4013ff:	be ce 27 40 00       	mov    $0x4027ce,%esi
  401404:	bf 70 3e 60 00       	mov    $0x603e70,%edi
  401409:	b8 00 00 00 00       	mov    $0x0,%eax
  40140e:	e8 2d f7 ff ff       	callq  400b40 <sscanf@plt>
  401413:	83 f8 03             	cmp    $0x3,%eax
  401416:	75 2f                	jne    401447 <phase_defused+0x72>
  401418:	be d7 27 40 00       	mov    $0x4027d7,%esi
  40141d:	48 89 df             	mov    %rbx,%rdi
  401420:	e8 6a fe ff ff       	callq  40128f <strings_not_equal>
  401425:	85 c0                	test   %eax,%eax
  401427:	75 1e                	jne    401447 <phase_defused+0x72>
  401429:	bf b0 29 40 00       	mov    $0x4029b0,%edi
  40142e:	e8 5d f6 ff ff       	callq  400a90 <puts@plt>
  401433:	bf d8 29 40 00       	mov    $0x4029d8,%edi
  401438:	e8 53 f6 ff ff       	callq  400a90 <puts@plt>
  40143d:	b8 00 00 00 00       	mov    $0x0,%eax
  401442:	e8 6a fa ff ff       	callq  400eb1 <secret_phase>
  401447:	bf 10 2a 40 00       	mov    $0x402a10,%edi
  40144c:	e8 3f f6 ff ff       	callq  400a90 <puts@plt>
  401451:	bf 40 2a 40 00       	mov    $0x402a40,%edi
  401456:	e8 35 f6 ff ff       	callq  400a90 <puts@plt>
  40145b:	48 83 c4 60          	add    $0x60,%rsp
  40145f:	5b                   	pop    %rbx
  401460:	c3                   	retq   

0000000000401461 <explode_bomb>:
  401461:	48 83 ec 08          	sub    $0x8,%rsp
  401465:	bf e1 27 40 00       	mov    $0x4027e1,%edi
  40146a:	e8 21 f6 ff ff       	callq  400a90 <puts@plt>
  40146f:	bf ea 27 40 00       	mov    $0x4027ea,%edi
  401474:	e8 17 f6 ff ff       	callq  400a90 <puts@plt>
  401479:	bf 00 00 00 00       	mov    $0x0,%edi
  40147e:	e8 90 fe ff ff       	callq  401313 <send_msg>
  401483:	bf 88 2a 40 00       	mov    $0x402a88,%edi
  401488:	e8 03 f6 ff ff       	callq  400a90 <puts@plt>
  40148d:	bf 08 00 00 00       	mov    $0x8,%edi
  401492:	e8 09 f6 ff ff       	callq  400aa0 <exit@plt>

0000000000401497 <read_six_numbers>:
  401497:	48 83 ec 18          	sub    $0x18,%rsp
  40149b:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  40149f:	48 8d 46 14          	lea    0x14(%rsi),%rax
  4014a3:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4014a8:	48 8d 46 10          	lea    0x10(%rsi),%rax
  4014ac:	48 89 04 24          	mov    %rax,(%rsp)
  4014b0:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  4014b4:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  4014b8:	48 89 f2             	mov    %rsi,%rdx
  4014bb:	be 01 28 40 00       	mov    $0x402801,%esi
  4014c0:	b8 00 00 00 00       	mov    $0x0,%eax
  4014c5:	e8 76 f6 ff ff       	callq  400b40 <sscanf@plt>
  4014ca:	83 f8 05             	cmp    $0x5,%eax
  4014cd:	7f 05                	jg     4014d4 <read_six_numbers+0x3d>
  4014cf:	e8 8d ff ff ff       	callq  401461 <explode_bomb>
  4014d4:	48 83 c4 18          	add    $0x18,%rsp
  4014d8:	c3                   	retq   

00000000004014d9 <blank_line>:
  4014d9:	55                   	push   %rbp
  4014da:	53                   	push   %rbx
  4014db:	48 83 ec 08          	sub    $0x8,%rsp
  4014df:	48 89 fd             	mov    %rdi,%rbp
  4014e2:	eb 1e                	jmp    401502 <blank_line+0x29>
  4014e4:	e8 27 f6 ff ff       	callq  400b10 <__ctype_b_loc@plt>
  4014e9:	48 0f be d3          	movsbq %bl,%rdx
  4014ed:	48 8b 00             	mov    (%rax),%rax
  4014f0:	f6 44 50 01 20       	testb  $0x20,0x1(%rax,%rdx,2)
  4014f5:	75 07                	jne    4014fe <blank_line+0x25>
  4014f7:	b8 00 00 00 00       	mov    $0x0,%eax
  4014fc:	eb 11                	jmp    40150f <blank_line+0x36>
  4014fe:	48 83 c5 01          	add    $0x1,%rbp
  401502:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  401506:	84 db                	test   %bl,%bl
  401508:	75 da                	jne    4014e4 <blank_line+0xb>
  40150a:	b8 01 00 00 00       	mov    $0x1,%eax
  40150f:	48 83 c4 08          	add    $0x8,%rsp
  401513:	5b                   	pop    %rbx
  401514:	5d                   	pop    %rbp
  401515:	c3                   	retq   

0000000000401516 <skip>:
  401516:	53                   	push   %rbx
  401517:	48 63 3d 46 28 20 00 	movslq 0x202846(%rip),%rdi        # 603d64 <num_input_strings>
  40151e:	48 8d 3c bf          	lea    (%rdi,%rdi,4),%rdi
  401522:	48 c1 e7 04          	shl    $0x4,%rdi
  401526:	48 81 c7 80 3d 60 00 	add    $0x603d80,%rdi
  40152d:	48 8b 15 34 28 20 00 	mov    0x202834(%rip),%rdx        # 603d68 <infile>
  401534:	be 50 00 00 00       	mov    $0x50,%esi
  401539:	e8 b2 f5 ff ff       	callq  400af0 <fgets@plt>
  40153e:	48 89 c3             	mov    %rax,%rbx
  401541:	48 85 c0             	test   %rax,%rax
  401544:	74 0c                	je     401552 <skip+0x3c>
  401546:	48 89 c7             	mov    %rax,%rdi
  401549:	e8 8b ff ff ff       	callq  4014d9 <blank_line>
  40154e:	85 c0                	test   %eax,%eax
  401550:	75 c5                	jne    401517 <skip+0x1>
  401552:	48 89 d8             	mov    %rbx,%rax
  401555:	5b                   	pop    %rbx
  401556:	c3                   	retq   

0000000000401557 <read_line>:
  401557:	53                   	push   %rbx
  401558:	b8 00 00 00 00       	mov    $0x0,%eax
  40155d:	e8 b4 ff ff ff       	callq  401516 <skip>
  401562:	48 85 c0             	test   %rax,%rax
  401565:	75 6e                	jne    4015d5 <read_line+0x7e>
  401567:	48 8b 05 d2 27 20 00 	mov    0x2027d2(%rip),%rax        # 603d40 <__bss_start>
  40156e:	48 39 05 f3 27 20 00 	cmp    %rax,0x2027f3(%rip)        # 603d68 <infile>
  401575:	75 14                	jne    40158b <read_line+0x34>
  401577:	bf 13 28 40 00       	mov    $0x402813,%edi
  40157c:	e8 0f f5 ff ff       	callq  400a90 <puts@plt>
  401581:	bf 08 00 00 00       	mov    $0x8,%edi
  401586:	e8 15 f5 ff ff       	callq  400aa0 <exit@plt>
  40158b:	bf 31 28 40 00       	mov    $0x402831,%edi
  401590:	e8 0b f6 ff ff       	callq  400ba0 <getenv@plt>
  401595:	48 85 c0             	test   %rax,%rax
  401598:	74 0a                	je     4015a4 <read_line+0x4d>
  40159a:	bf 00 00 00 00       	mov    $0x0,%edi
  40159f:	e8 fc f4 ff ff       	callq  400aa0 <exit@plt>
  4015a4:	48 8b 05 95 27 20 00 	mov    0x202795(%rip),%rax        # 603d40 <__bss_start>
  4015ab:	48 89 05 b6 27 20 00 	mov    %rax,0x2027b6(%rip)        # 603d68 <infile>
  4015b2:	b8 00 00 00 00       	mov    $0x0,%eax
  4015b7:	e8 5a ff ff ff       	callq  401516 <skip>
  4015bc:	48 85 c0             	test   %rax,%rax
  4015bf:	75 14                	jne    4015d5 <read_line+0x7e>
  4015c1:	bf 13 28 40 00       	mov    $0x402813,%edi
  4015c6:	e8 c5 f4 ff ff       	callq  400a90 <puts@plt>
  4015cb:	bf 00 00 00 00       	mov    $0x0,%edi
  4015d0:	e8 cb f4 ff ff       	callq  400aa0 <exit@plt>
  4015d5:	48 63 05 88 27 20 00 	movslq 0x202788(%rip),%rax        # 603d64 <num_input_strings>
  4015dc:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4015e0:	48 c1 e0 04          	shl    $0x4,%rax
  4015e4:	48 8d b8 80 3d 60 00 	lea    0x603d80(%rax),%rdi
  4015eb:	fc                   	cld    
  4015ec:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4015f3:	b8 00 00 00 00       	mov    $0x0,%eax
  4015f8:	f2 ae                	repnz scas %es:(%rdi),%al
  4015fa:	48 f7 d1             	not    %rcx
  4015fd:	8d 59 ff             	lea    -0x1(%rcx),%ebx
  401600:	83 fb 4e             	cmp    $0x4e,%ebx
  401603:	7e 50                	jle    401655 <read_line+0xfe>
  401605:	bf 3c 28 40 00       	mov    $0x40283c,%edi
  40160a:	e8 81 f4 ff ff       	callq  400a90 <puts@plt>
  40160f:	8b 05 4f 27 20 00    	mov    0x20274f(%rip),%eax        # 603d64 <num_input_strings>
  401615:	8d 50 01             	lea    0x1(%rax),%edx
  401618:	89 15 46 27 20 00    	mov    %edx,0x202746(%rip)        # 603d64 <num_input_strings>
  40161e:	48 98                	cltq   
  401620:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401624:	48 c1 e0 04          	shl    $0x4,%rax
  401628:	c7 80 80 3d 60 00 2a 	movl   $0x742a2a2a,0x603d80(%rax)
  40162f:	2a 2a 74 
  401632:	c7 80 84 3d 60 00 72 	movl   $0x636e7572,0x603d84(%rax)
  401639:	75 6e 63 
  40163c:	c7 80 88 3d 60 00 61 	movl   $0x64657461,0x603d88(%rax)
  401643:	74 65 64 
  401646:	c7 80 8c 3d 60 00 2a 	movl   $0x2a2a2a,0x603d8c(%rax)
  40164d:	2a 2a 00 
  401650:	e8 0c fe ff ff       	callq  401461 <explode_bomb>
  401655:	8b 0d 09 27 20 00    	mov    0x202709(%rip),%ecx        # 603d64 <num_input_strings>
  40165b:	8d 53 ff             	lea    -0x1(%rbx),%edx
  40165e:	48 63 d2             	movslq %edx,%rdx
  401661:	48 63 c1             	movslq %ecx,%rax
  401664:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401668:	48 c1 e0 04          	shl    $0x4,%rax
  40166c:	48 05 80 3d 60 00    	add    $0x603d80,%rax
  401672:	c6 04 10 00          	movb   $0x0,(%rax,%rdx,1)
  401676:	83 c1 01             	add    $0x1,%ecx
  401679:	89 0d e5 26 20 00    	mov    %ecx,0x2026e5(%rip)        # 603d64 <num_input_strings>
  40167f:	5b                   	pop    %rbx
  401680:	c3                   	retq   

0000000000401681 <initialize_bomb>:
  401681:	55                   	push   %rbp
  401682:	53                   	push   %rbx
  401683:	48 81 ec 48 20 00 00 	sub    $0x2048,%rsp
  40168a:	be 43 17 40 00       	mov    $0x401743,%esi
  40168f:	bf 02 00 00 00       	mov    $0x2,%edi
  401694:	e8 e7 f4 ff ff       	callq  400b80 <signal@plt>
  401699:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  4016a0:	00 
  4016a1:	be 40 00 00 00       	mov    $0x40,%esi
  4016a6:	e8 c5 f4 ff ff       	callq  400b70 <gethostname@plt>
  4016ab:	85 c0                	test   %eax,%eax
  4016ad:	75 1b                	jne    4016ca <initialize_bomb+0x49>
  4016af:	48 8b 3d 0a 24 20 00 	mov    0x20240a(%rip),%rdi        # 603ac0 <host_table>
  4016b6:	bb 00 00 00 00       	mov    $0x0,%ebx
  4016bb:	48 8d ac 24 00 20 00 	lea    0x2000(%rsp),%rbp
  4016c2:	00 
  4016c3:	48 85 ff             	test   %rdi,%rdi
  4016c6:	75 16                	jne    4016de <initialize_bomb+0x5d>
  4016c8:	eb 5b                	jmp    401725 <initialize_bomb+0xa4>
  4016ca:	bf b0 2a 40 00       	mov    $0x402ab0,%edi
  4016cf:	e8 bc f3 ff ff       	callq  400a90 <puts@plt>
  4016d4:	bf 08 00 00 00       	mov    $0x8,%edi
  4016d9:	e8 c2 f3 ff ff       	callq  400aa0 <exit@plt>
  4016de:	48 89 ee             	mov    %rbp,%rsi
  4016e1:	e8 ca f3 ff ff       	callq  400ab0 <strcasecmp@plt>
  4016e6:	85 c0                	test   %eax,%eax
  4016e8:	74 13                	je     4016fd <initialize_bomb+0x7c>
  4016ea:	48 8b 3c dd c8 3a 60 	mov    0x603ac8(,%rbx,8),%rdi
  4016f1:	00 
  4016f2:	48 83 c3 01          	add    $0x1,%rbx
  4016f6:	48 85 ff             	test   %rdi,%rdi
  4016f9:	74 2a                	je     401725 <initialize_bomb+0xa4>
  4016fb:	eb e1                	jmp    4016de <initialize_bomb+0x5d>
  4016fd:	48 89 e7             	mov    %rsp,%rdi
  401700:	e8 9b 00 00 00       	callq  4017a0 <init_driver>
  401705:	85 c0                	test   %eax,%eax
  401707:	79 30                	jns    401739 <initialize_bomb+0xb8>
  401709:	48 89 e6             	mov    %rsp,%rsi
  40170c:	bf 57 28 40 00       	mov    $0x402857,%edi
  401711:	b8 00 00 00 00       	mov    $0x0,%eax
  401716:	e8 35 f3 ff ff       	callq  400a50 <printf@plt>
  40171b:	bf 08 00 00 00       	mov    $0x8,%edi
  401720:	e8 7b f3 ff ff       	callq  400aa0 <exit@plt>
  401725:	bf e8 2a 40 00       	mov    $0x402ae8,%edi
  40172a:	e8 61 f3 ff ff       	callq  400a90 <puts@plt>
  40172f:	bf 08 00 00 00       	mov    $0x8,%edi
  401734:	e8 67 f3 ff ff       	callq  400aa0 <exit@plt>
  401739:	48 81 c4 48 20 00 00 	add    $0x2048,%rsp
  401740:	5b                   	pop    %rbx
  401741:	5d                   	pop    %rbp
  401742:	c3                   	retq   

0000000000401743 <sig_handler>:
  401743:	48 83 ec 08          	sub    $0x8,%rsp
  401747:	bf 20 2b 40 00       	mov    $0x402b20,%edi
  40174c:	e8 3f f3 ff ff       	callq  400a90 <puts@plt>
  401751:	bf 03 00 00 00       	mov    $0x3,%edi
  401756:	e8 f5 f3 ff ff       	callq  400b50 <sleep@plt>
  40175b:	bf 71 28 40 00       	mov    $0x402871,%edi
  401760:	b8 00 00 00 00       	mov    $0x0,%eax
  401765:	e8 e6 f2 ff ff       	callq  400a50 <printf@plt>
  40176a:	48 8b 3d df 25 20 00 	mov    0x2025df(%rip),%rdi        # 603d50 <stdout@@GLIBC_2.2.5>
  401771:	e8 8a f4 ff ff       	callq  400c00 <fflush@plt>
  401776:	bf 01 00 00 00       	mov    $0x1,%edi
  40177b:	e8 d0 f3 ff ff       	callq  400b50 <sleep@plt>
  401780:	bf 79 28 40 00       	mov    $0x402879,%edi
  401785:	e8 06 f3 ff ff       	callq  400a90 <puts@plt>
  40178a:	bf 10 00 00 00       	mov    $0x10,%edi
  40178f:	e8 0c f3 ff ff       	callq  400aa0 <exit@plt>
  401794:	90                   	nop
  401795:	90                   	nop
  401796:	90                   	nop
  401797:	90                   	nop
  401798:	90                   	nop
  401799:	90                   	nop
  40179a:	90                   	nop
  40179b:	90                   	nop
  40179c:	90                   	nop
  40179d:	90                   	nop
  40179e:	90                   	nop
  40179f:	90                   	nop

00000000004017a0 <init_driver>:
  4017a0:	41 54                	push   %r12
  4017a2:	55                   	push   %rbp
  4017a3:	53                   	push   %rbx
  4017a4:	48 83 ec 10          	sub    $0x10,%rsp
  4017a8:	48 89 fd             	mov    %rdi,%rbp
  4017ab:	be 01 00 00 00       	mov    $0x1,%esi
  4017b0:	bf 0d 00 00 00       	mov    $0xd,%edi
  4017b5:	e8 c6 f3 ff ff       	callq  400b80 <signal@plt>
  4017ba:	be 01 00 00 00       	mov    $0x1,%esi
  4017bf:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4017c4:	e8 b7 f3 ff ff       	callq  400b80 <signal@plt>
  4017c9:	be 01 00 00 00       	mov    $0x1,%esi
  4017ce:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4017d3:	e8 a8 f3 ff ff       	callq  400b80 <signal@plt>
  4017d8:	ba 00 00 00 00       	mov    $0x0,%edx
  4017dd:	be 01 00 00 00       	mov    $0x1,%esi
  4017e2:	bf 02 00 00 00       	mov    $0x2,%edi
  4017e7:	e8 a4 f3 ff ff       	callq  400b90 <socket@plt>
  4017ec:	41 89 c4             	mov    %eax,%r12d
  4017ef:	85 c0                	test   %eax,%eax
  4017f1:	79 4f                	jns    401842 <init_driver+0xa2>
  4017f3:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  4017fa:	c7 45 04 72 3a 20 43 	movl   $0x43203a72,0x4(%rbp)
  401801:	c7 45 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%rbp)
  401808:	c7 45 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%rbp)
  40180f:	c7 45 10 61 62 6c 65 	movl   $0x656c6261,0x10(%rbp)
  401816:	c7 45 14 20 74 6f 20 	movl   $0x206f7420,0x14(%rbp)
  40181d:	c7 45 18 63 72 65 61 	movl   $0x61657263,0x18(%rbp)
  401824:	c7 45 1c 74 65 20 73 	movl   $0x73206574,0x1c(%rbp)
  40182b:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  401832:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  401838:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40183d:	e9 27 01 00 00       	jmpq   401969 <init_driver+0x1c9>
  401842:	bf 78 2b 40 00       	mov    $0x402b78,%edi
  401847:	e8 34 f2 ff ff       	callq  400a80 <gethostbyname@plt>
  40184c:	48 85 c0             	test   %rax,%rax
  40184f:	75 69                	jne    4018ba <init_driver+0x11a>
  401851:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  401858:	c7 45 04 72 3a 20 44 	movl   $0x44203a72,0x4(%rbp)
  40185f:	c7 45 08 4e 53 20 69 	movl   $0x6920534e,0x8(%rbp)
  401866:	c7 45 0c 73 20 75 6e 	movl   $0x6e752073,0xc(%rbp)
  40186d:	c7 45 10 61 62 6c 65 	movl   $0x656c6261,0x10(%rbp)
  401874:	c7 45 14 20 74 6f 20 	movl   $0x206f7420,0x14(%rbp)
  40187b:	c7 45 18 72 65 73 6f 	movl   $0x6f736572,0x18(%rbp)
  401882:	c7 45 1c 6c 76 65 20 	movl   $0x2065766c,0x1c(%rbp)
  401889:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
  401890:	c7 45 24 65 72 20 61 	movl   $0x61207265,0x24(%rbp)
  401897:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  40189e:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  4018a4:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  4018a8:	44 89 e7             	mov    %r12d,%edi
  4018ab:	e8 c0 f1 ff ff       	callq  400a70 <close@plt>
  4018b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4018b5:	e9 af 00 00 00       	jmpq   401969 <init_driver+0x1c9>
  4018ba:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4018c1:	00 
  4018c2:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  4018c9:	00 00 
  4018cb:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  4018d1:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  4018d6:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4018da:	48 8b 40 18          	mov    0x18(%rax),%rax
  4018de:	48 8b 38             	mov    (%rax),%rdi
  4018e1:	e8 1a f2 ff ff       	callq  400b00 <bcopy@plt>
  4018e6:	66 c7 44 24 02 00 50 	movw   $0x5000,0x2(%rsp)
  4018ed:	ba 10 00 00 00       	mov    $0x10,%edx
  4018f2:	48 89 e6             	mov    %rsp,%rsi
  4018f5:	44 89 e7             	mov    %r12d,%edi
  4018f8:	e8 63 f2 ff ff       	callq  400b60 <connect@plt>
  4018fd:	85 c0                	test   %eax,%eax
  4018ff:	79 51                	jns    401952 <init_driver+0x1b2>
  401901:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  401908:	c7 45 04 72 3a 20 55 	movl   $0x55203a72,0x4(%rbp)
  40190f:	c7 45 08 6e 61 62 6c 	movl   $0x6c62616e,0x8(%rbp)
  401916:	c7 45 0c 65 20 74 6f 	movl   $0x6f742065,0xc(%rbp)
  40191d:	c7 45 10 20 63 6f 6e 	movl   $0x6e6f6320,0x10(%rbp)
  401924:	c7 45 14 6e 65 63 74 	movl   $0x7463656e,0x14(%rbp)
  40192b:	c7 45 18 20 74 6f 20 	movl   $0x206f7420,0x18(%rbp)
  401932:	c7 45 1c 73 65 72 76 	movl   $0x76726573,0x1c(%rbp)
  401939:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  40193f:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  401943:	44 89 e7             	mov    %r12d,%edi
  401946:	e8 25 f1 ff ff       	callq  400a70 <close@plt>
  40194b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401950:	eb 17                	jmp    401969 <init_driver+0x1c9>
  401952:	44 89 e7             	mov    %r12d,%edi
  401955:	e8 16 f1 ff ff       	callq  400a70 <close@plt>
  40195a:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  401960:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  401964:	b8 00 00 00 00       	mov    $0x0,%eax
  401969:	48 83 c4 10          	add    $0x10,%rsp
  40196d:	5b                   	pop    %rbx
  40196e:	5d                   	pop    %rbp
  40196f:	41 5c                	pop    %r12
  401971:	c3                   	retq   

0000000000401972 <init_timeout>:
  401972:	53                   	push   %rbx
  401973:	89 fb                	mov    %edi,%ebx
  401975:	85 ff                	test   %edi,%edi
  401977:	74 1e                	je     401997 <init_timeout+0x25>
  401979:	be 08 24 40 00       	mov    $0x402408,%esi
  40197e:	bf 0e 00 00 00       	mov    $0xe,%edi
  401983:	e8 f8 f1 ff ff       	callq  400b80 <signal@plt>
  401988:	85 db                	test   %ebx,%ebx
  40198a:	bf 00 00 00 00       	mov    $0x0,%edi
  40198f:	0f 49 fb             	cmovns %ebx,%edi
  401992:	e8 19 f2 ff ff       	callq  400bb0 <alarm@plt>
  401997:	5b                   	pop    %rbx
  401998:	c3                   	retq   

0000000000401999 <rio_readlineb>:
  401999:	41 57                	push   %r15
  40199b:	41 56                	push   %r14
  40199d:	41 55                	push   %r13
  40199f:	41 54                	push   %r12
  4019a1:	55                   	push   %rbp
  4019a2:	53                   	push   %rbx
  4019a3:	48 83 ec 18          	sub    $0x18,%rsp
  4019a7:	48 89 fb             	mov    %rdi,%rbx
  4019aa:	49 89 d7             	mov    %rdx,%r15
  4019ad:	49 89 f5             	mov    %rsi,%r13
  4019b0:	49 89 f6             	mov    %rsi,%r14
  4019b3:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  4019b9:	48 83 fa 01          	cmp    $0x1,%rdx
  4019bd:	77 3b                	ja     4019fa <rio_readlineb+0x61>
  4019bf:	e9 7e 00 00 00       	jmpq   401a42 <rio_readlineb+0xa9>
  4019c4:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  4019c8:	ba 00 20 00 00       	mov    $0x2000,%edx
  4019cd:	48 89 ee             	mov    %rbp,%rsi
  4019d0:	8b 3b                	mov    (%rbx),%edi
  4019d2:	e8 e9 f0 ff ff       	callq  400ac0 <read@plt>
  4019d7:	89 43 04             	mov    %eax,0x4(%rbx)
  4019da:	85 c0                	test   %eax,%eax
  4019dc:	79 14                	jns    4019f2 <rio_readlineb+0x59>
  4019de:	e8 dd f1 ff ff       	callq  400bc0 <__errno_location@plt>
  4019e3:	83 38 04             	cmpl   $0x4,(%rax)
  4019e6:	74 12                	je     4019fa <rio_readlineb+0x61>
  4019e8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4019ef:	90                   	nop
  4019f0:	eb 67                	jmp    401a59 <rio_readlineb+0xc0>
  4019f2:	85 c0                	test   %eax,%eax
  4019f4:	74 5e                	je     401a54 <rio_readlineb+0xbb>
  4019f6:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4019fa:	83 7b 04 00          	cmpl   $0x0,0x4(%rbx)
  4019fe:	66 90                	xchg   %ax,%ax
  401a00:	7e c2                	jle    4019c4 <rio_readlineb+0x2b>
  401a02:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401a06:	0f b6 00             	movzbl (%rax),%eax
  401a09:	88 44 24 17          	mov    %al,0x17(%rsp)
  401a0d:	48 83 43 08 01       	addq   $0x1,0x8(%rbx)
  401a12:	83 6b 04 01          	subl   $0x1,0x4(%rbx)
  401a16:	43 88 44 2c ff       	mov    %al,-0x1(%r12,%r13,1)
  401a1b:	49 83 c6 01          	add    $0x1,%r14
  401a1f:	80 7c 24 17 0a       	cmpb   $0xa,0x17(%rsp)
  401a24:	75 0f                	jne    401a35 <rio_readlineb+0x9c>
  401a26:	eb 23                	jmp    401a4b <rio_readlineb+0xb2>
  401a28:	b8 00 00 00 00       	mov    $0x0,%eax
  401a2d:	49 83 fc 01          	cmp    $0x1,%r12
  401a31:	74 31                	je     401a64 <rio_readlineb+0xcb>
  401a33:	eb 16                	jmp    401a4b <rio_readlineb+0xb2>
  401a35:	49 83 c4 01          	add    $0x1,%r12
  401a39:	4d 39 fc             	cmp    %r15,%r12
  401a3c:	75 bc                	jne    4019fa <rio_readlineb+0x61>
  401a3e:	66 90                	xchg   %ax,%ax
  401a40:	eb 09                	jmp    401a4b <rio_readlineb+0xb2>
  401a42:	49 89 f6             	mov    %rsi,%r14
  401a45:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  401a4b:	41 c6 06 00          	movb   $0x0,(%r14)
  401a4f:	4c 89 e0             	mov    %r12,%rax
  401a52:	eb 10                	jmp    401a64 <rio_readlineb+0xcb>
  401a54:	b8 00 00 00 00       	mov    $0x0,%eax
  401a59:	85 c0                	test   %eax,%eax
  401a5b:	74 cb                	je     401a28 <rio_readlineb+0x8f>
  401a5d:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401a64:	48 83 c4 18          	add    $0x18,%rsp
  401a68:	5b                   	pop    %rbx
  401a69:	5d                   	pop    %rbp
  401a6a:	41 5c                	pop    %r12
  401a6c:	41 5d                	pop    %r13
  401a6e:	41 5e                	pop    %r14
  401a70:	41 5f                	pop    %r15
  401a72:	c3                   	retq   

0000000000401a73 <submitr>:
  401a73:	41 57                	push   %r15
  401a75:	41 56                	push   %r14
  401a77:	41 55                	push   %r13
  401a79:	41 54                	push   %r12
  401a7b:	55                   	push   %rbp
  401a7c:	53                   	push   %rbx
  401a7d:	48 81 ec 78 a0 00 00 	sub    $0xa078,%rsp
  401a84:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
  401a89:	89 f5                	mov    %esi,%ebp
  401a8b:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
  401a90:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  401a95:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
  401a9a:	4d 89 cf             	mov    %r9,%r15
  401a9d:	4c 8b b4 24 b0 a0 00 	mov    0xa0b0(%rsp),%r14
  401aa4:	00 
  401aa5:	c7 84 24 4c 20 00 00 	movl   $0x0,0x204c(%rsp)
  401aac:	00 00 00 00 
  401ab0:	ba 00 00 00 00       	mov    $0x0,%edx
  401ab5:	be 01 00 00 00       	mov    $0x1,%esi
  401aba:	bf 02 00 00 00       	mov    $0x2,%edi
  401abf:	e8 cc f0 ff ff       	callq  400b90 <socket@plt>
  401ac4:	41 89 c5             	mov    %eax,%r13d
  401ac7:	85 c0                	test   %eax,%eax
  401ac9:	79 58                	jns    401b23 <submitr+0xb0>
  401acb:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401ad2:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401ad9:	43 
  401ada:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401ae1:	6e 
  401ae2:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401ae9:	6e 
  401aea:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401af1:	65 
  401af2:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401af9:	20 
  401afa:	41 c7 46 18 63 72 65 	movl   $0x61657263,0x18(%r14)
  401b01:	61 
  401b02:	41 c7 46 1c 74 65 20 	movl   $0x73206574,0x1c(%r14)
  401b09:	73 
  401b0a:	41 c7 46 20 6f 63 6b 	movl   $0x656b636f,0x20(%r14)
  401b11:	65 
  401b12:	66 41 c7 46 24 74 00 	movw   $0x74,0x24(%r14)
  401b19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b1e:	e9 5b 08 00 00       	jmpq   40237e <submitr+0x90b>
  401b23:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  401b28:	e8 53 ef ff ff       	callq  400a80 <gethostbyname@plt>
  401b2d:	48 85 c0             	test   %rax,%rax
  401b30:	0f 85 85 00 00 00    	jne    401bbb <submitr+0x148>
  401b36:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401b3d:	41 c7 46 04 72 3a 20 	movl   $0x44203a72,0x4(%r14)
  401b44:	44 
  401b45:	41 c7 46 08 4e 53 20 	movl   $0x6920534e,0x8(%r14)
  401b4c:	69 
  401b4d:	41 c7 46 0c 73 20 75 	movl   $0x6e752073,0xc(%r14)
  401b54:	6e 
  401b55:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401b5c:	65 
  401b5d:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401b64:	20 
  401b65:	41 c7 46 18 72 65 73 	movl   $0x6f736572,0x18(%r14)
  401b6c:	6f 
  401b6d:	41 c7 46 1c 6c 76 65 	movl   $0x2065766c,0x1c(%r14)
  401b74:	20 
  401b75:	41 c7 46 20 41 75 74 	movl   $0x6f747541,0x20(%r14)
  401b7c:	6f 
  401b7d:	41 c7 46 24 6c 61 62 	movl   $0x2062616c,0x24(%r14)
  401b84:	20 
  401b85:	41 c7 46 28 73 65 72 	movl   $0x76726573,0x28(%r14)
  401b8c:	76 
  401b8d:	41 c7 46 2c 65 72 20 	movl   $0x61207265,0x2c(%r14)
  401b94:	61 
  401b95:	41 c7 46 30 64 64 72 	movl   $0x65726464,0x30(%r14)
  401b9c:	65 
  401b9d:	66 41 c7 46 34 73 73 	movw   $0x7373,0x34(%r14)
  401ba4:	41 c6 46 36 00       	movb   $0x0,0x36(%r14)
  401ba9:	44 89 ef             	mov    %r13d,%edi
  401bac:	e8 bf ee ff ff       	callq  400a70 <close@plt>
  401bb1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401bb6:	e9 c3 07 00 00       	jmpq   40237e <submitr+0x90b>
  401bbb:	48 8d 9c 24 60 a0 00 	lea    0xa060(%rsp),%rbx
  401bc2:	00 
  401bc3:	48 c7 84 24 60 a0 00 	movq   $0x0,0xa060(%rsp)
  401bca:	00 00 00 00 00 
  401bcf:	48 c7 84 24 68 a0 00 	movq   $0x0,0xa068(%rsp)
  401bd6:	00 00 00 00 00 
  401bdb:	66 c7 84 24 60 a0 00 	movw   $0x2,0xa060(%rsp)
  401be2:	00 02 00 
  401be5:	48 8d 73 04          	lea    0x4(%rbx),%rsi
  401be9:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401bed:	48 8b 40 18          	mov    0x18(%rax),%rax
  401bf1:	48 8b 38             	mov    (%rax),%rdi
  401bf4:	e8 07 ef ff ff       	callq  400b00 <bcopy@plt>
  401bf9:	89 e8                	mov    %ebp,%eax
  401bfb:	66 c1 c8 08          	ror    $0x8,%ax
  401bff:	66 89 84 24 62 a0 00 	mov    %ax,0xa062(%rsp)
  401c06:	00 
  401c07:	ba 10 00 00 00       	mov    $0x10,%edx
  401c0c:	48 89 de             	mov    %rbx,%rsi
  401c0f:	44 89 ef             	mov    %r13d,%edi
  401c12:	e8 49 ef ff ff       	callq  400b60 <connect@plt>
  401c17:	85 c0                	test   %eax,%eax
  401c19:	79 75                	jns    401c90 <submitr+0x21d>
  401c1b:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401c22:	41 c7 46 04 72 3a 20 	movl   $0x55203a72,0x4(%r14)
  401c29:	55 
  401c2a:	41 c7 46 08 6e 61 62 	movl   $0x6c62616e,0x8(%r14)
  401c31:	6c 
  401c32:	41 c7 46 0c 65 20 74 	movl   $0x6f742065,0xc(%r14)
  401c39:	6f 
  401c3a:	41 c7 46 10 20 63 6f 	movl   $0x6e6f6320,0x10(%r14)
  401c41:	6e 
  401c42:	41 c7 46 14 6e 65 63 	movl   $0x7463656e,0x14(%r14)
  401c49:	74 
  401c4a:	41 c7 46 18 20 74 6f 	movl   $0x206f7420,0x18(%r14)
  401c51:	20 
  401c52:	41 c7 46 1c 74 68 65 	movl   $0x20656874,0x1c(%r14)
  401c59:	20 
  401c5a:	41 c7 46 20 41 75 74 	movl   $0x6f747541,0x20(%r14)
  401c61:	6f 
  401c62:	41 c7 46 24 6c 61 62 	movl   $0x2062616c,0x24(%r14)
  401c69:	20 
  401c6a:	41 c7 46 28 73 65 72 	movl   $0x76726573,0x28(%r14)
  401c71:	76 
  401c72:	66 41 c7 46 2c 65 72 	movw   $0x7265,0x2c(%r14)
  401c79:	41 c6 46 2e 00       	movb   $0x0,0x2e(%r14)
  401c7e:	44 89 ef             	mov    %r13d,%edi
  401c81:	e8 ea ed ff ff       	callq  400a70 <close@plt>
  401c86:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401c8b:	e9 ee 06 00 00       	jmpq   40237e <submitr+0x90b>
  401c90:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
  401c97:	4c 89 ff             	mov    %r15,%rdi
  401c9a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401ca0:	fc                   	cld    
  401ca1:	48 89 d9             	mov    %rbx,%rcx
  401ca4:	44 89 c0             	mov    %r8d,%eax
  401ca7:	f2 ae                	repnz scas %es:(%rdi),%al
  401ca9:	48 89 ce             	mov    %rcx,%rsi
  401cac:	48 f7 d6             	not    %rsi
  401caf:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  401cb4:	48 89 d9             	mov    %rbx,%rcx
  401cb7:	f2 ae                	repnz scas %es:(%rdi),%al
  401cb9:	48 89 ca             	mov    %rcx,%rdx
  401cbc:	48 f7 d2             	not    %rdx
  401cbf:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  401cc4:	48 89 d9             	mov    %rbx,%rcx
  401cc7:	f2 ae                	repnz scas %es:(%rdi),%al
  401cc9:	49 89 c9             	mov    %rcx,%r9
  401ccc:	49 f7 d1             	not    %r9
  401ccf:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  401cd4:	48 89 d9             	mov    %rbx,%rcx
  401cd7:	f2 ae                	repnz scas %es:(%rdi),%al
  401cd9:	48 f7 d1             	not    %rcx
  401cdc:	49 8d 44 11 7e       	lea    0x7e(%r9,%rdx,1),%rax
  401ce1:	48 8d 4c 01 ff       	lea    -0x1(%rcx,%rax,1),%rcx
  401ce6:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  401ceb:	48 01 c1             	add    %rax,%rcx
  401cee:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  401cf5:	76 7e                	jbe    401d75 <submitr+0x302>
  401cf7:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401cfe:	41 c7 46 04 72 3a 20 	movl   $0x52203a72,0x4(%r14)
  401d05:	52 
  401d06:	41 c7 46 08 65 73 75 	movl   $0x6c757365,0x8(%r14)
  401d0d:	6c 
  401d0e:	41 c7 46 0c 74 20 73 	movl   $0x74732074,0xc(%r14)
  401d15:	74 
  401d16:	41 c7 46 10 72 69 6e 	movl   $0x676e6972,0x10(%r14)
  401d1d:	67 
  401d1e:	41 c7 46 14 20 74 6f 	movl   $0x6f6f7420,0x14(%r14)
  401d25:	6f 
  401d26:	41 c7 46 18 20 6c 61 	movl   $0x72616c20,0x18(%r14)
  401d2d:	72 
  401d2e:	41 c7 46 1c 67 65 2e 	movl   $0x202e6567,0x1c(%r14)
  401d35:	20 
  401d36:	41 c7 46 20 49 6e 63 	movl   $0x72636e49,0x20(%r14)
  401d3d:	72 
  401d3e:	41 c7 46 24 65 61 73 	movl   $0x65736165,0x24(%r14)
  401d45:	65 
  401d46:	41 c7 46 28 20 53 55 	movl   $0x42555320,0x28(%r14)
  401d4d:	42 
  401d4e:	41 c7 46 2c 4d 49 54 	movl   $0x5254494d,0x2c(%r14)
  401d55:	52 
  401d56:	41 c7 46 30 5f 4d 41 	movl   $0x58414d5f,0x30(%r14)
  401d5d:	58 
  401d5e:	41 c7 46 34 42 55 46 	movl   $0x465542,0x34(%r14)
  401d65:	00 
  401d66:	44 89 ef             	mov    %r13d,%edi
  401d69:	e8 02 ed ff ff       	callq  400a70 <close@plt>
  401d6e:	89 d8                	mov    %ebx,%eax
  401d70:	e9 09 06 00 00       	jmpq   40237e <submitr+0x90b>
  401d75:	4c 8d a4 24 50 40 00 	lea    0x4050(%rsp),%r12
  401d7c:	00 
  401d7d:	ba 00 20 00 00       	mov    $0x2000,%edx
  401d82:	be 00 00 00 00       	mov    $0x0,%esi
  401d87:	4c 89 e7             	mov    %r12,%rdi
  401d8a:	e8 d1 ec ff ff       	callq  400a60 <memset@plt>
  401d8f:	4c 89 fd             	mov    %r15,%rbp
  401d92:	4c 89 ff             	mov    %r15,%rdi
  401d95:	fc                   	cld    
  401d96:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401d9d:	b8 00 00 00 00       	mov    $0x0,%eax
  401da2:	f2 ae                	repnz scas %es:(%rdi),%al
  401da4:	48 f7 d1             	not    %rcx
  401da7:	8d 59 fe             	lea    -0x2(%rcx),%ebx
  401daa:	83 fb ff             	cmp    $0xffffffffffffffff,%ebx
  401dad:	0f 84 e6 04 00 00    	je     402299 <submitr+0x826>
  401db3:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
  401db8:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
  401dbc:	80 fa 2a             	cmp    $0x2a,%dl
  401dbf:	74 26                	je     401de7 <submitr+0x374>
  401dc1:	80 fa 2d             	cmp    $0x2d,%dl
  401dc4:	74 21                	je     401de7 <submitr+0x374>
  401dc6:	80 fa 2e             	cmp    $0x2e,%dl
  401dc9:	74 1c                	je     401de7 <submitr+0x374>
  401dcb:	80 fa 5f             	cmp    $0x5f,%dl
  401dce:	66 90                	xchg   %ax,%ax
  401dd0:	74 15                	je     401de7 <submitr+0x374>
  401dd2:	8d 42 d0             	lea    -0x30(%rdx),%eax
  401dd5:	3c 09                	cmp    $0x9,%al
  401dd7:	76 0e                	jbe    401de7 <submitr+0x374>
  401dd9:	8d 42 bf             	lea    -0x41(%rdx),%eax
  401ddc:	3c 19                	cmp    $0x19,%al
  401dde:	76 07                	jbe    401de7 <submitr+0x374>
  401de0:	8d 42 9f             	lea    -0x61(%rdx),%eax
  401de3:	3c 19                	cmp    $0x19,%al
  401de5:	77 0a                	ja     401df1 <submitr+0x37e>
  401de7:	41 88 14 24          	mov    %dl,(%r12)
  401deb:	49 83 c4 01          	add    $0x1,%r12
  401def:	eb 52                	jmp    401e43 <submitr+0x3d0>
  401df1:	80 fa 20             	cmp    $0x20,%dl
  401df4:	75 0b                	jne    401e01 <submitr+0x38e>
  401df6:	41 c6 04 24 2b       	movb   $0x2b,(%r12)
  401dfb:	49 83 c4 01          	add    $0x1,%r12
  401dff:	eb 42                	jmp    401e43 <submitr+0x3d0>
  401e01:	8d 42 e0             	lea    -0x20(%rdx),%eax
  401e04:	3c 5f                	cmp    $0x5f,%al
  401e06:	76 05                	jbe    401e0d <submitr+0x39a>
  401e08:	80 fa 09             	cmp    $0x9,%dl
  401e0b:	75 4b                	jne    401e58 <submitr+0x3e5>
  401e0d:	0f b6 d2             	movzbl %dl,%edx
  401e10:	be 50 2c 40 00       	mov    $0x402c50,%esi
  401e15:	4c 89 ff             	mov    %r15,%rdi
  401e18:	b8 00 00 00 00       	mov    $0x0,%eax
  401e1d:	e8 fe ec ff ff       	callq  400b20 <sprintf@plt>
  401e22:	0f b6 44 24 30       	movzbl 0x30(%rsp),%eax
  401e27:	41 88 04 24          	mov    %al,(%r12)
  401e2b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
  401e30:	41 88 44 24 01       	mov    %al,0x1(%r12)
  401e35:	0f b6 44 24 32       	movzbl 0x32(%rsp),%eax
  401e3a:	41 88 44 24 02       	mov    %al,0x2(%r12)
  401e3f:	49 83 c4 03          	add    $0x3,%r12
  401e43:	83 eb 01             	sub    $0x1,%ebx
  401e46:	83 fb ff             	cmp    $0xffffffffffffffff,%ebx
  401e49:	0f 84 4a 04 00 00    	je     402299 <submitr+0x826>
  401e4f:	48 83 c5 01          	add    $0x1,%rbp
  401e53:	e9 60 ff ff ff       	jmpq   401db8 <submitr+0x345>
  401e58:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401e5f:	41 c7 46 04 72 3a 20 	movl   $0x52203a72,0x4(%r14)
  401e66:	52 
  401e67:	41 c7 46 08 65 73 75 	movl   $0x6c757365,0x8(%r14)
  401e6e:	6c 
  401e6f:	41 c7 46 0c 74 20 73 	movl   $0x74732074,0xc(%r14)
  401e76:	74 
  401e77:	41 c7 46 10 72 69 6e 	movl   $0x676e6972,0x10(%r14)
  401e7e:	67 
  401e7f:	41 c7 46 14 20 63 6f 	movl   $0x6e6f6320,0x14(%r14)
  401e86:	6e 
  401e87:	41 c7 46 18 74 61 69 	movl   $0x6e696174,0x18(%r14)
  401e8e:	6e 
  401e8f:	41 c7 46 1c 73 20 61 	movl   $0x6e612073,0x1c(%r14)
  401e96:	6e 
  401e97:	41 c7 46 20 20 69 6c 	movl   $0x6c6c6920,0x20(%r14)
  401e9e:	6c 
  401e9f:	41 c7 46 24 65 67 61 	movl   $0x6c616765,0x24(%r14)
  401ea6:	6c 
  401ea7:	41 c7 46 28 20 6f 72 	movl   $0x20726f20,0x28(%r14)
  401eae:	20 
  401eaf:	41 c7 46 2c 75 6e 70 	movl   $0x72706e75,0x2c(%r14)
  401eb6:	72 
  401eb7:	41 c7 46 30 69 6e 74 	movl   $0x61746e69,0x30(%r14)
  401ebe:	61 
  401ebf:	41 c7 46 34 62 6c 65 	movl   $0x20656c62,0x34(%r14)
  401ec6:	20 
  401ec7:	41 c7 46 38 63 68 61 	movl   $0x72616863,0x38(%r14)
  401ece:	72 
  401ecf:	41 c7 46 3c 61 63 74 	movl   $0x65746361,0x3c(%r14)
  401ed6:	65 
  401ed7:	66 41 c7 46 40 72 2e 	movw   $0x2e72,0x40(%r14)
  401ede:	41 c6 46 42 00       	movb   $0x0,0x42(%r14)
  401ee3:	44 89 ef             	mov    %r13d,%edi
  401ee6:	e8 85 eb ff ff       	callq  400a70 <close@plt>
  401eeb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401ef0:	e9 89 04 00 00       	jmpq   40237e <submitr+0x90b>
  401ef5:	48 01 c5             	add    %rax,%rbp
  401ef8:	48 89 da             	mov    %rbx,%rdx
  401efb:	48 89 ee             	mov    %rbp,%rsi
  401efe:	44 89 ef             	mov    %r13d,%edi
  401f01:	e8 ea ec ff ff       	callq  400bf0 <write@plt>
  401f06:	48 85 c0             	test   %rax,%rax
  401f09:	7f 0f                	jg     401f1a <submitr+0x4a7>
  401f0b:	e8 b0 ec ff ff       	callq  400bc0 <__errno_location@plt>
  401f10:	83 38 04             	cmpl   $0x4,(%rax)
  401f13:	75 0f                	jne    401f24 <submitr+0x4b1>
  401f15:	b8 00 00 00 00       	mov    $0x0,%eax
  401f1a:	48 29 c3             	sub    %rax,%rbx
  401f1d:	75 d6                	jne    401ef5 <submitr+0x482>
  401f1f:	4d 85 e4             	test   %r12,%r12
  401f22:	79 79                	jns    401f9d <submitr+0x52a>
  401f24:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401f2b:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401f32:	43 
  401f33:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401f3a:	6e 
  401f3b:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401f42:	6e 
  401f43:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401f4a:	65 
  401f4b:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401f52:	20 
  401f53:	41 c7 46 18 77 72 69 	movl   $0x74697277,0x18(%r14)
  401f5a:	74 
  401f5b:	41 c7 46 1c 65 20 74 	movl   $0x6f742065,0x1c(%r14)
  401f62:	6f 
  401f63:	41 c7 46 20 20 74 68 	movl   $0x65687420,0x20(%r14)
  401f6a:	65 
  401f6b:	41 c7 46 24 20 41 75 	movl   $0x74754120,0x24(%r14)
  401f72:	74 
  401f73:	41 c7 46 28 6f 6c 61 	movl   $0x62616c6f,0x28(%r14)
  401f7a:	62 
  401f7b:	41 c7 46 2c 20 73 65 	movl   $0x72657320,0x2c(%r14)
  401f82:	72 
  401f83:	41 c7 46 30 76 65 72 	movl   $0x726576,0x30(%r14)
  401f8a:	00 
  401f8b:	44 89 ef             	mov    %r13d,%edi
  401f8e:	e8 dd ea ff ff       	callq  400a70 <close@plt>
  401f93:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f98:	e9 e1 03 00 00       	jmpq   40237e <submitr+0x90b>
  401f9d:	44 89 ac 24 50 80 00 	mov    %r13d,0x8050(%rsp)
  401fa4:	00 
  401fa5:	c7 84 24 54 80 00 00 	movl   $0x0,0x8054(%rsp)
  401fac:	00 00 00 00 
  401fb0:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  401fb7:	00 
  401fb8:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401fbc:	48 89 84 24 58 80 00 	mov    %rax,0x8058(%rsp)
  401fc3:	00 
  401fc4:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  401fcb:	00 
  401fcc:	ba 00 20 00 00       	mov    $0x2000,%edx
  401fd1:	e8 c3 f9 ff ff       	callq  401999 <rio_readlineb>
  401fd6:	48 85 c0             	test   %rax,%rax
  401fd9:	0f 8f 90 00 00 00    	jg     40206f <submitr+0x5fc>
  401fdf:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401fe6:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401fed:	43 
  401fee:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401ff5:	6e 
  401ff6:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401ffd:	6e 
  401ffe:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  402005:	65 
  402006:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  40200d:	20 
  40200e:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  402015:	64 
  402016:	41 c7 46 1c 20 66 69 	movl   $0x72696620,0x1c(%r14)
  40201d:	72 
  40201e:	41 c7 46 20 73 74 20 	movl   $0x68207473,0x20(%r14)
  402025:	68 
  402026:	41 c7 46 24 65 61 64 	movl   $0x65646165,0x24(%r14)
  40202d:	65 
  40202e:	41 c7 46 28 72 20 66 	movl   $0x72662072,0x28(%r14)
  402035:	72 
  402036:	41 c7 46 2c 6f 6d 20 	movl   $0x41206d6f,0x2c(%r14)
  40203d:	41 
  40203e:	41 c7 46 30 75 74 6f 	movl   $0x6c6f7475,0x30(%r14)
  402045:	6c 
  402046:	41 c7 46 34 61 62 20 	movl   $0x73206261,0x34(%r14)
  40204d:	73 
  40204e:	41 c7 46 38 65 72 76 	movl   $0x65767265,0x38(%r14)
  402055:	65 
  402056:	66 41 c7 46 3c 72 00 	movw   $0x72,0x3c(%r14)
  40205d:	44 89 ef             	mov    %r13d,%edi
  402060:	e8 0b ea ff ff       	callq  400a70 <close@plt>
  402065:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40206a:	e9 0f 03 00 00       	jmpq   40237e <submitr+0x90b>
  40206f:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
  402074:	48 8d 8c 24 4c 20 00 	lea    0x204c(%rsp),%rcx
  40207b:	00 
  40207c:	48 8d 94 24 50 20 00 	lea    0x2050(%rsp),%rdx
  402083:	00 
  402084:	48 8d bc 24 50 60 00 	lea    0x6050(%rsp),%rdi
  40208b:	00 
  40208c:	49 89 d8             	mov    %rbx,%r8
  40208f:	be 57 2c 40 00       	mov    $0x402c57,%esi
  402094:	b8 00 00 00 00       	mov    $0x0,%eax
  402099:	e8 a2 ea ff ff       	callq  400b40 <sscanf@plt>
  40209e:	8b 94 24 4c 20 00 00 	mov    0x204c(%rsp),%edx
  4020a5:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  4020ab:	74 4a                	je     4020f7 <submitr+0x684>
  4020ad:	48 89 d9             	mov    %rbx,%rcx
  4020b0:	be 98 2b 40 00       	mov    $0x402b98,%esi
  4020b5:	4c 89 f7             	mov    %r14,%rdi
  4020b8:	b8 00 00 00 00       	mov    $0x0,%eax
  4020bd:	e8 5e ea ff ff       	callq  400b20 <sprintf@plt>
  4020c2:	44 89 ef             	mov    %r13d,%edi
  4020c5:	e8 a6 e9 ff ff       	callq  400a70 <close@plt>
  4020ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4020cf:	e9 aa 02 00 00       	jmpq   40237e <submitr+0x90b>
  4020d4:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  4020db:	00 
  4020dc:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  4020e3:	00 
  4020e4:	ba 00 20 00 00       	mov    $0x2000,%edx
  4020e9:	e8 ab f8 ff ff       	callq  401999 <rio_readlineb>
  4020ee:	48 85 c0             	test   %rax,%rax
  4020f1:	0f 8e 06 02 00 00    	jle    4022fd <submitr+0x88a>
  4020f7:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  4020fe:	00 
  4020ff:	0f b6 94 24 50 60 00 	movzbl 0x6050(%rsp),%edx
  402106:	00 
  402107:	0f b6 05 60 0b 00 00 	movzbl 0xb60(%rip),%eax        # 402c6e <array.3305+0x50e>
  40210e:	39 c2                	cmp    %eax,%edx
  402110:	75 c2                	jne    4020d4 <submitr+0x661>
  402112:	0f b6 94 24 51 60 00 	movzbl 0x6051(%rsp),%edx
  402119:	00 
  40211a:	0f b6 05 4e 0b 00 00 	movzbl 0xb4e(%rip),%eax        # 402c6f <array.3305+0x50f>
  402121:	39 c2                	cmp    %eax,%edx
  402123:	75 af                	jne    4020d4 <submitr+0x661>
  402125:	0f b6 94 24 52 60 00 	movzbl 0x6052(%rsp),%edx
  40212c:	00 
  40212d:	0f b6 05 3c 0b 00 00 	movzbl 0xb3c(%rip),%eax        # 402c70 <array.3305+0x510>
  402134:	39 c2                	cmp    %eax,%edx
  402136:	75 9c                	jne    4020d4 <submitr+0x661>
  402138:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  40213f:	00 
  402140:	ba 00 20 00 00       	mov    $0x2000,%edx
  402145:	e8 4f f8 ff ff       	callq  401999 <rio_readlineb>
  40214a:	48 85 c0             	test   %rax,%rax
  40214d:	0f 8f 91 00 00 00    	jg     4021e4 <submitr+0x771>
  402153:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  40215a:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  402161:	43 
  402162:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  402169:	6e 
  40216a:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  402171:	6e 
  402172:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  402179:	65 
  40217a:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  402181:	20 
  402182:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  402189:	64 
  40218a:	41 c7 46 1c 20 73 74 	movl   $0x61747320,0x1c(%r14)
  402191:	61 
  402192:	41 c7 46 20 74 75 73 	movl   $0x20737574,0x20(%r14)
  402199:	20 
  40219a:	41 c7 46 24 6d 65 73 	movl   $0x7373656d,0x24(%r14)
  4021a1:	73 
  4021a2:	41 c7 46 28 61 67 65 	movl   $0x20656761,0x28(%r14)
  4021a9:	20 
  4021aa:	41 c7 46 2c 66 72 6f 	movl   $0x6d6f7266,0x2c(%r14)
  4021b1:	6d 
  4021b2:	41 c7 46 30 20 41 75 	movl   $0x74754120,0x30(%r14)
  4021b9:	74 
  4021ba:	41 c7 46 34 6f 6c 61 	movl   $0x62616c6f,0x34(%r14)
  4021c1:	62 
  4021c2:	41 c7 46 38 20 73 65 	movl   $0x72657320,0x38(%r14)
  4021c9:	72 
  4021ca:	41 c7 46 3c 76 65 72 	movl   $0x726576,0x3c(%r14)
  4021d1:	00 
  4021d2:	44 89 ef             	mov    %r13d,%edi
  4021d5:	e8 96 e8 ff ff       	callq  400a70 <close@plt>
  4021da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4021df:	e9 9a 01 00 00       	jmpq   40237e <submitr+0x90b>
  4021e4:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  4021eb:	00 
  4021ec:	4c 89 f7             	mov    %r14,%rdi
  4021ef:	e8 dc e9 ff ff       	callq  400bd0 <strcpy@plt>
  4021f4:	44 89 ef             	mov    %r13d,%edi
  4021f7:	e8 74 e8 ff ff       	callq  400a70 <close@plt>
  4021fc:	4d 89 f0             	mov    %r14,%r8
  4021ff:	45 0f b6 0e          	movzbl (%r14),%r9d
  402203:	0f b6 05 5e 0a 00 00 	movzbl 0xa5e(%rip),%eax        # 402c68 <array.3305+0x508>
  40220a:	41 39 c1             	cmp    %eax,%r9d
  40220d:	75 30                	jne    40223f <submitr+0x7cc>
  40220f:	41 0f b6 56 01       	movzbl 0x1(%r14),%edx
  402214:	0f b6 05 4e 0a 00 00 	movzbl 0xa4e(%rip),%eax        # 402c69 <array.3305+0x509>
  40221b:	39 c2                	cmp    %eax,%edx
  40221d:	75 20                	jne    40223f <submitr+0x7cc>
  40221f:	41 0f b6 56 02       	movzbl 0x2(%r14),%edx
  402224:	0f b6 05 3f 0a 00 00 	movzbl 0xa3f(%rip),%eax        # 402c6a <array.3305+0x50a>
  40222b:	39 c2                	cmp    %eax,%edx
  40222d:	75 10                	jne    40223f <submitr+0x7cc>
  40222f:	41 0f b6 56 03       	movzbl 0x3(%r14),%edx
  402234:	0f b6 05 30 0a 00 00 	movzbl 0xa30(%rip),%eax        # 402c6b <array.3305+0x50b>
  40223b:	39 c2                	cmp    %eax,%edx
  40223d:	74 46                	je     402285 <submitr+0x812>
  40223f:	4c 89 f6             	mov    %r14,%rsi
  402242:	bf 6c 2c 40 00       	mov    $0x402c6c,%edi
  402247:	b9 05 00 00 00       	mov    $0x5,%ecx
  40224c:	fc                   	cld    
  40224d:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  40224f:	0f 97 c2             	seta   %dl
  402252:	0f 92 c0             	setb   %al
  402255:	38 c2                	cmp    %al,%dl
  402257:	74 2c                	je     402285 <submitr+0x812>
  402259:	0f b6 05 11 0a 00 00 	movzbl 0xa11(%rip),%eax        # 402c71 <array.3305+0x511>
  402260:	41 39 c1             	cmp    %eax,%r9d
  402263:	75 2a                	jne    40228f <submitr+0x81c>
  402265:	41 0f b6 50 01       	movzbl 0x1(%r8),%edx
  40226a:	0f b6 05 01 0a 00 00 	movzbl 0xa01(%rip),%eax        # 402c72 <array.3305+0x512>
  402271:	39 c2                	cmp    %eax,%edx
  402273:	75 1a                	jne    40228f <submitr+0x81c>
  402275:	41 0f b6 50 02       	movzbl 0x2(%r8),%edx
  40227a:	0f b6 05 f2 09 00 00 	movzbl 0x9f2(%rip),%eax        # 402c73 <array.3305+0x513>
  402281:	39 c2                	cmp    %eax,%edx
  402283:	75 0a                	jne    40228f <submitr+0x81c>
  402285:	b8 00 00 00 00       	mov    $0x0,%eax
  40228a:	e9 ef 00 00 00       	jmpq   40237e <submitr+0x90b>
  40228f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402294:	e9 e5 00 00 00       	jmpq   40237e <submitr+0x90b>
  402299:	48 8d ac 24 50 60 00 	lea    0x6050(%rsp),%rbp
  4022a0:	00 
  4022a1:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  4022a6:	48 89 04 24          	mov    %rax,(%rsp)
  4022aa:	4c 8d 8c 24 50 40 00 	lea    0x4050(%rsp),%r9
  4022b1:	00 
  4022b2:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
  4022b7:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  4022bc:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  4022c1:	be c8 2b 40 00       	mov    $0x402bc8,%esi
  4022c6:	48 89 ef             	mov    %rbp,%rdi
  4022c9:	b8 00 00 00 00       	mov    $0x0,%eax
  4022ce:	e8 4d e8 ff ff       	callq  400b20 <sprintf@plt>
  4022d3:	48 89 ef             	mov    %rbp,%rdi
  4022d6:	fc                   	cld    
  4022d7:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4022de:	b8 00 00 00 00       	mov    $0x0,%eax
  4022e3:	f2 ae                	repnz scas %es:(%rdi),%al
  4022e5:	48 f7 d1             	not    %rcx
  4022e8:	49 89 cc             	mov    %rcx,%r12
  4022eb:	49 83 ec 01          	sub    $0x1,%r12
  4022ef:	0f 84 a8 fc ff ff    	je     401f9d <submitr+0x52a>
  4022f5:	4c 89 e3             	mov    %r12,%rbx
  4022f8:	e9 fb fb ff ff       	jmpq   401ef8 <submitr+0x485>
  4022fd:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  402304:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  40230b:	43 
  40230c:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  402313:	6e 
  402314:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  40231b:	6e 
  40231c:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  402323:	65 
  402324:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  40232b:	20 
  40232c:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  402333:	64 
  402334:	41 c7 46 1c 20 68 65 	movl   $0x61656820,0x1c(%r14)
  40233b:	61 
  40233c:	41 c7 46 20 64 65 72 	movl   $0x73726564,0x20(%r14)
  402343:	73 
  402344:	41 c7 46 24 20 66 72 	movl   $0x6f726620,0x24(%r14)
  40234b:	6f 
  40234c:	41 c7 46 28 6d 20 41 	movl   $0x7541206d,0x28(%r14)
  402353:	75 
  402354:	41 c7 46 2c 74 6f 6c 	movl   $0x616c6f74,0x2c(%r14)
  40235b:	61 
  40235c:	41 c7 46 30 62 20 73 	movl   $0x65732062,0x30(%r14)
  402363:	65 
  402364:	41 c7 46 34 72 76 65 	movl   $0x72657672,0x34(%r14)
  40236b:	72 
  40236c:	41 c6 46 38 00       	movb   $0x0,0x38(%r14)
  402371:	44 89 ef             	mov    %r13d,%edi
  402374:	e8 f7 e6 ff ff       	callq  400a70 <close@plt>
  402379:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40237e:	48 81 c4 78 a0 00 00 	add    $0xa078,%rsp
  402385:	5b                   	pop    %rbx
  402386:	5d                   	pop    %rbp
  402387:	41 5c                	pop    %r12
  402389:	41 5d                	pop    %r13
  40238b:	41 5e                	pop    %r14
  40238d:	41 5f                	pop    %r15
  40238f:	c3                   	retq   

0000000000402390 <driver_post>:
  402390:	53                   	push   %rbx
  402391:	48 83 ec 10          	sub    $0x10,%rsp
  402395:	48 89 cb             	mov    %rcx,%rbx
  402398:	85 d2                	test   %edx,%edx
  40239a:	74 1f                	je     4023bb <driver_post+0x2b>
  40239c:	bf 74 2c 40 00       	mov    $0x402c74,%edi
  4023a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4023a6:	e8 a5 e6 ff ff       	callq  400a50 <printf@plt>
  4023ab:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4023b0:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4023b4:	b8 00 00 00 00       	mov    $0x0,%eax
  4023b9:	eb 47                	jmp    402402 <driver_post+0x72>
  4023bb:	48 85 ff             	test   %rdi,%rdi
  4023be:	74 34                	je     4023f4 <driver_post+0x64>
  4023c0:	0f b6 17             	movzbl (%rdi),%edx
  4023c3:	0f b6 05 a6 08 00 00 	movzbl 0x8a6(%rip),%eax        # 402c70 <array.3305+0x510>
  4023ca:	39 c2                	cmp    %eax,%edx
  4023cc:	74 26                	je     4023f4 <driver_post+0x64>
  4023ce:	48 89 0c 24          	mov    %rcx,(%rsp)
  4023d2:	49 89 f1             	mov    %rsi,%r9
  4023d5:	41 b8 8b 2c 40 00    	mov    $0x402c8b,%r8d
  4023db:	48 89 f9             	mov    %rdi,%rcx
  4023de:	ba 93 2c 40 00       	mov    $0x402c93,%edx
  4023e3:	be 50 00 00 00       	mov    $0x50,%esi
  4023e8:	bf 78 2b 40 00       	mov    $0x402b78,%edi
  4023ed:	e8 81 f6 ff ff       	callq  401a73 <submitr>
  4023f2:	eb 0e                	jmp    402402 <driver_post+0x72>
  4023f4:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4023f9:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4023fd:	b8 00 00 00 00       	mov    $0x0,%eax
  402402:	48 83 c4 10          	add    $0x10,%rsp
  402406:	5b                   	pop    %rbx
  402407:	c3                   	retq   

0000000000402408 <sigalrm_handler>:
  402408:	48 83 ec 08          	sub    $0x8,%rsp
  40240c:	ba 00 00 00 00       	mov    $0x0,%edx
  402411:	be 28 2c 40 00       	mov    $0x402c28,%esi
  402416:	48 8b 3d 2b 19 20 00 	mov    0x20192b(%rip),%rdi        # 603d48 <stderr@@GLIBC_2.2.5>
  40241d:	b8 00 00 00 00       	mov    $0x0,%eax
  402422:	e8 b9 e7 ff ff       	callq  400be0 <fprintf@plt>
  402427:	bf 01 00 00 00       	mov    $0x1,%edi
  40242c:	e8 6f e6 ff ff       	callq  400aa0 <exit@plt>
  402431:	90                   	nop
  402432:	90                   	nop
  402433:	90                   	nop
  402434:	90                   	nop
  402435:	90                   	nop
  402436:	90                   	nop
  402437:	90                   	nop
  402438:	90                   	nop
  402439:	90                   	nop
  40243a:	90                   	nop
  40243b:	90                   	nop
  40243c:	90                   	nop
  40243d:	90                   	nop
  40243e:	90                   	nop
  40243f:	90                   	nop

0000000000402440 <__libc_csu_fini>:
  402440:	f3 c3                	repz retq 
  402442:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402449:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402450 <__libc_csu_init>:
  402450:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  402455:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  40245a:	4c 8d 25 23 0d 20 00 	lea    0x200d23(%rip),%r12        # 603184 <__fini_array_end>
  402461:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  402466:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  40246b:	49 89 f6             	mov    %rsi,%r14
  40246e:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  402473:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  402478:	48 83 ec 38          	sub    $0x38,%rsp
  40247c:	41 89 ff             	mov    %edi,%r15d
  40247f:	49 89 d5             	mov    %rdx,%r13
  402482:	e8 a1 e5 ff ff       	callq  400a28 <_init>
  402487:	48 8d 05 f6 0c 20 00 	lea    0x200cf6(%rip),%rax        # 603184 <__fini_array_end>
  40248e:	49 29 c4             	sub    %rax,%r12
  402491:	49 c1 fc 03          	sar    $0x3,%r12
  402495:	4d 85 e4             	test   %r12,%r12
  402498:	74 1e                	je     4024b8 <__libc_csu_init+0x68>
  40249a:	31 ed                	xor    %ebp,%ebp
  40249c:	48 89 c3             	mov    %rax,%rbx
  40249f:	90                   	nop
  4024a0:	48 83 c5 01          	add    $0x1,%rbp
  4024a4:	4c 89 ea             	mov    %r13,%rdx
  4024a7:	4c 89 f6             	mov    %r14,%rsi
  4024aa:	44 89 ff             	mov    %r15d,%edi
  4024ad:	ff 13                	callq  *(%rbx)
  4024af:	48 83 c3 08          	add    $0x8,%rbx
  4024b3:	49 39 ec             	cmp    %rbp,%r12
  4024b6:	75 e8                	jne    4024a0 <__libc_csu_init+0x50>
  4024b8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  4024bd:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  4024c2:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  4024c7:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  4024cc:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  4024d1:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  4024d6:	48 83 c4 38          	add    $0x38,%rsp
  4024da:	c3                   	retq   
  4024db:	90                   	nop
  4024dc:	90                   	nop
  4024dd:	90                   	nop
  4024de:	90                   	nop
  4024df:	90                   	nop

00000000004024e0 <__do_global_ctors_aux>:
  4024e0:	55                   	push   %rbp
  4024e1:	48 89 e5             	mov    %rsp,%rbp
  4024e4:	53                   	push   %rbx
  4024e5:	bb 88 31 60 00       	mov    $0x603188,%ebx
  4024ea:	48 83 ec 08          	sub    $0x8,%rsp
  4024ee:	48 8b 05 93 0c 20 00 	mov    0x200c93(%rip),%rax        # 603188 <__CTOR_LIST__>
  4024f5:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  4024f9:	74 14                	je     40250f <__do_global_ctors_aux+0x2f>
  4024fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402500:	48 83 eb 08          	sub    $0x8,%rbx
  402504:	ff d0                	callq  *%rax
  402506:	48 8b 03             	mov    (%rbx),%rax
  402509:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  40250d:	75 f1                	jne    402500 <__do_global_ctors_aux+0x20>
  40250f:	48 83 c4 08          	add    $0x8,%rsp
  402513:	5b                   	pop    %rbx
  402514:	c9                   	leaveq 
  402515:	c3                   	retq   
  402516:	90                   	nop
  402517:	90                   	nop

Disassembly of section .fini:

0000000000402518 <_fini>:
  402518:	48 83 ec 08          	sub    $0x8,%rsp
  40251c:	e8 3f e7 ff ff       	callq  400c60 <__do_global_dtors_aux>
  402521:	48 83 c4 08          	add    $0x8,%rsp
  402525:	c3                   	retq   
