// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@i
M=1 //i = 1

// n = 8192 (32 * 256)
@8192
D=A
@n
M=D 

// screen = SCREEN
@SCREEN
D=A
@screen
M=D

(BLACK)
@24576
D=M
@WHITE
D;JGT

@i
D=M
@n
D=D-M
@END
D;JGT

@screen
A=M
M=-1
@i
M=M+1

@screen
M=M+1
@BLACK
0;JMP

(WHITE)
@24576
D=M
@BLACK
D;JEQ

@i
D=M
@n
D=D-M
@END
D;JGT

@screen
A=M
M=0
@i
M=M+1

@screen
M=M+1
@BLACK
0;JMP

(END)
@i
M=1
@SCREEN
D=A
@screen
M=D
@LOOP
0;JMP
