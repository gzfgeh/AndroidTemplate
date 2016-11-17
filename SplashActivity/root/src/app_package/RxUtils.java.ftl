package  ${packageName}.Utils;

import ${packageName}.Bean.BaseBean;
import rx.Observable;
import rx.Subscriber;
import rx.android.schedulers.AndroidSchedulers;
import rx.schedulers.Schedulers;
import rx.functions.Func1;

public class RxUtils {
    private static Observable.Transformer ioToMainThreadSchedulerTransformer;
    private static Observable.Transformer newThreadToMainThreadSchedulerTransformer;

    static {
        ioToMainThreadSchedulerTransformer = createIOToMainThreadScheduler();
        newThreadToMainThreadSchedulerTransformer = createNewThreadToMainThreadScheduler();
    }

    private static <T> Observable.Transformer<T, T> createIOToMainThreadScheduler() {
        return tObservable -> tObservable.subscribeOn(Schedulers.io())
                .unsubscribeOn(Schedulers.computation())
                .observeOn(AndroidSchedulers.mainThread());
    }

    public static <T> Observable.Transformer<T, T> applyIOToMainThreadSchedulers() {
        return ioToMainThreadSchedulerTransformer;
    }

    private static <T> Observable.Transformer<T, T> createNewThreadToMainThreadScheduler(){
        return tObservable -> tObservable.subscribeOn(Schedulers.newThread())
                .unsubscribeOn(Schedulers.computation())
                .unsubscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread());
    }

    public static <T> Observable.Transformer<T, T> applyNewThreadToMainThreadSchedulers(){
        return newThreadToMainThreadSchedulerTransformer;
    }
	
	/**
     * 处理服务器返回的数据，进一步处理错误信息
     * @param <T>
     * @return
     */
    public static <T> Observable.Transformer<BaseBean<T>, T> handleResult(){
        return new Observable.Transformer<BaseBean<T>, T>(){

            @Override
            public Observable<T> call(Observable<BaseBean<T>> tObservable) {
                return tObservable.flatMap(new Func1<BaseBean<T>, Observable<T>>() {
                    @Override
                    public Observable<T> call(BaseBean<T> result) {
                        if (!result.isError()){
                            return createData(result.getResults());
                        }else{
                            return Observable.error(new ServerException("服务器返回错误"));
                        }
                    }
                }).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread());
            }
        };
    }

    /**
     * 创建成功的数据
     *
     * @param data
     * @param <T>
     * @return
     */
    private static <T> Observable<T> createData(T data) {
        return Observable.create(new Observable.OnSubscribe<T>() {
            @Override
            public void call(Subscriber<? super T> subscriber) {
                try {
                    subscriber.onNext(data);
                    subscriber.onCompleted();
                } catch (Exception e) {
                    subscriber.onError(e);
                }
            }
        });
    }

    /**
     * 自定义 服务器返回异常
     */
    public static class ServerException extends Throwable {
        public ServerException(String msg) {}
    }

}