import { Routes } from '@angular/router';
import { Vagas } from './view/pages/vagas/vagas';
import { Inicio } from './view/pages/inicio/inicio';
import { PainelVagas } from './view/pages/painel-vagas/painel-vagas';
import { NotFound } from './view/pages/not-found/not-found';

export const routes: Routes = [
  {path: "", component: Inicio},
  {path: "vagas", component: Vagas},
  {path: "painel-vaga", component: PainelVagas},
  {path: "**", component: NotFound}
];
