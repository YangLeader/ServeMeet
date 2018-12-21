var wrestMsg = "";
var wrestFld = null;
var wrestFldDefaultColor = "";
//var wrestFldBackColor = "#ff3061";

// subject ¼Ó¼º°ªÀ» ¾ò¾î return, ¾øÀ¸¸é tagÀÇ nameÀ» ³Ñ±è
function wrestItemname(fld)
{
    //return fld.getAttribute("title") ? fld.getAttribute("title") : ( fld.getAttribute("alt") ? fld.getAttribute("alt") : fld.name );
    var id = fld.getAttribute("id");
    var labels = document.getElementsByTagName("label");
    var el = null;

    for(i=0; i<labels.length; i++) {
        if(id == labels[i].htmlFor) {
            el = labels[i];
            break;
        }
    }

    if(el != null) {
        var text =  el.innerHTML.replace(/[<].*[>].*[<]\/+.*[>]/gi, "");

        if(text == '') {
            return fld.getAttribute("title") ? fld.getAttribute("title") : ( fld.getAttribute("placeholder") ? fld.getAttribute("placeholder") : fld.name );
        } else {
            return text;
        }
    } else {
        return fld.getAttribute("title") ? fld.getAttribute("title") : ( fld.getAttribute("placeholder") ? fld.getAttribute("placeholder") : fld.name );
    }
}

// ¾çÂÊ °ø¹é ¾ø¾Ö±â
function wrestTrim(fld)
{
    var pattern = /(^\s+)|(\s+$)/g; // \s °ø¹é ¹®ÀÚ
    return fld.value.replace(pattern, "");
}

// ÇÊ¼ö ÀÔ·Â °Ë»ç
function wrestRequired(fld)
{
    if (wrestTrim(fld) == "") {
        if (wrestFld == null) {
            // ¼¿·ºÆ®¹Ú½ºÀÏ °æ¿ì¿¡µµ ÇÊ¼ö ¼±ÅÃ °Ë»çÇÕ´Ï´Ù.
            wrestMsg = wrestItemname(fld) + " : ÇÊ¼ö "+(fld.type=="select-one"?"¼±ÅÃ":"ÀÔ·Â")+"ÀÔ´Ï´Ù.\n";
            wrestFld = fld;
        }
    }
}

// ±è¼±¿ë 2006.3 - ÀüÈ­¹øÈ£(ÈŞ´ëÆù) Çü½Ä °Ë»ç : 123-123(4)-5678
function wrestTelNum(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
    if(!pattern.test(fld.value)){
        if(wrestFld == null){
            wrestMsg = wrestItemname(fld)+" : ÀüÈ­¹øÈ£ Çü½ÄÀÌ ¿Ã¹Ù¸£Áö ¾Ê½À´Ï´Ù.\n\nÇÏÀÌÇÂ(-)À» Æ÷ÇÔÇÏ¿© ÀÔ·ÂÇÏ¼¼¿ä.\n";
            wrestFld = fld;
            fld.select();
        }
    }
}

// ÀÌ¸ŞÀÏÁÖ¼Ò Çü½Ä °Ë»ç
function wrestEmail(fld)
{
    if (!wrestTrim(fld)) return;

    //var pattern = /(\S+)@(\S+)\.(\S+)/; ÀÌ¸ŞÀÏÁÖ¼Ò¿¡ ÇÑ±Û »ç¿ë½Ã
    var pattern = /([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)\.([0-9a-zA-Z_-]+)/;
    if (!pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + " : ÀÌ¸ŞÀÏÁÖ¼Ò Çü½ÄÀÌ ¾Æ´Õ´Ï´Ù.\n";
            wrestFld = fld;
        }
    }
}

// ÇÑ±ÛÀÎÁö °Ë»ç (ÀÚÀ½, ¸ğÀ½ Á¶ÇÕµÈ ÇÑ±Û¸¸ °¡´É)
function wrestHangul(fld)
{
    if (!wrestTrim(fld)) return;

    //var pattern = /([^°¡-ÆR\x20])/i;
    var pattern = /([^°¡-ÆR\x20])/;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : ÇÑ±ÛÀÌ ¾Æ´Õ´Ï´Ù. (ÀÚÀ½, ¸ğÀ½ Á¶ÇÕµÈ ÇÑ±Û¸¸ °¡´É)\n';
            wrestFld = fld;
        }
    }
}

// ÇÑ±ÛÀÎÁö °Ë»ç2 (ÀÚÀ½, ¸ğÀ½¸¸ ÀÖ´Â ÇÑ±Ûµµ °¡´É)
function wrestHangul2(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /([^°¡-ÆR¤¡-¤¾¤¿-¤Ó\x20])/i;
    //var pattern = /([^°¡-ÆR¤¡-¤¾¤¿-¤Ó\x20])/;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : ÇÑ±ÛÀÌ ¾Æ´Õ´Ï´Ù.\n';
            wrestFld = fld;
        }
    }
}

// ÇÑ±Û,¿µ¹®,¼ıÀÚÀÎÁö °Ë»ç3
function wrestHangulAlNum(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /([^°¡-ÆR\x20^a-z^A-Z^0-9])/i;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : ÇÑ±Û, ¿µ¹®, ¼ıÀÚ°¡ ¾Æ´Õ´Ï´Ù.\n';
            wrestFld = fld;
        }
    }
}

// ÇÑ±Û,¿µ¹® ÀÎÁö °Ë»ç
function wrestHangulAlpha(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /([^°¡-ÆR\x20^a-z^A-Z])/i;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : ÇÑ±Û, ¿µ¹®ÀÌ ¾Æ´Õ´Ï´Ù.\n';
            wrestFld = fld;
        }
    }
}

// ¼ıÀÚÀÎÁö°Ë»ç
// ¹èºÎ¸¥²Ü²ÜÀÌ´Ô Ãß°¡ (http://dasir.com) 2003-06-24
function wrestNumeric(fld)
{
    if (fld.value.length > 0) {
        for (i = 0; i < fld.value.length; i++) {
            if (fld.value.charAt(i) < '0' || fld.value.charAt(i) > '9') {
                wrestMsg = wrestItemname(fld) + " : ¼ıÀÚ°¡ ¾Æ´Õ´Ï´Ù.\n";
                wrestFld = fld;
            }
        }
    }
}

// ¿µ¹®ÀÚ °Ë»ç
// ¹èºÎ¸¥²Ü²ÜÀÌ´Ô Ãß°¡ (http://dasir.com) 2003-06-24
function wrestAlpha(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /(^[a-zA-Z]+$)/;

    if (!pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + " : ¿µ¹®ÀÌ ¾Æ´Õ´Ï´Ù.\n";
            wrestFld = fld;
        }
    }
}

// ¿µ¹®ÀÚ¿Í ¼ıÀÚ °Ë»ç
// ¹èºÎ¸¥²Ü²ÜÀÌ´Ô Ãß°¡ (http://dasir.com) 2003-07-07
function wrestAlNum(fld)
{
   if (!wrestTrim(fld)) return;

   var pattern = /(^[a-zA-Z0-9]+$)/;

   if (!pattern.test(fld.value)) {
       if (wrestFld == null) {
           wrestMsg = wrestItemname(fld) + " : ¿µ¹® ¶Ç´Â ¼ıÀÚ°¡ ¾Æ´Õ´Ï´Ù.\n";
           wrestFld = fld;
       }
   }
}

// ¿µ¹®ÀÚ¿Í ¼ıÀÚ ±×¸®°í _ °Ë»ç
function wrestAlNum_(fld)
{
   if (!wrestTrim(fld)) return;

   var pattern = /(^[a-zA-Z0-9\_]+$)/;

   if (!pattern.test(fld.value)) {
       if (wrestFld == null) {
           wrestMsg = wrestItemname(fld) + " : ¿µ¹®, ¼ıÀÚ, _ °¡ ¾Æ´Õ´Ï´Ù.\n";
           wrestFld = fld;
       }
   }
}

// ÃÖ¼Ò ±æÀÌ °Ë»ç
function wrestMinLength(fld)
{
    if (!wrestTrim(fld)) return;

    var minlength = fld.getAttribute("minlength");

    if (wrestFld == null) {
        if (fld.value.length < parseInt(minlength)) {
            wrestMsg = wrestItemname(fld) + " : ÃÖ¼Ò "+minlength+"±ÛÀÚ ÀÌ»ó ÀÔ·ÂÇÏ¼¼¿ä.\n";
            wrestFld = fld;
        }
    }
}

// ÀÌ¹ÌÁö È®ÀåÀÚ
function wrestImgExt(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /\.(gif|jpg|png)$/i; // jpeg ´Â Á¦¿Ü
    if(!pattern.test(fld.value)){
        if(wrestFld == null){
            wrestMsg = wrestItemname(fld)+" : ÀÌ¹ÌÁö ÆÄÀÏÀÌ ¾Æ´Õ´Ï´Ù.\n.gif .jpg .png ÆÄÀÏ¸¸ °¡´ÉÇÕ´Ï´Ù.\n";
            wrestFld = fld;
            fld.select();
        }
    }
}

// È®ÀåÀÚ
function wrestExtension(fld, css)
{
    if (!wrestTrim(fld)) return;

    var str = css.split("="); // ext=?? <-- str[1]
    var src = fld.value.split(".");
    var ext = src[src.length - 1];

    if (wrestFld == null) {
        if (ext.toLowerCase() < str[1].toLowerCase()) {
            wrestMsg = wrestItemname(fld) + " : ."+str[1]+" ÆÄÀÏ¸¸ °¡´ÉÇÕ´Ï´Ù.\n";
            wrestFld = fld;
        }
    }
}

// °ø¹é °Ë»çÈÄ °ø¹éÀ» "" ·Î º¯È¯
function wrestNospace(fld)
{
    var pattern = /(\s)/g; // \s °ø¹é ¹®ÀÚ

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + " : °ø¹éÀÌ ¾ø¾î¾ß ÇÕ´Ï´Ù.\n";
            wrestFld = fld;
        }
    }
}

// submit ÇÒ ¶§ ¼Ó¼ºÀ» °Ë»çÇÑ´Ù.
function wrestSubmit()
{
    wrestMsg = "";
    wrestFld = null;

    var attr = null;

    // ÇØ´çÆû¿¡ ´ëÇÑ ¿ä¼ÒÀÇ °³¼ö¸¸Å­ µ¹·Á¶ó
    for (var i=0; i<this.elements.length; i++) {
        var el = this.elements[i];

        // Input tag ÀÇ type ÀÌ text, file, password ÀÏ¶§¸¸
        // ¼¿·ºÆ® ¹Ú½ºÀÏ¶§µµ ÇÊ¼ö ¼±ÅÃ °Ë»çÇÕ´Ï´Ù. select-one
        if (el.type=="text" || el.type=="hidden" || el.type=="file" || el.type=="password" || el.type=="select-one" || el.type=="textarea") {
            if (el.getAttribute("required") != null) {
                wrestRequired(el);
            }

            if (el.getAttribute("minlength") != null) {
                wrestMinLength(el);
            }

            var array_css = el.className.split(" "); // class ¸¦ °ø¹éÀ¸·Î ³ª´®

            el.style.backgroundColor = wrestFldDefaultColor;

            // ¹è¿­ÀÇ ±æÀÌ¸¸Å­ µ¹·Á¶ó
            for (var k=0; k<array_css.length; k++) {
                var css = array_css[k];
                switch (css) {
                    case "required"     : wrestRequired(el); break;
                    case "trim"         : wrestTrim(el); break;
                    case "email"        : wrestEmail(el); break;
                    case "hangul"       : wrestHangul(el); break;
                    case "hangul2"      : wrestHangul2(el); break;
                    case "hangulalpha"  : wrestHangulAlpha(el); break;
                    case "hangulalnum"  : wrestHangulAlNum(el); break;
                    case "nospace"      : wrestNospace(el); break;
                    case "numeric"      : wrestNumeric(el); break;
                    case "alpha"        : wrestAlpha(el); break;
                    case "alnum"        : wrestAlNum(el); break;
                    case "alnum_"       : wrestAlNum_(el); break;
                    case "telnum"       : wrestTelNum(el); break; // ±è¼±¿ë 2006.3 - ÀüÈ­¹øÈ£ Çü½Ä °Ë»ç
                    case "imgext"       : wrestImgExt(el); break;
                    default :
                        if (/^extension\=/.test(css)) {
                            wrestExtension(el, css); break;
                        }
                } // switch (css)
            } // for (k)
        } // if (el)
    } // for (i)

    // ÇÊµå°¡ null ÀÌ ¾Æ´Ï¶ó¸é ¿À·ù¸Ş¼¼Áö Ãâ·ÂÈÄ Æ÷Ä¿½º¸¦ ÇØ´ç ¿À·ù ÇÊµå·Î ¿Å±è
    // ¿À·ù ÇÊµå´Â ¹è°æ»ö»óÀ» ¹Ù²Û´Ù.
    if (wrestFld != null) {
        // °æ°í¸Ş¼¼Áö Ãâ·Â
        alert(wrestMsg);

        if (wrestFld.style.display != "none") {
            var id = wrestFld.getAttribute("id");

            // ¿À·ù¸Ş¼¼Áö¸¦ À§ÇÑ element Ãß°¡
            var msg_el = document.createElement("strong");
            msg_el.id = "msg_"+id;
            msg_el.className = "msg_sound_only";
            msg_el.innerHTML = wrestMsg;
            wrestFld.parentNode.insertBefore(msg_el, wrestFld);

            var new_href = document.location.href.replace(/#msg.+$/, "")+"#msg_"+id;

            document.location.href = new_href;

            //wrestFld.style.backgroundColor = wrestFldBackColor;
            if (typeof(wrestFld.select) != "undefined")
                wrestFld.select();
            wrestFld.focus();
        }
        return false;
    }

    if (this.oldsubmit && this.oldsubmit() == false)
        return false;

    return true;
}


// ÃÊ±â¿¡ onsubmitÀ» °¡·ÎÃ¤µµ·Ï ÇÑ´Ù.
function wrestInitialized()
{
    for (var i = 0; i < document.forms.length; i++) {
        // onsubmit ÀÌº¥Æ®°¡ ÀÖ´Ù¸é ÀúÀåÇØ ³õ´Â´Ù.
        if (document.forms[i].onsubmit) {
            document.forms[i].oldsubmit = document.forms[i].onsubmit;
        }
        document.forms[i].onsubmit = wrestSubmit;
    }
}

// ÆûÇÊµå ÀÚµ¿°Ë»ç
$(document).ready(function(){
    // onload
    wrestInitialized();
});