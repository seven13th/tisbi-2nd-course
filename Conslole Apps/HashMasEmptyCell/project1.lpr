program Pust;
var M:array of integer;
    p,i,a,Number,Shag,Kol,KolMas,q,Ostat,y:integer;

procedure DobavNumber;
begin
  randomize;
  Kol:=Kol+a;
  for i:=0 to a-1 do begin
    Number:=random(300);
    Ostat:=Number mod a*2;
    shag:=2;
    y:=Ostat;
    if M[y]<>0 then
      while M[y]<>0 do begin
        if (y+(2*shag))>(a*2) then
          y:=0;
        y:=y+shag;
        shag:=shag+1;
      end;
    M[y]:=Number;
    end;
end;

procedure Nachalo;
begin
  write('������ ������⢮ ������塞�� �ᥫ: ');
  readln(a);
  SetLength(M,a*2);
  KolMas:=a*2;
  DobavNumber;
end;

procedure Dobav;
begin
  write ('������ ������⢮ ������塞�� �ᥫ: ');
  readln(a);
  if a>KolMas then begin
    KolMas:=KolMas+a;
    SetLength(M,KolMas);
    DobavNumber;
  end
  else begin
    if (((Kol+a) mod KolMas)>95) or (((Kol+a) div KolMas)=1) then begin
      KolMas:=KolMas*2;
      SetLength(M,KolMas);
      DobavNumber;
    end
    else
      DobavNumber;
  end;
end;

procedure Vivod;
begin
  for i:=0 to KolMas-1 do
    write('(',i+1,')',M[i],', ');
  writeln;
end;

procedure Poisk;
begin
  write('������ �᪮��� �᫮: ');
  readln(p);
  for i:=0 to KolMas do begin
      if M[i]=p then
        writeln('��᫮ ������� �� (',i+1,') ����');
  end;
end;

begin
  Nachalo;
  repeat
  writeln('1 - ���������� �ᥫ');
  writeln('2 - �뢮�');
  writeln('3 - ����');
  writeln('4 - ��室');
  readln(q);
  Case q of
  1:Dobav;
  2:Vivod;
  3:Poisk;
  end;
  until q=4;
end.

