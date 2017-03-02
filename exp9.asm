assume cs:code,ds:data,ss:stack

data segment
    db 'welcome to masm!'
    db 0C2h,24h,71h
    dw 720H,7c0H,860H

data ends

stack segment
    dw 8 dup(0)
stack ends
code segment
start: 
       mov ax,data
       mov es,ax
       mov ax,0B800h
       mov ds,ax
       mov cx,3
       mov di,0
       mov si,0 
 
s:     push cx
       push di
       push si
       mov cx,10h
       mov bx,es:[19+di]   
       mov ah,es:[16+si]          
       mov si,0
       mov di,0           
s0:    mov al,es:[si]      
       mov ds:[bx+di],al   
       mov ds:[bx+di+1],ah 
       inc si
       add di,2
       loop s0
       
       pop si
       pop di
       pop cx 
   
       add si,1
       add di,2      
       loop s
    
       mov ax,4c00h
       int 21h
code ends
end start


