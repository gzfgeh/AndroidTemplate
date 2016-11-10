package ${packageName}.Present;

import ${packageName}.Model.${pageName}Model;
import ${packageName}.View.${pageName}View;

import javax.inject.Inject;

import rx.Subscriber;

/**
 * Created by 
 */
public class ${pageName}Presenter extends BasePresenter<${pageName}View> {
	@Inject
    ${pageName}Model model;

    @Inject
    ${pageName}Presenter(){}
}
