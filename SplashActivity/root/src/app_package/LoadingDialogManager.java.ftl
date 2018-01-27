package ${packageName}.Widget.LoadingDialog;

public class LoadingDialogManager {

    public static ILoadingDialog getLoadingDialog(){
        return IOSLoadingDialog.getInstance();
    }
}