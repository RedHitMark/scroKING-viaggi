import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable, of} from 'rxjs';

import {Hotel} from '../Hotel';


@Injectable({
  providedIn: 'root'
})
export class HotelService {
  private url = 'http://scroking.ddns.net/SCROKING/api/Alberghi/';
  private hotel: Hotel;
  private hotels: Hotel[];

  /**
   * HotelService's constructor
   * @param http: the HTTP Client to process requests
   */
  constructor(private http: HttpClient) { }

  /**
   * @return : an array of viaggi
   */
  async getHotels(): Promise<Hotel[]> {
    try {
      const response = await this.http
          .get(this.url + 'read.php')
          .toPromise();
      this.hotels = response as Hotel[];
      console.log(this.hotels);
      return this.hotels;
    } catch (error) {
      await this.handleError(error);
    }
  }

  /**
   * Return the hotel
   * @param codAlbergo: cod Albergo
   */
  async getHotel(codAlbergo: number): Promise<Hotel> {
    const hotels = await this.getHotels();
    this.hotel = await hotels.find(value => value.codAlbergo.toString() === codAlbergo.toString()) ;
    console.log(this.hotel);
    return await this.hotel;
  }
  /**
   * Handle Http operation that failed.
   * Let the app continue.
   * @param operation - name of the operation that failed
   * @param result - optional value to return as the observable result
   */
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error); // log to console instead
      console.log(`${operation} failed: ${error.message}`);

      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
  }
}
