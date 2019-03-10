import { Component, OnInit } from '@angular/core';
import {Hotel} from '../Hotel';

@Component({
  selector: 'app-hotel-form',
  templateUrl: './hotel-form.component.html',
  styleUrls: ['./hotel-form.component.css']
})
export class HotelFormComponent implements OnInit {
  hotel: Hotel;
  constructor() { }

  ngOnInit() {
    this.hotel = new Hotel();
  }

  newHotel() {
      //
  }
}
