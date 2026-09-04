import { Routes } from '@angular/router';
import { VagasComponent } from './view/pages/main/vagas/vagas.component';
import { InicioComponent } from './view/pages/main/inicio/inicio.component';
import { PainelVagasComponent } from './view/pages/admin/gerenciamento-vagas/gerenciamento-vagas.component';
import { NotFoundComponent } from './view/pages/utils/not-found/not-found.component';
import { CurriculosComponent } from './view/pages/main/curriculos/curriculos.component';
import { GaleriaComponent } from './view/pages/main/galeria/galeria.component';
import { GerenciamentoCurriculosComponent } from './view/pages/admin/gerenciamento-curriculos/gerenciamento-curriculos.component';

export const routes: Routes = [
  { path: '', component: InicioComponent },
  { path: 'vagas', component: VagasComponent },
  { path: 'painel-vagas', component: PainelVagasComponent },
  { path: 'curriculos', component: CurriculosComponent },
  { path: 'painel-curriculos', component: GerenciamentoCurriculosComponent },
  { path: 'galeria', component: GaleriaComponent },
  { path: '**', component: NotFoundComponent },
];
