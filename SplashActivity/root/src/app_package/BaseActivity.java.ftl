package ${packageName}.Activity;

import ${packageName}.Component.ActivityComponent;
import ${packageName}.Component.ActivityComponentFactory;
import com.zhy.autolayout.AutoLayoutActivity;

public class BaseActivity extends AutoLayoutActivity {
    protected ActivityComponent activityComponent;

    public ActivityComponent getActivityComponent() {
        if (activityComponent == null) {
            activityComponent = ActivityComponentFactory.create(this);
        }
        return activityComponent;
    }
}
