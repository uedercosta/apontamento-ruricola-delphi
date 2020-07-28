unit Unit_Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Unit_Pai,
  ACBrBase, ACBrEnterTab, Vcl.ComCtrls, System.Actions, Vcl.ActnList,
  Vcl.Buttons, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls, Unit_DM;

type
  TFrmPadrao = class(TFrmPai)
    ilBotoes: TImageList;
    Panel1: TPanel;
    btnIncluir: TSpeedButton;
    ActionList1: TActionList;
    act_Incluir: TAction;
    act_Editar: TAction;
    act_Salvar: TAction;
    act_Cancelar: TAction;
    act_Excluir: TAction;
    act_Sair: TAction;
    act_Pesquisar: TAction;
    btnEditar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    act_Relatorios: TAction;
    btnRelatorios: TSpeedButton;
    btnPesquisar: TSpeedButton;
    sb: TStatusBar;
    ds: TDataSource;
    pnDados: TPanel;
    procedure act_SairExecute(Sender: TObject);
    procedure act_IncluirExecute(Sender: TObject);
    procedure act_CancelarExecute(Sender: TObject);
    procedure act_EditarExecute(Sender: TObject);
    procedure act_SalvarExecute(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure act_PesquisarExecute(Sender: TObject);
    procedure act_RelatoriosExecute(Sender: TObject);
    procedure act_ExcluirExecute(Sender: TObject);
  private
    { Private declarations }
    procedure camposUpper;
    function getCodigo(Tabela: string): Integer;
    procedure camposSomenteLeitura;
  public
    { Public declarations }
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

uses
  Unit_Principal;

{$R *.dfm}

procedure TFrmPadrao.act_CancelarExecute(Sender: TObject);
begin
  if Assigned(ds.DataSet) then
  begin
    TFDQuery(ds.DataSet).CancelUpdates;
    Application.MessageBox('Todas as alterações foram desfeitas.', 'Informação', MB_OK + MB_ICONINFORMATION);
    Exit;
  end
  else
  begin
    Application.MessageBox('DataSet não informado.' + #13#10 + 'Entre em contato com o Administrador do sistema!!!', 'Informação', MB_OK + MB_ICONSTOP);
    Exit;
  end;
end;

procedure TFrmPadrao.act_EditarExecute(Sender: TObject);
begin
  if Assigned(ds.DataSet) then
  begin
    if not (ds.DataSet.IsEmpty) then
    begin
      ds.DataSet.Edit;
    end;
  end
  else
  begin
    Application.MessageBox('DataSet não informado.' + #13#10 + 'Entre em contato com o Administrador do sistema!!!', 'Informação', MB_OK + MB_ICONSTOP);
    Exit;
  end;
end;

procedure TFrmPadrao.act_ExcluirExecute(Sender: TObject);
begin
  inherited;
  if Assigned(ds.DataSet) then
  begin
    if Application.MessageBox('Confirma a exclusão do Registro ? ', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      TFDQuery(ds.DataSet).Delete;
      TFDQuery(ds.DataSet).Close;
      TFDQuery(ds.DataSet).open;
      Application.MessageBox('Registro excluído com sucesso.', 'Informação', MB_OK + MB_ICONINFORMATION);
    end;
  end
  else
  begin
    Application.MessageBox('DataSet não informado.' + #13#10 + 'Entre em contato com o Administrador do sistema!!!', 'Informação', MB_OK + MB_ICONSTOP);
    Exit;
  end;
end;

procedure TFrmPadrao.act_IncluirExecute(Sender: TObject);
begin
  try
    if Assigned(ds.DataSet) then
    begin
      ds.DataSet.Insert;
      if ds.DataSet.FindField('ativo') <> nil then
        ds.DataSet.FieldByName('ativo').Value := 1;
      if ds.DataSet.FindField('id_empresa') <> nil then
        ds.DataSet.FieldByName('id_empresa').Value := VAR_empresa;
      if ds.DataSet.FindField('id_usuario') <> nil then
        ds.DataSet.FieldByName('id_usuario').Value := VAR_UsuarioLogado;
      if ds.DataSet.FindField('datacad') <> nil then
        ds.DataSet.FieldByName('datacad').Value := Now;
    end
    else
    begin
      Application.MessageBox('DataSet não informado.' + #13#10 + 'Entre em contato com o Administrador do sistema!!!', 'Informação', MB_OK + MB_ICONSTOP);
      Exit;
    end;
  finally

  end;
end;

procedure TFrmPadrao.act_PesquisarExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmPadrao.act_RelatoriosExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmPadrao.act_SairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmPadrao.act_SalvarExecute(Sender: TObject);
var
  I, camposVazios: Integer;
  mensagem: TStringBuilder;
begin
  mensagem := TStringBuilder.Create;
  camposVazios := 0;
  if Assigned(ds.DataSet) then
  begin
    if ds.DataSet.State = dsInsert then
    begin
      if ds.DataSet.FindField('codigo') <> nil then
        ds.DataSet.FieldByName('codigo').Value := getCodigo(VAR_Tabela);
    end;

    if ds.DataSet.State = dsEdit then
    begin
      if ds.DataSet.FindField('dataalt') <> nil then
        ds.DataSet.FindField('dataalt').Value := Now;
      if ds.DataSet.FindField('id_usuario_alt') <> nil then
        ds.DataSet.FindField('id_usuario_alt').Value := VAR_UsuarioLogado;
    end;

    for I := 0 to ds.DataSet.FieldCount - 1 do
    begin
      if (ds.DataSet.Fields[I].Required) and (ds.DataSet.Fields[I].IsNull) then
      begin
        mensagem.Append(Format('%s é obrigatório !', [ds.DataSet.Fields[I].DisplayLabel]));
        Inc(camposVazios);
      end;
    end;

    if camposVazios > 0 then
    begin
      Application.MessageBox(PChar('Existem campos que ainda não foram preenchidos !!!' + #13#10#13#10 + mensagem.ToString), 'Informação', MB_OK + MB_ICONWARNING);
      Exit;
    end
    else
    begin
      TFDQuery(ds.DataSet).post;
      TFDQuery(ds.DataSet).ApplyUpdates(0);
      TFDQuery(ds.DataSet).close;
      TFDQuery(ds.DataSet).open;
      Application.MessageBox('Registro gravado com sucesso.', 'Informação', MB_OK + MB_ICONINFORMATION);
    end;
  end
  else
  begin
    Application.MessageBox('DataSet não informado.' + #13#10 + 'Entre em contato com o Administrador do sistema!!!', 'Informação', MB_OK + MB_ICONSTOP);
    Exit;
  end;
end;

procedure TFrmPadrao.camposSomenteLeitura;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TEdit) and (Components[I] as TEdit).ReadOnly then
    begin
      (Components[I] as TEdit).Color := $00E0FFFF;
    end;
    if (Components[I] is TDBEdit) and (Components[I] as TDBEdit).ReadOnly then
    begin
      (Components[I] as TDBEdit).Color := $00E0FFFF;
    end;
  end;
end;

procedure TFrmPadrao.camposUpper;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TEdit) then
    begin
      (Components[I] as TEdit).CharCase := ecUpperCase;
    end;
    if (Components[I] is TDBEdit) then
    begin
      (Components[I] as TDBEdit).CharCase := ecUpperCase;
    end;
  end;
end;

procedure TFrmPadrao.dsDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(ds.DataSet) then
  begin
    btnIncluir.Enabled := (ds.DataSet.State = dsBrowse);
    btnEditar.Enabled := (ds.DataSet.State = dsBrowse) and (not ds.DataSet.IsEmpty);
    btnExcluir.Enabled := (ds.DataSet.State = dsBrowse) and (not ds.DataSet.IsEmpty);
    btnSalvar.Enabled := (ds.DataSet.State in [dsInsert, dsEdit]);
    btnCancelar.Enabled := (ds.DataSet.State in [dsInsert, dsEdit]);
    pnDados.Enabled := (ds.DataSet.State in [dsInsert, dsEdit]);
    btnPesquisar.Enabled := (ds.DataSet.State = dsBrowse);
    btnRelatorios.Enabled := (ds.DataSet.State = dsBrowse);
    btnSair.Enabled := (ds.DataSet.State = dsBrowse);
    camposSomenteLeitura;
  end
  else
  begin
    Application.MessageBox('DataSet não informado.' + #13#10 + 'Entre em contato com o Administrador do sistema!!!', 'Informação', MB_OK + MB_ICONSTOP);
    Exit;
  end;
end;

procedure TFrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(ds.DataSet) then
    TFDQuery(ds.DataSet).Close
  else
  begin
    Application.MessageBox('DataSet não informado.' + #13#10 + 'Entre em contato com o Administrador do sistema!!!', 'Informação', MB_OK + MB_ICONSTOP);
    Exit;
  end;
end;

procedure TFrmPadrao.FormShow(Sender: TObject);
begin
  if Assigned(ds.DataSet) then
  begin
    if VAR_Comando <> '' then
    begin
      with TFDQuery(ds.DataSet) do
      begin
        close;
        sql.Clear;
        sql.Add(VAR_Comando);
        open;
      end;
      camposUpper;
    end
    else
    begin
      Application.MessageBox('Comando SQL não foi informado.' + #13#10 + 'Entre em contato com o Administrador do Sistema!!!', 'Informação', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end
  else
  begin
    Application.MessageBox('DataSet não informado.' + #13#10 + 'Entre em contato com o Administrador do sistema!!!', 'Informação', MB_OK + MB_ICONSTOP);
    Exit;
  end;
end;

function TFrmPadrao.getCodigo(Tabela: string): Integer;
var
  Qry: TFDQuery;
  codigo: Integer;
begin
  codigo := 0;
  try
    Qry := TFDQuery.Create(self);
    with Qry do
    begin
      Close;
      Connection := dm.con;
      sql.Clear;
      SQL.Add(Format('select (coalesce(max(codigo),0)+1) as codigo from %s(NOLOCK) where id_empresa = %s', [Tabela, VAR_empresa.ToString]));
      Open;
    end;
    codigo := Qry.FieldByName('codigo').AsInteger;
  finally
    Qry.Free;
  end;
  Result := codigo;
end;

end.

