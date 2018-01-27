package ${packageName}.Present;

import ${packageName}.Model.${pageName}Model;
import ${packageName}.View.${pageName}View;
import ${packageName}.Utils.RxSubUtils;

import javax.inject.Inject;

/**
 * Created by 
 */
public class ${pageName}Presenter extends BasePresenter<${pageName}View> {
	@Inject
    ${pageName}Model model;

    @Inject
    ${pageName}Presenter(){}

    public void getData(Context context){
        compositeDisposable.add(model.getData()
            .subscribeWith(new RxSubUtils<String>(compositeDisposable, context){

                @Override
                protected void _onNext(String o) {
                    
                }

                @Override
                protected void _onError(String msg) {
                    getView().onFail(msg);
                }
            }));
    }
}
