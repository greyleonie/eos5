/**
 * ����selectѡ��
 * @author wangkq 
 * 
 * ���ҳ���������Ҫ��������ѡ��Ĳ�����
 *      ��ѡ��һ��ʡ��ѡ���ʡ�����ĳ���У�������һ��select�������г���ʡ�������У�������������ʡ������ѡ����
 *
 * ʹ������selectʱ����Ҫ��ʼ��һ�� Level2Select ����
 * ���������
<!-- HTML ���Ӵ��뿪ʼ -->
<form name="frm">
<select name="pSelect" onChange="myselect.changeParentSelect();">
<option value="fd">fdjk</option>
</select>
<select name="cSelect" >
</select>
<p>
<select name="ppp" onChange="our.changeParentSelect();">
<option value="fd">fdjk</option>
</select>
<select name="ccc" >
</select>
</form>

<script>
var mytable = new Array (
'02', 'ɽ��', '0532', '�ൺ',
'01', '����', '002', '����',
'02', 'ɽ��', '0531', '����',
'03', '������', '', '',
'01', '����', '001', '����', 
'01', '����', '003', '��ɽ', 
'end');

var ppTable = new Array ('01', '����', '03', '������', '02', 'ɽ��', 'end');
var ccTable = new Array ('01', '001', '����', '02', '0531', '����', '01', '002', '����',
    '02', '0532', '�ൺ', 'end');

var myselect = new Level2Select();
myselect.init("frm", "pSelect", "cSelect", mytable);

var newSelect = new Level2Select();
newSelect.init("frm", "ppp", "ccc", ppTable, ccTable);
newSelect.setNullOption(true, "ȫ��", true, "��ѡ��...");
</script>
<!-- HTML ���Ӵ������ -->

���г�ʼ�� init �����������£�
    function init(frmName, parentSelect, childSelect, parentTable, childTable)
    @param frmName select�������ڵ�FORM������
    @param parentSelect ��select���������
    @param childSelect ��select���������
    @parentTable ���б��������ͣ�
             ������б���ڣ���ʽ���£�����һ�飬�����һ��'end'Ԫ�أ���('�����1', '������1', '�����2', '������2', ... , 'end')
             ������б�û�У���ʽ���£��ĸ�һ�飬�����һ��'end'Ԫ�أ���('�����1', '������1', '�ӱ��1', '������1', '�����2', '������2', '�ӱ��2', '������2', ... , 'end')
    @childTable ���б��������Բ����ڣ����������ͣ�
             ����б���ڣ���ʽ�������£�����һ�飬�����һ��'end'Ԫ�أ��� ('�����1', '�ӱ��1', '������1', '�����1', '�ӱ��2', '������2', ... , 'end')


���select������Ҫ���Ͽյ�ѡ�����ͨ��setNullOption��������
    function setNullOption(parentNull, parentLabel, childNull, childLabel)
    @parentNull ��select�Ƿ��п�ѡ��
    @parentLabel ��select�Ŀ�ѡ�����ʾLABEL
    @childNull ��select�Ƿ��п�ѡ��������Բ����ڣ�
    @childLabel ��select�Ŀ�ѡ�����ʾLABEL���������Բ����ڣ����childNull�������ڣ�childLabel����������ڣ�

�ڸ�select�����м��� onChange�¼�������changeParentSelect�����Ϳ���ʵ����Ҫ��

����ѡ���б��е����ݿ���ͨ��
ѭ��ʹ��<bean:write ... />��list�����
<script language="JavaScript">
    var parentTable = new Array ( <bean:write ...>); ����ѭ������һ�������������
    var childTable = new Array ( <bean:write ...>); ����ѭ�����Ӽ��������������ʽ������ţ��ӱ�ţ�˵����
</script>

���磺
var parentTable = new Array (<logic:iterate id="provice" property="list[@type='province']">"<bean:write id='provice' property='province/provinceID'/>","<bean:write id='provice' property='province/provinceName'/>",</logic:iterate>"end");

�����һ��ҳ������Ҫ�������ѡ�����ֱ�Ӵ������LevelSelect����Ϳ��Խ���������

 *
 *
 */

function Level2Select() {
    this.parent;
    this.child;
    this.parentID;
    this.parentName;
    this.childID;
    this.childName;
    this.parentNum;
    this.childNum;

    this.parentNullOption;
    this.childNullOption;
    this.parentNullLabel;
    this.childNullLabel;

    this.init = init;
    this.changeParentSelect = changeParentSelect;
    this.setNullOption = setNullOption;

    /**
     * ��ʼ������select
     * @param frmName select�������ڵ�FORM������
     * @param parentSelect ��select���������
     * @param childSelect ��select���������
     * @parentTable ���б��������ͣ�
     *          ������б���ڣ���ʽ���£�����һ�飬�����һ��'end'Ԫ�أ���('�����1', '������1', '�����2', '������2', ... , 'end')
     *          ������б�û�У���ʽ���£��ĸ�һ�飬�����һ��'end'Ԫ�أ���('�����1', '������1', '�ӱ��1', '������1', '�����2', '������2', '�ӱ��2', '������2', ... , 'end')
     * @childTable ���б��������Բ����ڣ����������ͣ�
     *          ����б���ڣ���ʽ�������£�����һ�飬�����һ��'end'Ԫ�أ��� ('�����1', '�ӱ��1', '������1', '�����1', '�ӱ��2', '������2', ... , 'end')
     */
    function init(frmName, parentSelect, childSelect, parentTable, childTable) {
        this.parent = document.forms[frmName].elements[parentSelect];
        this.child = document.forms[frmName].elements[childSelect];
        this.parentID = new Array;
        this.parentName = new Array;
        this.childID = new Array;
        this.childName = new Array;
        this.parentNum = 0;
        this.childNum = 0;

        this.parentNullOption = false;
        this.childNullOption = false;
        this.parentNullLabel = "";
        this.childNullLabel = "";

        var len;
        var i, j;
        if (childTable == null) {
            len = parentTable.length - 1;
            if ((len % 4) != 0) {
                alert("��ʼ�����ݴ���");
                return;
            }
            this.childNum = Math.round(len / 4);
            for (i=0; i<len; i=i+4) {
                var pos = -1;
                for (j=0; j<this.parentID.length; j++) {
                    if (this.parentID[j] == parentTable[i]) {
                        pos = j;
                        break;
                    }
                }
                if (pos == -1) {
                    pos = this.parentID.length;
                    this.parentID[pos] = parentTable[i];
                    this.parentName[pos] = parentTable[i+1];
                    this.childID[pos] = new Array;
                    this.childName[pos] = new Array;
                }
                var pos2 = this.childID[pos].length;
                this.childID[pos][pos2] = parentTable[i+2];
                this.childName[pos][pos2] = parentTable[i+3];
            }
            this.parentNum = this.parentID.length;
        } else {
            len = parentTable.length - 1;
            if ((len % 2) != 0) {
                alert("��ʼ�����ݴ���");
                return;
            }
            this.parentNum = Math.round(len/2);
            len = childTable.length - 1;
            if ((len % 3) != 0) {
                alert("��ʼ�����ݴ���");
                return;
            }
            this.childNum = Math.round(len/2);
            for (i=0; i<this.parentNum; i++) {
                this.parentID[i] = parentTable[2*i];
                this.parentName[i] = parentTable[2*i+1];
                this.childID[i] = new Array;
                this.childName[i] = new Array;
            }
            var pos, pos2;
            for (i=0; i<this.childNum; i++) {
                pos = -1;
                for (j=0; j<this.parentNum; j++) {
                    if (this.parentID[j] == childTable[3*i]) {
                        pos = j;
                        break;
                    }
                }
                if (pos == -1) continue;
                pos2 = this.childID[pos].length;
                this.childID[pos][pos2] = childTable[3*i+1];
                this.childName[pos][pos2] = childTable[3*i+2];
            }
        }
        emptySelect(this.parent);
        emptySelect(this.child);
        for (i=0; i<this.parentNum; i++) {
            this.parent.options[i] = new Option (this.parentName[i], this.parentID[i]);
        }
        for (i=0; i<this.childID[0].length; i++) {
            this.child.options[i] = new Option (this.childName[0][i], this.childID[0][i]);
        }
        selectFirst(this.parent);
        selectFirst(this.child);
    }

    function emptySelect(mySelect) {
        var i;
        for (i=mySelect.length; i>=0; i--) {
            mySelect.options[i] = null;
        }
    }
    
    function selectFirst(mySelect) {
        if (mySelect.length > 0) {
            mySelect.options[0].selected = true;
        }
    }

    /**
     * ��������select�Ƿ��п�ѡ��
     * @parentNull ��select�Ƿ��п�ѡ��
     * @parentLabel ��select�Ŀ�ѡ�����ʾLABEL
     * @childNull ��select�Ƿ��п�ѡ��������Բ����ڣ�
     * @childLabel ��select�Ŀ�ѡ�����ʾLABEL���������Բ����ڣ����childNull�������ڣ�childLabel����������ڣ�
     */
    function setNullOption(parentNull, parentLabel, childNull, childLabel) {
        this.parentNullOption = parentNull;
        if (parentNull) {
            this.parentNullLabel = parentLabel;
        } else {
            this.parentNullLabel = "";
        }
        if (childNull == null) {
            this.childNullOption = false;
            this.childNullLabel = "";
        } else {
            this.childNullOption = childNull;
            if (childNull) {
                this.childNullLabel = childLabel;
            } else {
                this.childNullLabel = "";
            }
        }
        emptySelect(this.parent);
        var nullOption = 0;
        if (this.parentNullOption) {
            this.parent.options[0] = new Option (this.parentNullLabel, "");
            nullOption++;
        }
        for (i=0; i<this.parentNum; i++) {
            this.parent.options[i + nullOption] = new Option (this.parentName[i], this.parentID[i]);
        }
        selectFirst(this.parent);
        this.changeParentSelect();
    }
    
    function changeParentSelect() {
        var i, pos;
        emptySelect(this.child);
        var pID = this.parent.options[this.parent.selectedIndex].value;

        if (this.parentNullOption && (pID == "")) {
            if (this.childNullOption) {
                this.child.options[0] = new Option (this.childNullLabel, "");
            } else {
                this.child.options[0] = new Option ("", "");
            }
            selectFirst(this.child);
            return;
        }

        pos = -1;
        for (i=0; i<this.parentNum; i++) {
            if (this.parentID[i] == pID) {
                pos = i;
                break;
            }
        }
        if (pos == -1 ) {
            this.child.options[0] = new Option ("", "");
            this.child.options[0].selected = true;
            return;
        }

        var nullOption = 0;
        if (this.childNullOption) {
            this.child.options[0] = new Option (this.childNullLabel, "");
            nullOption++;
        }
        for (i=0; i<this.childID[pos].length; i++) {
            this.child.options[i + nullOption] = new Option (this.childName[pos][i], this.childID[pos][i]);
        }
        selectFirst(this.child);
    }
}
