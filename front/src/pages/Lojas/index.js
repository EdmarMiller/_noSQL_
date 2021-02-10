import Card from 'react-bootstrap/Card';
import CardDeck from 'react-bootstrap/CardDeck';
import minas from "./minas.jpg";
import rio from "./rio.jpg";
import saopaulo from "./saopaulo.jpg";


export default function Lojas(props) {
  return (
      <CardDeck>
        <Card style={{ minWidth: '18rem', width: '18rem'}}>
          <Card.Img variant="top" src={minas} />
          <Card.Body>
            <Card.Title>Minas Gerais</Card.Title>
            <Card.Text>
              <p>Avenida da Pampulha, 8745</p>
              <p>15&ordm; andar</p>
              <p><strong> Jardim Atlântico</strong></p>
            </Card.Text>
          </Card.Body>
          <Card.Footer>
            <small className="text-muted">(31) 4874-3123</small>
          </Card.Footer>
        </Card>
        <Card style={{ minWidth: '18rem', width: '18rem'}}>
          <Card.Img variant="top" src={rio} />
          <Card.Body>
            <Card.Title>Rio de Janeiro</Card.Title>
            <Card.Text>
              <p>Avenida Brasil, 354</p>
              <p>13&ordm; andar</p>
              <p><strong>Jardim Europa</strong></p>
            </Card.Text>
          </Card.Body>
          <Card.Footer>
            <small className="text-muted">(21) 3254-7541</small>
          </Card.Footer>
        </Card>
        <Card style={{ minWidth: '18rem', width: '18rem'}}>
          <Card.Img variant="top" src={saopaulo} />
          <Card.Body>
            <Card.Title>São Paulo</Card.Title>
            <Card.Text>
               <p>Avenida Getúlio Vargas , 4850</p>
              <p>10&ordm; andar</p>
              <p><strong>Nações Unidas</strong></p>
            </Card.Text>
          </Card.Body>
          <Card.Footer>
            <small className="text-muted">(11) 7541-3587</small>
          </Card.Footer>
        </Card>
    </CardDeck>
  )
}