unit uClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp,
  Vcl.ExtCtrls;

type
  TfrmClient = class(TForm)
    btnSend: TButton;
    ClientSocket: TClientSocket;
    mmLog: TMemo;
    edtServerIP: TLabeledEdit;
    edtServerPort: TLabeledEdit;
    edtData: TLabeledEdit;
    procedure btnSendClick(Sender: TObject);
    procedure ClientSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
  private
    procedure Log(Msg: string);
  public
    { Public declarations }
  end;

var
  frmClient: TfrmClient;

implementation

{$R *.dfm}

procedure TfrmClient.btnSendClick(Sender: TObject);
begin
  try
    if ClientSocket.Active then
      ClientSocket.Close;

    ClientSocket.Host := edtServerIP.Text;
    ClientSocket.Port := StrToInt(edtServerPort.Text);
    ClientSocket.Open;
  except on E: Exception do
    Log(E.Message);
  end;
end;

procedure TfrmClient.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  Data: AnsiString;
begin
  Data := AnsiString(edtData.Text);
  ClientSocket.Socket.SendText(Data);
  Log('Send Data      ' + Data);
end;

procedure TfrmClient.Log(Msg: string);
var
  s: string;
begin
  s:= FormatDateTime('yyyy-mm-dd hh:mm:ss ', Now());
  mmLog.Lines.Add(format('%s : %s',[s, Msg]));
end;

end.
