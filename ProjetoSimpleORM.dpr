program ProjetoSimpleORM;
{$R *.dres}
uses
  Vcl.Forms,
  projetosimpleorm.view.pages.cliente in 'src\view\pages\projetosimpleorm.view.pages.cliente.pas' {PageCliente},
  projetosimpleorm.view.pages.configuracoes in 'src\view\pages\projetosimpleorm.view.pages.configuracoes.pas' {PageConfiguracoes},
  projetosimpleorm.view.pages.pedidovenda in 'src\view\pages\projetosimpleorm.view.pages.pedidovenda.pas' {PagePedidoVenda},
  projetosimpleorm.view.pages.produto in 'src\view\pages\projetosimpleorm.view.pages.produto.pas' {PageProduto},
  projetosimpleorm.view.utils.interfaces in 'src\view\utils\projetosimpleorm.view.utils.interfaces.pas',
  projetosimpleorm.view.utils.impl.forms in 'src\view\utils\impl\projetosimpleorm.view.utils.impl.forms.pas',
  projetosimpleorm.view.utils.impl.gerenciadorforms in 'src\view\utils\impl\projetosimpleorm.view.utils.impl.gerenciadorforms.pas',
  projetosimpleorm.view.utils.impl.resourceimage in 'src\view\utils\impl\projetosimpleorm.view.utils.impl.resourceimage.pas',
  projetosimpleorm.model.resource.interfaces in 'src\model\resource\projetosimpleorm.model.resource.interfaces.pas',
  projetosimpleorm.model.resource.impl.conexaofiredac in 'src\model\resource\impl\projetosimpleorm.model.resource.impl.conexaofiredac.pas',
  projetosimpleorm.model.resource.impl.configuracao in 'src\model\resource\impl\projetosimpleorm.model.resource.impl.configuracao.pas',
  projetosimpleorm.model.service.interfaces in 'src\model\service\projetosimpleorm.model.service.interfaces.pas',
  projetosimpleorm.model.service.impl.servicesimpleorm in 'src\model\service\impl\projetosimpleorm.model.service.impl.servicesimpleorm.pas',
  projetosimpleorm.model.resource.impl.factory in 'src\model\resource\impl\projetosimpleorm.model.resource.impl.factory.pas',
  projetosimpleorm.model.entity.cliente in 'src\model\entity\projetosimpleorm.model.entity.cliente.pas',
  projetosimpleorm.model.entity.endereco in 'src\model\entity\projetosimpleorm.model.entity.endereco.pas',
  projetosimpleorm.model.entity.pessoa in 'src\model\entity\projetosimpleorm.model.entity.pessoa.pas',
  projetosimpleorm.model.entity.produto in 'src\model\entity\projetosimpleorm.model.entity.produto.pas',
  projetosimpleorm.model.entity.pedido in 'src\model\entity\projetosimpleorm.model.entity.pedido.pas',
  projetosimpleorm.model.entity.pedidoitens in 'src\model\entity\projetosimpleorm.model.entity.pedidoitens.pas',
  projetosimpleorm.controller.dto.interfaces in 'src\controller\dto\projetosimpleorm.controller.dto.interfaces.pas',
  projetosimpleorm.controller.dto.impl.cliente in 'src\controller\dto\impl\projetosimpleorm.controller.dto.impl.cliente.pas',
  projetosimpleorm.controller.dto.impl.pessoa in 'src\controller\dto\impl\projetosimpleorm.controller.dto.impl.pessoa.pas',
  projetosimpleorm.controller.dto.impl.endereco in 'src\controller\dto\impl\projetosimpleorm.controller.dto.impl.endereco.pas',
  projetosimpleorm.controller.dto.impl.pedido in 'src\controller\dto\impl\projetosimpleorm.controller.dto.impl.pedido.pas',
  projetosimpleorm.controller.dto.impl.pedidoitens in 'src\controller\dto\impl\projetosimpleorm.controller.dto.impl.pedidoitens.pas',
  projetosimpleorm.controller.interfaces in 'src\controller\projetosimpleorm.controller.interfaces.pas',
  projetosimpleorm.controller.impl.controller in 'src\controller\impl\projetosimpleorm.controller.impl.controller.pas',
  projetosimpleorm.controller.dto.impl.produto in 'src\controller\dto\impl\projetosimpleorm.controller.dto.impl.produto.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPagePedidoVenda, PagePedidoVenda);
  Application.Run;
end.
