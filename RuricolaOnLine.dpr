program RuricolaOnLine;

uses
  Vcl.Forms,
  Unit_Principal in 'Janelas\Unit_Principal.pas' {FrmMenu},
  Unit_DM in 'DAO\Unit_DM.pas' {DM: TDataModule},
  Unit_Pai in 'Janelas\Unit_Pai.pas' {FrmPai},
  Unit_Padrao in 'Janelas\Unit_Padrao.pas' {FrmPadrao},
  Unit_CadTurmas in 'Janelas\Cadastros\Unit_CadTurmas.pas' {FrmCadTurmas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.Run;
end.
