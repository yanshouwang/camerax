package dev.zeekr.camerax_android.common

import dev.zeekr.camerax_android.TimeUnitApi
import java.util.concurrent.TimeUnit

val TimeUnitApi.impl: TimeUnit
    get() = when (this) {
        TimeUnitApi.NANOSECONDS -> TimeUnit.NANOSECONDS
        TimeUnitApi.MICROSECONDS -> TimeUnit.MICROSECONDS
        TimeUnitApi.MILLISECONDS -> TimeUnit.MILLISECONDS
        TimeUnitApi.SECONDS -> TimeUnit.SECONDS
        TimeUnitApi.MINUTES -> TimeUnit.MINUTES
        TimeUnitApi.HOURS -> TimeUnit.HOURS
        TimeUnitApi.DAYS -> TimeUnit.DAYS
    }