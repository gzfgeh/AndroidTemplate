package  ${packageName}.Model;

import ${packageName}.Utils.RxUtils;

import rx.Observable;
import rx.Subscriber;

public class SplashModel extends BaseModel {

    public Observable<String> getUrl(){
        return Observable.create(new Observable.OnSubscribe<String>() {
            @Override
            public void call(Subscriber<? super String> subscriber) {
                subscriber.onNext("http://img.my.csdn.net/uploads/201309/01/1378037235_7476.jpg");
                subscriber.onCompleted();
            }
        }).compose(RxUtils.applyIOToMainThreadSchedulers());
    }
}