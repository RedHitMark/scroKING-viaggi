import { Component, OnInit } from '@angular/core';
import {Viaggio} from '../Viaggio';
import {Mezzo} from '../Mezzo';

@Component({
  selector: 'app-mezzo-form',
  templateUrl: './mezzo-form.component.html',
  styleUrls: ['./mezzo-form.component.css']
})
export class MezzoFormComponent implements OnInit {
  mezzo: Mezzo;
  constructor() { }

  ngOnInit() {
    this.mezzo = new Mezzo();
  }

  newMezzo() {
    // @todo
  }

}
