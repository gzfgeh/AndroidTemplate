package ${packageName}.Activity;

import android.os.Bundle;

import ${packageName}.Present.BasePresenter;
import ${packageName}.Utils.Dagger.Component.ActivityComponent;
import ${packageName}.Utils.Dagger.Component.ActivityComponentFactory;
import ${packageName}.View.BaseView;
import com.gzfgeh.swipeback.SwipeBackActivity;

import javax.inject.Inject;

public class BaseActivity<P extends BasePresenter> extends SwipeBackActivity
		implements BaseView {
    protected ActivityComponent activityComponent;
    @Inject
    P presenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        inject();
        if(presenter != null)
            presenter.attachView(this);

    }

    /**
     * 如果有 依赖注入，这个必须要加
     */
    protected void inject(){

    }


    public ActivityComponent getActivityComponent() {
        if (activityComponent == null) {
            activityComponent = ActivityComponentFactory.create(this);
        }
        return activityComponent;
    }

    @Override
    public void onFail(String msg) {

    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if(presenter != null)
            presenter.detachView();
    }
}
