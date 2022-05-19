package mx.itson.cita;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.os.ConditionVariable;
import android.util.Log;
import android.widget.ListView;

import java.util.List;

import mx.itson.cita.entidades.Cita;
import mx.itson.cita.utilerias.Utils;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CitaListActivity extends AppCompatActivity {

    ListView listaCitas;
    Context context;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cita_list);

        listaCitas = findViewById(R.id.listaCitas);
        context = this;
        obtenerCitas();
    }

    public void obtenerCitas(){
        try {

            Call<List<Cita>> call = Utils.getApi().getCitas();

            call.enqueue(new Callback<List<Cita>>() {
                @Override
                public void onResponse(Call<List<Cita>> call, Response<List<Cita>> response) {
                    List<Cita> citas = response.body();
                    int a = 2;
                }

                @Override
                public void onFailure(Call<List<Cita>> call, Throwable t) {
                    Log.e("Error en la API", "Error :" );

                }
            });

        }catch (Exception ex){
            Log.e("Error en la API", "Error" + ex.getMessage());
        }
    }
}