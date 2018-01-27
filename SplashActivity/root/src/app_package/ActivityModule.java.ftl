package  ${packageName}.Utils.Dagger.Module;

import android.app.Activity;
import android.content.Context;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;

import ${packageName}.Utils.Dagger.Component.ActivityScope;

import dagger.Module;
import dagger.Provides;

@Module
public class ActivityModule {
    private Activity activity;

    public ActivityModule(Activity activity) {
        this.activity = activity;
    }

    @Provides
    Activity provideActivity(){
        return activity;
    }

    @Provides
    @ActivityScope
    Context provideContext(){
        return activity;
    }

    @Provides
    @ActivityScope
    FragmentManager provideFragmentManager(){
        return ((FragmentActivity)activity).getSupportFragmentManager();
    }
}