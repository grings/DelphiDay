unit DelphiDay.Model.Database.Query.FireDAC;

interface

uses
  Data.DB,
  FireDAC.Comp.Client,
  DelphiDay.Model.Database.Interfaces;

type
  TDelphiDayModelDatabaseQuery = class sealed(TInterfacedObject, IDelphiDayModelDatabaseQuery)
  strict private
    FModelConnessione: IDelphiDayModelDatabaseConnessione;
    FQuery: TFDQuery;
    function Close: IDelphiDayModelDatabaseQuery;
    function Connessione(const Value: IDelphiDayModelDatabaseConnessione): IDelphiDayModelDatabaseQuery;
    function DataSet: TDataSet;
    function Execute: IDelphiDayModelDatabaseQuery;
    function Open: IDelphiDayModelDatabaseQuery;
    function Prepere: IDelphiDayModelDatabaseQuery;
    function Setup: IDelphiDayModelDatabaseQuery;
    function Sql(const Value: string): IDelphiDayModelDatabaseQuery;
    //1 Accoppiato deve essere rimosso
    function This: TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IDelphiDayModelDatabaseQuery;
  end;

implementation

uses
  FireDAC.DApt;

constructor TDelphiDayModelDatabaseQuery.Create;
begin
  inherited;

  FQuery := TFDQuery.Create(nil);
end;

destructor TDelphiDayModelDatabaseQuery.Destroy;
begin
  FQuery.Free;

  inherited;
end;

class function TDelphiDayModelDatabaseQuery.New: IDelphiDayModelDatabaseQuery;
begin
  Result := Self.Create;
end;

function TDelphiDayModelDatabaseQuery.Close: IDelphiDayModelDatabaseQuery;
begin
  Result := Self;
  FQuery.Close;
end;

function TDelphiDayModelDatabaseQuery.Connessione(const Value: IDelphiDayModelDatabaseConnessione): IDelphiDayModelDatabaseQuery;
begin
  Result := Self;
  FModelConnessione := Value;
  FQuery.Connection := FModelConnessione.Connection as TFDConnection;
end;

function TDelphiDayModelDatabaseQuery.DataSet: TDataSet;
begin
  Result := FQuery;
end;

function TDelphiDayModelDatabaseQuery.Execute: IDelphiDayModelDatabaseQuery;
begin
  Result := Self;
  FQuery.ExecSQL;
end;

function TDelphiDayModelDatabaseQuery.Open: IDelphiDayModelDatabaseQuery;
begin
  Result := Self;
  FQuery.Open;
end;

function TDelphiDayModelDatabaseQuery.Prepere: IDelphiDayModelDatabaseQuery;
begin
  Result := Self;

  if not FQuery.Prepared then
    FQuery.Prepare;
end;

function TDelphiDayModelDatabaseQuery.Setup: IDelphiDayModelDatabaseQuery;
begin
  Result := Self;
  FQuery.FetchOptions.RowsetSize := -1;
end;

function TDelphiDayModelDatabaseQuery.Sql(const Value: string): IDelphiDayModelDatabaseQuery;
begin
  Result := Self;
  FQuery.SQL.Text := Value;
end;

function TDelphiDayModelDatabaseQuery.This: TFDQuery;
begin
  Result := FQuery;
end;

end.
