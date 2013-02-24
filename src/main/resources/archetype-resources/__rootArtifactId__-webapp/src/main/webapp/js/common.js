/**
 * Generate UUID
 * @see http://www.broofa.com/blog/?p=151
 * @return {String}
 */
function randomUUID() {
    var i,
        s = [],
        itoh = '0123456789ABCDEF';

    // Make array of random hex digits. The UUID only has 32 digits in it, but we
    // allocate an extra items to make room for the '-'s we'll be inserting.
    for (i = 0; i < 36; i++) s[i] = Math.floor(Math.random() * 0x10);

    // Conform to RFC-4122, section 4.4
    s[14] = 4;  // Set 4 high bits of time_high field to version
    s[19] = (s[19] & 0x3) | 0x8;  // Specify 2 high bits of clock sequence

    // Convert to hex chars
    for (i = 0; i < 36; i++) s[i] = itoh[s[i]];

    // Insert '-'s
    s[8] = s[13] = s[18] = s[23] = '-';

    return s.join('');
}

/**
 *
 *  Base64 encode / decode
 *  @see http://www.webtoolkit.info/
 */
var Base64 = {

    // private property
    _keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",

    // public method for encoding
    encode:function (input) {
        var output = "",
            chr1, chr2, chr3, enc1, enc2, enc3, enc4,
            i = 0;

        input = Base64._utf8_encode(input);

        while (i < input.length) {

            chr1 = input.charCodeAt(i++);
            chr2 = input.charCodeAt(i++);
            chr3 = input.charCodeAt(i++);

            enc1 = chr1 >> 2;
            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
            enc4 = chr3 & 63;

            if (isNaN(chr2)) {
                enc3 = enc4 = 64;
            } else if (isNaN(chr3)) {
                enc4 = 64;
            }

            output = output +
                this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
                this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);

        }

        return output;
    },

    // public method for decoding
    decode:function (input) {
        var output = "",
            chr1, chr2, chr3,
            enc1, enc2, enc3, enc4,
            i = 0;

        input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

        while (i < input.length) {

            enc1 = this._keyStr.indexOf(input.charAt(i++));
            enc2 = this._keyStr.indexOf(input.charAt(i++));
            enc3 = this._keyStr.indexOf(input.charAt(i++));
            enc4 = this._keyStr.indexOf(input.charAt(i++));

            chr1 = (enc1 << 2) | (enc2 >> 4);
            chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
            chr3 = ((enc3 & 3) << 6) | enc4;

            output = output + String.fromCharCode(chr1);

            if (enc3 != 64) {
                output = output + String.fromCharCode(chr2);
            }
            if (enc4 != 64) {
                output = output + String.fromCharCode(chr3);
            }

        }

        output = Base64._utf8_decode(output);

        return output;

    },

    // private method for UTF-8 encoding
    _utf8_encode:function (string) {
        var utftext = "",
            n, c;

        string = string.replace(/\r\n/g, "\n");

        for (n = 0; n < string.length; n++) {

            c = string.charCodeAt(n);

            if (c < 128) {
                utftext += String.fromCharCode(c);
            }
            else if ((c > 127) && (c < 2048)) {
                utftext += String.fromCharCode((c >> 6) | 192);
                utftext += String.fromCharCode((c & 63) | 128);
            }
            else {
                utftext += String.fromCharCode((c >> 12) | 224);
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                utftext += String.fromCharCode((c & 63) | 128);
            }

        }

        return utftext;
    },

    // private method for UTF-8 decoding
    _utf8_decode:function (utftext) {
        var string = "",
            i = 0,
            c2 = 0, c = 0;

        while (i < utftext.length) {

            c = utftext.charCodeAt(i);

            if (c < 128) {
                string += String.fromCharCode(c);
                i++;
            }
            else if ((c > 191) && (c < 224)) {
                c2 = utftext.charCodeAt(i + 1);
                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
                i += 2;
            }
            else {
                c2 = utftext.charCodeAt(i + 1);
                c3 = utftext.charCodeAt(i + 2);
                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                i += 3;
            }

        }

        return string;
    }

};

/**
 * Wrapper to pub/sub to log who sent what and who handled that
 * @param event     event
 * @param args      event arguments
 * @param from      free form notification point id, use this for tracking signal source (optional)
 */

function notify(event, args, from) {
    stopWatch('event sent: ' + event + (from? ', from: ' + from : ''));
    $.publish(event, args);
}

/**
 * Wrapper to pub/sub to log who sent what and who handled that
 * @param event     event to observe
 * @param handler   event handler
 * @param by        free form watch point id, use this for tracking who handled the signal
 */
function watch(event, handler, by) {
    $.subscribe(event, function(e, args) {
        stopWatch('event received: ' + event + (by? ', by: ' + by : ''));
        handler(e, args);
    });
}

/**
 * URL parser class
 * @see http://www.ietf.org/rfc/rfc3986.txt, Ap. B
 */
function URL(url) {
    //..............12            3    4          5       6  7        8 9
    var pattern = /^(([^:/?#]+):)?(\/\/([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?/,
        matches = url.match(pattern);

    this.scheme = matches[2];
    this.authority = matches[4];
    this.path = matches[5];
    this.query = matches[7];
    this.fragment = matches[9];
}