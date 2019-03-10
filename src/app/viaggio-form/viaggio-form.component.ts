import { Component, OnInit } from '@angular/core';
import {Viaggio} from '../Viaggio';
import {ViaggiService} from '../services/viaggi.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-viaggio-form',
  templateUrl: './viaggio-form.component.html',
  styleUrls: ['./viaggio-form.component.css']
})
export class ViaggioFormComponent implements OnInit {
  viaggio: Viaggio;
  constructor(
      private viaggiService: ViaggiService,
      private router: Router
  ) { }

  ngOnInit() {
    this.viaggio = new Viaggio();
  }
  async newViaggio() {
    if (await confirm('Inserire il viaggio?')) {
      await this.viaggiService.createViaggio(this.viaggio);
      this.router.navigate(['/', 'viaggi']);
    }
  }

}
