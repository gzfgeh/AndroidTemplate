package  ${packageName}.Component;

import ${packageName}.Module.ActivityModule;
import ${packageName}.Activity.SplashActivity;

import dagger.Subcomponent;

@Subcomponent(modules = {ActivityModule.class})
@ActivityScope
public interface ActivityComponent {
    void inject(SplashActivity activity);
}