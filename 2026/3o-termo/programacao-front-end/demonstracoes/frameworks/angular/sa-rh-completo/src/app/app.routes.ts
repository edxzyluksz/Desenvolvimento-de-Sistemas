import { Routes } from '@angular/router';
import { Vagas } from './view/vagas/vagas';
import { Inicio } from './view/inicio/inicio';

export const routes: Routes = [
  {path: "", component: Inicio},
  {path: "vagas", component: Vagas},
];
