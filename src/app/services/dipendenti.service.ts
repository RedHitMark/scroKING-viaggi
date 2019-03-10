import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable, of} from 'rxjs';
import {Dipendente} from '../Dipendente';

@Injectable({
  providedIn: 'root'
})
export class DipendentiService {
  // private parameters
  private url = 'http://scroking.ddns.net/SCROKING/api/Dipendenti/';
  private dipendenti: Dipendente[];

  /**
   * DipendentiService's constructor
   * @param http: the HTTP Client to process requests
   */
  constructor(private http: HttpClient) {
  }

  /**
   * @return : an array of dipendenti
   */
  async getDipendenti(): Promise<Dipendente[]> {
    try {
      const dipendenti = await this.http
          .get(this.url + 'read.php')
          .toPromise();
      this.dipendenti = dipendenti as Dipendente[];
      console.log(this.dipendenti);
      return this.dipendenti;
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
      console.error(error); // log to console instead
      console.log(`${operation} failed: ${error.message}`);
      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
  }
}
