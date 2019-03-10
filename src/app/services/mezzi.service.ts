import {Injectable} from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable, of} from 'rxjs';
import {catchError, map, tap} from 'rxjs/operators';

import {Mezzo} from '../Mezzo';


const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root'
})
export class MezziService {
  private url = 'http://scroking.ddns.net/SCROKING/api/Mezzi/';
  private mezzo: Mezzo;
  private mezzi: Mezzo[];

  /**
   * MezziService's constructor
   * @param http: the HTTP Client to process requests
   */
  constructor(private http: HttpClient) { }

  /**
   * @return : an array of mezzi
   */
  async getMezzi(): Promise<Mezzo[]> {
    try {
      const mezzi = await this.http
          .get(this.url + 'read.php')
          .toPromise();
      this.mezzi = mezzi as Mezzo[];
      console.log(this.mezzi);
      return this.mezzi;
    } catch (error) {
      await this.handleError(error);
    }
  }

  /**
   * @return : mezzo
   */
  async getMezzo(codMezzo: string): Promise<Mezzo> {
    const mezzi = await this.getMezzi();
    this.mezzo = await mezzi.find(value => value.codMezzo.toString() === codMezzo.toString());
    console.log(this.mezzo);
    return this.mezzo;
  }

  /**
   * Handle Http operation that failed.
   * Let the app continue.
   * @param operation - name of the operation that failed
   * @param result - optional value to return as the observable result
   */
  private handleError<T> (operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error); // log to console instead
      console.log(`${operation} failed: ${error.message}`);

      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
  }
}
