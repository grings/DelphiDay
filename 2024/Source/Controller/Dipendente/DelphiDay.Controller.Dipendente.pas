unit DelphiDay.Controller.Dipendente;

interface

uses
  Spring.Collections,
  DelphiDay.Controller.Dipendente.Interfaces,
  DelphiDay.Model.Dipendente.Interfaces,
  DelphiDay.Model.Database.Interfaces;

type
  TDelphiDayControllerDipendente = class sealed(TInterfacedObject, IDelphiDayControllerDipendente)
  strict private
    FDictionary: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
    FDictionaryAdd: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
    FDictionaryDelete: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
    FDictionaryEdit: IDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
    FEntity: IDelphiDayControllerDipendenteEntity;
    FModel: IDelphiDayModelDipendente;
    FModelConnection: IDelphiDayModelDatabaseConnessione;
    function Add: IDelphiDayControllerDipendente;
    function ApplyUpdate: IDelphiDayControllerDipendente;
    procedure ApplyUpdateAdd;
    procedure ApplyUpdateDelete;
    procedure ApplyUpdateEdit;
    function Clear: IDelphiDayControllerDipendente;
    function Delete: IDelphiDayControllerDipendente;
    function Edit: IDelphiDayControllerDipendente;
    function Entity(const Value: IDelphiDayControllerDipendenteEntity): IDelphiDayControllerDipendente;
    function IsEmpty: Boolean;
    function Lista: IReadOnlyDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
    function Load: IDelphiDayControllerDipendente;
    function Post: IDelphiDayControllerDipendente;
    function Setup: IDelphiDayControllerDipendente;
  public
    constructor Create;
    class function New: IDelphiDayControllerDipendente;
  end;

implementation

uses
  System.SysUtils,
  DelphiDay.Model.Dipendente.Factory,
  DelphiDay.Model.Database.Factory;

constructor TDelphiDayControllerDipendente.Create;
begin
  inherited;

  FDictionary := TCollections.CreateDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
  FDictionaryAdd := TCollections.CreateDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
  FDictionaryDelete := TCollections.CreateDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
  FDictionaryEdit := TCollections.CreateDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
  FModelConnection := TDelphiDayModelConnessioneFactory.New.Connessione;
  FModel := TDelphiDayModelDipendenteFactory.New.Dipendente;
end;

class function TDelphiDayControllerDipendente.New: IDelphiDayControllerDipendente;
begin
  Result := Self.Create;
end;

function TDelphiDayControllerDipendente.Add: IDelphiDayControllerDipendente;
begin
  Result := Self;
  FDictionaryAdd.Add(FEntity.Id, FEntity);
end;

function TDelphiDayControllerDipendente.ApplyUpdate: IDelphiDayControllerDipendente;
var
  EntityDelete: TObject;
begin
  Result := Self;
  ApplyUpdateAdd;
  ApplyUpdateDelete;
  ApplyUpdateEdit;
end;

procedure TDelphiDayControllerDipendente.ApplyUpdateAdd;
begin
  FModel.Add;
  FDictionary.AddRange(FDictionaryAdd);
  FDictionaryAdd.Clear;
end;

procedure TDelphiDayControllerDipendente.ApplyUpdateDelete;
begin
  FModel.Delete;

  for var Id in FDictionaryDelete.Keys do
    FDictionary.Remove(Id);

  FDictionaryDelete.Clear;
end;

procedure TDelphiDayControllerDipendente.ApplyUpdateEdit;
begin
  FModel.Edit;

  for var EntityModificata  in FDictionaryEdit.Values do
//  begin
//    FDictionary.Extract(EntityModificata.Id);
//    FDictionary.Add(EntityModificata.Id, EntityModificata);
    FDictionary.AddOrSetValue(EntityModificata.Id, EntityModificata);
//  end;

  FDictionaryDelete.Clear;
end;

function TDelphiDayControllerDipendente.Clear: IDelphiDayControllerDipendente;
begin
  Result := Self;
end;

function TDelphiDayControllerDipendente.Delete: IDelphiDayControllerDipendente;
begin
  Result := Self;
  FDictionaryDelete.Add(FEntity.Id, FEntity);
end;

function TDelphiDayControllerDipendente.Edit: IDelphiDayControllerDipendente;
var
  EntityOriginale: IDelphiDayControllerDipendenteEntity;
begin
  Result := Self;

  if FDictionary.TryGetValue(FEntity.Id, EntityOriginale) then
    FEntity.DataNascita(EntityOriginale.DataNascita)
           .Livello(EntityOriginale.Livello)
           .Mansione(EntityOriginale.Mansione)
           .Paese(EntityOriginale.Paese)
           .Reparto(EntityOriginale.Reparto)
           .Stipendio(EntityOriginale.Stipendio)
  else
    raise Exception.CreateFmt('Id %d non trovato', [FEntity.Id]);

  FDictionaryEdit.Add(FEntity.Id, FEntity);
end;

function TDelphiDayControllerDipendente.Entity(const Value: IDelphiDayControllerDipendenteEntity): IDelphiDayControllerDipendente;
begin
  Result := Self;
  FEntity := Value;
end;

function TDelphiDayControllerDipendente.IsEmpty: Boolean;
begin
  Result := FDictionary.IsEmpty;
end;

function TDelphiDayControllerDipendente.Lista: IReadOnlyDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
begin
  Result := FDictionary.AsReadOnly;
end;

function TDelphiDayControllerDipendente.Load: IDelphiDayControllerDipendente;
begin
  Result := Self;
  FModel.Load;
end;

function TDelphiDayControllerDipendente.Post: IDelphiDayControllerDipendente;
begin
  Result := Self;
end;

function TDelphiDayControllerDipendente.Setup: IDelphiDayControllerDipendente;
begin
  Result := Self;
  FModelConnection.Setup;
  FModel.Connection(FModelConnection)
        .Lista(FDictionary)
        .ListaAdd(FDictionaryAdd)
        .ListaDelete(FDictionaryDelete)
        .ListaModify(FDictionaryEdit)
        .Setup;
end;

end.
