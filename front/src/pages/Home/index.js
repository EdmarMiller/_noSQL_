
import { Container } from "react-bootstrap";
import index from "./index.png";

export default function Home(props) {
  return (
    <Container fluid>
    <h1>Home</h1>
    <img src={index} style={{width:'100%', height:'700px'}}/>
    </Container>
  )
}