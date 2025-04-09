unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  { TForm1 }
  TForm1 = class(TForm)
    btnBack: TButton;
    btnFive: TButton;
    btnSix: TButton;
    btnMinus: TButton;
    btnOne: TButton;
    btnTwo: TButton;
    btnThree: TButton;
    btnMultiplication: TButton;
    btnZero: TButton;
    btnDot: TButton;
    btnEqual: TButton;
    btnCe: TButton;
    Button20: TButton;
    btnC: TButton;
    btnPm: TButton;
    btnSeven: TButton;
    btnEight: TButton;
    btnNine: TButton;
    btnPlus: TButton;
    btnFour: TButton;
    Edit1: TEdit;
    procedure btnTwoClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DigitButtonClick(Sender: TObject);
    procedure OperatorButtonClick(Sender: TObject);
    procedure EqualsButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure ClearEntryButtonClick(Sender: TObject);
    procedure BackspaceButtonClick(Sender: TObject);
    procedure PlusMinusButtonClick(Sender: TObject);
    procedure DotButtonClick(Sender: TObject);
  private
         FOperand: Double;
         FOperation: Char;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.btnTwoClick(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := '0';
  FOperand := 0;
  FOperation := #0;


  btnZero.OnClick := @DigitButtonClick;
  btnOne.OnClick := @DigitButtonClick;
  btnTwo.OnClick := @DigitButtonClick;
  btnThree.OnClick := @DigitButtonClick;
  btnFour.OnClick := @DigitButtonClick;
  btnFive.OnClick := @DigitButtonClick;
  btnSix.OnClick := @DigitButtonClick;
  btnSeven.OnClick := @DigitButtonClick;
  btnEight.OnClick := @DigitButtonClick;
  btnNine.OnClick := @DigitButtonClick;


  btnPlus.OnClick := @OperatorButtonClick;
  btnMinus.OnClick := @OperatorButtonClick;
  btnMultiplication.OnClick := @OperatorButtonClick;
  Button20.OnClick := @OperatorButtonClick;

  btnEqual.OnClick := @EqualsButtonClick;


  btnC.OnClick := @ClearButtonClick;
  btnCe.OnClick := @ClearEntryButtonClick;
  btnBack.OnClick := @BackspaceButtonClick;
  btnPm.OnClick := @PlusMinusButtonClick;
  btnDot.OnClick := @DotButtonClick;
end;

procedure TForm1.DigitButtonClick(Sender: TObject);
var
  digit: string;
begin
  digit := (Sender as TButton).Caption;
  if Edit1.Text = '0' then
    Edit1.Text := digit
  else
    Edit1.Text := Edit1.Text + digit;
end;

procedure TForm1.OperatorButtonClick(Sender: TObject);
begin
  FOperand := StrToFloat(Edit1.Text);
  FOperation := (Sender as TButton).Caption[1];
  Edit1.Text := '0';
end;

procedure TForm1.EqualsButtonClick(Sender: TObject);
var
  secondOperand, resultValue: Double;
begin
  secondOperand := StrToFloat(Edit1.Text);
  case FOperation of
    '+': resultValue := FOperand + secondOperand;
    '-': resultValue := FOperand - secondOperand;
    '*': resultValue := FOperand * secondOperand;
    '/': begin
           if secondOperand <> 0 then
             resultValue := FOperand / secondOperand
           else
           begin
             ShowMessage('Nie dziel przez zero!');
             Exit;
           end;
         end;
  else
    resultValue := secondOperand;
  end;
  Edit1.Text := FloatToStr(resultValue);
  FOperation := #0;
end;

procedure TForm1.ClearButtonClick(Sender: TObject);
begin
  Edit1.Text := '0';
  FOperand := 0;
  FOperation := #0;
end;

procedure TForm1.ClearEntryButtonClick(Sender: TObject);
begin
  Edit1.Text := '0';
end;

procedure TForm1.BackspaceButtonClick(Sender: TObject);
var
  s: string;
begin
  s := Edit1.Text;
  if Length(s) > 1 then
  begin
    Delete(s, Length(s), 1);
    Edit1.Text := s;
  end
  else
    Edit1.Text := '0';
end;

procedure TForm1.PlusMinusButtonClick(Sender: TObject);
var
  value: Double;
begin
  value := StrToFloat(Edit1.Text);
  value := -value;
  Edit1.Text := FloatToStr(value);
end;

procedure TForm1.DotButtonClick(Sender: TObject);
begin
  if Pos(FormatSettings.DecimalSeparator, Edit1.Text) = 0 then
    Edit1.Text := Edit1.Text + FormatSettings.DecimalSeparator;
end;
end.


