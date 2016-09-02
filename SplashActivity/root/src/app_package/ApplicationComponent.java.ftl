package  ${packageName}.Component;

import android.support.annotation.NonNull;

import ${packageName}.APP;
import ${packageName}.Module.ActivityModule;
import ${packageName}.Module.ApplicationModule;

import javax.inject.Singleton;

import dagger.Component;

@Singleton
@Component(modules = {ApplicationModule.class})
public interface ApplicationComponent {
    @NonNull
    ActivityComponent plus(@NonNull ActivityModule activityModule);
    @NonNull

    void inject(@NonNull APP app);

}