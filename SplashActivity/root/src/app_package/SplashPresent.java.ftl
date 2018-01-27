package  ${packageName}.Present;

import ${packageName}.Model.SplashModel;
import ${packageName}.View.SplashView;
import ${packageName}.Utils.RxSubUtils;

import javax.inject.Inject;

public class SplashPresent extends BasePresenter<SplashView>{
    @Inject
    SplashModel splashModel;

    @Inject
    public SplashPresent(){}

    public void getUrl() {
        compositeDisposable.add(splashModel.getUrl()
                .subscribeWith(new RxSubUtils<String>(compositeDisposable) {
                    @Override
                    protected void _onNext(String s) {
                        getView().getUrlData(s);
                    }
                }));
    }
}