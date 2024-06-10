unit DelphiDay.Controller.Dipendente.Interfaces;

interface

uses
  Spring.Collections;

type
  IDelphiDayControllerDipendenteEntity = interface(IInterface)
    ['{C94C1980-3FF7-454B-A9BA-8A91A2DF4D69}']
    function Cognome: string; overload;
    function Cognome(const Value: string): IDelphiDayControllerDipendenteEntity; overload;
    function DataNascita: TDate; overload;
    function DataNascita(const Value: TDate): IDelphiDayControllerDipendenteEntity; overload;
    function Id: UInt16; overload;
    function Id(const Value: UInt16): IDelphiDayControllerDipendenteEntity; overload;
    function Livello: UInt8; overload;
    function Livello(const Value: UInt8): IDelphiDayControllerDipendenteEntity; overload;
    function Mansione: string; overload;
    function Mansione(const Value: string): IDelphiDayControllerDipendenteEntity; overload;
    function Nome: string;
    function Paese: string; overload;
    function Paese(const Value: string): IDelphiDayControllerDipendenteEntity; overload;
    function PrimoNome: string; overload;
    function PrimoNome(const Value: string): IDelphiDayControllerDipendenteEntity; overload;
    function Reparto: string; overload;
    function Reparto(const Value: string): IDelphiDayControllerDipendenteEntity; overload;
    function Stipendio: Currency; overload;
    function Stipendio(const Value: Currency): IDelphiDayControllerDipendenteEntity; overload;
  end;

  IDelphiDayControllerDipendente = interface(IInterface)
    ['{306838A7-D9E3-44BA-8F56-0D18A400822D}']
    function Add: IDelphiDayControllerDipendente;
    function ApplyUpdate: IDelphiDayControllerDipendente;
    function Clear: IDelphiDayControllerDipendente;
    function Delete: IDelphiDayControllerDipendente;
    function Edit: IDelphiDayControllerDipendente;
    function Entity(const Value: IDelphiDayControllerDipendenteEntity): IDelphiDayControllerDipendente;
    function IsEmpty: Boolean;
    function Lista: IReadOnlyDictionary<UInt16, IDelphiDayControllerDipendenteEntity>;
    function Load: IDelphiDayControllerDipendente;
    function Post: IDelphiDayControllerDipendente;
    function Setup: IDelphiDayControllerDipendente;
  end;

  IDelphiDayControllerDipendenteFactory = interface(IInterface)
    ['{63E4603C-89CB-4FAD-AC1D-D16EE2489FE9}']
    function Dipendente: IDelphiDayControllerDipendente;
    function Entity: IDelphiDayControllerDipendenteEntity;
  end;

implementation

end.

