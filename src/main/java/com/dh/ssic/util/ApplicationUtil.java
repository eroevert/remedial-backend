package com.dh.ssic.util;

import javax.servlet.ServletContext;

public class ApplicationUtil {
    private static ServletContext context;
    /* Called by Listener */
    public static void setServletContext(ServletContext context){
        ApplicationUtil.context = context;
    }
    /* Use this method to access context from any location */
    public static ServletContext getServletContext(){
        return ApplicationUtil.context;
    }
}
