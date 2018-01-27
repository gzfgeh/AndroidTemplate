package ${packageName}.Model;

import javax.inject.Inject;
import javax.inject.Singleton;

/**
 * Created by 
 */
@Singleton
public class ${pageName}Model extends BaseModel {
	@Inject
    public ${pageName}Model(){}

    public Flowable<String> getData(){
        return Flowable.create(new FlowableOnSubscribe<String>() {
            @Override
            public void subscribe(@NonNull FlowableEmitter<String> flowableEmitter) throws Exception {

                flowableEmitter.onNext("");
                flowableEmitter.onComplete();
            }
        }, BackpressureStrategy.ERROR)
                .compose(RxUtils.applyIOToMainThreadSchedulers());
    }

}
