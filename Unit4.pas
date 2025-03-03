unit Unit4;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Nullables, Unit2, Unit3, MVCFramework.Serializer.Commons, System.Generics.Collections;

type
  [MVCPath('/api')]
  TCustomerController = class(TMVCController)
  protected
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;
  public
    [MVCPath]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.TEXT_HTML)]
    function Index: String;

    [MVCPath('/reversedstrings/($Value)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.TEXT_PLAIN)]
    function GetReversedString(const Value: String): String;

    //Sample CRUD Actions for a "People" entity
    [MVCPath('/people')]
    [MVCHTTPMethod([httpGET])]
    function GetPeople([MVCInject] PeopleService: IPeopleService): IMVCResponse;

    [MVCPath('/people/($ID)')]
    [MVCHTTPMethod([httpGET])]
    function GetPerson(ID: Integer): TPerson;

    [MVCPath('/people')]
    [MVCHTTPMethod([httpPOST])]
    function CreatePerson([MVCFromBody] Person: TPerson): IMVCResponse;

    [MVCPath('/people/($ID)')]
    [MVCHTTPMethod([httpPUT])]
    function UpdatePerson(ID: Integer; [MVCFromBody] Person: TPerson): IMVCResponse;

    [MVCPath('/people/($ID)')]
    [MVCHTTPMethod([httpDELETE])]
    function DeletePerson(ID: Integer): IMVCResponse;
  end;

implementation

uses
  System.StrUtils, System.SysUtils, MVCFramework.Logger;


procedure TCustomerController.OnAfterAction(Context: TWebContext; const AActionName: string);
begin
  { Executed after each action }
  inherited;
end;

procedure TCustomerController.OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean);
begin
  { Executed before each action
    if handled is true (or an exception is raised) the actual
    action will not be called }
  inherited;
end;

function TCustomerController.Index: String;
begin
  //use Context property to access to the HTTP request and response
  Result := '<p>Hello <strong>DelphiMVCFramework</strong> World</p>' + 
            '<p><small>dmvcframework-' + DMVCFRAMEWORK_VERSION + '</small></p>';
end;

function TCustomerController.GetReversedString(const Value: String): String;
begin
  Result := System.StrUtils.ReverseString(Value.Trim);
end;

//Sample CRUD Actions for a "People" entity (with service injection)
function TCustomerController.GetPeople(PeopleService: IPeopleService): IMVCResponse;
begin
  Result := OkResponse(PeopleService.GetAll);
end;

function TCustomerController.GetPerson(ID: Integer): TPerson;
begin
  Result := TPerson.Create(ID, 'Daniele', 'Teti', EncodeDate(1979, 11, 4));
end;

function TCustomerController.CreatePerson([MVCFromBody] Person: TPerson): IMVCResponse;
begin
  LogI('Created ' + Person.FirstName + ' ' + Person.LastName);
  Result := CreatedResponse('', 'Person created');
end;

function TCustomerController.UpdatePerson(ID: Integer; [MVCFromBody] Person: TPerson): IMVCResponse;
begin
  LogI('Updated ' + Person.FirstName + ' ' + Person.LastName);
  Result := NoContentResponse();
end;

function TCustomerController.DeletePerson(ID: Integer): IMVCResponse;
begin
  LogI('Deleted person with id ' + ID.ToString);
  Result := NoContentResponse();
end;

end.
