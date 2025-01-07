declare i32 @read(i32, i8*, i32)

declare i32 @puts(i8*)

define void @main() {
  %text = alloca [10 x i8]
  %1 = call i32 @read(i32 0, ptr %text, i32 9)
  %2 = call i32 @puts(ptr %text)
  ret void 
}
