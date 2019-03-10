import { Component, OnInit } from '@angular/core';
import { Hotel } from '../Hotel';
import { HotelService } from '../services/hotel.service';


@Component({
  selector: 'app-hotel',
  templateUrl: './hotel.component.html',
  styleUrls: ['./hotel.component.css']
})
export class HotelComponent implements OnInit {
  hotels: Hotel[];
  hotelsFiltrati: Hotel[];
  constructor(private hotelService: HotelService) { }

  async ngOnInit(): Promise<void> {
    await this.getHotels();
  }

  async getHotels(): Promise<void> {
    this.hotels = await this.hotelService.getHotels();
    this.hotelsFiltrati = this.hotels;
  }

  filtraHotels(key: string) {
    key = key.toLowerCase();
    this.hotelsFiltrati = this.hotels;
    this.hotelsFiltrati = this.hotels.filter(value =>
        value.codAlbergo.toString().toLowerCase().indexOf(key) > -1 ||
        value.denominazione.toString().toLowerCase().indexOf(key) > -1 ||
        value.stanzeDisponibili.toString().toLowerCase().indexOf(key) > -1
    );
  }

}
