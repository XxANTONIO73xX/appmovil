package mx.itson.cita.entidades;

public class Modulo {

    private int id;
    private String nombre;
    private Estado estado;
    private Ciudad ciudad;
    private String direccion;
    private String referencia;
    private String horario;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String toString(){
        return nombre;
    }

}

