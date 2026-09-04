import { Component } from '@angular/core';

@Component({
  selector: 'app-galeria',
  imports: [],
  templateUrl: './galeria.component.html',
  styleUrl: './galeria.component.scss',
})
export class GaleriaComponent {
  public listaVagas = [
    {
      arquivo: 'backend.jpg',
      categoria: 'Tecnologia / Desenvolvimento',
      nome: 'Infraestrutura de Back-End',
    },
    {
      arquivo: 'fullstack.jpg',
      categoria: 'Tecnologia / Desenvolvimento',
      nome: 'Desenvolvedor Full-Stack Pleno',
    },
    {
      arquivo: 'user-experience.jpg',
      categoria: 'Design / Produto',
      nome: 'Interface de Usuário (UX/UI)',
    },
    {
      arquivo: 'network-technician.jpg',
      categoria: 'Tecnologia / Infraestrutura',
      nome: 'Técnico em Redes de Computadores'
    },
  ];
}
