package com.mikesoftstudio.one_for_all

import android.annotation.SuppressLint
import android.content.Context



@SuppressLint("StaticFieldLeak")
object OneForAllKit {

    private  lateinit var context: Context


    fun init(appContext: Context) {
        OneForAllKit. context = appContext
    }




}