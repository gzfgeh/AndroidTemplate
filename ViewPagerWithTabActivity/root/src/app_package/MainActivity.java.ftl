package  ${packageName};

import android.os.Bundle;
import android.support.design.widget.TabLayout;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;

import ${packageName}.fragment.SimpleFragment;

public class ${activityClass} extends AppCompatActivity
{


    private TabLayout mTabLayout;
    private ViewPager mViewPager;
    private int mTabCount = ${tabCount};

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${activityLayoutName});

        mTabLayout = (TabLayout) findViewById(R.id.id_tablayout);
        mViewPager = (ViewPager) findViewById(R.id.id_viewpager);

        mViewPager.setAdapter(new FragmentPagerAdapter(getSupportFragmentManager())
        {
            @Override
            public Fragment getItem(int position)
            {
                return new SimpleFragment();
            }

            @Override
            public int getCount()
            {
                return mTabCount;
            }

            @Override
            public CharSequence getPageTitle(int position)
            {
                return "Tab:" + position;
            }
        });

        mTabLayout.setupWithViewPager(mViewPager);
    }
}
