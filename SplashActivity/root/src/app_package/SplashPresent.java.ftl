package  ${packageName}.Present;

import ${packageName}.Model.SplashModel;
import ${packageName}.View.SplashView;

import rx.Subscriber;

public class SplashPresent extends BasePresenter<SplashView>{
    private SplashModel splashModel = new SplashModel();

    public void getUrl(){
        mCompositeSubscription.add(splashModel.getUrl()
                .subscribe(new Subscriber<String>() {
                    @Override
                    public void onCompleted() {
                        if (mCompositeSubscription != null)
                            mCompositeSubscription.remove(this);
                    }

                    @Override
                    public void onError(Throwable e) {
                        if (getView() != null)
                            getView().onFailure(e.getMessage());
                    }

                    @Override
                    public void onNext(String data) {
                        if (getView() != null)
                            getView().getUrlData(data);
                    }
                }));
    }
}