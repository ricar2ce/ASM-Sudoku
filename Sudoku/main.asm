
INCLUDE Irvine32.inc
.data
unsolved byte 5,3,0,0,7,0,0,0,0,6,0,0,1,9,5,0,0,0,0,9,8,0,0,0,0,6,0,8,0,0,0,6,0,0,0,3,4,0,0,8,0,3,0,0,1,7,0,0
solved   byte 5,3,4,6,7,8,9,1,2,6,7,2,1,9,5,3,4,8,1,9,8,3,4,2,5,6,7,8,5,9,7,6,1,4,2,3,4,2,6,8,5,3,7,9,1,7,1,3
string   byte " enter Solution : ",0
value    byte ?
row     dword  ?
col     dword ?
st1     byte  "okay",0
incrementation  byte ?
r byte "Enter Row :" ,0
c1 byte "Enter Colomn :" ,0
wrongAns byte "Wrong Answer",0
.code
check PROC
COMMENT @
mov ebx,row
dec ebx
mov ecx,9
l2:
   add ebx,ebx

loop l2
add ebx,col
@
add esi,30 ;; add 3l offset value el formula
add edi,30 ;; add 3l offset value el formula
movzx ecx,byte ptr[esi] ;; move el value el fel esi (solved) fl ecx
cmp value,cl ;; compare el fel ecx bel enetered value (law equal zero flag hykon b one
jnz l1 ;; jump if xero flag=zero
mov edx,offset st1 ;; move offset string okay
mov eax,2
call SetTextColor
call writestring ;; write okay 
RET
l1: mov edx,offset wrongAns;; law msh zy ba3d hygy hena ( el mafrood cout wrong answer )
    mov eax,4
call SetTextColor
	call writestring
RET
check ENDP ;; end function
main PROC
   mov edx , offset string ;;count enter number
   call writestring
   call readdec ;; fel acx 3ndi el value entered
   mov value ,al
   mov edx,offset r
   call writestring ;;cout enter row
   call readdec ;; enter row
   mov row,eax 
   mov edx,offset c1
   call writestring ;; cout enter row
   call readdec ;; enter col
   mov col,eax
   mov esi,offset solved ;;move offset of arrays
   mov edi ,offset unsolved
   call check ;; proc call


    call dumpregs
	exit
main ENDP

END main