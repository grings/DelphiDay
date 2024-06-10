unit DelphiDay.Model.Dipendente.Interfaces;

interface

uses
  Spring.Collections,
  DelphiDay.Model.Database.Interfaces,
  DelphiDay.Controller.Dipendente.Interfaces;

type
  IDelphiDayModelDipendente = interface(IInterface)
    ['{FCDDBC84-5BC8-4098-B214-9EA995EA5B75}']
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
  end;

  IDelphiDayModelDipendenteFactory = interface(IInterface)
    ['{F35FF598-BFDF-4C24-A3D9-038526098AA0}']
    function Dipendente: IDelphiDayModelDipendente;
  end;

implementation

end.
