unit uMouseAndKeyboardHook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, DateUtils, StdCtrls;

type
  TfrmMouseAndKeyboardHook = class(TForm)
    tmrCheckLastActionTime: TTimer;
    edtTriggerTime: TEdit;
    Label1: TLabel;
    btnSetTriggerTime: TButton;
    Label2: TLabel;
    procedure tmrCheckLastActionTimeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSetTriggerTimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMouseAndKeyboardHook: TfrmMouseAndKeyboardHook;

implementation

{$R *.dfm}

const
  WH_KEYBOARD_LL = 13;
  WH_MOUSE_LL = 14;

var
  LastActionTime: Cardinal;
  gMouseHook: HHOOK;
  gKeyboardHook: HHOOK;
  nTriggerTime: Integer;

function MouseHookProc(iCode: Integer; wParam: wParam; lParam: lParam): LRESULT; stdcall;
begin
  if iCode >= 0 then
  begin
    if (iCode = HC_ACTION) then
    begin
      LastActionTime := GetTickCount;
    end;
  end;

  Result := CallNextHookEx(gMouseHook, iCode, wParam, lParam);
end;

function KeyboardHookProc(iCode: Integer; wParam: wParam; lParam: lParam): LRESULT; stdcall;
begin
  if iCode >= 0 then
  begin
    if (iCode = HC_ACTION) then
    begin
      LastActionTime := GetTickCount;
    end;
  end;

  Result := CallNextHookEx(gKeyboardHook, iCode, wParam, lParam);
end;

procedure TfrmMouseAndKeyboardHook.tmrCheckLastActionTimeTimer(Sender: TObject);
var
  nMinuteSpan: Integer;
begin
  if nTriggerTime > 0 then
  begin
    nMinuteSpan := (GetTickCount - LastActionTime) div (60 * 1000);
    if nMinuteSpan >= nTriggerTime then
    begin
      LastActionTime := GetTickCount;
      ShowMessage('Triggered');
    end;
  end;
end;

procedure TfrmMouseAndKeyboardHook.FormCreate(Sender: TObject);
begin
  nTriggerTime := 3;

  gMouseHook := SetWindowsHookEx(WH_MOUSE_LL, MouseHookProc, HInstance, 0);
  if gMouseHook = 0 then
  begin
    raise Exception.Create('×¢²áÊó±ê¹³×Óº¯ÊýÊ§°Ü');
  end;

  gKeyboardHook := SetWindowsHookEx(WH_KEYBOARD_LL, KeyboardHookProc, HInstance, 0);
  if gKeyboardHook = 0 then
  begin
    raise Exception.Create('×¢²á¼üÅÌ¹³×Óº¯ÊýÊ§°Ü');
  end;
end;

procedure TfrmMouseAndKeyboardHook.FormDestroy(Sender: TObject);
begin
  if gKeyboardHook <> 0 then
    UnhookWindowsHookEx(gKeyboardHook);
  if gMouseHook <> 0 then
    UnhookWindowsHookEx(gMouseHook);
end;

procedure TfrmMouseAndKeyboardHook.btnSetTriggerTimeClick(Sender: TObject);
begin
  nTriggerTime := StrToIntDef(edtTriggerTime.Text, 3);
end;

end.

