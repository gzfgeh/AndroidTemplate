package  ${packageName}.Component;

import android.app.Activity;

import ${packageName}.APP;
import ${packageName}.Module.ActivityModule;

public final class ActivityComponentFactory {
    private ActivityComponentFactory() {
        //no op
    }

    public static ActivityComponent create(Activity activity) {
        return APP.get(activity).getComponent()
                .plus(new ActivityModule(activity));
    }
}