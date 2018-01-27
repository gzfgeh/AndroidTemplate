package  ${packageName}.Utils;

import android.content.Context;
import ${packageName}.Widget.LoadingDialog.LoadingDialogManager;

import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.subscribers.DisposableSubscriber;

public abstract class RxSubUtils<T> extends DisposableSubscriber<T> {
    private CompositeDisposable compositeDisposable;
    private Context mContext;
    private String msg;

    public RxSubUtils(CompositeDisposable mCompositeSubscription) {
        this.compositeDisposable = mCompositeSubscription;
    }

    /**
     * @param context context
     * @param msg     dialog message
     */
    public RxSubUtils(CompositeDisposable mCompositeSubscription, Context context, String msg) {
        this.compositeDisposable = mCompositeSubscription;
        this.mContext = context;
        this.msg = msg;
    }

    /**
     * @param context context
     */
    public RxSubUtils(CompositeDisposable mCompositeSubscription, Context context) {
        this(mCompositeSubscription, context, "请稍后...");
    }

    /**
     * 这个一定要有 Presenter的逻辑在这里处理
     * @param t
     */
    @Override
    public void onNext(T t) {
        _onNext(t);
    }

    @Override
    public void onError(Throwable e) {
        e.printStackTrace();
        LoadingDialogManager.getLoadingDialog().hideDialog();

        if (!NetWorkUtils.isNetworkAvailable()) {
            ToastUtil.show("网络错误");
        } else if (e instanceof RxUtils.ServerException) {
//            String s = ((RxUtils.ServerException)e).getMsg();
//            //token 过期了
//            if(TextUtils.equals(s, RxUtils.TOKEN_OVER_TIME) && mContext != null){
//                Utils.startLoginActivity(mContext);
//            }
//            ToastUtil.show(s);
        } else {
            ToastUtil.show("服务器错误");
        }

        _onError("");
    }

    @Override
    public void onComplete() {
        if (compositeDisposable != null)
            compositeDisposable.clear();

        LoadingDialogManager.getLoadingDialog().hideDialog();
    }

    @Override
    public void onStart() {
        super.onStart();
        if (mContext != null) {
            LoadingDialogManager.getLoadingDialog().showDialog(mContext);
        }
    }

    protected abstract void _onNext(T t);

    /**
     * 错误处理，需要的话重写这个方法
     */
    protected void _onError(String msg){

    }

}