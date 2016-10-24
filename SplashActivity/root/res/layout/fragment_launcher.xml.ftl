<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android">
    <data>
        <variable
            name="btnText"
            type="String" />

        <variable
            name="btnClick"
            type="android.view.View.OnClickListener" />
    </data>
    <LinearLayout
        android:orientation="vertical"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:gravity="bottom|center_horizontal">

        <Button
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="@{btnText}"
            android:layout_marginBottom="200px"
            android:onClick="@{btnClick}"/>

    </LinearLayout>
</layout>
