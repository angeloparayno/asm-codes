;PARAYNO, JOHN ANGELO DC.
;PADILLA, CRISZELLE
;2ITAw

.model small
.stack 64
.data
		;PRIMARY TABLE OUTPUT
		a db 10,13,"--------------------------------------------------------------------$"
        b db 10,13,"|                     Angelo's Vegetable Store                     |$"
        c db 10,13,"|     -----            -----            -----            -----     |$"
        d db 10,13,"|    |  9  |          |  9  |          |  9  |          |  9  |    |$"
        e db 10,13,"|     -----            -----            -----            -----     |$"
        f db 10,13,"|   [A]Asparagus     [B]Broccoli       [G]Garlic         [O]Okra   |$"
        g db 10,13,"|------------------------------------------------------------------|$"
        h db 10,13,"|            What kind of vegetable do you want to buy?            |$"
        i db 10,13,"|       what?[_]          qty? [_]        buy again:(y/n) [_]      |$"
        j db 10,13,"--------------------------------------------------------------------$"
		;SECONDARY TABLE OUTPUT
		k db 10,13,"|                 Invalid Input, Please try again!                 |$"
		l db 10,13,"|                   How many do you want to buy? 	               |$"
		m db 10,13,"|                 Not Enough Stack, Please Try Again               |$"
		n db 10,13,"|   There're no more Stack, Do you like to buy other vegetables    |$"
		o db 10,13,"|    Thank you for dropping by our store, Please come again!!      |$"	
		;VARIABLES
		as db 39h
		br db 39h
		ga db 39h
		ok db 39h

.386
.code

main proc far
	mov ax,@data
	mov ds,ax
	
	mov ax,03h
	int 10h
;----- ----- ----- ----- -----
	lea dx,a
	call string
	lea dx,b
	call string
	lea dx,c
	call string
	lea dx,d
	call string
	lea dx,e
	call string
	lea dx,f
	call string
	lea dx,g
	call string
	lea dx,h
	call string
	lea dx,g
	call string
	lea dx,i
	call string
	lea dx,j
	call string
;----- Anoher Trasaction -----
again:	
	;----- Display -----
		call setDisplay
	
		lea dx,h
		call string
;-----------------------------
	mov bl,07h
	call reset
;-----------------------------	
again2:	
;-----------------------------	
	mov dl,14
	mov dh,10
	call setcursor
	
	call input 
	
	cmp al,'A'
	je Asparagus
	cmp al,'a'
	je Asparagus
	cmp al,'B'
	je Broccoli
	cmp al,'b'
	je Broccoli
	cmp al,'G'
	je Garlic
	cmp al,'g'
	je Garlic
	cmp al,'O'
	je Okra
	cmp al,'o'
	je Okra
	
	call setDisplayInvalid
	lea dx,k
	call string
	
	jmp again2
;----- ----- ----- ----- -----
	Asparagus:
		;----- Display -----
		call setDisplay
	
		lea dx,l
		call string
		
	cmp as,30h
	je NoMoreStack
	
	;----- ----- ----- ----- -----
	inputQtyAgain1:
	;----- ----- ----- ----- -----	
	mov dl,32
	mov dh,10
	call setcursor
	
	call input
	cmp al,39h
	ja check1
	cmp al,30h	
	jb check1
	
	sub as,al
	add as,30h
	;----- Check if there's a Stack -----
	cmp as,30h
	jnb continue1
	
	add as,al
	sub as,30h
	
	call setDisplayInvalid
	lea dx,m
	call string
	
	jmp inputQtyAgain1
	;----- Checks if it's not a number -----
	check1:
	call setDisplayInvalid
	lea dx,k
	call string
	
	jmp inputQtyAgain1
	;----- ----- -----
	continue1:
	call setDisplay
	
	mov dl,8
	mov dh,4
	call setcursor
	
	mov dl,as
	call output

	jmp askYesOrNo
;----- ----- ----- ----- -----
	Broccoli:
		;----- Display -----
		call setDisplay
	
		lea dx,l
		call string
		
	cmp br,30h
	je NoMoreStack
	
	;----- ----- ----- ----- -----
	inputQtyAgain2:
	;----- ----- ----- ----- -----	
	mov dl,32
	mov dh,10
	call setcursor
	
	call input
	cmp al,39h
	ja check2
	cmp al,30h	
	jb check2
	
	sub br,al
	add br,30h
	;----- Check if there's a Stack -----
	cmp br,30h
	jnb continue2
	
	add br,al
	sub br,30h
	
	call setDisplayInvalid
	lea dx,m
	call string
	
	jmp inputQtyAgain2
	;----- Checks if it's not a number -----
	check2:
	call setDisplayInvalid
	lea dx,k
	call string
	
	jmp inputQtyAgain2
	;----- ----- -----
	continue2:
	call setDisplay
	
	mov dl,25
	mov dh,4
	call setcursor
	
	mov dl,br
	call output

	jmp askYesOrNo
;----- ----- ----- ----- -----
	Garlic:
		;----- Display -----
		call setDisplay
	
		lea dx,l
		call string
	
	cmp ga,30h
	je NoMoreStack
	
	;----- ----- ----- ----- -----
	inputQtyAgain3:
	;----- ----- ----- ----- -----	
	mov dl,32
	mov dh,10
	call setcursor
	
	call input
	cmp al,39h
	ja check3
	cmp al,30h	
	jb check3
	
	sub ga,al
	add ga,30h
	;----- Check if there's a Stack -----
	cmp ga,30h
	jnb continue3
	
	add ga,al
	sub ga,30h
	
	call setDisplayInvalid
	lea dx,m
	call string
	
	jmp inputQtyAgain3
	;----- Checks if it's not a number -----
	check3:
	call setDisplayInvalid
	lea dx,k
	call string
	
	jmp inputQtyAgain3
	;----- ----- -----
	continue3:
	call setDisplay
	
	mov dl,42
	mov dh,4
	call setcursor
	
	mov dl,ga
	call output

	jmp askYesOrNo
;----- ----- ----- ----- -----
	Okra:
		;----- Display -----
		call setDisplay
	
		lea dx,l
		call string

	cmp ok,30h
	je NoMoreStack	
		
	;----- ----- ----- ----- -----
	inputQtyAgain4:
	;----- ----- ----- ----- -----	
	mov dl,32
	mov dh,10
	call setcursor
	
	call input
	cmp al,39h
	ja check4
	cmp al,30h	
	jb check4
	
	sub ok,al
	add ok,30h
	;----- Check if there's a Stack -----
	cmp ok,30h
	jnb continue4
	
	add ok,al
	sub ok,30h
	
	call setDisplayInvalid
	lea dx,m
	call string
	
	jmp inputQtyAgain4
	;----- Checks if it's not a number -----
	check4:
	call setDisplayInvalid
	lea dx,k
	call string
	
	jmp inputQtyAgain4
	;----- ----- -----
	continue4:
	call setDisplay
	
	mov dl,59
	mov dh,4
	call setcursor
	
	mov dl,ok
	call output

	jmp askYesOrNo
;----- ----- ----- ----- -----
NoMoreStack:
;----- ----- ----- ----- -----
	call setDisplay
	
	lea dx,n
	call string
;----- ----- ----- ----- -----
askYesOrNo:
;----- ----- ----- ----- -----
	mov bl,87h
	call reset
	
	mov dl,59
	mov dh,10
	call setcursor
	
	call input
	
	cmp al,'y'
	je again
	cmp al,'Y'
	je again
	cmp al,'N'
	je stop
	cmp al,'n'
	je stop
	
	call setDisplayInvalid
	
	jmp askYesOrNo
;----- ----- ----- ----- -----	
	stop:
;----- ----- ----- ----- -----
	mov bl,07h
	call reset
	
	call setDisplay

	lea dx,o
	call string
	
	mov ah,4ch
	int 21h
	
output proc
mov ah,2
int 21h
ret
output endp

input proc
mov ah,1
int 21h
ret
input endp

setcursor proc
mov ah,2
mov bh,0
int 10h
ret
setcursor endp
       
string proc
mov ah,9
int 21h
ret
string endp

setattribute proc
mov ah,9
mov al,' '
mov cx,63
int 10h;
ret
setattribute endp

setDisplay proc
mov dl,2
mov dh,8
call setcursor
mov bl,07h
call setattribute
mov dl,4
mov dh,7	
call setcursor
ret
setdisplay endp

setDisplayinvalid proc
mov dl,2
mov dh,8
call setcursor
mov bl,87h
call setattribute
mov dl,4
mov dh,7
call setcursor
ret
setdisplayinvalid endp

reset proc
mov dl,42
mov dh,10
call setcursor
mov ah,9
mov al,' '
mov cx,15
int 10h
mov dl,0
mov dh,9
call setcursor
lea dx,i
call string
ret
reset endp
	
main endp
end main