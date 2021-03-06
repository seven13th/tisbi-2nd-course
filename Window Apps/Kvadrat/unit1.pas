unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TCalc }

  TCalc = class(TForm)
    ButtonCalculate: TButton;
    ButtonClose: TButton;
    a: TEdit;
    b: TEdit;
    c: TEdit;
    Heading: TLabel;
    equation1: TLabel;
    equation2: TLabel;
    equation3: TLabel;
    x1: TLabel;
    MainPanel: TPanel;
    x2: TLabel;
    procedure aChange(Sender: TObject);
    procedure bChange(Sender: TObject);
    procedure ButtonCalculateClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure cChange(Sender: TObject);
    procedure equation1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Calc: TCalc;
  first_coef,second_coef,third_coef:Real;
  result:string;
  a1,b1,c1:boolean;

implementation

{$R *.lfm}

{ TCalc }

procedure TCalc.equation1Click(Sender: TObject);
begin

end;

procedure TCalc.aChange(Sender: TObject);
begin
  If a.Text='' then a.Text:='1';
  first_coef:=StrToFloat(a.Text);
end;

procedure TCalc.bChange(Sender: TObject);
begin
  If b.Text='' then b.Text:='1';
  second_coef:=StrToFloat(b.Text);
end;

procedure TCalc.ButtonCalculateClick(Sender: TObject);
Var D, X, result1,result2 : Real;
Begin
  a1:=false; b1:=false; c1:=false;
  If first_coef = 0 then a1:=true;
  If second_coef = 0 then b1:=true;
  If third_coef = 0 then c1:=true;
  If (a1 and b1 and c1 = true) then begin
  x1.Caption:='';
  x2.Caption:='';
  ShowMessage('Ошибка! Введите корректные коэффициенты.')
  end
  else
  Begin
If first_coef=0 Then
Begin
     X:=-third_coef/second_coef;
     x2.Caption:=FloatToStr(X);
     x1.Caption:='ОТВЕТ: ';
End else
If second_coef=0 Then
Begin
     x1.Caption:='';
     x2.Caption:='';
     ShowMessage('Нет решения!');
End else begin
   D:=second_coef*second_coef-4*first_coef*third_coef;
   If D<0 Then begin
   x1.Caption:='';
   x2.Caption:='';
   ShowMessage('Корней нет!');
   end
      Else
      Begin
      result1:=(-second_coef+SQRT(D))/2/first_coef;
      result2:=(-second_coef-SQRT(D))/2/first_coef;
      if (result1 = result2)then begin
      x1.Caption:='Ответ: ';
      x2.Caption:='X = '+FloatToStr(result2);
      end else begin
      x1.Caption:='X1= '+ FloatToStr(result2);
      x2.Caption:='X2= '+FloatToStr(result1);
      End;
   End;
End;
end;
end;

procedure TCalc.ButtonCloseClick(Sender: TObject);
begin
  close;
end;

procedure TCalc.cChange(Sender: TObject);
begin
  If c.Text='' then c.Text:='1';
  third_coef:=StrToFloat(c.Text);
end;

end.

