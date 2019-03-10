import {Injectable} from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable, of} from 'rxjs';
import {Viaggio} from '../Viaggio';

const httpOptions = {
    headers: new HttpHeaders({'Content-Type': 'application/json'})
};

@Injectable({
    providedIn: 'root'
})

export class ViaggiService {
    // private parameters
    private url = 'http://scroking.ddns.net/SCROKING/api/Viaggi/';
    private viaggi: Viaggio[];
    private viaggio: Viaggio;

    /**
     * ViaggiService's constructor
     * @param http: the HTTP Client to process requests
     */
    constructor(private http: HttpClient) {
    }

    /**
     * @return : an array of viaggi
     */
    async getViaggi(): Promise<Viaggio[]> {
        try {
            const viaggi = await this.http
                .get(this.url + 'read.php')
                .toPromise();
            this.viaggi = viaggi as Viaggio[];
            console.log(this.viaggi);
            return this.viaggi;
        } catch (error) {
            await this.handleError(error);
        }
    }

    async getViaggio(codViaggio: number): Promise<Viaggio> {
        const viaggi = await this.getViaggi();
        this.viaggio = await viaggi.find(value => value.codViaggio.toString() === codViaggio.toString()) ;
        console.log(this.viaggio);
        return await this.viaggio;
    }

    async deleteViaggio(codViaggio: number): Promise<boolean>  {
        try {
            const response = await this.http
                .delete( this.url + 'delete.php?codViaggio=' + codViaggio)
                .toPromise();
            console.log(response);
            return await true;
        } catch (error) {
            await this.handleError(error);
            return await false;
        }
    }

    async createViaggio(viaggio: Viaggio): Promise<boolean> {
        try {
            const response = await this.http
                .post(this.url + 'create.php', viaggio, httpOptions)
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
            console.error(error); // log to console instead
            console.log(`${operation} failed: ${error.message}`);
            // Let the app keep running by returning an empty result.
            return of(result as T);
        };
    }


}
