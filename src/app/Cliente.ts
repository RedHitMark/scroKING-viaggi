import {Prenotazione} from './Prenotazione';

export class Cliente {
    codFiscale: string;
    nomeCliente: string;
    cognomeCliente: string;
    sesso: string;
    telefono: string;
    indirizzo: string;
    prenotazioni: Prenotazione[];
}
