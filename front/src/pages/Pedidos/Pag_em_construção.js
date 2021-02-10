import { useEffect, useState } from 'react';
import { Form, Button, Container, Table } from 'react-bootstrap';
import Pedido from '../../Components/Pedidos';

export default function Pedidos() {

  const [pedidos, setPedidos] = useState([]);
    
    useEffect(() => {
      async function fethData() {
        const url = "http://localhost/Projetos_pessoais/LojaDaTia_React/src/api/Pedido.php";
        const resposta = await fetch(url);
        const resultado = await resposta.json();
        setPedidos(resultado);
      }
      fethData();
      }, [])
      
 const enviaPedido = async (evento) => {
   evento.preventDefault(); // Nao atualizar a pagina altomaticamente

   const url = "http://localhost/Projetos_pessoais/LojaDaTia_React/src/api/Pedido.php";
   const dados = new FormData(evento.target);
   await fetch(url,{
     method:"POST",
     body: dados
   })
 }

  return (
    <Container>
      <Form onSubmit={enviaPedido} className="col-12 col-md-10 mx-auto my-5">
        <h1>Formulario de Compra</h1>
        <Form.Group>
          <Form.Label>Nome</Form.Label>
          <Form.Control id="nome" name="nome" className="mb-3" type="text" placeholder="Digite seu nome" required />
        </Form.Group>
        <Form.Group>
          <Form.Label>Endereco</Form.Label>
          <Form.Control id="endereco" name="endereco" className="mb-3" type="text" placeholder="Digite seu endereco" required />
        </Form.Group>
        <Form.Group>
          <Form.Label>Telefone</Form.Label>
          <Form.Control id="telefone" name="telefone" className="mb-3" type="text" placeholder="Digite seu telefone" required />
        </Form.Group>
        <Form.Group>
          <Form.Label>Produto</Form.Label>
          <Form.Control id="produto" name="produto" as="select">
            <option></option>
            <option>Bolo Branco</option>
            <option>Bolo Sem Açucar</option>
            <option>Bolo Chocolate</option>
            <option>Doce Premium</option>
            <option>Doce Tradicionais</option>
            <option>Doce Clássicos</option>
            <option>Doce Padrinhos</option>
            <option>Doce Convidados</option>
          
          </Form.Control>
        </Form.Group>
        <Form.Group>
          <Form.Label>Valor Unitario</Form.Label>
          <Form.Control  id="valor" name="valor" className="mb-3" type="number" step="0.01" placeholder="Digite o valor unitario" required />
        </Form.Group>
        <Form.Group>
          <Form.Label>Quantidade</Form.Label>
          <Form.Control  id="quantidade" name="quantidade" className="mb-3" type="number" min="1" required />
        </Form.Group>
        <Form.Group>
          <Form.Label>Valor Total</Form.Label>
          <Form.Control id="valor_total" name="valor_total" className="mb-3" type="text" />
        </Form.Group>
        <Form.Group>
          <Button type="submit" variant="success">Enviar</Button>
          {'  '}
          <Button type="reset" variant="warning">Limpar</Button>
        </Form.Group>
      </Form>
    <Table striped bordered hover>
     <thead>
        <tr>
          <th>id</th>
          <th>nome</th>
          <th>endereco</th>
          <th>telefone</th>
          <th>produto</th>
          <th>valor</th>
          <th>quantidade</th>
          <th>total</th>
        </tr>
      </thead>
      <tbody>
      {pedidos && pedidos.map(item => <Pedido key={item.idpedidos} id={item.idpedidos} nome={item.nome_cliente}
      endereco={item.endereco} telefone={item.telefone} produto={item.nome_produto} valor={item.valor_unit}
      quantidade={item.quantidade} total={item.valor_total} />)}
      </tbody>
    </Table>
    </Container>
  )
}