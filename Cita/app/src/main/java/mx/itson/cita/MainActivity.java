package mx.itson.cita;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import mx.itson.cita.entidades.Cita;

public class MainActivity extends AppCompatActivity implements View.OnClickListener{

    Button btn_agregar;
    Button btn_consultar;
    Button btn_ciudadano;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btn_agregar = findViewById(R.id.btn_agregar);
        btn_agregar.setOnClickListener(this);

        btn_consultar = findViewById(R.id.btn_consultar);
        btn_consultar.setOnClickListener(this);

        btn_ciudadano = findViewById(R.id.btn_agregarCiudadano);
        btn_ciudadano.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {

        Cita cita = new Cita();

        switch (view.getId()){
            case R.id.btn_agregar:
                Intent intentGuardar = new Intent(this, CitaFormActivity.class);
                startActivity(intentGuardar);
                break;

            case R.id.btn_consultar:
                Intent intentConsultar = new Intent(MainActivity.this, CitaListActivity.class);
                startActivity(intentConsultar);
                break;

            case R.id.btn_agregarCiudadano:
                Intent intentCiudadano = new Intent(this, CiudadanoForm.class);
                startActivity(intentCiudadano);
                break;
        }

    }
}