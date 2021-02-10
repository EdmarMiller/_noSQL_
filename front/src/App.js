import {BrowserRouter} from 'react-router-dom';
import { Container } from 'react-bootstrap';
import Routes from './routes';

import './App.css';
import Menu from './Components/Menu/Menu';
import Footer from './Components/Footer/Footer';

function App() {
  return (
    <BrowserRouter>
      <Container fluid>
        <Menu />
          <Routes />
        <Footer />
      </Container>
    </BrowserRouter>
  );
}

export default App;
