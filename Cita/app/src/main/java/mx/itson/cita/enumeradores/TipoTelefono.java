package mx.itson.cita.enumeradores;

public enum TipoTelefono {

    MOVIL(1), FIJO(2);

    private int valor;

    TipoTelefono(int valor) {
        this.valor = valor;
    }

}
