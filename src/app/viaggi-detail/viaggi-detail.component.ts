import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router';
import {ViaggiService} from '../services/viaggi.service';
import {Viaggio} from '../Viaggio';
import {PrenotazioniService} from '../services/prenotazioni.service';
import {MezziService} from '../services/mezzi.service';
import {SoggiorniService} from '../services/soggiorni.service';

@Component({
  selector: 'app-viaggi-detail',
  templateUrl: './viaggi-detail.component.html',
  styleUrls: ['./viaggi-detail.component.css']
})
export class ViaggiDetailComponent implements OnInit {
  viaggio: Viaggio;

  constructor(
      private route: ActivatedRoute,
      private viaggiService: ViaggiService,
      private prentazioniService: PrenotazioniService,
      private mezziService: MezziService,
      private soggiorniService: SoggiorniService
  ) { }

  async ngOnInit(): Promise<void> {
    await this.getViaggio();
  }

  async getViaggio(): Promise<void> {
    const codViaggio = +this.route.snapshot.paramMap.get('codViaggio');
    this.viaggio = await this.viaggiService.getViaggio(codViaggio);
    // prenotazioni filer
    const prenotazioni = await this.prentazioniService.getPrenotazioni();
    this.viaggio.prenotazioni = await prenotazioni.filter(value => value.viaggio.toString() === codViaggio.toString());
    // mezzi filer
    const mezzi = await this.mezziService.getMezzi();
    const mezziAffittati = mezzi.filter(value => value.viaggio != null);
    this.viaggio.mezzi = await mezziAffittati.filter(value => value.viaggio.toString() === codViaggio.toString());
    // soggiorni filter
    const soggiorni = await this.soggiorniService.getSoggiorni();
    this.viaggio.soggiorni = await soggiorni.filter(value => value.viaggio.toString() === codViaggio.toString());
  }
}
