import { Component, OnInit } from '@angular/core';
import {Cliente} from '../Cliente';
import {ClientiService} from '../services/clienti.service';

@Component({
  selector: 'app-clienti',
  templateUrl: './clienti.component.html',
  styleUrls: ['./clienti.component.css']
})
export class ClientiComponent implements OnInit {
  clienti: Cliente[];
  clientiFiltrati: Cliente[];
  constructor(private clientiService: ClientiService) { }

  async ngOnInit(): Promise<void> {
    await this.getClienti();
  }

  async getClienti(): Promise<void> {
    this.clienti = await this.clientiService.getClienti();
    this.clientiFiltrati = this.clienti;
  }
  // used to filter results
  filtraClienti(key: string) {
    key = key.toLowerCase();
    this.clientiFiltrati = this.clienti;
    this.clientiFiltrati = this.clienti.filter(value =>
        value.codFiscale.toString().toLowerCase().indexOf(key) > -1 ||
        value.nomeCliente.toString().toLowerCase().indexOf(key) > -1 ||
        value.cognomeCliente.toString().toLowerCase().indexOf(key) > -1 ||
        value.sesso.toString().toLowerCase().indexOf(key) > -1 ||
        value.telefono.toString().toLowerCase().indexOf(key) > -1 ||
        value.indirizzo.toString().toLowerCase().indexOf(key) > -1
    );
  }

  async deleteCliente(codFiscale: string) {
    if (await confirm('Eliminare il cliente ' + codFiscale)) {
      await this.clientiService.deleteCliente(codFiscale);
      await location.reload();
    }
  }

}
