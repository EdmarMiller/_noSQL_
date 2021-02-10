import {ListGroup} from 'react-bootstrap'

export default function Catedoria(){
  
  const FiltrarCategoria = (evento) =>{
      const categoria = evento.target.id;
      let elementos = document.getElementsByClassName('boxProduto');
      console.log(elementos);
      for (var i = 0; i < elementos.length; i++) {
        if (categoria === elementos[i].id || categoria === "todos"){
            elementos[i].style = "display: inline-block";
        }
        else{
            elementos[i].style = "display: none";
        }
    }
  }
  
  return(
   
    <aside>
      <ListGroup variant="flush">
        <ListGroup.Item onClick={FiltrarCategoria} id="todos" action>Todos</ListGroup.Item>
        <ListGroup.Item onClick={FiltrarCategoria} id="Bolo" action>Bolos</ListGroup.Item>
        <ListGroup.Item onClick={FiltrarCategoria} id="Doce" action>Doces</ListGroup.Item>
      </ListGroup>
    </aside>
  )
} 