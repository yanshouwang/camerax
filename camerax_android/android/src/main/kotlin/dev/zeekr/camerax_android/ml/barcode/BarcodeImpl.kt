package dev.zeekr.camerax_android.ml.barcode

import android.graphics.Point
import android.graphics.Rect
import com.google.mlkit.vision.barcode.common.Barcode
import dev.zeekr.camerax_android.AddressTypeApi
import dev.zeekr.camerax_android.BarcodeFormatApi
import dev.zeekr.camerax_android.BarcodeValueTypeApi
import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.EmailTypeApi
import dev.zeekr.camerax_android.PhoneTypeApi
import dev.zeekr.camerax_android.PigeonApiAddressApi
import dev.zeekr.camerax_android.PigeonApiBarcodeApi
import dev.zeekr.camerax_android.PigeonApiCalendarDateTimeApi
import dev.zeekr.camerax_android.PigeonApiCalendarEventApi
import dev.zeekr.camerax_android.PigeonApiContactInfoApi
import dev.zeekr.camerax_android.PigeonApiDriverLicenseApi
import dev.zeekr.camerax_android.PigeonApiEmailApi
import dev.zeekr.camerax_android.PigeonApiGeoPointApi
import dev.zeekr.camerax_android.PigeonApiPersonNameApi
import dev.zeekr.camerax_android.PigeonApiPhoneApi
import dev.zeekr.camerax_android.PigeonApiSmsApi
import dev.zeekr.camerax_android.PigeonApiUrlBookmarkApi
import dev.zeekr.camerax_android.PigeonApiWiFiApi
import dev.zeekr.camerax_android.WiFiEncryptionTypeApi

class BarcodeImpl(impl: CameraXImpl) : PigeonApiBarcodeApi(impl) {
    override fun boundingBox(pigeon_instance: Barcode): Rect? {
        return pigeon_instance.boundingBox
    }

    override fun cornerPoints(pigeon_instance: Barcode): List<Point>? {
        return pigeon_instance.cornerPoints?.toList()
    }

    override fun format(pigeon_instance: Barcode): BarcodeFormatApi {
        return pigeon_instance.format.barcodeFormatApi
    }

    override fun valueType(pigeon_instance: Barcode): BarcodeValueTypeApi {
        return pigeon_instance.valueType.barcodeValueTypeApi
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

    class AddressImpl(impl: CameraXImpl) : PigeonApiAddressApi(impl) {
        override fun type(pigeon_instance: Barcode.Address): AddressTypeApi {
            return pigeon_instance.type.addressTypeApi
        }

        override fun addressLines(pigeon_instance: Barcode.Address): List<String> {
            return pigeon_instance.addressLines.toList()
        }
    }

    class CalendarDateTimeImpl(impl: CameraXImpl) : PigeonApiCalendarDateTimeApi(impl) {
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

    class CalendarEventImpl(impl: CameraXImpl) : PigeonApiCalendarEventApi(impl) {
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

    class ContactInfoImpl(impl: CameraXImpl) : PigeonApiContactInfoApi(impl) {
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

    class DriverLicenseImpl(impl: CameraXImpl) : PigeonApiDriverLicenseApi(impl) {
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

    class EmailImpl(impl: CameraXImpl) : PigeonApiEmailApi(impl) {
        override fun type(pigeon_instance: Barcode.Email): EmailTypeApi {
            return pigeon_instance.type.emailTypeApi
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

    class GeoPointImpl(impl: CameraXImpl) : PigeonApiGeoPointApi(impl) {
        override fun lat(pigeon_instance: Barcode.GeoPoint): Double {
            return pigeon_instance.lat
        }

        override fun lng(pigeon_instance: Barcode.GeoPoint): Double {
            return pigeon_instance.lng
        }
    }

    class PersonNameImpl(impl: CameraXImpl) : PigeonApiPersonNameApi(impl) {
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

    class PhoneImpl(impl: CameraXImpl) : PigeonApiPhoneApi(impl) {
        override fun type(pigeon_instance: Barcode.Phone): PhoneTypeApi {
            return pigeon_instance.type.phoneTypeApi
        }

        override fun number(pigeon_instance: Barcode.Phone): String? {
            return pigeon_instance.number
        }
    }

    class SmsImpl(impl: CameraXImpl) : PigeonApiSmsApi(impl) {
        override fun phoneNumber(pigeon_instance: Barcode.Sms): String? {
            return pigeon_instance.phoneNumber
        }

        override fun message(pigeon_instance: Barcode.Sms): String? {
            return pigeon_instance.message
        }
    }

    class UrlBookmarkImpl(impl: CameraXImpl) : PigeonApiUrlBookmarkApi(impl) {
        override fun title(pigeon_instance: Barcode.UrlBookmark): String? {
            return pigeon_instance.title
        }

        override fun url(pigeon_instance: Barcode.UrlBookmark): String? {
            return pigeon_instance.url
        }
    }

    class WiFiImpl(impl: CameraXImpl) : PigeonApiWiFiApi(impl) {
        override fun encryptionType(pigeon_instance: Barcode.WiFi): WiFiEncryptionTypeApi {
            return pigeon_instance.encryptionType.wifiEncryptionTypeApi
        }

        override fun ssid(pigeon_instance: Barcode.WiFi): String? {
            return pigeon_instance.ssid
        }

        override fun password(pigeon_instance: Barcode.WiFi): String? {
            return pigeon_instance.password
        }
    }
}

val Int.addressTypeApi
    get() = when (this) {
        Barcode.Address.TYPE_UNKNOWN -> AddressTypeApi.UNKNOWN
        Barcode.Address.TYPE_WORK -> AddressTypeApi.WORK
        Barcode.Address.TYPE_HOME -> AddressTypeApi.HOME
        else -> throw IllegalArgumentException()
    }

val Int.emailTypeApi
    get() = when (this) {
        Barcode.Email.TYPE_UNKNOWN -> EmailTypeApi.UNKNOWN
        Barcode.Email.TYPE_WORK -> EmailTypeApi.WORK
        Barcode.Email.TYPE_HOME -> EmailTypeApi.HOME
        else -> throw IllegalArgumentException()
    }

val Int.phoneTypeApi
    get() = when (this) {
        Barcode.Phone.TYPE_UNKNOWN -> PhoneTypeApi.UNKNOWN
        Barcode.Phone.TYPE_WORK -> PhoneTypeApi.WORK
        Barcode.Phone.TYPE_HOME -> PhoneTypeApi.HOME
        Barcode.Phone.TYPE_FAX -> PhoneTypeApi.FAX
        Barcode.Phone.TYPE_MOBILE -> PhoneTypeApi.MOBILE
        else -> throw IllegalArgumentException()
    }

val Int.wifiEncryptionTypeApi
    get() = when (this) {
        Barcode.WiFi.TYPE_OPEN -> WiFiEncryptionTypeApi.OPEN
        Barcode.WiFi.TYPE_WPA -> WiFiEncryptionTypeApi.WPA
        Barcode.WiFi.TYPE_WEP -> WiFiEncryptionTypeApi.WEP
        else -> throw IllegalArgumentException()
    }

val BarcodeFormatApi.impl
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

val Int.barcodeFormatApi
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
        else -> throw IllegalArgumentException()
    }

val Int.barcodeValueTypeApi
    get() = when (this) {
        Barcode.TYPE_UNKNOWN -> BarcodeValueTypeApi.UNKNOWN
        Barcode.TYPE_CONTACT_INFO -> BarcodeValueTypeApi.CONTACT_INFO
        Barcode.TYPE_EMAIL -> BarcodeValueTypeApi.EMAIL
        Barcode.TYPE_ISBN -> BarcodeValueTypeApi.ISBN
        Barcode.TYPE_PHONE -> BarcodeValueTypeApi.PHONE
        Barcode.TYPE_PRODUCT -> BarcodeValueTypeApi.PRODUCT
        Barcode.TYPE_SMS -> BarcodeValueTypeApi.SMS
        Barcode.TYPE_TEXT -> BarcodeValueTypeApi.TEXT
        Barcode.TYPE_URL -> BarcodeValueTypeApi.URL
        Barcode.TYPE_WIFI -> BarcodeValueTypeApi.WIFI
        Barcode.TYPE_GEO -> BarcodeValueTypeApi.GEO
        Barcode.TYPE_CALENDAR_EVENT -> BarcodeValueTypeApi.CALENDAR_EVENT
        Barcode.TYPE_DRIVER_LICENSE -> BarcodeValueTypeApi.DRIVER_LICENSE
        else -> throw IllegalArgumentException()
    }