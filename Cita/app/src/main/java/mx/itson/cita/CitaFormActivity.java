package mx.itson.cita;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import mx.itson.cita.R;
import mx.itson.cita.entidades.Cita;
import mx.itson.cita.entidades.Ciudad;
import mx.itson.cita.entidades.Ciudadano;
import mx.itson.cita.entidades.ComprobanteDomicilio;
import mx.itson.cita.entidades.DocumentoNacionalidad;
import mx.itson.cita.entidades.Estado;
import mx.itson.cita.entidades.Modulo;
import mx.itson.cita.entidades.Tramite;
import mx.itson.cita.transporte.RespuestaDTO;
import mx.itson.cita.utilerias.Utils;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CitaFormActivity extends AppCompatActivity implements View.OnClickListener {
    Spinner cbxEstados;
    Spinner cbxCiudades;
    Spinner cbxModulos;
    Spinner cbxCiudadanos;
    Spinner cbxTramite;
    Spinner cbxDocumentoNacionalidad;
    Spinner cbxComprobanteDomicilio;
    Button btnGuardar;
    EditText fecha;
    Context context;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cita_form);
        context = CitaFormActivity.this;
        cbxEstados = (Spinner) findViewById(R.id.cbxEntidad);
        cbxCiudades = (Spinner) findViewById(R.id.cbxMunicipio);
        cbxModulos = (Spinner) findViewById(R.id.cbxModulo);
        cbxCiudadanos = (Spinner) findViewById(R.id.cbxCiudadanos);
        cbxTramite = (Spinner) findViewById(R.id.cbxTramite);
        cbxDocumentoNacionalidad = (Spinner) findViewById(R.id.cbxDocumentoNacionalidad);
        cbxComprobanteDomicilio = (Spinner) findViewById(R.id.cbxComprobanteDomicilio);
        btnGuardar = findViewById(R.id.btn_guardar);
        btnGuardar.setOnClickListener(this);
        fecha = (EditText) findViewById(R.id.txtFechaHora);

        cargarCbxEstados();
        cargarCbxCiudadanos();
        cargarCbxTramites();
        cargarCbxDocumento();
        cargarCbxComprobantes();

        cbxEstados.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                Estado estado = (Estado) cbxEstados.getSelectedItem();
                cargarCbxCiudades(estado.getId());
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });
        cbxCiudades.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
                Ciudad ciudad = (Ciudad) cbxCiudades.getSelectedItem();
                cargarCbxModulos(ciudad.getId());
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {

            }
        });
    }
    public void cargarCbxEstados(){
        Call<List<Estado>> call = Utils.getApi().getEstados();
        call.enqueue(new Callback<List<Estado>>() {
            @Override
            public void onResponse(Call<List<Estado>> call, Response<List<Estado>> response) {
                List<Estado> estadosList = response.body();
                ArrayAdapter<Estado> adapter = new ArrayAdapter<Estado>(context, androidx.appcompat.R.layout.support_simple_spinner_dropdown_item, estadosList);
                cbxEstados.setAdapter(adapter);
            }

            @Override
            public void onFailure(Call<List<Estado>> call, Throwable t) {

            }
        });
    }

    public void cargarCbxCiudades(int id){
        Call<List<Ciudad>> call = Utils.getApi().getCiudades(id);
        call.enqueue(new Callback<List<Ciudad>>() {
            @Override
            public void onResponse(Call<List<Ciudad>> call, Response<List<Ciudad>> response) {
                List<Ciudad> ciudades = response.body();
                ArrayAdapter<Ciudad> adapter = new ArrayAdapter<Ciudad>(context, androidx.appcompat.R.layout.support_simple_spinner_dropdown_item, ciudades);
                cbxCiudades.setAdapter(adapter);
            }

            @Override
            public void onFailure(Call<List<Ciudad>> call, Throwable t) {

            }
        });
    }

    public void cargarCbxModulos(int id){
        Call<List<Modulo>> call = Utils.getApi().getModulos(id);
        call.enqueue(new Callback<List<Modulo>>() {
            @Override
            public void onResponse(Call<List<Modulo>> call, Response<List<Modulo>> response) {
                List<Modulo> modulos = response.body();
                ArrayAdapter<Modulo> adapter = new ArrayAdapter<Modulo>(context, androidx.appcompat.R.layout.support_simple_spinner_dropdown_item, modulos);
                cbxModulos.setAdapter(adapter);
            }

            @Override
            public void onFailure(Call<List<Modulo>> call, Throwable t) {

            }
        });
    }

    public void cargarCbxCiudadanos(){
    Call<List<Ciudadano>> call = Utils.getApi().getCiudadanos();
    call.enqueue(new Callback<List<Ciudadano>>() {
        @Override
        public void onResponse(Call<List<Ciudadano>> call, Response<List<Ciudadano>> response) {
            List<Ciudadano> ciudadanos = response.body();
            ArrayAdapter<Ciudadano> adapter = new ArrayAdapter<Ciudadano>(context, androidx.appcompat.R.layout.support_simple_spinner_dropdown_item, ciudadanos);
            cbxCiudadanos.setAdapter(adapter);
        }

        @Override
        public void onFailure(Call<List<Ciudadano>> call, Throwable t) {

        }
    });
    }

    public void cargarCbxTramites(){
        Call<List<Tramite>> call = Utils.getApi().getTramites();
        call.enqueue(new Callback<List<Tramite>>() {
            @Override
            public void onResponse(Call<List<Tramite>> call, Response<List<Tramite>> response) {
                List<Tramite> tramites = response.body();
                ArrayAdapter<Tramite> adapter = new ArrayAdapter<Tramite>(context, androidx.appcompat.R.layout.support_simple_spinner_dropdown_item, tramites);
                cbxTramite.setAdapter(adapter);
            }

            @Override
            public void onFailure(Call<List<Tramite>> call, Throwable t) {

            }
        });
    }

    public void cargarCbxDocumento(){
        Call<List<DocumentoNacionalidad>> call = Utils.getApi().getDocumentos();
        call.enqueue(new Callback<List<DocumentoNacionalidad>>() {
            @Override
            public void onResponse(Call<List<DocumentoNacionalidad>> call, Response<List<DocumentoNacionalidad>> response) {
                List<DocumentoNacionalidad> documentos = response.body();
                ArrayAdapter<DocumentoNacionalidad> adapter = new ArrayAdapter<DocumentoNacionalidad>(context, androidx.appcompat.R.layout.support_simple_spinner_dropdown_item, documentos);
                cbxDocumentoNacionalidad.setAdapter(adapter);
            }

            @Override
            public void onFailure(Call<List<DocumentoNacionalidad>> call, Throwable t) {

            }
        });
    }

    public void cargarCbxComprobantes(){
        Call<List<ComprobanteDomicilio>> call = Utils.getApi().getComprobantes();
        call.enqueue(new Callback<List<ComprobanteDomicilio>>() {
            @Override
            public void onResponse(Call<List<ComprobanteDomicilio>> call, Response<List<ComprobanteDomicilio>> response) {
                List<ComprobanteDomicilio> comprobantes = response.body();
                ArrayAdapter<ComprobanteDomicilio> adapter = new ArrayAdapter<ComprobanteDomicilio>(context, androidx.appcompat.R.layout.support_simple_spinner_dropdown_item, comprobantes);
                cbxComprobanteDomicilio.setAdapter(adapter);
            }

            @Override
            public void onFailure(Call<List<ComprobanteDomicilio>> call, Throwable t) {

            }
        });
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()){
            case R.id.btn_guardar:
                Ciudadano ciudadano = (Ciudadano) cbxCiudadanos.getSelectedItem();
                Modulo modulo = (Modulo) cbxModulos.getSelectedItem();
                DocumentoNacionalidad documento = (DocumentoNacionalidad) cbxDocumentoNacionalidad.getSelectedItem();
                ComprobanteDomicilio comprobante = (ComprobanteDomicilio) cbxComprobanteDomicilio.getSelectedItem();
                Tramite tramite = (Tramite) cbxTramite.getSelectedItem();
                Call<RespuestaDTO> call = Utils.getApi().guardar(
                        ciudadano.getId(),
                        modulo.getId(),
                        fecha.getText().toString(),
                        documento.getId(),
                        comprobante.getId(),
                        tramite.getId()
                );
                call.enqueue(new Callback<RespuestaDTO>() {
                    @Override
                    public void onResponse(Call<RespuestaDTO> call, Response<RespuestaDTO> response) {
                        RespuestaDTO respuestaDTO = response.body();
                        Toast.makeText(CitaFormActivity.this, respuestaDTO.getMensaje(), Toast.LENGTH_SHORT).show();
                    }

                    @Override
                    public void onFailure(Call<RespuestaDTO> call, Throwable t) {

                    }
                });
                break;
        }
    }
}