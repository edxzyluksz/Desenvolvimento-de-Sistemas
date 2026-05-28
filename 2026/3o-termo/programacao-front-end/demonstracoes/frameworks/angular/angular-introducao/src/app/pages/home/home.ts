import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-home',
  imports: [FormsModule],
  templateUrl: './home.html',
  styleUrl: './home.css',
})
export class Home {
  // Exemplo de Interpolação (DataBinding)
  // Comunicação unidirecional entre TS -> HTML
  // A interpolação é dada usando {{ elemento }}
  nome: string = 'Edxzy';

  // Property Binding -> Unidirecional : TS -> HTML
  // Manipula propriedade do HTML
  imgUrl: string = 'https://images4.alphacoders.com/140/thumb-1920-1401011.jpg';
  botaoDesabilitado: boolean = true;

  // Class e Style Binding
  classeAlerta: string = "alert-sucess";
}
