unit projetosimpleorm.model.entity.cliente;

interface

uses
  System.SysUtils,
  System.Classes,
  SimpleAttributes;

type
  [Tabela('CLIENTE')]
  TCliente = class
    private
      FId: Integer;
      FIdPessoa: Integer;
      FTipo: String;
      FCpfCnpj: String;
      FEmail: String;
      FTelefone: String;
      FFoto: TStream;

      procedure SetFoto(const Value: TStream);
    public
      constructor Create;
      destructor Destroy; override;

      [Campo('ID'), Pk, AutoInc]
      property Id: Integer read FId write FId;

      [Campo('ID_PESSOA'), Fk]
      property IdPessoa: Integer read FIdPessoa write FIdPessoa;

      [Campo('TIPO')]
      property Tipo: String read FTipo write FTipo;

      [Campo('CPFCNPJ')]
      property CpfCnpj: String read FCpfCnpj write FCpfCnpj;

      [Campo('EMAIL')]
      property Email: String read FEmail write FEmail;

      [Campo('TELEFONE')]
      property Telefone: String read FTelefone write FTelefone;

      [Campo('FOTO', 'Blob')]
      property Foto: TStream read FFoto write SetFoto;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
begin
  FFoto := TMemoryStream.Create;
end;

destructor TCliente.Destroy;
begin
  FFoto.DisposeOf;
  inherited;
end;

procedure TCliente.SetFoto(const Value: TStream);
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
