unit DelphiDay.View.Principale;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TDelphiDayViewPrincipale = class(TForm)
    btnConnessione: TButton;
    btnControllerAdd: TButton;
    btnControllerAddSolo: TButton;
    btnControllerDelete: TButton;
    btnControllerEdit: TButton;
    btnControllerLista: TButton;
    btnEntita: TButton;
    btnQuery: TButton;
    mmoLog: TMemo;
    procedure btnConnessioneClick(Sender: TObject);
    procedure btnControllerAddClick(Sender: TObject);
    procedure btnControllerAddSoloClick(Sender: TObject);
    procedure btnControllerDeleteClick(Sender: TObject);
    procedure btnControllerEditClick(Sender: TObject);
    procedure btnControllerListaClick(Sender: TObject);
    procedure btnEntitaClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  strict private
    function AppendLine: TDelphiDayViewPrincipale;
    function AppendLog(const Value: string): TDelphiDayViewPrincipale;
    function AppendLogTitolo(const Sender: TObject): TDelphiDayViewPrincipale;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  DelphiDayViewPrincipale: TDelphiDayViewPrincipale;

implementation

uses
  System.StrUtils,
  Spring,
  DelphiDay.Controller.Dipendente.Factory,
  DelphiDay.Model.Database.Factory,
  DelphiDay.Model.Database.Interfaces,
  DelphiDay.Controller.Dipendente.Interfaces;

{$R *.dfm}

constructor TDelphiDayViewPrincipale.Create(AOwner: TComponent);
begin
  inherited;

  mmoLog.Anchors := [TAnchorKind.akLeft, TAnchorKind.akTop, TAnchorKind.akRight, TAnchorKind.akBottom];
  mmoLog.ScrollBars := TScrollStyle.ssBoth;
  mmoLog.Clear;
end;

function TDelphiDayViewPrincipale.AppendLine: TDelphiDayViewPrincipale;
begin
  Result := Self;
  Self.AppendLog(DupeString('=', 80));
end;

function TDelphiDayViewPrincipale.AppendLog(const Value: string): TDelphiDayViewPrincipale;
begin
  Result := Self;
  mmoLog.Lines.Append(Value);
end;

function TDelphiDayViewPrincipale.AppendLogTitolo(const Sender: TObject): TDelphiDayViewPrincipale;
var
  Button: TButton absolute Sender;
begin
  Result := Self;
  Self.AppendLog(Format('Esempio "%s"', [Button.Caption]))
end;

procedure TDelphiDayViewPrincipale.btnConnessioneClick(Sender: TObject);
begin
  if TDelphiDayModelConnessioneFactory.New.Connessione.Setup.Open.Connesso then
    Self.AppendLogTitolo(Sender)
        .AppendLog('Connesso')
        .AppendLine;
end;

procedure TDelphiDayViewPrincipale.btnControllerAddClick(Sender: TObject);
var
  ControllerDipendente: IDelphiDayControllerDipendente;
  Valori: array of string;
begin
  SetLength(Valori, 2);
  Self.AppendLogTitolo(Sender);
  ControllerDipendente := TDelphiDayControllerDipendenteFactory.New.Dipendente;
  ControllerDipendente.Setup;

  for var I := 1 to 2 do
  begin
    var Nome: string;
    InputQuery('Dipendente', ['Nome', 'Cognome'], Valori);
    var DipendenteEntity := TDelphiDayControllerDipendenteFactory.New.Entity;
    DipendenteEntity.Id(I)
                    .DataNascita(Now)
                    .PrimoNome(Valori[0])
                    .Cognome(Valori[1])
                    .Reparto('600')
                    .Mansione('VP')
                    .Livello(2)
                    .Paese('USA')
                    .Stipendio(105900.00);
    ControllerDipendente.Entity(DipendenteEntity)
                        .Add;
    Self.AppendLog('Aggiunto =' + DipendenteEntity.PrimoNome);
  end;

  ControllerDipendente.ApplyUpdate;

  Self.AppendLine
      .AppendLog('Lista aggiornata');

  for var Dipendente in ControllerDipendente.Lista.Values do
  begin
    var Testo: Shared<TStringBuilder> := TStringBuilder.Create;
    Testo.Value.Append('Nome = ').Append(Dipendente.Nome).Append(' | ')
               .Append('Mansione = ').Append(Dipendente.Mansione).Append(' | ')
               .Append('Data di nascita = ').Append(FormatDateTime('c', Dipendente.DataNascita));
    Self.AppendLog(Testo.Value.ToString);
  end;
end;

procedure TDelphiDayViewPrincipale.btnControllerAddSoloClick(Sender: TObject);
var
  Controller: IDelphiDayControllerDipendente;
begin
  Controller := TDelphiDayControllerDipendenteFactory.New.Dipendente;

  for var I := 0 to 2 do
    Controller.Entity(TDelphiDayControllerDipendenteFactory.New.Entity.Id(1))
              .Add;
end;

procedure TDelphiDayViewPrincipale.btnControllerDeleteClick(Sender: TObject);
var
  ControllerDipendente: IDelphiDayControllerDipendente;
begin
  Self.AppendLogTitolo(Sender);
  ControllerDipendente := TDelphiDayControllerDipendenteFactory.New.Dipendente;
  ControllerDipendente.Setup;

  for var I := 1 to 2 do
  begin
    var Id: string;
    InputQuery('Dipendente', 'Id', Id);
    var DipendenteEntity := TDelphiDayControllerDipendenteFactory.New.Entity;
    DipendenteEntity.Id(Id.ToInteger);
    ControllerDipendente.Entity(DipendenteEntity)
                        .Delete;
    Self.AppendLog('Cancellato =' + DipendenteEntity.Id.ToString);
  end;

  ControllerDipendente.ApplyUpdate;

  Self.AppendLine
      .AppendLog('Lista aggiornata');

  for var Dipendente in ControllerDipendente.Lista.Values do
  begin
    var Testo: Shared<TStringBuilder> := TStringBuilder.Create;
    Testo.Value.Append('Nome = ').Append(Dipendente.Nome).Append(' | ')
               .Append('Mansione = ').Append(Dipendente.Mansione).Append(' | ')
               .Append('Data di nascita = ').Append(FormatDateTime('c', Dipendente.DataNascita));
    Self.AppendLog(Testo.Value.ToString);
  end;
end;

procedure TDelphiDayViewPrincipale.btnControllerEditClick(Sender: TObject);
var
  Cognome: string;
  ControllerDipendente: IDelphiDayControllerDipendente;
  DipendenteEntity: IDelphiDayControllerDipendenteEntity;
  Id: string;
  Valori: array of string;
begin
  Self.AppendLogTitolo(Sender);
  SetLength(Valori, 3);
  InputQuery('Dipendente', ['Id', 'Nome', 'Cognome'], Valori);

  DipendenteEntity := TDelphiDayControllerDipendenteFactory.New.Entity;
  DipendenteEntity.Id(Valori[0].ToInteger)
                  .PrimoNome(Valori[1])
                  .Cognome(Valori[2]);

  ControllerDipendente := TDelphiDayControllerDipendenteFactory.New.Dipendente;
  ControllerDipendente.Setup
                      .Entity(DipendenteEntity)
                      .Load
                      .Edit
                      .ApplyUpdate;
  Self.AppendLine
      .AppendLog('Lista dipendente modificato');
end;

procedure TDelphiDayViewPrincipale.btnControllerListaClick(Sender: TObject);
var
  ControllerDipendente: IDelphiDayControllerDipendente;
begin
  ControllerDipendente := TDelphiDayControllerDipendenteFactory.New.Dipendente;
  ControllerDipendente.Setup
                      .Load;
  Self.AppendLogTitolo(Sender);

  for var Dipendente in ControllerDipendente.Lista.Values do
  begin
    var Testo: Shared<TStringBuilder> := TStringBuilder.Create;
    Testo.Value.Append('Id = ').Append(Dipendente.Id).Append(' | ')
               .Append('Nome = ').Append(Dipendente.Nome).Append(' | ')
               .Append('Mansione = ').Append(Dipendente.Mansione).Append(' | ')
               .Append('Data di nascita = ').Append(FormatDateTime('c', Dipendente.DataNascita));
    Self.AppendLog(Testo.Value.ToString);
  end;

  Self.AppendLine;
end;

procedure TDelphiDayViewPrincipale.btnEntitaClick(Sender: TObject);
begin
  Self.AppendLogTitolo(Sender)
      .AppendLog(

      TDelphiDayControllerDipendenteFactory.New.Entity
                  .PrimoNome('Cleber')
                  .Cognome('Grings')
                  .Nome);

  Self.AppendLine;
end;

procedure TDelphiDayViewPrincipale.btnQueryClick(Sender: TObject);
var
  ModelConnessione: IDelphiDayModelDatabaseConnessione;
  ModelQuery: IDelphiDayModelDatabaseQuery;
begin
//  ModelConnessione := TDelphiDayModelConnessioneFactory.New.Connessione.Setup;
//  ModelQuery := TDelphiDayModelConnessioneFactory.New.Query.Connessione(ModelConnessione).Setup;

//  ModelConnessione := TDelphiDayModelConnessioneFactory.New.Connessione
//                          .Setup;
//  ModelQuery := TDelphiDayModelConnessioneFactory.New.Query
//                    .Connessione(ModelConnessione)
//                    .Setup;

  Self.AppendLogTitolo(Sender)
      .AppendLog(

      TDelphiDayModelConnessioneFactory.New.Query
          .Connessione(TDelphiDayModelConnessioneFactory.New.Connessione.Setup)
          .Setup
          .Sql('SELECT FIRST 1 * FROM EMPLOYEE')
          .Open
          .DataSet.FieldByName('FIRST_NAME').AsString);

  Self.AppendLine;
end;

end.
