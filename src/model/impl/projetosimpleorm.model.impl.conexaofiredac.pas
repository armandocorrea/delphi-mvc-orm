unit projetosimpleorm.model.impl.conexaofiredac;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  Data.DB,
  projetosimpleorm.model.interfaces;

type
  TConexao = class(TInterfacedObject, IConexao)
    private
      FConfiguracao: IConfiguracao;
      FConn: TFDConnection;
    public
      constructor Create(Configuracao: IConfiguracao);
      destructor Destroy; override;
      class function New(Configuracao: IConfiguracao): IConexao;

      function Connect: TCustomConnection;
  end;

implementation

uses
  SysUtils;

{ TConexao }

function TConexao.Connect: TCustomConnection;
begin
  try
    FConn.Params.DriverID := FConfiguracao.DriverID;
    FConn.Params.Database := FConfiguracao.Database;
    FConn.Params.UserName := FConfiguracao.Username;
    FConn.Params.Password := FConfiguracao.Password;
    FConn.Params.Add('Port=' + FConfiguracao.Port);
    FConn.Params.Add('Server=' + FConfiguracao.Server);

    if not FConfiguracao.Schema.IsEmpty then
    begin
      FConn.Params.Add('MetaCurSchema=' + FConfiguracao.Schema);
      FConn.Params.Add('MetaDefSchema=' + FConfiguracao.Schema);
    end;

    if not FConfiguracao.Locking.IsEmpty then
      FConn.Params.Add('LockingMode=' + FConfiguracao.Locking);

    FConn.Connected := True;
    Result := FConn;
  except
    raise Exception.Create('Não foi possível realizar a conexão.');
  end;
end;

constructor TConexao.Create(Configuracao: IConfiguracao);
begin
  FConn := TFDConnection.Create(nil);
  FConfiguracao := Configuracao;
end;

destructor TConexao.Destroy;
begin
  FConn.DisposeOf;
  inherited;
end;

class function TConexao.New(Configuracao: IConfiguracao): IConexao;
begin
  Result := Self.Create(Configuracao);
end;

end.
