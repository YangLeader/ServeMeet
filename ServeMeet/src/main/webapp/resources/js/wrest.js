var wrestMsg = "";
var wrestFld = null;
var wrestFldDefaultColor = "";
//var wrestFldBackColor = "#ff3061";

// subject �Ӽ����� ��� return, ������ tag�� name�� �ѱ�
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

// ���� ���� ���ֱ�
function wrestTrim(fld)
{
    var pattern = /(^\s+)|(\s+$)/g; // \s ���� ����
    return fld.value.replace(pattern, "");
}

// �ʼ� �Է� �˻�
function wrestRequired(fld)
{
    if (wrestTrim(fld) == "") {
        if (wrestFld == null) {
            // ����Ʈ�ڽ��� ��쿡�� �ʼ� ���� �˻��մϴ�.
            wrestMsg = wrestItemname(fld) + " : �ʼ� "+(fld.type=="select-one"?"����":"�Է�")+"�Դϴ�.\n";
            wrestFld = fld;
        }
    }
}

// �輱�� 2006.3 - ��ȭ��ȣ(�޴���) ���� �˻� : 123-123(4)-5678
function wrestTelNum(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
    if(!pattern.test(fld.value)){
        if(wrestFld == null){
            wrestMsg = wrestItemname(fld)+" : ��ȭ��ȣ ������ �ùٸ��� �ʽ��ϴ�.\n\n������(-)�� �����Ͽ� �Է��ϼ���.\n";
            wrestFld = fld;
            fld.select();
        }
    }
}

// �̸����ּ� ���� �˻�
function wrestEmail(fld)
{
    if (!wrestTrim(fld)) return;

    //var pattern = /(\S+)@(\S+)\.(\S+)/; �̸����ּҿ� �ѱ� ����
    var pattern = /([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)\.([0-9a-zA-Z_-]+)/;
    if (!pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + " : �̸����ּ� ������ �ƴմϴ�.\n";
            wrestFld = fld;
        }
    }
}

// �ѱ����� �˻� (����, ���� ���յ� �ѱ۸� ����)
function wrestHangul(fld)
{
    if (!wrestTrim(fld)) return;

    //var pattern = /([^��-�R\x20])/i;
    var pattern = /([^��-�R\x20])/;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : �ѱ��� �ƴմϴ�. (����, ���� ���յ� �ѱ۸� ����)\n';
            wrestFld = fld;
        }
    }
}

// �ѱ����� �˻�2 (����, ������ �ִ� �ѱ۵� ����)
function wrestHangul2(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /([^��-�R��-����-��\x20])/i;
    //var pattern = /([^��-�R��-����-��\x20])/;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : �ѱ��� �ƴմϴ�.\n';
            wrestFld = fld;
        }
    }
}

// �ѱ�,����,�������� �˻�3
function wrestHangulAlNum(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /([^��-�R\x20^a-z^A-Z^0-9])/i;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : �ѱ�, ����, ���ڰ� �ƴմϴ�.\n';
            wrestFld = fld;
        }
    }
}

// �ѱ�,���� ���� �˻�
function wrestHangulAlpha(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /([^��-�R\x20^a-z^A-Z])/i;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : �ѱ�, ������ �ƴմϴ�.\n';
            wrestFld = fld;
        }
    }
}

// ���������˻�
// ��θ��ܲ��̴� �߰� (http://dasir.com) 2003-06-24
function wrestNumeric(fld)
{
    if (fld.value.length > 0) {
        for (i = 0; i < fld.value.length; i++) {
            if (fld.value.charAt(i) < '0' || fld.value.charAt(i) > '9') {
                wrestMsg = wrestItemname(fld) + " : ���ڰ� �ƴմϴ�.\n";
                wrestFld = fld;
            }
        }
    }
}

// ������ �˻�
// ��θ��ܲ��̴� �߰� (http://dasir.com) 2003-06-24
function wrestAlpha(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /(^[a-zA-Z]+$)/;

    if (!pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + " : ������ �ƴմϴ�.\n";
            wrestFld = fld;
        }
    }
}

// �����ڿ� ���� �˻�
// ��θ��ܲ��̴� �߰� (http://dasir.com) 2003-07-07
function wrestAlNum(fld)
{
   if (!wrestTrim(fld)) return;

   var pattern = /(^[a-zA-Z0-9]+$)/;

   if (!pattern.test(fld.value)) {
       if (wrestFld == null) {
           wrestMsg = wrestItemname(fld) + " : ���� �Ǵ� ���ڰ� �ƴմϴ�.\n";
           wrestFld = fld;
       }
   }
}

// �����ڿ� ���� �׸��� _ �˻�
function wrestAlNum_(fld)
{
   if (!wrestTrim(fld)) return;

   var pattern = /(^[a-zA-Z0-9\_]+$)/;

   if (!pattern.test(fld.value)) {
       if (wrestFld == null) {
           wrestMsg = wrestItemname(fld) + " : ����, ����, _ �� �ƴմϴ�.\n";
           wrestFld = fld;
       }
   }
}

// �ּ� ���� �˻�
function wrestMinLength(fld)
{
    if (!wrestTrim(fld)) return;

    var minlength = fld.getAttribute("minlength");

    if (wrestFld == null) {
        if (fld.value.length < parseInt(minlength)) {
            wrestMsg = wrestItemname(fld) + " : �ּ� "+minlength+"���� �̻� �Է��ϼ���.\n";
            wrestFld = fld;
        }
    }
}

// �̹��� Ȯ����
function wrestImgExt(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /\.(gif|jpg|png)$/i; // jpeg �� ����
    if(!pattern.test(fld.value)){
        if(wrestFld == null){
            wrestMsg = wrestItemname(fld)+" : �̹��� ������ �ƴմϴ�.\n.gif .jpg .png ���ϸ� �����մϴ�.\n";
            wrestFld = fld;
            fld.select();
        }
    }
}

// Ȯ����
function wrestExtension(fld, css)
{
    if (!wrestTrim(fld)) return;

    var str = css.split("="); // ext=?? <-- str[1]
    var src = fld.value.split(".");
    var ext = src[src.length - 1];

    if (wrestFld == null) {
        if (ext.toLowerCase() < str[1].toLowerCase()) {
            wrestMsg = wrestItemname(fld) + " : ."+str[1]+" ���ϸ� �����մϴ�.\n";
            wrestFld = fld;
        }
    }
}

// ���� �˻��� ������ "" �� ��ȯ
function wrestNospace(fld)
{
    var pattern = /(\s)/g; // \s ���� ����

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + " : ������ ����� �մϴ�.\n";
            wrestFld = fld;
        }
    }
}

// submit �� �� �Ӽ��� �˻��Ѵ�.
function wrestSubmit()
{
    wrestMsg = "";
    wrestFld = null;

    var attr = null;

    // �ش����� ���� ����� ������ŭ ������
    for (var i=0; i<this.elements.length; i++) {
        var el = this.elements[i];

        // Input tag �� type �� text, file, password �϶���
        // ����Ʈ �ڽ��϶��� �ʼ� ���� �˻��մϴ�. select-one
        if (el.type=="text" || el.type=="hidden" || el.type=="file" || el.type=="password" || el.type=="select-one" || el.type=="textarea") {
            if (el.getAttribute("required") != null) {
                wrestRequired(el);
            }

            if (el.getAttribute("minlength") != null) {
                wrestMinLength(el);
            }

            var array_css = el.className.split(" "); // class �� �������� ����

            el.style.backgroundColor = wrestFldDefaultColor;

            // �迭�� ���̸�ŭ ������
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
                    case "telnum"       : wrestTelNum(el); break; // �輱�� 2006.3 - ��ȭ��ȣ ���� �˻�
                    case "imgext"       : wrestImgExt(el); break;
                    default :
                        if (/^extension\=/.test(css)) {
                            wrestExtension(el, css); break;
                        }
                } // switch (css)
            } // for (k)
        } // if (el)
    } // for (i)

    // �ʵ尡 null �� �ƴ϶�� �����޼��� ����� ��Ŀ���� �ش� ���� �ʵ�� �ű�
    // ���� �ʵ�� �������� �ٲ۴�.
    if (wrestFld != null) {
        // ���޼��� ���
        alert(wrestMsg);

        if (wrestFld.style.display != "none") {
            var id = wrestFld.getAttribute("id");

            // �����޼����� ���� element �߰�
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


// �ʱ⿡ onsubmit�� ����ä���� �Ѵ�.
function wrestInitialized()
{
    for (var i = 0; i < document.forms.length; i++) {
        // onsubmit �̺�Ʈ�� �ִٸ� ������ ���´�.
        if (document.forms[i].onsubmit) {
            document.forms[i].oldsubmit = document.forms[i].onsubmit;
        }
        document.forms[i].onsubmit = wrestSubmit;
    }
}

// ���ʵ� �ڵ��˻�
$(document).ready(function(){
    // onload
    wrestInitialized();
});