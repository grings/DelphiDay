unit DelphiDay.Model.Database.Interfaces;

interface

uses
  Data.DB,
  //1 Accoppiato deve essere rimosso
  FireDAC.Comp.Client;

type
//  IDelphiDayModelDatabaseConnectionInjection = interface;

  IDelphiDayModelDatabaseConnessione = interface(IInterface)
    ['{D9E3AD64-11BE-4473-9593-1E3BBA01A016}']
    function Close: IDelphiDayModelDatabaseConnessione;
    function Connection: TCustomConnection;
    function Connesso: Boolean;
    function Open: IDelphiDayModelDatabaseConnessione;
    function Setup: IDelphiDayModelDatabaseConnessione;
  end;

  IDelphiDayModelDatabaseQuery = interface(IInterface)
    ['{79B2C01D-176E-45D9-9DA1-8BF1D6C1F420}']
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
  end;

//  IDelphiDayModelDatabaseConnectionInjection = interface(IInterface)
//    ['{4B8CFBB0-3D93-416C-8CA6-C0BBE6C73CAB}']
//    function Connection(const Value: IDelphiDayModelDatabaseConnessione): IDelphiDayModelDatabaseConnectionInjection;
//  end;

  IDelphiDayModelConnessioneFactory = interface(IInterface)
    ['{78435D15-09D3-4A8D-AF41-6540548893D7}']
    function Connessione: IDelphiDayModelDatabaseConnessione;
    function Query: IDelphiDayModelDatabaseQuery;
  end;

implementation

end.
