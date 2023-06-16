unit projetosimpleorm.model.entity.produto;

interface

uses
  System.SysUtils,
  System.Classes,
  SimpleAttributes;

type
  [Tabela('PRODUTO')]
  TProduto = class
    private
      FId: Integer;
      FDescricao: String;
      FPrecoVenda: Currency;
      FFoto: TStream;
    procedure SetFoto(const Value: TStream);
    public
      constructor Create;
      destructor Destroy; override;

      [Campo('ID'), Pk, AutoInc]
      property Id: Integer read FId write FId;

      [Campo('DESCRICAO')]
      property Descricao: String read FDescricao write FDescricao;

      [Campo('PRECOVENDA')]
      property PrecoVenda: Currency read FPrecoVenda write FPrecoVenda;

      [Campo('FOTO', 'Blob')]
      property Foto: TStream read FFoto write SetFoto;
  end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
  FFoto := TMemoryStream.Create;
end;

destructor TProduto.Destroy;
begin
  FFoto.DisposeOf;
  inherited;
end;

procedure TProduto.SetFoto(const Value: TStream);
begin
  if not Assigned(Value) then
  begin
    TMemoryStream(FFoto).Clear;
    Exit;
  end;
  Value.Position := 0;
  TMemoryStream(FFoto).LoadFromStream(Value);
end;

end.
