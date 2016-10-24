package ${packageName}.Fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.content.Intent;
import android.databinding.DataBindingUtil;

import ${packageName}.Activity.MainActivity;
import ${packageName}.Interface.LauncherBaseFragment;
import ${packageName}.R;
import ${packageName}.Utils.ShareUtils;
import ${packageName}.databinding.FragmentLaunchBinding;

/**
 * Created by guzhenfu on 16/6/6.
 */
public class SimpleFragment extends LauncherBaseFragment{
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        FragmentLaunchBinding binding = DataBindingUtil.inflate(inflater, R.layout.fragment_launch, container, false);
        binding.setBtnText("立即使用");
        binding.setBtnClick(View-> {
            ShareUtils.putValue("isComeOver", true);
            startActivity(new Intent(getActivity(), MainActivity.class));
        });
        return binding.getRoot();
    }
	
	@Override
    public void startAnimation() {}
	
	@Override
    public void stopAnimation() {}
}
