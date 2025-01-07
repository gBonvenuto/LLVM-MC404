declare void @read(i32 %fd, ptr %input_address, i32 %size)
declare void @write(i32 %fd, ptr %buffer, i32 %size)

@str = global [21 x i8] c"0000 0000 0000 0000\0a\00", align 1

define i32 @_start() {

  ; Obtendo o primeiro valor
  %str_1 = getelementptr i8, ptr @str, i32 0
  call i32 @read(i32 0, ptr %str_1, i32 4); lendo 4 dígitos
  call i32 @read(i32 0, ptr null, i32 1) ; lendo o espaço
  %val1 = call i32 @atoi(ptr %str_1); guardando o valor numérico

  ; Obtendo o segundo valor
  %str_2 = getelementptr i8, ptr @str, i32 5
  call i32 @read(i32 0, ptr %str_2, i32 4); lendo 4 dígitos
  call i32 @read(i32 0, ptr null, i32 1) ; lendo o espaço
  %val2 = call i32 @atoi(ptr %str_2); guardando o valor numérico

  ; Obtendo o terceiro valor
  %str_3 = getelementptr i8, ptr @str, i32 10
  call i32 @read(i32 0, ptr %str_3, i32 4); lendo 4 dígitos
  call i32 @read(i32 0, ptr null, i32 1) ; lendo o espaço
  %val3 = call i32 @atoi(ptr %str_3); guardando o valor numérico

  ; Obtendo o quarto valor
  %str_4 = getelementptr i8, ptr @str, i32 15
  call i32 @read(i32 0, ptr %str_4, i32 4); lendo 4 dígitos
  call i32 @read(i32 0, ptr null, i32 1) ; comendo o \n
  %val4 = call i32 @atoi(ptr %str_4); guardando o valor numérico

  %val1.sqrt = call i32 @sqrt(i32 %val1)
  call void @itoa(i32 %val1.sqrt, ptr %str_1)

  %val2.sqrt = call i32 @sqrt(i32 %val2)
  call void @itoa(i32 %val2.sqrt, ptr %str_2)

  %val3.sqrt = call i32 @sqrt(i32 %val3)
  call void @itoa(i32 %val3.sqrt, ptr %str_3)

  %val4.sqrt = call i32 @sqrt(i32 %val4)
  call void @itoa(i32 %val4.sqrt, ptr %str_4)
  call i32 @write(i32 1, ptr @str, i32 25)

  br label %end

end:
  ret i32 0;
}

; itoa(i32 val, i8* buffer)
define void @itoa(i32 %1, i8* %2) {
  entry:
    br label %loop

  loop:
    %contador = phi i8 [0, %entry], [%contador.update, %loop]
    %val = phi i32 [%1, %entry], [%val.update, %loop]

    %char.index = sub i8 3, %contador
    %char.ptr = getelementptr inbounds i8, ptr %2, i8 %char.index
    %val.rem = srem i32 %val, 10
    %val.remi8 = trunc i32 %val.rem to i8
    %val.rem.char = add i8 %val.remi8, u0x30
    store i8 %val.rem.char, ptr %char.ptr

    ;TODO: vou parar por aqui e voltar amanhã
    %val.update = sdiv i32 %val, 10
    %contador.update = add i8 %contador, 1
    %cond = icmp slt i8 %contador, 3
    br i1 %cond, label %loop, label %break

  break:
    ret void
}

; atoi(char[] buf) i32
define i32 @atoi(i8* %1){
start:
  br label %loop

 loop:
  %contador = phi i8 [0, %start], [%10, %loop]
  %acc = phi i32 [0, %start], [ %9, %loop ]
  %mul = mul i32 %acc, 10

  %4 = getelementptr inbounds i8, ptr %1, i8 %contador ; obtendo o ponteiro pro caracter
  %5 = load i8, ptr %4 ; obtendo o caracter
  %6 = zext i8 %5 to i32
  %7 = sub i32 %6, u0x30 ; valor


  %9 = add i32 %mul, %7
  %10 = add i8 1, %contador

  %cond = icmp slt i8 %contador, 4
  br i1 %cond, label %loop, label %end

end: 
  ret i32 %acc
}

; usando o Babylonion Method
define i32 @sqrt(i32 %0) {
  entry:
    %k = sdiv i32 %0, 2
    br label %loop

  loop:
    %contador = phi i32 [0, %entry], [%contador.update, %loop]
    %kp.1 = phi i32 [%k, %entry], [%kp, %loop ]
    %kp.2 = sdiv i32 %0, %kp.1
    %kp.3 = add i32 %kp.2, %kp.1
    %kp = sdiv i32 %kp.3, 2
    %contador.update = add i32 1, %contador

    %cond = icmp slt i32 %contador, 20
    br i1 %cond, label %loop, label %break

  break:
    ret i32 %kp
}
