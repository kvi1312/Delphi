unit ProductController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Nullables, ProductModel,
  ProductService, MVCFramework.Serializer.Commons, System.Generics.Collections;

type

  [MVCPath('/api')]
  TProductController = class(TMVCController)
  public
    [MVCPath('/get-all-products')]
    [MVCHTTPMethod([httpGET])]
    function GetAllProduct([MVCInject] ProductService : IProductService): IMVCResponse;
  end;

implementation


{ TProductController }


{ TProductController }

function TProductController.GetAllProduct(
  ProductService: IProductService): IMVCResponse;
begin
Result := OKResponse(ProductService.GetAllProducts);
end;


end.
