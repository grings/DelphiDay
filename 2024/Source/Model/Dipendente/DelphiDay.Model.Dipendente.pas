unit DelphiDay.Model.Dipendente;

interface

uses
  Spring.Collections,
  DelphiDay.Controller.Dipendente.Interfaces,
  DelphiDay.Model.Dipendente.Interfaces,
  DelphiDay.Model.Database.Interfaces;

type
  TDelphiDayModelDipendente = class sealed(TInterfacedObject, IDelphiDayModelDipendente)
  strict private
  const
    SFieldNameCognome: string = 'LAST_NAME';
    SFieldNameDataNascita: string = 'HIRE_DATE';
    SFieldNameId: string = 'EMP_NO';
    SFieldNameLivello: string = 'JOB_GRADE';
    SFieldNameMansione: string = 'JOB_CODE';
    SFieldNamePaese: string = 'JOB_COUNTRY';
    SFieldNamePrimoNome: string = 'FIRST_NAME';
    SFieldNameReparto: string = 'DEPT_NO';
    SFieldNameStipendio: string = 'SALARY';
  var
    FDictionary: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
    FDictionaryAdd: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
    FDictionaryDelete: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
    FDictionaryModify: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
    FEntity: IDelphiDayControllerDipendenteEntity;
    FModelConnection: IDelphiDayModelDatabaseConnessione;
    FModelQuery: IDelphiDayModelDatabaseQuery;
    FModelQueryDelete: IDelphiDayModelDatabaseQuery;
    FModelQueryInsert: IDelphiDayModelDatabaseQuery;
    FModelQueryUpdate: IDelphiDayModelDatabaseQuery;
    function Add: IDelphiDayModelDipendente;
    function Connection(const Value: IDelphiDayModelDatabaseConnessione): IDelphiDayModelDipendente;
    function Delete: IDelphiDayModelDipendente;
    function Edit: IDelphiDayModelDipendente;
    function Entity(const Value: IDelphiDayControllerDipendenteEntity): IDelphiDayModelDipendente;
    function Lista(const Value: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>): IDelphiDayModelDipendente;
    function ListaAdd(const Value: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>): IDelphiDayModelDipendente;
    function ListaDelete(const Value: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>): IDelphiDayModelDipendente;
    function ListaModify(const Value: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>): IDelphiDayModelDipendente;
    function Load: IDelphiDayModelDipendente;
    function Setup: IDelphiDayModelDipendente;
    procedure SetupQuery;
    procedure SetupQueryDelete;
    procedure SetupQueryInsert;
    procedure SetupQueryUpdate;
  public
    constructor Create;
    class function New: IDelphiDayModelDipendente;
  end;

implementation

uses
  Data.DB,
  DelphiDay.Model.Database.Factory,
  DelphiDay.Controller.Dipendente.Factory;

constructor TDelphiDayModelDipendente.Create;
begin
  inherited;
  FModelQuery := TDelphiDayModelConnessioneFactory.New.Query;
  FModelQueryInsert := TDelphiDayModelConnessioneFactory.New.Query;
  FModelQueryDelete := TDelphiDayModelConnessioneFactory.New.Query;
  FModelQueryUpdate:= TDelphiDayModelConnessioneFactory.New.Query;
end;

class function TDelphiDayModelDipendente.New: IDelphiDayModelDipendente;
begin
  Result := Self.Create;
end;

function TDelphiDayModelDipendente.Add: IDelphiDayModelDipendente;
begin
  Result := Self;

  for var Entity in FDictionaryAdd.Values do
  begin
    FModelQueryInsert.This.ParamByName(SFieldNamePrimoNome).AsString := Entity.PrimoNome;
    FModelQueryInsert.This.ParamByName(SFieldNameCognome).AsString := Entity.Cognome;
    FModelQueryInsert.This.ParamByName(SFieldNameDataNascita).AsDate := Entity.DataNascita;
    FModelQueryInsert.This.ParamByName(SFieldNameReparto).AsString := Entity.Reparto;
    FModelQueryInsert.This.ParamByName(SFieldNameMansione).AsString := Entity.Mansione;
    FModelQueryInsert.This.ParamByName(SFieldNameLivello).AsSmallInt := Entity.Livello;
    FModelQueryInsert.This.ParamByName(SFieldNamePaese).AsString := Entity.Paese;
    FModelQueryInsert.This.ParamByName(SFieldNameStipendio).AsFMTBCD := Entity.Stipendio;
    FModelQueryInsert.Execute;
  end;
end;

function TDelphiDayModelDipendente.Connection(const Value: IDelphiDayModelDatabaseConnessione): IDelphiDayModelDipendente;
begin
  Result := Self;
  FModelConnection := Value;
end;

function TDelphiDayModelDipendente.Delete: IDelphiDayModelDipendente;
begin
  Result := Self;

  for var Entity in FDictionaryDelete.Values do
  begin
    FModelQueryDelete.This.ParamByName(SFieldNameId).AsSmallInt := Entity.Id;
    FModelQueryDelete.Execute;
  end;
end;

function TDelphiDayModelDipendente.Edit: IDelphiDayModelDipendente;
begin
  Result := Self;

  for var Entity in FDictionaryModify.Values do
  begin
    FModelQueryUpdate.This.ParamByName(SFieldNameId).AsSmallInt := Entity.Id;
    FModelQueryUpdate.This.ParamByName(SFieldNamePrimoNome).AsString := Entity.PrimoNome;
    FModelQueryUpdate.This.ParamByName(SFieldNameCognome).AsString := Entity.Cognome;
    FModelQueryUpdate.This.ParamByName(SFieldNameDataNascita).AsDate := Entity.DataNascita;
    FModelQueryUpdate.This.ParamByName(SFieldNameReparto).AsString := Entity.Reparto;
    FModelQueryUpdate.This.ParamByName(SFieldNameMansione).AsString := Entity.Mansione;
    FModelQueryUpdate.This.ParamByName(SFieldNameLivello).AsSmallInt := Entity.Livello;
    FModelQueryUpdate.This.ParamByName(SFieldNamePaese).AsString := Entity.Paese;
    FModelQueryUpdate.This.ParamByName(SFieldNameStipendio).AsFMTBCD := Entity.Stipendio;
    FModelQueryUpdate.Execute;
  end;
end;

function TDelphiDayModelDipendente.Entity(const Value: IDelphiDayControllerDipendenteEntity): IDelphiDayModelDipendente;
begin
  Result := Self;
  FEntity := Value;
end;

function TDelphiDayModelDipendente.Lista(const Value: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>): IDelphiDayModelDipendente;begin
  Result := Self;
  FDictionary := Value;
end;

function TDelphiDayModelDipendente.ListaAdd(const Value: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>): IDelphiDayModelDipendente;
begin
  Result := Self;
  FDictionaryAdd := Value;
end;

function TDelphiDayModelDipendente.ListaDelete(const Value: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>): IDelphiDayModelDipendente;
begin
  Result := Self;
  FDictionaryDelete := Value;
end;

function TDelphiDayModelDipendente.ListaModify(const Value: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>): IDelphiDayModelDipendente;
begin
  Result := Self;
  FDictionaryModify := Value;
end;

function TDelphiDayModelDipendente.Load: IDelphiDayModelDipendente;
begin
  Result := Self;

  try
    FModelQuery.Open;
    FDictionary.Clear;
    var TmpDataSet := FModelQuery.DataSet;

    while not TmpDataSet.Eof do
    begin
      var Entity := TDelphiDayControllerDipendenteFactory.New.Entity;
      Entity.Cognome(TmpDataSet.FieldByName(SFieldNamePrimoNome).AsString)
            .DataNascita(TmpDataSet.FieldByName(SFieldNameDataNascita).AsDateTime)
            .Id(TmpDataSet.FieldByName(SFieldNameId).AsInteger)
            .Livello(TmpDataSet.FieldByName(SFieldNameLivello).AsInteger)
            .Mansione(TmpDataSet.FieldByName(SFieldNameMansione).AsString)
            .Paese(TmpDataSet.FieldByName(SFieldNamePaese).AsString)
            .PrimoNome(TmpDataSet.FieldByName(SFieldNamePrimoNome).AsString)
            .Reparto(TmpDataSet.FieldByName(SFieldNameReparto).AsString)
            .Stipendio(TmpDataSet.FieldByName(SFieldNameStipendio).AsCurrency);
      FDictionary.Add(Entity.Id, Entity);
      TmpDataSet.Next;
    end;
  finally
    FModelQuery.Close;
  end;
end;

function TDelphiDayModelDipendente.Setup: IDelphiDayModelDipendente;
begin
  Result := Self;
  SetupQuery;
  SetupQueryInsert;
  SetupQueryDelete;
  SetupQueryUpdate;
end;

procedure TDelphiDayModelDipendente.SetupQuery;
const
  SSqlCommandSelect: string = 'SELECT ' +
                              'E.EMP_NO, ' +
                              'E.FIRST_NAME, ' +
                              'E.LAST_NAME, ' +
                              'E.PHONE_EXT, ' +
                              'E.HIRE_DATE, ' +
                              'E.DEPT_NO, ' +
                              'E.JOB_CODE, ' +
                              'E.JOB_GRADE, ' +
                              'E.JOB_COUNTRY, ' +
                              'E."SALARY" ' +
                              'FROM ' +
                              'EMPLOYEE E;';
begin
  FModelQuery.Connessione(FModelConnection)
             .Setup
             .Sql(SSqlCommandSelect)
             .Prepere;
end;

procedure TDelphiDayModelDipendente.SetupQueryDelete;
const
  SSqlCommandDelete: string = 'DELETE ' +
                              'FROM EMPLOYEE ' +
                              'WHERE ' +
                              'EMP_NO = :EMP_NO;';
begin
  FModelQueryDelete.Connessione(FModelConnection)
                   .Setup
                   .Sql(SSqlCommandDelete)
                   .Prepere;
end;

procedure TDelphiDayModelDipendente.SetupQueryInsert;
const
  SSqlCommandInsert: string = 'INSERT INTO EMPLOYEE ( ' +
                              'EMP_NO,' +
                              'FIRST_NAME, ' +
                              'LAST_NAME, ' +
                              'PHONE_EXT, ' +
                              'HIRE_DATE, ' +
                              'DEPT_NO, ' +
                              'JOB_CODE, ' +
                              'JOB_GRADE, ' +
                              'JOB_COUNTRY, ' +
                              '"SALARY" ' +
                              ') VALUES (' +
                              ':EMP_NO, ' +
                              ':FIRST_NAME, ' +
                              ':LAST_NAME, ' +
                              ':PHONE_EXT, ' +
                              ':HIRE_DATE, ' +
                              ':DEPT_NO, ' +
                              ':JOB_CODE, ' +
                              ':JOB_GRADE, ' +
                              ':JOB_COUNTRY, ' +
                              ':SALARY ' +
                              ');';
begin
  FModelQueryInsert.Connessione(FModelConnection)
                   .Setup
                   .Sql(SSqlCommandInsert);
  FModelQueryInsert.This.ParamByName(SFieldNameDataNascita).DataType := TFieldType.ftDate;
  FModelQueryInsert.Prepere;
end;

procedure TDelphiDayModelDipendente.SetupQueryUpdate;
const
  SSqlCommandUpdate: string = 'UPDATE ' +
                              'EMPLOYEE ' +
                              'SET ' +
                              'FIRST_NAME = :FIRST_NAME, ' +
                              'LAST_NAME = :LAST_NAME, ' +
                              'PHONE_EXT = :PHONE_EXT, ' +
                              'HIRE_DATE = :HIRE_DATE, ' +
                              'DEPT_NO = :DEPT_NO, ' +
                              'JOB_CODE = :JOB_CODE, ' +
                              'JOB_GRADE = :JOB_GRADE, ' +
                              'JOB_COUNTRY = :JOB_COUNTRY, ' +
                              '"SALARY" = :SALARY ' +
                              'WHERE ' +
                              'EMP_NO = :EMP_NO;';
begin
  FModelQueryUpdate.Connessione(FModelConnection)
                   .Setup
                   .Sql(SSqlCommandUpdate);
  FModelQueryUpdate.This.ParamByName(SFieldNameDataNascita).DataType := TFieldType.ftDate;
  FModelQueryUpdate.Prepere;
end;

end.
