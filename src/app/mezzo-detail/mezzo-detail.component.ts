import { Component, OnInit } from '@angular/core';
import {Mezzo} from '../Mezzo';
import {ActivatedRoute} from '@angular/router';
import {MezziService} from '../services/mezzi.service';

@Component({
  selector: 'app-mezzo-detail',
  templateUrl: './mezzo-detail.component.html',
  styleUrls: ['./mezzo-detail.component.css']
})
export class MezzoDetailComponent implements OnInit {
  mezzo: Mezzo;
  constructor(
      private route: ActivatedRoute,
      private mezziService: MezziService
  ) { }

  async ngOnInit(): Promise<void> {
    await this.getMezzo();
  }

  async getMezzo(): Promise<void> {
    const codMezzo = this.route.snapshot.paramMap.get('codMezzo');
    this.mezzo = await this.mezziService.getMezzo(codMezzo);
  }
}
