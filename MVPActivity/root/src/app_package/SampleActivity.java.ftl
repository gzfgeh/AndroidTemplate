package ${packageName}.Activity;

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
public class ${pageName}Activity extends BaseActivity implements ${pageName}View{

	@Inject
    ${pageName}Presenter presenter;
	
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
		getActivityComponent().inject(this);
		presenter.attachView(this);
    }
	
	
	@Override
    public void onFailure() {

    }
	
	@Override
    public void onDestroy() {
        super.onDestroy();
        presenter.detachView();
    }

}
