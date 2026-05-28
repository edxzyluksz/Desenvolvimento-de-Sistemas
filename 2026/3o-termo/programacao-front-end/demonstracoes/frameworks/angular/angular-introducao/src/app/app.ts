import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Header } from './fragments/header/header';
import { Footer } from './fragments/footer/footer';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, Header, Footer],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('angular-introducao');
}
