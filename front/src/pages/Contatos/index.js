import { Button, Container, Form, Card, CardDeck } from 'react-bootstrap';
import { useState, useEffect } from 'react'
//import React,{lazy, Suspense} from 'react';

export default function Contatos(props) {

  const [comentarios, setComentarios] = useState([]);

  useEffect(() => {
    async function fethData() {
      const url = "http://localhost:3010/recebe_mensagem";
      const resposta = await fetch(url);
      const resultado = await resposta.json();
      setComentarios(resultado);
    }
    fethData();
  }, []);

  const [dadosForm, setDadosForm] = useState({
    nome: '',
    mensagem: ''
  });
  function handleChange(evento) {
    dadosForm[evento.target.name] = evento.target.value;
    console.log(dadosForm);
  }
  const enviaMSG = async () => {

    const url = "http://localhost:3010/envia_mensagem";
    await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(dadosForm)
    });
  }
  return (


    <Container >
      <Form onSubmit={enviaMSG} >
        <Form.Group >
          <Form.Label><h3>Nome:</h3></Form.Label>
          <Form.Control onChange={handleChange} name="nome" type="nome" placeholder="Coloque seu nome:" />
        </Form.Group>

        <Form.Group >
          <Form.Label><h3>Coloque sua mensagem:</h3></Form.Label>
          <Form.Control onChange={handleChange} name="mensagem" as="textarea" rows={7} placeholder="Aguardamos por sua msg....." />
        </Form.Group>
        <Button variant="outline-danger" type="submit" block>
          Enviar
        </Button>
      </Form>
      <Container>

       <CardDeck>

      {comentarios && comentarios
        .map(item =>
         
          <Card border="danger" style={{ width: '25rem' }}>
            <Card.Body>
            <Card.Title>{item.nome}</Card.Title>
            <Card.Text>
            {item.mensagem}
            </Card.Text>
          </Card.Body>
        </Card>
         )}
    </CardDeck>
  </Container>
  </Container>


  )
}