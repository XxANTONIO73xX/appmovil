package mx.itson.cita.entidades;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import java.util.HashMap;
import java.util.Map;

import mx.itson.cita.CitaFormActivity;
import mx.itson.cita.transporte.RespuestaDTO;
import mx.itson.cita.utilerias.Utils;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class Cita {
    private int id;
    private String folio;
    private Ciudadano ciudadano;
    private Modulo modulo;
    private String fecha;
    private DocumentoNacionalidad documentoNacionalidad;
    private ComprobanteDomicilio comprobanteDomicilio;
    private Tramite tramite;

    public Cita() {
    }

    public Cita(int id, Ciudadano ciudadano, Modulo modulo, String fecha, DocumentoNacionalidad documentoNacionalidad, ComprobanteDomicilio comprobanteDomicilio, Tramite tramite) {
        this.id = id;
        this.ciudadano = ciudadano;
        this.modulo = modulo;
        this.fecha = fecha;
        this.documentoNacionalidad = documentoNacionalidad;
        this.comprobanteDomicilio = comprobanteDomicilio;
        this.tramite = tramite;
    }

    public Cita(CitaFormActivity citaFormActivity) {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Ciudadano getCiudadano() {
        return ciudadano;
    }

    public void setCiudadano(Ciudadano ciudadano) {
        this.ciudadano = ciudadano;
    }

    public Modulo getModulo() {
        return modulo;
    }

    public void setModulo(Modulo modulo) {
        this.modulo = modulo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public DocumentoNacionalidad getDocumentoNacionalidad() {
        return documentoNacionalidad;
    }

    public void setDocumentoNacionalidad(DocumentoNacionalidad documentoNacionalidad) {
        this.documentoNacionalidad = documentoNacionalidad;
    }

    public ComprobanteDomicilio getComprobanteDomicilio() {
        return comprobanteDomicilio;
    }

    public void setComprobanteDomicilio(ComprobanteDomicilio comprobanteDomicilio) {
        this.comprobanteDomicilio = comprobanteDomicilio;
    }

    public Tramite getTramite() {
        return tramite;
    }

    public void setTramite(Tramite tramite) {
        this.tramite = tramite;
    }
}
