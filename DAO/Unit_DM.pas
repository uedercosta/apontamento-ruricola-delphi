unit Unit_DM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    con: TFDConnection;
    DriverSQLServer: TFDPhysMSSQLDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    QryEmpresa: TFDQuery;
    QryEmpresaid_empresa: TLargeintField;
    QryEmpresanome: TStringField;
    QryEmpresalogotipo: TStringField;
    QryEmpresaativo: TIntegerField;
    QryEmpresadatacad: TSQLTimeStampField;
    QryEmpresadataalt: TSQLTimeStampField;
    QryEmpresaid_usuario: TLargeintField;
    QryEmpresaid_usuario_alt: TLargeintField;
    QryEmpresalogradouro: TStringField;
    QryEmpresanumero: TStringField;
    QryEmpresacomplemento: TStringField;
    QryEmpresabairro: TStringField;
    QryEmpresaid_cidade: TLargeintField;
    QryEmpresacep: TStringField;
    QryEmpresaobservacoes: TStringField;
    QryTurmas: TFDQuery;
    QryTurmasid_turma: TLargeintField;
    QryTurmasid_empresa: TLargeintField;
    QryTurmasdatacad: TSQLTimeStampField;
    QryTurmasdataalt: TSQLTimeStampField;
    QryTurmasid_usuario: TLargeintField;
    QryTurmasid_usuario_alt: TLargeintField;
    QryTurmasativo: TIntegerField;
    QryTurmasdescricao: TStringField;
    QryTurmascodigo: TLargeintField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
