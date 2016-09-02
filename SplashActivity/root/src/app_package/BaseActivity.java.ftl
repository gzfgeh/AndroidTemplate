package ${packageName}.Activity;

import android.support.v7.app.AppCompatActivity;

import ${packageName}.Component.ActivityComponent;
import ${packageName}.Component.ActivityComponentFactory;

public class BaseActivity extends AppCompatActivity {
    protected ActivityComponent activityComponent;

    public ActivityComponent getActivityComponent() {
        if (activityComponent == null) {
            activityComponent = ActivityComponentFactory.create(this);
        }
        return activityComponent;
    }
}
