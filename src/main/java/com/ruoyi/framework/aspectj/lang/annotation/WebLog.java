package com.ruoyi.framework.aspectj.lang.annotation;

import java.lang.annotation.*;

/**
 * @Author: liuzw     Email :a1774214410@163.com
 * @Date: 2018/8/29 13:24
 */
@Target({ElementType.METHOD ,ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface WebLog {
    String value() default "";

    boolean ignore() default false;
}
