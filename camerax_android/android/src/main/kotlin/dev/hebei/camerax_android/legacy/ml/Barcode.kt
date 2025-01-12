package dev.hebei.camerax_android.legacy.ml

import dev.hebei.camerax_android.legacy.*

class Barcode(registrar: CameraXRegistrar) : PigeonApiBarcode(registrar) {
    override fun getBoundingBox(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): android.graphics.Rect? {
        return pigeon_instance.boundingBox
    }

    override fun getCornerPoints(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): List<android.graphics.Point>? {
        return pigeon_instance.cornerPoints?.toList()
    }

    override fun getFormat(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): BarcodeFormat {
        return pigeon_instance.format.barcodeFormatArgs
    }

    override fun getValueType(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): BarcodeValueType {
        return pigeon_instance.valueType.barcodeValueTypeArgs
    }

    override fun getRawBytes(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): ByteArray? {
        return pigeon_instance.rawBytes
    }

    override fun getRawValue(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): String? {
        return pigeon_instance.rawValue
    }

    override fun getDisplayValue(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): String? {
        return pigeon_instance.displayValue
    }

    override fun getCalendarEvent(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): com.google.mlkit.vision.barcode.common.Barcode.CalendarEvent? {
        return pigeon_instance.calendarEvent
    }

    override fun getContactInfo(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): com.google.mlkit.vision.barcode.common.Barcode.ContactInfo? {
        return pigeon_instance.contactInfo
    }

    override fun getDriverLicense(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): com.google.mlkit.vision.barcode.common.Barcode.DriverLicense? {
        return pigeon_instance.driverLicense
    }

    override fun getEmail(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): com.google.mlkit.vision.barcode.common.Barcode.Email? {
        return pigeon_instance.email
    }

    override fun getGeoPoint(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): com.google.mlkit.vision.barcode.common.Barcode.GeoPoint? {
        return pigeon_instance.geoPoint
    }

    override fun getPhone(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): com.google.mlkit.vision.barcode.common.Barcode.Phone? {
        return pigeon_instance.phone
    }

    override fun getSms(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): com.google.mlkit.vision.barcode.common.Barcode.Sms? {
        return pigeon_instance.sms
    }

    override fun getUrl(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): com.google.mlkit.vision.barcode.common.Barcode.UrlBookmark? {
        return pigeon_instance.url
    }

    override fun getWifi(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode): com.google.mlkit.vision.barcode.common.Barcode.WiFi? {
        return pigeon_instance.wifi
    }

    class Address(registrar: CameraXRegistrar) : PigeonApiAddress(registrar) {
        override fun getType(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.Address): AddressType {
            return pigeon_instance.type.addressTypeArgs
        }

        override fun getAddressLines(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.Address): List<String> {
            return pigeon_instance.addressLines.toList()
        }
    }

    class CalendarDateTime(registrar: CameraXRegistrar) : PigeonApiCalendarDateTime(registrar) {
        override fun getRawValue(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime): String? {
            return pigeon_instance.rawValue
        }

        override fun getYear(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime): Long {
            return pigeon_instance.year.toLong()
        }

        override fun getMonth(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime): Long {
            return pigeon_instance.month.toLong()
        }

        override fun getDay(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime): Long {
            return pigeon_instance.day.toLong()
        }

        override fun getHours(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime): Long {
            return pigeon_instance.hours.toLong()
        }

        override fun getMinutes(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime): Long {
            return pigeon_instance.minutes.toLong()
        }

        override fun getSeconds(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime): Long {
            return pigeon_instance.seconds.toLong()
        }

        override fun isUtc(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime): Boolean {
            return pigeon_instance.isUtc
        }
    }

    class CalendarEvent(registrar: CameraXRegistrar) : PigeonApiCalendarEvent(registrar) {
        override fun getStart(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarEvent): com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime? {
            return pigeon_instance.start
        }

        override fun getEnd(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarEvent): com.google.mlkit.vision.barcode.common.Barcode.CalendarDateTime? {
            return pigeon_instance.end
        }

        override fun getLocation(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarEvent): String? {
            return pigeon_instance.location
        }

        override fun getOrganizer(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarEvent): String? {
            return pigeon_instance.organizer
        }

        override fun getSummary(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarEvent): String? {
            return pigeon_instance.summary
        }

        override fun getDescription(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarEvent): String? {
            return pigeon_instance.description
        }

        override fun getStatus(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.CalendarEvent): String? {
            return pigeon_instance.status
        }
    }

    class ContactInfo(registrar: CameraXRegistrar) : PigeonApiContactInfo(registrar) {
        override fun getAddresses(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.ContactInfo): List<com.google.mlkit.vision.barcode.common.Barcode.Address> {
            return pigeon_instance.addresses
        }

        override fun getEmails(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.ContactInfo): List<com.google.mlkit.vision.barcode.common.Barcode.Email> {
            return pigeon_instance.emails
        }

        override fun getName(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.ContactInfo): com.google.mlkit.vision.barcode.common.Barcode.PersonName? {
            return pigeon_instance.name
        }

        override fun getOrganization(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.ContactInfo): String? {
            return pigeon_instance.organization
        }

        override fun getPhones(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.ContactInfo): List<com.google.mlkit.vision.barcode.common.Barcode.Phone> {
            return pigeon_instance.phones
        }

        override fun getTitle(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.ContactInfo): String? {
            return pigeon_instance.title
        }

        override fun getUrls(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.ContactInfo): List<String> {
            return pigeon_instance.urls
        }
    }

    class DriverLicense(registrar: CameraXRegistrar) : PigeonApiDriverLicense(registrar) {
        override fun getLicenseNumber(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.licenseNumber
        }

        override fun getDocumentType(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.documentType
        }

        override fun getExpiryDate(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.expiryDate
        }

        override fun getFirstName(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.firstName
        }

        override fun getMiddleName(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.middleName
        }

        override fun getLastName(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.lastName
        }

        override fun getGender(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.gender
        }

        override fun getBirthDate(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.birthDate
        }

        override fun getIssueDate(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.issueDate
        }

        override fun getIssuingCountry(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.issuingCountry
        }

        override fun getAddressState(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.addressState
        }

        override fun getAddressCity(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.addressCity
        }

        override fun getAddressStreet(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.addressStreet
        }

        override fun getAddressZip(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.DriverLicense): String? {
            return pigeon_instance.addressZip
        }
    }

    class Email(registrar: CameraXRegistrar) : PigeonApiEmail(registrar) {
        override fun getType(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.Email): EmailType {
            return pigeon_instance.type.emailTypeArgs
        }

        override fun getAddress(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.Email): String? {
            return pigeon_instance.address
        }

        override fun getSubgect(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.Email): String? {
            return pigeon_instance.subject
        }

        override fun getBody(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.Email): String? {
            return pigeon_instance.body
        }
    }

    class GeoPoint(registrar: CameraXRegistrar) : PigeonApiGeoPoint(registrar) {
        override fun getLat(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.GeoPoint): Double {
            return pigeon_instance.lat
        }

        override fun getLng(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.GeoPoint): Double {
            return pigeon_instance.lng
        }
    }

    class PersonName(registrar: CameraXRegistrar) : PigeonApiPersonName(registrar) {
        override fun getFormattedName(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.PersonName): String? {
            return pigeon_instance.formattedName
        }

        override fun getPronunciation(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.PersonName): String? {
            return pigeon_instance.pronunciation
        }

        override fun getPrefix(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.PersonName): String? {
            return pigeon_instance.prefix
        }

        override fun getFirst(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.PersonName): String? {
            return pigeon_instance.first
        }

        override fun getMiddle(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.PersonName): String? {
            return pigeon_instance.middle
        }

        override fun getLast(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.PersonName): String? {
            return pigeon_instance.last
        }

        override fun getSuffix(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.PersonName): String? {
            return pigeon_instance.suffix
        }
    }

    class Phone(registrar: CameraXRegistrar) : PigeonApiPhone(registrar) {
        override fun getType(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.Phone): PhoneType {
            return pigeon_instance.type.phoneTypeArgs
        }

        override fun getNumber(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.Phone): String? {
            return pigeon_instance.number
        }
    }

    class Sms(registrar: CameraXRegistrar) : PigeonApiSms(registrar) {
        override fun getPhoneNumber(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.Sms): String? {
            return pigeon_instance.phoneNumber
        }

        override fun getMessage(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.Sms): String? {
            return pigeon_instance.message
        }
    }

    class UrlBookmark(registrar: CameraXRegistrar) : PigeonApiUrlBookmark(registrar) {
        override fun getTitle(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.UrlBookmark): String? {
            return pigeon_instance.title
        }

        override fun getUrl(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.UrlBookmark): String? {
            return pigeon_instance.url
        }
    }

    class WiFi(registrar: CameraXRegistrar) : PigeonApiWiFi(registrar) {
        override fun getEncryptionType(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.WiFi): WiFiEncryptionType {
            return pigeon_instance.encryptionType.wifiEncryptionTypeArgs
        }

        override fun getSsid(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.WiFi): String? {
            return pigeon_instance.ssid
        }

        override fun getPassword(pigeon_instance: com.google.mlkit.vision.barcode.common.Barcode.WiFi): String? {
            return pigeon_instance.password
        }
    }
}

val Int.addressTypeArgs
    get() = when (this) {
        com.google.mlkit.vision.barcode.common.Barcode.Address.TYPE_UNKNOWN -> AddressType.UNKNOWN
        com.google.mlkit.vision.barcode.common.Barcode.Address.TYPE_WORK -> AddressType.WORK
        com.google.mlkit.vision.barcode.common.Barcode.Address.TYPE_HOME -> AddressType.HOME
        else -> throw IllegalArgumentException()
    }

val Int.emailTypeArgs
    get() = when (this) {
        com.google.mlkit.vision.barcode.common.Barcode.Email.TYPE_UNKNOWN -> EmailType.UNKNOWN
        com.google.mlkit.vision.barcode.common.Barcode.Email.TYPE_WORK -> EmailType.WORK
        com.google.mlkit.vision.barcode.common.Barcode.Email.TYPE_HOME -> EmailType.HOME
        else -> throw IllegalArgumentException()
    }

val Int.phoneTypeArgs
    get() = when (this) {
        com.google.mlkit.vision.barcode.common.Barcode.Phone.TYPE_UNKNOWN -> PhoneType.UNKNOWN
        com.google.mlkit.vision.barcode.common.Barcode.Phone.TYPE_WORK -> PhoneType.WORK
        com.google.mlkit.vision.barcode.common.Barcode.Phone.TYPE_HOME -> PhoneType.HOME
        com.google.mlkit.vision.barcode.common.Barcode.Phone.TYPE_FAX -> PhoneType.FAX
        com.google.mlkit.vision.barcode.common.Barcode.Phone.TYPE_MOBILE -> PhoneType.MOBILE
        else -> throw IllegalArgumentException()
    }

val Int.wifiEncryptionTypeArgs
    get() = when (this) {
        com.google.mlkit.vision.barcode.common.Barcode.WiFi.TYPE_OPEN -> WiFiEncryptionType.OPEN
        com.google.mlkit.vision.barcode.common.Barcode.WiFi.TYPE_WPA -> WiFiEncryptionType.WPA
        com.google.mlkit.vision.barcode.common.Barcode.WiFi.TYPE_WEP -> WiFiEncryptionType.WEP
        else -> throw IllegalArgumentException()
    }

val BarcodeFormat.obj
    get() = when (this) {
        BarcodeFormat.UNKNOWN -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_UNKNOWN
        BarcodeFormat.ALL -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_ALL_FORMATS
        BarcodeFormat.CODE128 -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_CODE_128
        BarcodeFormat.CODE39 -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_CODE_39
        BarcodeFormat.CODE93 -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_CODE_93
        BarcodeFormat.CODABAR -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_CODABAR
        BarcodeFormat.DATA_MATRIX -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_DATA_MATRIX
        BarcodeFormat.EAN13 -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_EAN_13
        BarcodeFormat.EAN8 -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_EAN_8
        BarcodeFormat.ITF -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_ITF
        BarcodeFormat.QR_CODE -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_QR_CODE
        BarcodeFormat.UPC_A -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_UPC_A
        BarcodeFormat.UPC_E -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_UPC_E
        BarcodeFormat.PDF417 -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_PDF417
        BarcodeFormat.AZTEC -> com.google.mlkit.vision.barcode.common.Barcode.FORMAT_AZTEC
    }

val Int.barcodeFormatArgs
    get() = when (this) {
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_UNKNOWN -> BarcodeFormat.UNKNOWN
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_ALL_FORMATS -> BarcodeFormat.ALL
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_CODE_128 -> BarcodeFormat.CODE128
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_CODE_39 -> BarcodeFormat.CODE39
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_CODE_93 -> BarcodeFormat.CODE93
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_CODABAR -> BarcodeFormat.CODABAR
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_DATA_MATRIX -> BarcodeFormat.DATA_MATRIX
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_EAN_13 -> BarcodeFormat.EAN13
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_EAN_8 -> BarcodeFormat.EAN8
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_ITF -> BarcodeFormat.ITF
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_QR_CODE -> BarcodeFormat.QR_CODE
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_UPC_A -> BarcodeFormat.UPC_A
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_UPC_E -> BarcodeFormat.UPC_E
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_PDF417 -> BarcodeFormat.PDF417
        com.google.mlkit.vision.barcode.common.Barcode.FORMAT_AZTEC -> BarcodeFormat.AZTEC
        else -> throw IllegalArgumentException()
    }

val Int.barcodeValueTypeArgs
    get() = when (this) {
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_UNKNOWN -> BarcodeValueType.UNKNOWN
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_CONTACT_INFO -> BarcodeValueType.CONTACT_INFO
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_EMAIL -> BarcodeValueType.EMAIL
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_ISBN -> BarcodeValueType.ISBN
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_PHONE -> BarcodeValueType.PHONE
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_PRODUCT -> BarcodeValueType.PRODUCT
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_SMS -> BarcodeValueType.SMS
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_TEXT -> BarcodeValueType.TEXT
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_URL -> BarcodeValueType.URL
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_WIFI -> BarcodeValueType.WIFI
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_GEO -> BarcodeValueType.GEO
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_CALENDAR_EVENT -> BarcodeValueType.CALENDAR_EVENT
        com.google.mlkit.vision.barcode.common.Barcode.TYPE_DRIVER_LICENSE -> BarcodeValueType.DRIVER_LICENSE
        else -> throw IllegalArgumentException()
    }