program Client;

uses
  Vcl.Forms,
  uClient in 'uClient.pas' {frmClient};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmClient, frmClient);
  Application.Run;
end.
