package ${packageName}.Activity;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import ${packageName}.R;

public class MainActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${mainActivityLayoutName});
		getActivityComponent().inject(this);
    }
}
