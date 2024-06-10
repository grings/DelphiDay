unit DelphiDay.Controller.Dipendente.Factory;

interface

uses
  DelphiDay.Controller.Dipendente.Interfaces;

type
  TDelphiDayControllerDipendenteFactory = class sealed(TInterfacedObject, IDelphiDayControllerDipendenteFactory)
  strict private
    function Dipendente: IDelphiDayControllerDipendente;
    function Entity: IDelphiDayControllerDipendenteEntity;
  public
    class function New: IDelphiDayControllerDipendenteFactory;
  end;

implementation

uses
  DelphiDay.Controller.Dipendente,
  DelphiDay.Controller.Dipendente.Entity;

class function TDelphiDayControllerDipendenteFactory.New: IDelphiDayControllerDipendenteFactory;
begin
  Result := Self.Create;
end;

function TDelphiDayControllerDipendenteFactory.Dipendente: IDelphiDayControllerDipendente;
begin
  Result := TDelphiDayControllerDipendente.New;
end;

function TDelphiDayControllerDipendenteFactory.Entity: IDelphiDayControllerDipendenteEntity;
begin
  Result := TDelphiDayControllerDipendenteEntity.New;
end;

end.
