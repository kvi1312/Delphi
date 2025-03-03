unit ProductModel;

interface

uses MVCFramework.Nullables, MVCFramework.Serializer.Commons;

type
  TProduct = class
  private
    FId: NullableInt32;
    FName: String;
    FAlias: String;
    FBrand: String;
    FPrice: Double;

   public
    [MVCNameAs('ID')]
    property ID: NullableInt32 read FId write FId;

    [MVCNameAs('Name')]
    property Name: String read FName write FName;

    [MVCNameAs('Alias')]
    property Alias: String read FAlias write FAlias;

    [MVCNameAs('Brand')]
    property Brand: String read FBrand write FBrand;

    [MVCNameAs('Price')]
    property Price: Double read FPrice write FPrice;

    constructor Create(ID: Integer; Name, Alias, Brand: String; Price: Double);
  end;

implementation

constructor TProduct.Create(ID: Integer; Name, Alias, Brand: String;
  Price: Double);
begin
  inherited Create;
  FId := ID;
  FName := Name;
  FAlias := Alias;
  FBrand := Brand;
  FPrice := Price;
end;

end.
