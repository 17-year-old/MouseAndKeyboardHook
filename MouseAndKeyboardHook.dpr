program MouseAndKeyboardHook;

uses
  Forms,
  uMouseAndKeyboardHook in 'uMouseAndKeyboardHook.pas' {frmMouseAndKeyboardHook};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMouseAndKeyboardHook, frmMouseAndKeyboardHook);
  Application.Run;
end.
