package  ${packageName}.Present;

import ${packageName}.View.BaseView;

import io.reactivex.disposables.CompositeDisposable;

public class BasePresenter<T extends BaseView> implements Presenter<T> {
    public CompositeDisposable compositeDisposable;
    public T view;

    @Override
    public void attachView(T t) {
        compositeDisposable = new CompositeDisposable();
        view = t;
    }

    @Override
    public void detachView() {
        compositeDisposable.clear();
        compositeDisposable = null;
        view = null;
    }

    public T getView() {
        return view;
    }
}