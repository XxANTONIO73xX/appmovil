package mx.itson.cita.interfaces;

import java.util.List;

import mx.itson.cita.entidades.Cita;
import mx.itson.cita.entidades.Ciudad;
import mx.itson.cita.entidades.Ciudadano;
import mx.itson.cita.entidades.ComprobanteDomicilio;
import mx.itson.cita.entidades.DocumentoNacionalidad;
import mx.itson.cita.entidades.Estado;
import mx.itson.cita.entidades.Modulo;
import mx.itson.cita.entidades.Tramite;
import mx.itson.cita.transporte.RespuestaDTO;
import retrofit2.Call;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.Headers;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface ApiService {

    @GET("estados")
    Call<List<Estado>> getEstados();

    @GET("ciudades/{id}")
    Call<List<Ciudad>> getCiudades(@Path("id") int id);

    @GET("modulos/{id}")
    Call<List<Modulo>> getModulos(@Path("id") int id);

    @GET("tramites")
    Call<List<Tramite>> getTramites();

    @GET("documentos")
    Call<List<DocumentoNacionalidad>> getDocumentos();

    @GET("comprobantes")
    Call<List<ComprobanteDomicilio>> getComprobantes();

    @GET("citas")
    Call<List<Cita>> getCitas();

    @GET("ciudadanos")
    Call<List<Ciudadano>> getCiudadanos();

    @Headers("Content-Type: application/x-www-form-urlencoded")
    @FormUrlEncoded
    @POST("cita/guardar")
    Call<RespuestaDTO> guardar(
            @Field("idCiudadano") int idCiudadano,
            @Field("idModulo") int idModulo,
            @Field("fecha") String fecha,
            @Field("idDocumento") int idDocumento,
            @Field("idComprobante") int idComprobante,
            @Field("idTramite") int idTramite
    );

}
