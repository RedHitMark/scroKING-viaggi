import { Component, OnInit } from '@angular/core';
import {Mezzo} from '../Mezzo';
import {MezziService} from '../services/mezzi.service';

@Component({
  selector: 'app-mezzi',
  templateUrl: './mezzi.component.html',
  styleUrls: ['./mezzi.component.css']
})
export class MezziComponent implements OnInit {
  mezzi: Mezzo[];
  mezziFiltrati: Mezzo[];
  constructor(private mezziService: MezziService) { }

  async ngOnInit(): Promise<void> {
    await this.getMezzi();
  }

  async getMezzi(): Promise<void> {
    this.mezzi = await this.mezziService.getMezzi();
    this.mezziFiltrati = this.mezzi;
  }

  // used to filter results
  filtraMezzi(key: string) {
    key = key.toLowerCase();
    this.mezziFiltrati = this.mezzi;
    this.mezziFiltrati = this.mezzi.filter(value =>
        value.codMezzo.toString().toLowerCase().indexOf(key) > -1 ||
        value.descrizioneMezzo.toString().toLowerCase().indexOf(key) > -1 ||
        value.capienzaMezzo.toString().toLowerCase().indexOf(key) > -1
    );
  }

  async deleteMezzo(codMezzo: number): Promise<void> {
    if (await confirm('Eliminare il mezzo ' + codMezzo)) {
      // await this.mezziService.deleteViaggio(codViaggio);
      await location.reload();
    }
  }

}
