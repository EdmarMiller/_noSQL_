import React from 'react';
import formas_pagamento from './formas_pagamento.png';

class Footer extends React.Component {
    render() {
        return (
          <footer className ="my-5">
            <h4>Formas de Pagamento</h4>
            <img className="img-fluid" src={formas_pagamento} alt="Formas de pagamento " />
            <hr />&copy;Edmar Miller
          </footer>
        );
    }
}

export default Footer;