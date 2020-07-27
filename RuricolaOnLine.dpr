program RuricolaOnLine;

uses
  Vcl.Forms,
  Unit_Principal in 'Janelas\Unit_Principal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
