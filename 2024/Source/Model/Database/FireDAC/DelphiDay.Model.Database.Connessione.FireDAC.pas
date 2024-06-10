unit DelphiDay.Model.Database.Connessione.FireDAC;

interface

uses
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.IBWrapper,
  DelphiDay.Model.Database.Interfaces;

type
  TDelphiDayModelDatabaseConnessioneFireDAC = class sealed(TInterfacedObject, IDelphiDayModelDatabaseConnessione)
  strict private
    FConection: TFDConnection;
    FConnesso: Boolean;
    function Close: IDelphiDayModelDatabaseConnessione;
    function Connection: TCustomConnection;
    function Connesso: Boolean;
    function Open: IDelphiDayModelDatabaseConnessione;
    function Setup: IDelphiDayModelDatabaseConnessione;
    function This: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IDelphiDayModelDatabaseConnessione;
  end;

implementation

constructor TDelphiDayModelDatabaseConnessioneFireDAC.Create;
begin
  inherited;
  FConection := TFDConnection.Create(nil);
end;

destructor TDelphiDayModelDatabaseConnessioneFireDAC.Destroy;
begin
  FConection.Free;
  inherited;
end;

class function TDelphiDayModelDatabaseConnessioneFireDAC.New: IDelphiDayModelDatabaseConnessione;
begin
  Result := Self.Create;
end;

function TDelphiDayModelDatabaseConnessioneFireDAC.Close: IDelphiDayModelDatabaseConnessione;
begin
  Result := Self;
  FConection.Close;
  FConnesso := False;
end;

function TDelphiDayModelDatabaseConnessioneFireDAC.Connection: TCustomConnection;
begin
  Result := FConection;
end;

function TDelphiDayModelDatabaseConnessioneFireDAC.Connesso: Boolean;
begin
  Result := FConnesso;
end;

function TDelphiDayModelDatabaseConnessioneFireDAC.Open: IDelphiDayModelDatabaseConnessione;
begin
  Result := Self;
  FConection.Open;
  FConnesso := True;
end;

function TDelphiDayModelDatabaseConnessioneFireDAC.Setup: IDelphiDayModelDatabaseConnessione;
const
  SRowsetSize: Int8 = -1;
  SDriveName: string = 'FB';
  SDatabase: string = 'C:\Program Files (x86)\Firebird\Firebird_4_0\examples\empbuild\employee.fdb';
  SPassword: string = 'masterkey';
  sUser: string = 'sysdba';
  SDialect: UInt8 = 3;
var
  ParamsFirebird: TFDPhysFBConnectionDefParams;
begin
  Result := Self;
  FConection.LoginPrompt := False;
  FConection.DriverName := SDriveName;
  FConection.FetchOptions.RowsetSize := SRowsetSize;
  ParamsFirebird := (FConection.Params as TFDPhysFBConnectionDefParams);
  ParamsFirebird.CharacterSet := TIBCharacterSet.csWIN1252;
  ParamsFirebird.Database := SDatabase;
  ParamsFirebird.DriverID := SDriveName;
  ParamsFirebird.Password := SPassword;
  ParamsFirebird.UserName := sUser;
  ParamsFirebird.Protocol := TIBProtocol.ipLocal;
  ParamsFirebird.SQLDialect := SDialect;
end;

function TDelphiDayModelDatabaseConnessioneFireDAC.This: TFDConnection;
begin
  Result := FConection;
end;

end.
