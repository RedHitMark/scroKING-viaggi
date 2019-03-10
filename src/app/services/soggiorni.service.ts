import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable, of} from 'rxjs';
import {Soggiorno} from '../Soggiorno';

@Injectable({
  providedIn: 'root'
})
export class SoggiorniService {
  private url = 'http://scroking.ddns.net/SCROKING/api/Soggiorni/';

  private soggiorni: Soggiorno[];
  /**
   * SoggiorniService's constructor
   * @param http: the HTTP Client to process requests
   */
  constructor( private http: HttpClient ) { }

  /**
   * @return : an array of viaggi
   */
  async getSoggiorni(): Promise<Soggiorno[]> {
    try {
      const soggiorni = await this.http
          .get(this.url + 'read.php')
          .toPromise();
      this.soggiorni = soggiorni as Soggiorno[];
      console.log(this.soggiorni);
      return this.soggiorni;
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
