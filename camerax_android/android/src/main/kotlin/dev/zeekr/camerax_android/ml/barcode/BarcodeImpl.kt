package dev.zeekr.camerax_android.ml.barcode

import android.graphics.Point
import android.graphics.Rect
import com.google.mlkit.vision.barcode.common.Barcode
import dev.zeekr.camerax_android.BarcodeAddressTypeApi
import dev.zeekr.camerax_android.BarcodeEmailTypeApi
import dev.zeekr.camerax_android.BarcodeFormatApi
import dev.zeekr.camerax_android.BarcodePhoneTypeApi
import dev.zeekr.camerax_android.BarcodeTypeApi
import dev.zeekr.camerax_android.BarcodeWiFiTypeApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiBarcodeAddressProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodeCalendarDateTimeProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodeCalendarEventProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodeContactInfoProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodeDriverLicenseProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodeEmailProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodeGeoPointProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodePersonNameProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodePhoneProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodeProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodeSmsProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodeUrlBookmarkProxyApi
import dev.zeekr.camerax_android.PigeonApiBarcodeWiFiProxyApi

class BarcodeImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBarcodeProxyApi(registrar) {
    class AddressImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBarcodeAddressProxyApi(registrar) {
        override fun type(pigeon_instance: Barcode.Address): BarcodeAddressTypeApi {
            return pigeon_instance.type.barcodeAddressTypeApi
        }

        override fun addressLines(pigeon_instance: Barcode.Address): List<String> {
            return pigeon_instance.addressLines.toList()
        }
    }

    class CalendarDateTimeImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiBarcodeCalendarDateTimeProxyApi(registrar) {
        override fun rawValue(pigeon_instance: Barcode.CalendarDateTime): String? {
            return pigeon_instance.rawValue
        }

        override fun year(pigeon_instance: Barcode.CalendarDateTime): Long {
            return pigeon_instance.year.toLong()
        }

        override fun month(pigeon_instance: Barcode.CalendarDateTime): Long {
            return pigeon_instance.month.toLong()
        }

        override fun day(pigeon_instance: Barcode.CalendarDateTime): Long {
            return pigeon_instance.day.toLong()
        }

        override fun hours(pigeon_instance: Barcode.CalendarDateTime): Long {
            return pigeon_instance.hours.toLong()
        }

        override fun minutes(pigeon_instance: Barcode.CalendarDateTime): Long {
            return pigeon_instance.minutes.toLong()
        }

        override fun seconds(pigeon_instance: Barcode.CalendarDateTime): Long {
            return pigeon_instance.seconds.toLong()
        }

        override fun isUtc(pigeon_instance: Barcode.CalendarDateTime): Boolean {
            return pigeon_instance.isUtc
        }
    }

    class CalendarEventImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiBarcodeCalendarEventProxyApi(registrar) {
        override fun start(pigeon_instance: Barcode.CalendarEvent): Barcode.CalendarDateTime? {
            return pigeon_instance.start
        }

        override fun end(pigeon_instance: Barcode.CalendarEvent): Barcode.CalendarDateTime? {
            return pigeon_instance.end
        }

        override fun location(pigeon_instance: Barcode.CalendarEvent): String? {
            return pigeon_instance.location
        }

        override fun organizer(pigeon_instance: Barcode.CalendarEvent): String? {
            return pigeon_instance.organizer
        }

        override fun summary(pigeon_instance: Barcode.CalendarEvent): String? {
            return pigeon_instance.summary
        }

        override fun description(pigeon_instance: Barcode.CalendarEvent): String? {
            return pigeon_instance.description
        }

        override fun status(pigeon_instance: Barcode.CalendarEvent): String? {
            return pigeon_instance.status
        }
    }

    class ContactInfoImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiBarcodeContactInfoProxyApi(registrar) {
        override fun addresses(pigeon_instance: Barcode.ContactInfo): List<Barcode.Address> {
            return pigeon_instance.addresses
        }

        override fun emails(pigeon_instance: Barcode.ContactInfo): List<Barcode.Email> {
            return pigeon_instance.emails
        }

        override fun name(pigeon_instance: Barcode.ContactInfo): Barcode.PersonName? {
            return pigeon_instance.name
        }

        override fun organization(pigeon_instance: Barcode.ContactInfo): String? {
            return pigeon_instance.organization
        }

        override fun phones(pigeon_instance: Barcode.ContactInfo): List<Barcode.Phone> {
            return pigeon_instance.phones
        }

        override fun title(pigeon_instance: Barcode.ContactInfo): String? {
            return pigeon_instance.title
        }

        override fun urls(pigeon_instance: Barcode.ContactInfo): List<String> {
            return pigeon_instance.urls
        }
    }

    class DriverLicenseImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiBarcodeDriverLicenseProxyApi(registrar) {
        override fun licenseNumber(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.licenseNumber
        }

        override fun documentType(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.documentType
        }

        override fun expiryDate(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.expiryDate
        }

        override fun firstName(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.firstName
        }

        override fun middleName(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.middleName
        }

        override fun lastName(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.lastName
        }

        override fun gender(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.gender
        }

        override fun birthDate(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.birthDate
        }

        override fun issueDate(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.issueDate
        }

        override fun issuingCountry(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.issuingCountry
        }

        override fun addressState(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.addressState
        }

        override fun addressCity(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.addressCity
        }

        override fun addressStreet(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.addressStreet
        }

        override fun addressZip(pigeon_instance: Barcode.DriverLicense): String? {
            return pigeon_instance.addressZip
        }
    }

    class EmailImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBarcodeEmailProxyApi(registrar) {
        override fun type(pigeon_instance: Barcode.Email): BarcodeEmailTypeApi {
            return pigeon_instance.type.barcodeEmailTypeApi
        }

        override fun address(pigeon_instance: Barcode.Email): String? {
            return pigeon_instance.address
        }

        override fun subject(pigeon_instance: Barcode.Email): String? {
            return pigeon_instance.subject
        }

        override fun body(pigeon_instance: Barcode.Email): String? {
            return pigeon_instance.body
        }
    }

    class GeoPointImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBarcodeGeoPointProxyApi(registrar) {
        override fun lat(pigeon_instance: Barcode.GeoPoint): Double {
            return pigeon_instance.lat
        }

        override fun lng(pigeon_instance: Barcode.GeoPoint): Double {
            return pigeon_instance.lng
        }
    }

    class PersonNameImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBarcodePersonNameProxyApi(registrar) {
        override fun formattedName(pigeon_instance: Barcode.PersonName): String? {
            return pigeon_instance.formattedName
        }

        override fun pronunciation(pigeon_instance: Barcode.PersonName): String? {
            return pigeon_instance.pronunciation
        }

        override fun prefix(pigeon_instance: Barcode.PersonName): String? {
            return pigeon_instance.prefix
        }

        override fun first(pigeon_instance: Barcode.PersonName): String? {
            return pigeon_instance.first
        }

        override fun middle(pigeon_instance: Barcode.PersonName): String? {
            return pigeon_instance.middle
        }

        override fun last(pigeon_instance: Barcode.PersonName): String? {
            return pigeon_instance.last
        }

        override fun suffix(pigeon_instance: Barcode.PersonName): String? {
            return pigeon_instance.suffix
        }
    }

    class PhoneImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBarcodePhoneProxyApi(registrar) {
        override fun type(pigeon_instance: Barcode.Phone): BarcodePhoneTypeApi {
            return pigeon_instance.type.barcodePhoneTypeApi
        }

        override fun number(pigeon_instance: Barcode.Phone): String? {
            return pigeon_instance.number
        }
    }

    class SmsImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBarcodeSmsProxyApi(registrar) {
        override fun phoneNumber(pigeon_instance: Barcode.Sms): String? {
            return pigeon_instance.phoneNumber
        }

        override fun message(pigeon_instance: Barcode.Sms): String? {
            return pigeon_instance.message
        }
    }

    class UrlBookmarkImpl(registrar: CameraXApiPigeonProxyApiRegistrar) :
        PigeonApiBarcodeUrlBookmarkProxyApi(registrar) {
        override fun title(pigeon_instance: Barcode.UrlBookmark): String? {
            return pigeon_instance.title
        }

        override fun url(pigeon_instance: Barcode.UrlBookmark): String? {
            return pigeon_instance.url
        }
    }

    class WiFiImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBarcodeWiFiProxyApi(registrar) {
        override fun encryptionType(pigeon_instance: Barcode.WiFi): BarcodeWiFiTypeApi {
            return pigeon_instance.encryptionType.barcodeWiFiTypeApi
        }

        override fun ssid(pigeon_instance: Barcode.WiFi): String? {
            return pigeon_instance.ssid
        }

        override fun password(pigeon_instance: Barcode.WiFi): String? {
            return pigeon_instance.password
        }
    }

    override fun boundingBox(pigeon_instance: Barcode): Rect? {
        return pigeon_instance.boundingBox
    }

    override fun cornerPoints(pigeon_instance: Barcode): List<Point>? {
        return pigeon_instance.cornerPoints?.toList()
    }

    override fun format(pigeon_instance: Barcode): BarcodeFormatApi {
        return pigeon_instance.format.barcodeFormatApi
    }

    override fun valueType(pigeon_instance: Barcode): BarcodeTypeApi {
        return pigeon_instance.valueType.barcodeTypeApi
    }

    override fun rawBytes(pigeon_instance: Barcode): ByteArray? {
        return pigeon_instance.rawBytes
    }

    override fun rawValue(pigeon_instance: Barcode): String? {
        return pigeon_instance.rawValue
    }

    override fun displayValue(pigeon_instance: Barcode): String? {
        return pigeon_instance.displayValue
    }

    override fun calendarEvent(pigeon_instance: Barcode): Barcode.CalendarEvent? {
        return pigeon_instance.calendarEvent
    }

    override fun contactInfo(pigeon_instance: Barcode): Barcode.ContactInfo? {
        return pigeon_instance.contactInfo
    }

    override fun driverLicense(pigeon_instance: Barcode): Barcode.DriverLicense? {
        return pigeon_instance.driverLicense
    }

    override fun email(pigeon_instance: Barcode): Barcode.Email? {
        return pigeon_instance.email
    }

    override fun geoPoint(pigeon_instance: Barcode): Barcode.GeoPoint? {
        return pigeon_instance.geoPoint
    }

    override fun phone(pigeon_instance: Barcode): Barcode.Phone? {
        return pigeon_instance.phone
    }

    override fun sms(pigeon_instance: Barcode): Barcode.Sms? {
        return pigeon_instance.sms
    }

    override fun url(pigeon_instance: Barcode): Barcode.UrlBookmark? {
        return pigeon_instance.url
    }

    override fun wifi(pigeon_instance: Barcode): Barcode.WiFi? {
        return pigeon_instance.wifi
    }
}

val Int.barcodeFormatApi: BarcodeFormatApi
    get() = when (this) {
        Barcode.FORMAT_UNKNOWN -> BarcodeFormatApi.UNKNOWN
        Barcode.FORMAT_ALL_FORMATS -> BarcodeFormatApi.ALL
        Barcode.FORMAT_CODE_128 -> BarcodeFormatApi.CODE128
        Barcode.FORMAT_CODE_39 -> BarcodeFormatApi.CODE39
        Barcode.FORMAT_CODE_93 -> BarcodeFormatApi.CODE93
        Barcode.FORMAT_CODABAR -> BarcodeFormatApi.CODABAR
        Barcode.FORMAT_DATA_MATRIX -> BarcodeFormatApi.DATA_MATRIX
        Barcode.FORMAT_EAN_13 -> BarcodeFormatApi.EAN13
        Barcode.FORMAT_EAN_8 -> BarcodeFormatApi.EAN8
        Barcode.FORMAT_ITF -> BarcodeFormatApi.ITF
        Barcode.FORMAT_QR_CODE -> BarcodeFormatApi.QR_CODE
        Barcode.FORMAT_UPC_A -> BarcodeFormatApi.UPC_A
        Barcode.FORMAT_UPC_E -> BarcodeFormatApi.UPC_E
        Barcode.FORMAT_PDF417 -> BarcodeFormatApi.PDF417
        Barcode.FORMAT_AZTEC -> BarcodeFormatApi.AZTEC
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val Int.barcodeTypeApi: BarcodeTypeApi
    get() = when (this) {
        Barcode.TYPE_UNKNOWN -> BarcodeTypeApi.UNKNOWN
        Barcode.TYPE_CONTACT_INFO -> BarcodeTypeApi.CONTACT_INFO
        Barcode.TYPE_EMAIL -> BarcodeTypeApi.EMAIL
        Barcode.TYPE_ISBN -> BarcodeTypeApi.ISBN
        Barcode.TYPE_PHONE -> BarcodeTypeApi.PHONE
        Barcode.TYPE_PRODUCT -> BarcodeTypeApi.PRODUCT
        Barcode.TYPE_SMS -> BarcodeTypeApi.SMS
        Barcode.TYPE_TEXT -> BarcodeTypeApi.TEXT
        Barcode.TYPE_URL -> BarcodeTypeApi.URL
        Barcode.TYPE_WIFI -> BarcodeTypeApi.WIFI
        Barcode.TYPE_GEO -> BarcodeTypeApi.GEO
        Barcode.TYPE_CALENDAR_EVENT -> BarcodeTypeApi.CALENDAR_EVENT
        Barcode.TYPE_DRIVER_LICENSE -> BarcodeTypeApi.DRIVER_LICENSE
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val Int.barcodeAddressTypeApi: BarcodeAddressTypeApi
    get() = when (this) {
        Barcode.Address.TYPE_UNKNOWN -> BarcodeAddressTypeApi.UNKNOWN
        Barcode.Address.TYPE_WORK -> BarcodeAddressTypeApi.WORK
        Barcode.Address.TYPE_HOME -> BarcodeAddressTypeApi.HOME
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val Int.barcodeEmailTypeApi: BarcodeEmailTypeApi
    get() = when (this) {
        Barcode.Email.TYPE_UNKNOWN -> BarcodeEmailTypeApi.UNKNOWN
        Barcode.Email.TYPE_WORK -> BarcodeEmailTypeApi.WORK
        Barcode.Email.TYPE_HOME -> BarcodeEmailTypeApi.HOME
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val Int.barcodePhoneTypeApi: BarcodePhoneTypeApi
    get() = when (this) {
        Barcode.Phone.TYPE_UNKNOWN -> BarcodePhoneTypeApi.UNKNOWN
        Barcode.Phone.TYPE_WORK -> BarcodePhoneTypeApi.WORK
        Barcode.Phone.TYPE_HOME -> BarcodePhoneTypeApi.HOME
        Barcode.Phone.TYPE_FAX -> BarcodePhoneTypeApi.FAX
        Barcode.Phone.TYPE_MOBILE -> BarcodePhoneTypeApi.MOBILE
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val Int.barcodeWiFiTypeApi: BarcodeWiFiTypeApi
    get() = when (this) {
        Barcode.WiFi.TYPE_OPEN -> BarcodeWiFiTypeApi.OPEN
        Barcode.WiFi.TYPE_WPA -> BarcodeWiFiTypeApi.WPA
        Barcode.WiFi.TYPE_WEP -> BarcodeWiFiTypeApi.WEP
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val BarcodeFormatApi.impl: Int
    get() = when (this) {
        BarcodeFormatApi.UNKNOWN -> Barcode.FORMAT_UNKNOWN
        BarcodeFormatApi.ALL -> Barcode.FORMAT_ALL_FORMATS
        BarcodeFormatApi.CODE128 -> Barcode.FORMAT_CODE_128
        BarcodeFormatApi.CODE39 -> Barcode.FORMAT_CODE_39
        BarcodeFormatApi.CODE93 -> Barcode.FORMAT_CODE_93
        BarcodeFormatApi.CODABAR -> Barcode.FORMAT_CODABAR
        BarcodeFormatApi.DATA_MATRIX -> Barcode.FORMAT_DATA_MATRIX
        BarcodeFormatApi.EAN13 -> Barcode.FORMAT_EAN_13
        BarcodeFormatApi.EAN8 -> Barcode.FORMAT_EAN_8
        BarcodeFormatApi.ITF -> Barcode.FORMAT_ITF
        BarcodeFormatApi.QR_CODE -> Barcode.FORMAT_QR_CODE
        BarcodeFormatApi.UPC_A -> Barcode.FORMAT_UPC_A
        BarcodeFormatApi.UPC_E -> Barcode.FORMAT_UPC_E
        BarcodeFormatApi.PDF417 -> Barcode.FORMAT_PDF417
        BarcodeFormatApi.AZTEC -> Barcode.FORMAT_AZTEC
    }

val BarcodeTypeApi.impl: Int
    get() = when (this) {
        BarcodeTypeApi.UNKNOWN -> Barcode.TYPE_UNKNOWN
        BarcodeTypeApi.CONTACT_INFO -> Barcode.TYPE_CONTACT_INFO
        BarcodeTypeApi.EMAIL -> Barcode.TYPE_EMAIL
        BarcodeTypeApi.ISBN -> Barcode.TYPE_ISBN
        BarcodeTypeApi.PHONE -> Barcode.TYPE_PHONE
        BarcodeTypeApi.PRODUCT -> Barcode.TYPE_PRODUCT
        BarcodeTypeApi.SMS -> Barcode.TYPE_SMS
        BarcodeTypeApi.TEXT -> Barcode.TYPE_TEXT
        BarcodeTypeApi.URL -> Barcode.TYPE_URL
        BarcodeTypeApi.WIFI -> Barcode.TYPE_WIFI
        BarcodeTypeApi.GEO -> Barcode.TYPE_GEO
        BarcodeTypeApi.CALENDAR_EVENT -> Barcode.TYPE_CALENDAR_EVENT
        BarcodeTypeApi.DRIVER_LICENSE -> Barcode.TYPE_DRIVER_LICENSE
    }

val BarcodeAddressTypeApi.impl: Int
    get() = when (this) {
        BarcodeAddressTypeApi.UNKNOWN -> Barcode.Address.TYPE_UNKNOWN
        BarcodeAddressTypeApi.WORK -> Barcode.Address.TYPE_WORK
        BarcodeAddressTypeApi.HOME -> Barcode.Address.TYPE_HOME
    }

val BarcodeEmailTypeApi.impl: Int
    get() = when (this) {
        BarcodeEmailTypeApi.UNKNOWN -> Barcode.Email.TYPE_UNKNOWN
        BarcodeEmailTypeApi.WORK -> Barcode.Email.TYPE_WORK
        BarcodeEmailTypeApi.HOME -> Barcode.Email.TYPE_HOME
    }

val BarcodePhoneTypeApi.impl: Int
    get() = when (this) {
        BarcodePhoneTypeApi.UNKNOWN -> Barcode.Phone.TYPE_UNKNOWN
        BarcodePhoneTypeApi.WORK -> Barcode.Phone.TYPE_WORK
        BarcodePhoneTypeApi.HOME -> Barcode.Phone.TYPE_HOME
        BarcodePhoneTypeApi.FAX -> Barcode.Phone.TYPE_FAX
        BarcodePhoneTypeApi.MOBILE -> Barcode.Phone.TYPE_MOBILE
    }

val BarcodeWiFiTypeApi.impl: Int
    get() = when (this) {
        BarcodeWiFiTypeApi.OPEN -> Barcode.WiFi.TYPE_OPEN
        BarcodeWiFiTypeApi.WPA -> Barcode.WiFi.TYPE_WPA
        BarcodeWiFiTypeApi.WEP -> Barcode.WiFi.TYPE_WEP
    }
