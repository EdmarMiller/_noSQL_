import { Switch, Route } from 'react-router-dom';
import React,{lazy, Suspense} from 'react';

// Sem lazy 
//  import Home from './pages/Home';
//  import Contatos from './pages/Contatos';
//  import Lojas from './pages/Lojas';
//  import PageProdutos from './pages/Produtos';
//  import PagePedidos from './pages/Pedidos';

const Home = lazy(() => import('./pages/Home'))
const Contatos = lazy(() => import('./pages/Contatos'))
const Lojas = lazy(() => import('./pages/Lojas'))
const PageProdutos = lazy(() => import('./pages/Produtos'))
const PagePedidos = lazy(() => import('./pages/Pedidos'))



function Routes() {
    return (
        <Switch>
              <Suspense fallback={<p>Carregandoooooo...</p>}> 
                 <Route component={Home} exact path="/"  />
                  <Route component={PageProdutos} exact path="/produtos"  />
                  <Route component={Contatos} exact path="/contatos"  />
                  <Route component={Lojas} exact path="/lojas"  />
                 <Route component={PagePedidos} exact path="/Pedidos"  />
              </Suspense> 
        </Switch>
    );
}

export default Routes;