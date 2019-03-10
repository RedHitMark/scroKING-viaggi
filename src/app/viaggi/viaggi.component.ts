import { Component, OnInit } from '@angular/core';
import {Viaggio} from '../Viaggio';
import {ViaggiService} from '../services/viaggi.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-viaggi',
  templateUrl: './viaggi.component.html',
  styleUrls: ['./viaggi.component.css']
})
export class ViaggiComponent implements OnInit {
  viaggi: Viaggio[];
  viaggiFiltrati: Viaggio[];
  constructor( private viaggiService: ViaggiService ) { }

  async ngOnInit(): Promise<void> {
    await this.getViaggi();
  }

  async getViaggi(): Promise<void> {
    this.viaggi = await this.viaggiService.getViaggi();
    this.viaggiFiltrati = this.viaggi;
  }
  // used to filter results
  filtraViaggi(key: string) {
    key = key.toLowerCase();
    this.viaggiFiltrati = this.viaggi;
    this.viaggiFiltrati = this.viaggi.filter(value =>
        value.codViaggio.toString().toLowerCase().indexOf(key) > -1 ||
        value.tipoViaggio.toString().toLowerCase().indexOf(key) > -1 ||
        value.luogoPartenza.toString().toLowerCase().indexOf(key) > -1 ||
        value.luogoDestinazione.toString().toLowerCase().indexOf(key) > -1 ||
        value.codViaggio.toString().toLowerCase().indexOf(key) > -1 ||
        value.dataInizioViaggio.toString().toLowerCase().indexOf(key) > -1 ||
        value.dataFineViaggio.toString().toLowerCase().indexOf(key) > -1
    );
  }

  async deleteViaggio(codViaggio: number): Promise<void> {
    if (await confirm('Eliminare il viaggio ' + codViaggio)) {
      await this.viaggiService.deleteViaggio(codViaggio);
      await location.reload();
    }
  }
}
