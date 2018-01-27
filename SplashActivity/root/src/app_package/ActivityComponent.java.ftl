package  ${packageName}.Utils.Dagger.Component;

import ${packageName}.Utils.Dagger.Module.ActivityModule;
import ${packageName}.Activity.SplashActivity;

import dagger.Subcomponent;

@Subcomponent(modules = {ActivityModule.class})
@ActivityScope
public interface ActivityComponent {
    void inject(SplashActivity activity);
}