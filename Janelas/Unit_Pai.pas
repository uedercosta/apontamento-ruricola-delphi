unit Unit_Pai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase,
  ACBrEnterTab;

type
  TFrmPai = class(TForm)
    EnterTab: TACBrEnterTab;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPai: TFrmPai;

implementation

uses
  Unit_Principal;

{$R *.dfm}

procedure TFrmPai.FormCreate(Sender: TObject);
begin
  EnterTab.EnterAsTab := VAR_TabEnter;
end;

end.

