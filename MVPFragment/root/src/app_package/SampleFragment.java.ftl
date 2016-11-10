package ${packageName}.Fragment;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import ${packageName}.R;
import ${packageName}.View.${pageName}View;
import ${packageName}.Present.${pageName}Presenter;

import javax.inject.Inject;

/**
 * create by 
 */
public class ${pageName}Fragment extends BaseFragment implements ${pageName}View{
	private static final String ARG_PARAM1 = "param1";
    private String mParam1;

	@Inject
    ${pageName}Presenter presenter;
	
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            mParam1 = getArguments().getString(ARG_PARAM1);
        }
    }
	
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.${layoutName}, container, false);//注意不要指定父视图
		getActivityComponent().inject(this);
		presenter.attachView(this);
        return view;
    }
	
	@Override
    public void onFail() {

    }
	
	@Override
    public void onDestroy() {
        super.onDestroy();
        presenter.detachView();
    }

}
