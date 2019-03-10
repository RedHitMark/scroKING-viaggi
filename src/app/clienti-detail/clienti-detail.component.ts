import { Component, OnInit } from '@angular/core';
import {Cliente} from '../Cliente';
import {ActivatedRoute} from '@angular/router';
import {ClientiService} from '../services/clienti.service';
import {PrenotazioniService} from '../services/prenotazioni.service';


@Component({
  selector: 'app-clienti-detail',
  templateUrl: './clienti-detail.component.html',
  styleUrls: ['./clienti-detail.component.css']
})
export class ClientiDetailComponent implements OnInit {
  cliente: Cliente;

  constructor(
      private route: ActivatedRoute,
      private clientiService: ClientiService,
      private prentazioniService: PrenotazioniService
  ) { }

  async ngOnInit(): Promise<void> {
    await this.getCliente();
  }
  async getCliente(): Promise<void> {
    const codFiscale = this.route.snapshot.paramMap.get('codFiscale');
    this.cliente = await this.clientiService.getCliente(codFiscale.toString());
    // prenotazioni filer
    const prenotazioni = await this.prentazioniService.getPrenotazioni();
    this.cliente.prenotazioni = await prenotazioni.filter(value => value.cliente.toString() === codFiscale.toString());
  }

}
