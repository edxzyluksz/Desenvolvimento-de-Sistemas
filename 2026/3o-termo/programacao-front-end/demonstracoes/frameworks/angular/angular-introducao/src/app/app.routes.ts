import { Routes } from '@angular/router';
import { Home } from './pages/home/home';
import { Produtos } from './pages/produtos/produtos';
import { Contato } from './pages/contato/contato';
import { Error } from './pages/error/error';

export const routes: Routes = [
  // Criar as rotas de navegação
  {path: "home", component: Home},
  {path: "produtos", component: Produtos},
  {path: "contato", component: Contato},
  {path: "", component: Home},
  {path: "**", component: Error}
];
