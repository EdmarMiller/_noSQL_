import { Row, Col, Container, Image } from 'react-bootstrap';
import image from "./image.gif";

export default function Pedidos() {
  
  return (
   
   <Container>
    <Row >
      <Col xs={6} md={4}>
        <Image src={image} thumbnail  />
      </Col>
      <Col xs={6} md={4}>
        <Image className='border'  src={image}  roundedCircle />
      </Col>
      <Col xs={6} md={4}>
        <Image src={image}  thumbnail />
      </Col>
    </Row>
  </Container>
  
  )
}