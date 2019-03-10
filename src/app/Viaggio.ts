import {Prenotazione} from './Prenotazione';
import {Soggiorno} from './Soggiorno';
import {Mezzo} from './Mezzo';

export class Viaggio {
    codViaggio: number;
    tipoViaggio: string;
    luogoPartenza: string;
    luogoDestinazione: string;
    costoViaggio: number;
    dataInizioViaggio: Date;
    dataFineViaggio: Date;
    prenotazioni: Prenotazione[];
    soggiorni: Soggiorno[];
    mezzi: Mezzo[];
}
