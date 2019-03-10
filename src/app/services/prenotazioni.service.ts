import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable, of} from 'rxjs';
import {Prenotazione} from '../Prenotazione';

@Injectable({
  providedIn: 'root'
})

export class PrenotazioniService {
  // private parameters
  private url = 'http://scroking.ddns.net/SCROKING/api/Prenotazioni/';
  private prenotazioni: Prenotazione[];
  /**
   * PrenotazioniService's constructor
   * @param http: the HTTP Client to process requests
   */
  constructor( private http: HttpClient ) { }

  /**
   * @return : an array of viaggi
   */
  async getPrenotazioni(): Promise<Prenotazione[]> {
    try {
      const prenotazioni = await this.http
          .get(this.url + 'read.php')
          .toPromise();
      this.prenotazioni = prenotazioni as Prenotazione[];
      console.log(this.prenotazioni);
      return this.prenotazioni;
    } catch (error) {
      await this.handleError(error);
    }
  }

  /**
   * Handle Http operation that failed.
   * Let the app continue.
   * @param operation - name of the operation that failed
   * @param result - optional value to return as the observable result
   */
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {

      // TODO: send the error to remote logging infrastructure
      console.error(error); // log to console instead

      // TODO: better job of transforming error for user consumption
      console.log(`${operation} failed: ${error.message}`);

      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
  }
}
