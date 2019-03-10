import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// import all component used for routing
import { HomeComponent } from './home/home.component';
import { ViaggiComponent } from './viaggi/viaggi.component';
import { ViaggiDetailComponent } from './viaggi-detail/viaggi-detail.component';
import { ViaggioFormComponent } from './viaggio-form/viaggio-form.component';
import { ClientiComponent } from './clienti/clienti.component';
import { MezziComponent } from './mezzi/mezzi.component';
import { HotelComponent } from './hotel/hotel.component';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';
import { HotelDetailComponent} from './hotel-detail/hotel-detail.component';
import {ClienteFormComponent} from './cliente-form/cliente-form.component';
import {MezzoFormComponent} from './mezzo-form/mezzo-form.component';
import {HotelFormComponent} from './hotel-form/hotel-form.component';
import {ClientiDetailComponent} from './clienti-detail/clienti-detail.component';
import {MezzoDetailComponent} from './mezzo-detail/mezzo-detail.component';



const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'viaggi', component: ViaggiComponent },
  { path: 'viaggi/viaggio-detail/:codViaggio', component: ViaggiDetailComponent},
  { path: 'viaggi/viaggio-form', component: ViaggioFormComponent},
  { path: 'clienti', component: ClientiComponent },
  { path: 'clienti/cliente-detail/:codFiscale', component: ClientiDetailComponent},
  { path: 'clienti/cliente-form', component: ClienteFormComponent},
  { path: 'mezzi', component: MezziComponent },
  { path: 'mezzi/mezzo-form', component: MezzoFormComponent},
  { path: 'mezzi/mezzo-detail/:codMezzo', component: MezzoDetailComponent},
  { path: 'hotel', component: HotelComponent },
  { path: 'hotel/hotel-detail/:codAlbergo', component: HotelDetailComponent},
  { path: 'hotel/hotel-form', component: HotelFormComponent},
  { path: 'about', component: AboutComponent },
  { path: 'contact', component: ContactComponent },
  { path: '', redirectTo: '/home', pathMatch: 'full' }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ],
})
export class AppRoutingModule { }
