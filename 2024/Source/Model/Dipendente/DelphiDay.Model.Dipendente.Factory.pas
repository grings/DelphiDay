unit DelphiDay.Model.Dipendente.Factory;

interface

uses
  DelphiDay.Model.Dipendente.Interfaces;

type
  TDelphiDayModelDipendenteFactory = class sealed(TInterfacedObject, IDelphiDayModelDipendenteFactory)
  strict private
    function Dipendente: IDelphiDayModelDipendente;
  public
    class function New: IDelphiDayModelDipendenteFactory;
  end;

implementation

uses
  DelphiDay.Model.Dipendente;

function TDelphiDayModelDipendenteFactory.Dipendente: IDelphiDayModelDipendente;
begin
  Result := TDelphiDayModelDipendente.New;
end;

class function TDelphiDayModelDipendenteFactory.New: IDelphiDayModelDipendenteFactory;
begin
  Result := Self.Create;
end;

end.
