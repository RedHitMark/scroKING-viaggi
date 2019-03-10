import { Component, OnInit } from '@angular/core';
import {Hotel} from '../Hotel';
import {ActivatedRoute} from '@angular/router';
import {HotelService} from '../services/hotel.service';
import {DipendentiService} from '../services/dipendenti.service';
import {TelefoniAlberghiService} from '../services/telefoni-alberghi.service';

@Component({
  selector: 'app-hotel-detail',
  templateUrl: './hotel-detail.component.html',
  styleUrls: ['./hotel-detail.component.css']
})
export class HotelDetailComponent implements OnInit {
  hotel: Hotel;
  constructor(
      private route: ActivatedRoute,
      private hotelService: HotelService,
      private telefoniAlberghiService: TelefoniAlberghiService,
      private dipendentiService: DipendentiService
  ) { }

  async ngOnInit(): Promise<void> {
    await this.getHotel();
  }

  async getHotel(): Promise<void> {
    const codAlbergo = +this.route.snapshot.paramMap.get('codAlbergo');
    this.hotel = await this.hotelService.getHotel(codAlbergo);
    // telefoni filter
    const telefoni = await this.telefoniAlberghiService.getTelefoniAlberghi();
    this.hotel.telefoni = await telefoni.filter(value => value.albergo.toString() === codAlbergo.toString());
    // dipendenti filer
    const dipendenti = await this.dipendentiService.getDipendenti();
    const dipendentiAlbergo = await dipendenti.filter(value => value.albergo.toString() === codAlbergo.toString());
    this.hotel.dipendentiFissiDirigenti = await dipendentiAlbergo.filter(d => d.tipoDipendente.toString() === 'fisso dirigente');
    this.hotel.dipendentiFissi = await dipendentiAlbergo.filter(d => d.tipoDipendente.toString() === 'fisso');
    this.hotel.dipendentiStagionali = await dipendentiAlbergo.filter(d => d.tipoDipendente.toString() === 'stagionale');
  }

}
