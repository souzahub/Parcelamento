program Parcelamento_Dias;

uses
  Forms,
  u_parcelamento in 'u_parcelamento.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
