import {Dipendente} from './Dipendente';
import {TelefonoAlbergo} from './TelefonoAlbergo';
import {Soggiorno} from './Soggiorno';

export class Hotel {
    codAlbergo: number;
    denominazione: string;
    stanzeDisponibili: number;
    telefoni: TelefonoAlbergo[];
    soggiorni: Soggiorno[];
    dipendentiFissiDirigenti: Dipendente[];
    dipendentiFissi: Dipendente[];
    dipendentiStagionali: Dipendente[];
}
