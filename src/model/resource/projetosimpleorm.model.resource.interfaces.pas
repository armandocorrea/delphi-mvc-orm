unit projetosimpleorm.model.resource.interfaces;

interface

uses
  Data.DB;

type
  IConexao = interface
    function Connect: TCustomConnection;
  end;

  IConfiguracao = interface
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

  IResource = interface
    function Conexao: IConexao;
    function Configuracao: IConfiguracao;
  end;

implementation

end.
