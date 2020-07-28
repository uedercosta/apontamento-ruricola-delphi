unit Unit_CadTurmas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Unit_Padrao, Data.DB, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, ACBrBase, ACBrEnterTab,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFrmCadTurmas = class(TFrmPadrao)
    Label1: TLabel;
    edcodigo: TDBEdit;
    eddescricao: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure act_IncluirExecute(Sender: TObject);
    procedure act_EditarExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadTurmas: TFrmCadTurmas;

implementation

uses
  Unit_Principal;

{$R *.dfm}

procedure TFrmCadTurmas.act_EditarExecute(Sender: TObject);
begin
  inherited;
  eddescricao.SetFocus;
end;

procedure TFrmCadTurmas.act_IncluirExecute(Sender: TObject);
begin
  inherited;
  eddescricao.SetFocus;
end;

procedure TFrmCadTurmas.act_SalvarExecute(Sender: TObject);
begin
  edcodigo.SetFocus;
  inherited;

end;

procedure TFrmCadTurmas.FormShow(Sender: TObject);
begin
  VAR_Tabela:= 'TURMAS';
  VAR_Comando:= '';
  VAR_Comando:= Format('SELECT * FROM %S(NOLOCK) WHERE ID_EMPRESA = %S', ['TURMAS',VAR_Empresa.ToString]);
  inherited;
end;

end.
