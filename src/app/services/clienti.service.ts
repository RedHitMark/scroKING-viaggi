import {Injectable} from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable, of} from 'rxjs';
import {catchError, map, tap} from 'rxjs/operators';

import {Cliente} from '../Cliente';
import {Viaggio} from '../Viaggio';
const httpOptions = {
  headers: new HttpHeaders({'Content-Type': 'application/json'})
};

@Injectable({
  providedIn: 'root'
})

export class ClientiService {
  // private parameters
  private url = 'http://scroking.ddns.net/SCROKING/api/Clienti/';
  private cliente: Cliente;
  private clienti: Cliente[];

  /**
   * ViaggiService's constructor
   * @param http: the HTTP Client to process requests
   */
  constructor(private http: HttpClient) {
  }

  /**
   * @return : an array of clienti
   */
  async getClienti(): Promise<Cliente[]> {
    try {
      const response = await this.http
          .get(this.url + 'read.php')
          .toPromise();
      this.clienti = response as Cliente[];
      console.log(this.clienti);
      return this.clienti;
    } catch (error) {
      await this.handleError(error);
    }
  }

  async getCliente(codFiscale: string): Promise<Cliente> {
    const clienti = await this.getClienti();
    this.cliente = await clienti.find(value => value.codFiscale.toString() === codFiscale.toString()) ;
    console.log(this.cliente);
    return await this.cliente;
  }

  async createCliente(cliente: Cliente): Promise<boolean> {
    try {
      const response = await this.http
          .post(this.url + 'create.php', cliente, httpOptions)
          .toPromise();
      console.log(response);
      return await true;
    } catch (error) {
      await this.handleError(error);
      return await false;
    }
  }

  async deleteCliente(codFiscale: string): Promise<boolean>  {
    try {
      const response = await this.http
          .delete( this.url + 'delete.php?codFiscale=' + codFiscale)
          .toPromise();
      console.log(response);
      return await true;
    } catch (error) {
      await this.handleError(error);
      return await false;
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
