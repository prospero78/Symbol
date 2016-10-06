uses GraphABC;

var
   сим: array[0..7, 0..7]of integer;

procedure Окно_Установить;
begin
   SetSmoothingOn;
   window.SetSize(640, 480);
   floodfill(1, 1, clBlack);
   window.Title := 'Символ'; 
   (*Coordinate.SetMathematic; *)
end;

procedure Сетка_Уст;
const
   предел = 331;
begin
   pen.Color := clRed;
   pen.Width := 3;
   pen.Style := DashStyle.Solid;
   var x := 10;
   while x < предел do 
   begin
      Line(x, 10, x, предел, clRed);  
      x += 40;
   end;
   var y := 10;
   while y < предел do 
   begin
      Line(10, y, предел, y, clRed);  
      y += 40;
   end;
end;

procedure Мышь_Нажата(x, y, кнопка: integer);
begin
   TextOut(350, 400, '                                              ');
   TextOut(350, 400, 'x= ' + x + ' y= ' + y + ' кнопка= ' + кнопка);
   var x1, y1: integer;
   
   x1 := x div 40;   y1 := y div 40;
   
   textOut(350, 380, 'x= ' + x1);   textOut(390, 380, 'y= ' + y1);
   
   if x1 > 7 then x1 := 7;
   if y1 > 7 then y1 := 7;
   
   x := x1 * 40 + 30;   y := y1 * 40 + 30;
   
   if сим[x1, y1] = 1 then
   begin
      сим[x1, y1] := 0;
      pen.Color := clBlack;
      Rectangle(x - 16, y - 16, x + 16, y + 16);
      FloodFill(x, y, clBlack);
   end
   else
   begin
      сим[x1, y1] := 1;
      pen.Color := clBlue;
      Circle(x, y, 15);
      FloodFill(x, y, clYellow);
   end;
   Rectangle(410, 30, 420, 40);
   FloodFill(411, 31, clBlack);
   var num: array[0..7] of integer;
   for x := 0 to 7 do
   begin
      for y := 0 to 7 do
      begin
         if сим[x, y] = 1 then
         begin
            num[y] := num[y] + сим[x, y] * (1 shl x);
            SetPixel(410+x, 30+y, clWhite);
         end
         else   SetPixel(410+x, 30+y, clBlack);
      end;
   end;
   for y := 0 to 7 do
   begin
      textOut(350, 30 + y * 40, '            ');
      textOut(350, 30 + y * 40, y + ': ' + num[y]);
   end;
   
end;

begin
   Окно_Установить;
   Сетка_Уст;
   OnMouseDown := Мышь_Нажата;
   LockDrawing; 
   UnlockDrawing;
end.