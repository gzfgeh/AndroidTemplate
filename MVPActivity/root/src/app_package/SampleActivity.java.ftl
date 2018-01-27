package ${packageName}.Activity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;

import ${packageName}.R;
import ${packageName}.View.${pageName}View;
import ${packageName}.Present.${pageName}Presenter;

import javax.inject.Inject;

/**
 * create by 
 */
public class ${pageName}Activity extends BaseActivity<${pageName}Presenter> implements ${pageName}View{


    public static void startActivity(Context context) {
        Intent intent = new Intent(context, ${pageName}Activity.class);
        context.startActivity(intent);
    }
	
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
    }

    @Override
    protected void inject() {
        getActivityComponent().inject(this);
    }
	
	
	@Override
    public void onFail(String msg) {

    }
	

}
