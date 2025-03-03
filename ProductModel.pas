unit ProductModel;

interface

uses MVCFramework.Nullables, MVCFramework.Serializer.Commons;

type
  TProduct = class
  private
    FId: NullableInt32;
    FName: String;
    FAlias: String;
    TBrand: String;
    TPrice: Double;

  public
    property ID: NullableInt32 read FId write FId;
    property Name: String read FName write FName;
    property Alias: String read FAlias write FAlias;
    property Brand: String read TBrand write TBrand;
    property Price: Double read TPrice write TPrice;
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
  TBrand := Brand;
  TPrice := Price;
end;

end.
