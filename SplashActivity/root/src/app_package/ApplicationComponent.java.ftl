package  ${packageName}.Utils.Dagger.Component;

import android.support.annotation.NonNull;

import ${packageName}.APP;
import ${packageName}.Utils.Dagger.Module.ActivityModule;
import ${packageName}.Utils.Dagger.Module.ApplicationModule;

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