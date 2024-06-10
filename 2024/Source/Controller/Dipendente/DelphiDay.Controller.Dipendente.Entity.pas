unit DelphiDay.Controller.Dipendente.Entity;

interface

uses
  DelphiDay.Controller.Dipendente.Interfaces;

type
  TDelphiDayControllerDipendenteEntity = class sealed(TInterfacedObject, IDelphiDayControllerDipendenteEntity)
  strict private
    FCognome: string;
    FDataNascita: TDate;
    FId: UInt16;
    FLivello: UInt8;
    FMansione: string;
    FPaese: string;
    FPrimoNome: string;
    FReparto: string;
    FStipendio: Currency;
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
  public
    class function New: IDelphiDayControllerDipendenteEntity;
  end;

implementation

uses
  System.SysUtils;

class function TDelphiDayControllerDipendenteEntity.New: IDelphiDayControllerDipendenteEntity;
begin
  Result := Self.Create;
end;

function TDelphiDayControllerDipendenteEntity.Cognome: string;
begin
  Result := FCognome;
end;

function TDelphiDayControllerDipendenteEntity.Cognome(const Value: string): IDelphiDayControllerDipendenteEntity;
begin
  Result := Self;
  FCognome := Value;
end;

function TDelphiDayControllerDipendenteEntity.DataNascita: TDate;
begin
  Result := FDataNascita;
end;

function TDelphiDayControllerDipendenteEntity.DataNascita(const Value: TDate): IDelphiDayControllerDipendenteEntity;
begin
  Result := Self;
  FDataNascita := Value;
end;

function TDelphiDayControllerDipendenteEntity.Id: UInt16;
begin
  Result := FId;
end;

function TDelphiDayControllerDipendenteEntity.Id(const Value: UInt16): IDelphiDayControllerDipendenteEntity;
begin
  Result := Self;
  FId := Value;
end;

function TDelphiDayControllerDipendenteEntity.Livello: UInt8;
begin
  Result := FLivello;
end;

function TDelphiDayControllerDipendenteEntity.Livello(const Value: UInt8): IDelphiDayControllerDipendenteEntity;
begin
  Result := Self;
  FLivello := Value;
end;

function TDelphiDayControllerDipendenteEntity.Mansione: string;
begin
  Result := FMansione;
end;

function TDelphiDayControllerDipendenteEntity.Mansione(const Value: string): IDelphiDayControllerDipendenteEntity;
begin
  Result := Self;
  FMansione := Value;
end;

function TDelphiDayControllerDipendenteEntity.Nome: string;
const
  SMaskNome: string = '%s %s';
begin
  Result := Format(SMaskNome, [FPrimoNome, FCognome]);
end;

function TDelphiDayControllerDipendenteEntity.Paese: string;
begin
  Result := FPaese;
end;

function TDelphiDayControllerDipendenteEntity.Paese(const Value: string): IDelphiDayControllerDipendenteEntity;
begin
  Result := Self;
  FPaese := Value;
end;

function TDelphiDayControllerDipendenteEntity.PrimoNome: string;
begin
  Result := FPrimoNome;
end;

function TDelphiDayControllerDipendenteEntity.PrimoNome(const Value: string): IDelphiDayControllerDipendenteEntity;
begin
  Result := Self;
  FPrimoNome := Value;
end;

function TDelphiDayControllerDipendenteEntity.Reparto: string;
begin
  Result := FReparto;
end;

function TDelphiDayControllerDipendenteEntity.Reparto(const Value: string): IDelphiDayControllerDipendenteEntity;
begin
  Result := Self;
  FReparto := Value;
end;

function TDelphiDayControllerDipendenteEntity.Stipendio: Currency;
begin
  Result := FStipendio;
end;

function TDelphiDayControllerDipendenteEntity.Stipendio(const Value: Currency): IDelphiDayControllerDipendenteEntity;
begin
  Result := Self;
  FStipendio := Value;
end;

end.
