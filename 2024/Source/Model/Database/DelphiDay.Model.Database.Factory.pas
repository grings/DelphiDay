unit DelphiDay.Model.Database.Factory;

interface

uses
  DelphiDay.Model.Database.Interfaces;

type
  TDelphiDayModelConnessioneFactory = class sealed(TInterfacedObject, IDelphiDayModelConnessioneFactory)
  strict private
    function Connessione: IDelphiDayModelDatabaseConnessione;
    function Query: IDelphiDayModelDatabaseQuery;
  public
    class function New: IDelphiDayModelConnessioneFactory;
  end;

implementation

uses
  DelphiDay.Model.Database.Connessione.FireDAC,
  DelphiDay.Model.Database.Query.FireDAC;

function TDelphiDayModelConnessioneFactory.Connessione: IDelphiDayModelDatabaseConnessione;
begin
  Result := TDelphiDayModelDatabaseConnessioneFireDAC.New;
end;

class function TDelphiDayModelConnessioneFactory.New: IDelphiDayModelConnessioneFactory;
begin
  Result := Self.Create;
end;

function TDelphiDayModelConnessioneFactory.Query: IDelphiDayModelDatabaseQuery;
begin
  Result := TDelphiDayModelDatabaseQuery.New;
end;

end.
