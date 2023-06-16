unit projetosimpleorm.model.service.interfaces;

interface

uses
  Data.DB;

type
  IService<T: Class> = interface
    function ListarTodos: IService<T>;
    function ListarPorId(aId: Integer): IService<T>;
    function ListarPor(Field: String; Value: Variant): IService<T>;
    function Inserir: IService<T>;
    function Atualizar: IService<T>;
    function Excluir: IService<T>; overload;
    function Excluir(Field, Value: String): IService<T>; overload;
    function DataSource(var aDataSource: TDataSource): IService<T>;
    function This: T;
  end;

implementation

end.
