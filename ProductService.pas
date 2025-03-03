unit ProductService;

interface

uses
  ProductModel,
  MVCFramework.Container, System.Generics.Collections;

type
  IProductService = interface
    // Delphi require and Interface's Guid for reflection to a class that implement that interface
    ['{8A1D4B56-3C1E-4F99-9123-ABCD12345678}']
    function GetAllProducts: TObjectList<TProduct>;
  end;

  TProductService = class(TInterfacedObject, IProductService)
  protected
    function GetAllProducts: TObjectList<TProduct>;
  end;

procedure RegisterServices(App: IMVCServiceContainer);

implementation

// IMVCServiceContainer - Use for DI and IoC
procedure RegisterServices(App: IMVCServiceContainer);
begin
  App.RegisterType(TProductService, IProductService,
    TRegistrationType.SingletonPerRequest);
end;

{ TProductService }
function TProductService.GetAllProducts: TObjectList<TProduct>;
begin
  Result := TObjectList<TProduct>.Create;
  Result.AddRange([TProduct.Create(1, 'Laptop', 'laptop123', 'Dell', 1200.50),
    TProduct.Create(2, 'Smartphone', 'phone456', 'Samsung', 800.75),
    TProduct.Create(3, 'Headphones', 'head789', 'Sony', 150.00)]);

end;

end.
