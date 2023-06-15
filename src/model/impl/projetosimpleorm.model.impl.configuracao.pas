unit projetosimpleorm.model.impl.configuracao;

interface

uses
  System.SysUtils,
  LocalCache4D,
  projetosimpleorm.model.interfaces;

type
  TConfiguracao = class(TInterfacedObject, IConfiguracao)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IConfiguracao;

      function DriverID(Value: String): IConfiguracao; overload;
      function DriverID: String; overload;

      function Database(Value: String): IConfiguracao; overload;
      function Database: String; overload;

      function Username(Value: String): IConfiguracao; overload;
      function Username: String; overload;

      function Password(Value: String): IConfiguracao; overload;
      function Password: String; overload;

      function Port(Value: String): IConfiguracao; overload;
      function Port: String; overload;

      function Server(Value: String): IConfiguracao; overload;
      function Server: String; overload;

      function Schema(Value: String): IConfiguracao; overload;
      function Schema: String; overload;

      function Locking(Value: String): IConfiguracao; overload;
      function Locking: String; overload;
  end;

implementation

{ TConfiguracao }

constructor TConfiguracao.Create;
begin
  if not FileExists('simpleorm.lc4') then
    LocalCache.SaveToStorage('simpleorm.lc4');

  LocalCache.LoadDatabase('simpleorm.lc4');
  LocalCache.Instance('Configuracao');
end;

function TConfiguracao.Database: String;
begin
  Result := LocalCache.GetItem('Database');
end;

function TConfiguracao.Database(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Database', Value);
end;

destructor TConfiguracao.Destroy;
begin
  LocalCache.SaveToStorage('simpleorm.lc4');
  inherited;
end;

function TConfiguracao.DriverID: String;
begin
  Result := LocalCache.GetItem('DriverID');
end;

function TConfiguracao.DriverID(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('DriverID', Value);
end;

function TConfiguracao.Locking: String;
begin
  Result := LocalCache.GetItem('Locking');
end;

function TConfiguracao.Locking(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Locking', Value);
end;

class function TConfiguracao.New: IConfiguracao;
begin
  Result := Self.Create;
end;

function TConfiguracao.Password: String;
begin
  Result := LocalCache.GetItem('Password');
end;

function TConfiguracao.Password(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Password', Value);
end;

function TConfiguracao.Port(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Port', Value);
end;

function TConfiguracao.Port: String;
begin
  Result := LocalCache.GetItem('Port');
end;

function TConfiguracao.Schema: String;
begin
  Result := LocalCache.GetItem('Schema');
end;

function TConfiguracao.Schema(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Schema', Value);
end;

function TConfiguracao.Server(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Server', Value);
end;

function TConfiguracao.Server: String;
begin
  Result := LocalCache.GetItem('Server');
end;

function TConfiguracao.Username(Value: String): IConfiguracao;
begin
  Result := Self;
  LocalCache.SetItem('Username', Value);
end;

function TConfiguracao.Username: String;
begin
  Result := LocalCache.GetItem('Username');
end;

end.
