unit Unit2;

{$mode objfpc}{$H+}

interface
type
  TStudent=class
  private
    Fam:string;
    Ocenki:array[1..10] of integer;
    i:integer;
  public
    Constructor Create;
    Procedure SetFam(NewFam:string);
    Procedure AddOcenky (NewOcenka:integer);
    Function SredBall:real;
end;

implementation
 uses
  Classes, SysUtils, Unit1;

constructor TStudent.Create;
begin
  Fam:='';
  i:=1;
end;

Procedure TStudent.SetFam(NewFam:string);
begin
  Form1.StringGrid1.Cells[0,0]:=NewFam;
  Form1.StringGrid1.Cells[1,0]:='Оценки';
  Form1.addMark.Visible:=true;
end;

Procedure TStudent.AddOcenky (NewOcenka:integer);
var q:integer;
begin

  Form1.StringGrid1.RowCount:=Form1.StringGrid1.RowCount+1;
  Form1.StringGrid1.Row:=Form1.StringGrid1.RowCount;
  Form1.StringGrid1.Cells[1,Form1.StringGrid1.Row]:=inttostr(NewOcenka);
  Form1.StringGrid1.Cells[0,Form1.StringGrid1.Row]:=Form1.ComboBox1.Items[Form1.ComboBox1.ItemIndex];
  Form1.averageBall.Visible:=true;
end;

function TStudent.SredBall:real;
var chet,sum,kol:integer; sred:real;
begin
  chet:=0;
  kol:=0;
  sum:=0;
  for chet:=1 to Form1.StringGrid1.RowCount-1 do begin
    sum:=sum+strtoint(Form1.StringGrid1.Cells[1,chet]);
    kol:=kol+1;
  end;
  Sred:=sum/kol;
  Form1.Edit2.Text:=floattostr(sred);
end;

end.

