import { Component, OnInit } from '@angular/core';
import {Cliente} from '../Cliente';
import {ClientiService} from '../services/clienti.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-cliente-form',
  templateUrl: './cliente-form.component.html',
  styleUrls: ['./cliente-form.component.css']
})
export class ClienteFormComponent implements OnInit {
  cliente: Cliente;
  constructor(
      private clientiService: ClientiService,
      private router: Router) { }

  ngOnInit() {
    this.cliente = new Cliente();
  }

  async newCliente() {
    if (await confirm('Inserire il cliente?')) {
      await this.clientiService.createCliente(this.cliente);
      this.router.navigate(['/', 'clienti']);
    }
  }
}
