unit Unit_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ActnMan,
  Vcl.Ribbon, Vcl.ActnCtrls, Vcl.ToolWin, Vcl.ActnMenus, Vcl.RibbonActnMenus,
  Vcl.RibbonObsidianStyleActnCtrls, Vcl.StdCtrls, Unit_CadTurmas;

type
  TFrmMenu = class(TForm)
    LblResolucao: TLabel;
    Ribbon1: TRibbon;
    RbnApplicationMenuBar: TRibbonApplicationMenuBar;
    RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar;
    RBP_Arquivo: TRibbonPage;
    RBGSistema: TRibbonGroup;
    RibbonGroup2: TRibbonGroup;
    RibbonGroup3: TRibbonGroup;
    RibbonGroup1: TRibbonGroup;
    RibbonGroup21: TRibbonGroup;
    RBP_Cadastros: TRibbonPage;
    RibbonGroup4: TRibbonGroup;
    RibbonGroup5: TRibbonGroup;
    RibbonGroup7: TRibbonGroup;
    RibbonGroup8: TRibbonGroup;
    rgrCadastrosGerais: TRibbonGroup;
    RibbonGroup10: TRibbonGroup;
    RBP_Produtos: TRibbonPage;
    RibbonGroup11: TRibbonGroup;
    RibbonGroup12: TRibbonGroup;
    RibbonGroup13: TRibbonGroup;
    RibbonGroup31: TRibbonGroup;
    RibbonGroup29: TRibbonGroup;
    RBP_Compras: TRibbonPage;
    RibbonGroup14: TRibbonGroup;
    RibbonGroup15: TRibbonGroup;
    RibbonGroup6: TRibbonGroup;
    RBP_Producao: TRibbonPage;
    RibbonGroup20: TRibbonGroup;
    RibbonGroup23: TRibbonGroup;
    RibbonGroup24: TRibbonGroup;
    RibbonGroup25: TRibbonGroup;
    RibbonGroup26: TRibbonGroup;
    RibbonGroup9: TRibbonGroup;
    RBP_Vendas: TRibbonPage;
    RibbonGroup27: TRibbonGroup;
    RibbonGroup28: TRibbonGroup;
    RibbonGroup40: TRibbonGroup;
    RibbonGroup17: TRibbonGroup;
    RBP_Financeiro: TRibbonPage;
    RibbonGroup33: TRibbonGroup;
    RibbonGroup34: TRibbonGroup;
    RibbonGroup35: TRibbonGroup;
    RibbonGroup37: TRibbonGroup;
    RibbonGroup39: TRibbonGroup;
    RibbonGroup45: TRibbonGroup;
    RibbonGroup16: TRibbonGroup;
    RBP_Expedicao: TRibbonPage;
    RibbonGroup47: TRibbonGroup;
    RibbonGroup48: TRibbonGroup;
    RBP_Fiscal: TRibbonPage;
    RibbonGroup41: TRibbonGroup;
    RBP_Ajuda: TRibbonPage;
    RibbonGroup44: TRibbonGroup;
    RibbonGroup49: TRibbonGroup;
    RibbonGroup50: TRibbonGroup;
    ActionMenus: TActionManager;
    mnuProdutosGrupo: TAction;
    mnuProdutosSubgrupo: TAction;
    Action4: TAction;
    mnuProdutosTipoProdutos: TAction;
    mnuProdutosNCM: TAction;
    mnuProdutosCadastro: TAction;
    mnuProdutosAtualizar: TAction;
    mnuProdutosCodigoBarraTermica: TAction;
    Action_Opcoes: TAction;
    Action3: TAction;
    Action_Empresa: TAction;
    Act_fases: TAction;
    Action6: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    MnuArquivo_Cotacao: TAction;
    Action13: TAction;
    Action16: TAction;
    Action_Sair: TAction;
    Action33: TAction;
    Action32: TAction;
    Action5: TAction;
    Action26: TAction;
    Action12: TAction;
    ActAtividades: TAction;
    ActMotivoBaixa: TAction;
    Action14: TAction;
    Action27: TAction;
    Action29: TAction;
    MnuCad_ClieJuridica: TAction;
    MnuCad_CliePFisica: TAction;
    Action23: TAction;
    Action25: TAction;
    Action19: TAction;
    Action28: TAction;
    Action30: TAction;
    Action31: TAction;
    MnuCad_FornecedorRelatorio: TAction;
    MnuComprasPedidos: TAction;
    MnuComprasNotaFiscal: TAction;
    MnuDistribuir_Pagamentos: TAction;
    Action7: TAction;
    MnuDistribuir_Relatorios: TAction;
    Mnu_PCP_LoteProducao: TAction;
    Mnu_PCP_Grifes: TAction;
    Mnu_PCP_Colecao: TAction;
    Mnu_PCP_FaixaEtaria: TAction;
    Mnu_PCP_Fases: TAction;
    Mnu_PCP_FasesGrade: TAction;
    Mnu_PCP_Celulas: TAction;
    Mnu_PCP_Etiqueta: TAction;
    Mnu_PCP_Tamanhos: TAction;
    Mnu_PCP_GradeTamanho: TAction;
    Mnu_PCP_Cores: TAction;
    Mnu_PCP_Processos: TAction;
    Mnu_PCP_ProcessosGrade: TAction;
    Mnu_PCP_Maquinas: TAction;
    Mnu_PCP_ProcessoMaquinas: TAction;
    Mnu_PCP_Defeitos: TAction;
    Mnu_Qualidades: TAction;
    Mnu_PCP_ProcessosOperador: TAction;
    Mnu_PCP_FichaTecnica: TAction;
    Mnu_PCP_OrdemProducao: TAction;
    Mnu_PCP_AndamentoFaseProducao: TAction;
    Mnu_PCP_Relatorios: TAction;
    MnuVendas_Pedidos: TAction;
    MnuVendas_PedidosAprovar: TAction;
    MnuVendas_PedidosConferencia: TAction;
    ActPedidoVendaRelatorio: TAction;
    MnuVendas_OrdemServicos: TAction;
    MnuVendasNFe_Emitir: TAction;
    MnuVendas_VendaExpressa: TAction;
    MnuVendasNFe_Processamento: TAction;
    Action18: TAction;
    Action88: TAction;
    Action95: TAction;
    MnuFin_CadContas: TAction;
    Action114: TAction;
    Action113: TAction;
    MnuFin_CtaRecMovto: TAction;
    MnuFin_CtaReceberBaixa: TAction;
    MnuFin_CtaReceberBaixaLote: TAction;
    MnuFin_CtaRecBordero: TAction;
    Action98: TAction;
    Act_RelatorioCtaReceber: TAction;
    Action99: TAction;
    Action117: TAction;
    MnuFin_CtaPagarMovto: TAction;
    MnuFin_CtaPagarSubstituir: TAction;
    MnuFin_CtaPagarComissoes: TAction;
    MnuFin_CtaPagarComissoesRelatorios: TAction;
    MnuFin_CtaPagarBaixa: TAction;
    MnuFin_CtaPagarBaixaLote: TAction;
    Act_RelatorioCtaPagar: TAction;
    Action105: TAction;
    Action106: TAction;
    Action111: TAction;
    MnuFin_TransferenciaContas: TAction;
    Action115: TAction;
    Action120: TAction;
    Action121: TAction;
    Action122: TAction;
    Action123: TAction;
    Action124: TAction;
    Action130: TAction;
    Action131: TAction;
    Action133: TAction;
    Action165: TAction;
    Action174: TAction;
    Action176: TAction;
    ActTabelaPrecos: TAction;
    Action17: TAction;
    mnuProdutosCodigoBarraJatoTintas: TAction;
    mnuProdutosRelatorios: TAction;
    MnuFin_FluxoCaixa: TAction;
    MnuFin_FechamentoCaixa: TAction;
    MnuJan_Calendario: TAction;
    MnuComprasRelatorios: TAction;
    img16xRibbonAplication: TImageList;
    imgMenusImagens32x: TImageList;
    ImageList1Novos: TImageList;
    dlgPntSetup: TPrinterSetupDialog;
    procedure Action10Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Action_OpcoesExecute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;
  VAR_TabEnter: Boolean;
  VAR_Empresa, VAR_UsuarioLogado: Integer;
  VAR_Comando, VAR_Tabela: string;

implementation

uses
  Unit_Padrao;

{$R *.dfm}

procedure TFrmMenu.Action10Execute(Sender: TObject);
begin
  dlgPntSetup.Execute;
end;

procedure TFrmMenu.Action5Execute(Sender: TObject);
begin
  try
    FrmCadTurmas := TFrmCadTurmas.create(self);
    frmcadturmas.showmodal;
  finally
    frmcadturmas.free;
  end;
end;

procedure TFrmMenu.Action_OpcoesExecute(Sender: TObject);
begin
  try
    Frmpadrao := TFrmPadrao.create(self);
    FrmPadrao.ShowModal;
  finally
    FrmPadrao.Free;
  end;
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
  VAR_TabEnter := True;
  VAR_Empresa := 1;
  VAR_UsuarioLogado := 1;
end;

end.

