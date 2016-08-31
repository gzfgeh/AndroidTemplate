<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <${packageName}.Widget.GuideViewPager
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:id="@+id/vp_launcher"/>

    <RelativeLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content">

        <LinearLayout
            android:id="@+id/ll_view"
            android:layout_width="fill_parent"
            android:layout_height="wrap_content"
            android:layout_alignParentBottom="true"
            android:layout_marginBottom="30dp"
            android:gravity="center_horizontal"
            android:orientation="horizontal" />
    </RelativeLayout>

</RelativeLayout>
