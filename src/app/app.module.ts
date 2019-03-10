import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { NavbarComponent } from './navbar/navbar.component';
import { FooterComponent } from './footer/footer.component';

import { AppRoutingModule } from './app-routing.module';
import { MezziComponent } from './mezzi/mezzi.component';
import { HotelComponent } from './hotel/hotel.component';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';
import { ViaggiComponent } from './viaggi/viaggi.component';
import { ClientiComponent } from './clienti/clienti.component';
import { ViaggiDetailComponent } from './viaggi-detail/viaggi-detail.component';
import { ClientiDetailComponent } from './clienti-detail/clienti-detail.component';
import { HotelDetailComponent } from './hotel-detail/hotel-detail.component';
import { ViaggioFormComponent } from './viaggio-form/viaggio-form.component';
import { HotelFormComponent } from './hotel-form/hotel-form.component';
import { MezzoFormComponent } from './mezzo-form/mezzo-form.component';
import { ClienteFormComponent } from './cliente-form/cliente-form.component';
import { MezzoDetailComponent } from './mezzo-detail/mezzo-detail.component';

@NgModule({
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  declarations: [
    AppComponent,
    HomeComponent,
    NavbarComponent,
    FooterComponent,
    MezziComponent,
    HotelComponent,
    AboutComponent,
    ContactComponent,
    ViaggiComponent,
    ClientiComponent,
    ViaggiDetailComponent,
    ClientiDetailComponent,
    HotelDetailComponent,
    ViaggioFormComponent,
    HotelFormComponent,
    MezzoFormComponent,
    ClienteFormComponent,
    MezzoDetailComponent
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
