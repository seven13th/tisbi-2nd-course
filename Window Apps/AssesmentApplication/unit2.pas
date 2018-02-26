unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { TSelectTest }

  TSelectTest = class(TForm)
    CancelBtn: TButton;
    MathBtn: TButton;
    InformaticsBtn: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Username: TLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InformaticsBtnClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure MathBtnClick(Sender: TObject);
    procedure UsernameClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
 var RESULTS_HEADER, TEST_TYPE:String;
var
  SelectTest: TSelectTest;
  TestResults:text;
implementation
 uses Unit1,Unit3;
{$R *.lfm}

{ TSelectTest }

procedure TSelectTest.UsernameClick(Sender: TObject);
begin

end;

procedure TSelectTest.FormCreate(Sender: TObject);
begin

end;

procedure TSelectTest.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSelectTest.FormActivate(Sender: TObject);
begin
end;

procedure TSelectTest.InformaticsBtnClick(Sender: TObject);
begin
  Unit3.isInfo:=True;
  Test.ShowModal;
end;

procedure TSelectTest.Label1Click(Sender: TObject);
begin

end;

procedure TSelectTest.MathBtnClick(Sender: TObject);
begin
  Unit3.isMath:=True;
  Test.ShowModal;
end;

end.

