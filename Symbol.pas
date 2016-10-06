uses GraphABC;

var
   ���: array[0..7, 0..7]of integer;

procedure ����_����������;
begin
   SetSmoothingOn;
   window.SetSize(640, 480);
   floodfill(1, 1, clBlack);
   window.Title := '������'; 
   (*Coordinate.SetMathematic; *)
end;

procedure �����_���;
const
   ������ = 331;
begin
   pen.Color := clRed;
   pen.Width := 3;
   pen.Style := DashStyle.Solid;
   var x := 10;
   while x < ������ do 
   begin
      Line(x, 10, x, ������, clRed);  
      x += 40;
   end;
   var y := 10;
   while y < ������ do 
   begin
      Line(10, y, ������, y, clRed);  
      y += 40;
   end;
end;

procedure ����_������(x, y, ������: integer);
begin
   TextOut(350, 400, '                                              ');
   TextOut(350, 400, 'x= ' + x + ' y= ' + y + ' ������= ' + ������);
   var x1, y1: integer;
   
   x1 := x div 40;   y1 := y div 40;
   
   textOut(350, 380, 'x= ' + x1);   textOut(390, 380, 'y= ' + y1);
   
   if x1 > 7 then x1 := 7;
   if y1 > 7 then y1 := 7;
   
   x := x1 * 40 + 30;   y := y1 * 40 + 30;
   
   if ���[x1, y1] = 1 then
   begin
      ���[x1, y1] := 0;
      pen.Color := clBlack;
      Rectangle(x - 16, y - 16, x + 16, y + 16);
      FloodFill(x, y, clBlack);
   end
   else
   begin
      ���[x1, y1] := 1;
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
         if ���[x, y] = 1 then
         begin
            num[y] := num[y] + ���[x, y] * (1 shl x);
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
   ����_����������;
   �����_���;
   OnMouseDown := ����_������;
   LockDrawing; 
   UnlockDrawing;
end.