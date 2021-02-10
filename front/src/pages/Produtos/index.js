import { Col, Row } from 'react-bootstrap';
import Catedoria from '../../Components/Categoria';
import Produtos from '../../Components/Produtos/Produtos'



export default function PageProdutos(props) {
  
  return (
    <>
     
      <h2 className="border-bottom py-5 text-center">Produtos</h2>
      <Row>

        <Col lg={3} md={4}>
          <Catedoria />
        </Col>
      
        <Col lg={9} md={8}>
          <Produtos /> 
        </Col>

      </Row>
    </>
    )
}
