/**
 * 两级select选项
 * @author wangkq 
 * 
 * 解决页面操作中需要进行两级选项的操作，
 *      如选择一个省后选择该省下面的某个市，在另外一个select对象中列出该省的所有市，而不能有其他省的市在选项中
 *
 * 使用两级select时候需要初始化一个 Level2Select 对象
 * 如下面代码
<!-- HTML 例子代码开始 -->
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
'02', '山东', '0532', '青岛',
'01', '辽宁', '002', '大连',
'02', '山东', '0531', '济南',
'03', '黑龙江', '', '',
'01', '辽宁', '001', '沈阳', 
'01', '辽宁', '003', '鞍山', 
'end');

var ppTable = new Array ('01', '辽宁', '03', '黑龙江', '02', '山东', 'end');
var ccTable = new Array ('01', '001', '沈阳', '02', '0531', '济南', '01', '002', '大连',
    '02', '0532', '青岛', 'end');

var myselect = new Level2Select();
myselect.init("frm", "pSelect", "cSelect", mytable);

var newSelect = new Level2Select();
newSelect.init("frm", "ppp", "ccc", ppTable, ccTable);
newSelect.setNullOption(true, "全部", true, "请选择...");
</script>
<!-- HTML 例子代码结束 -->

其中初始化 init 函数参数如下：
    function init(frmName, parentSelect, childSelect, parentTable, childTable)
    @param frmName select对象所在地FORM的名称
    @param parentSelect 父select对象的名称
    @param childSelect 子select对象的名称
    @parentTable 父列表，数组类型，
             如果子列表存在，格式如下（两个一组，最后有一个'end'元素）：('父编号1', '父名称1', '父编号2', '父名称2', ... , 'end')
             如果子列表没有，格式如下（四个一组，最后有一个'end'元素）：('父编号1', '父名称1', '子编号1', '子名称1', '父编号2', '父名称2', '子编号2', '子名称2', ... , 'end')
    @childTable 子列表（参数可以不存在），数组类型，
             如果列表存在，格式依次如下（三个一组，最后有一个'end'元素）： ('父编号1', '子编号1', '父名称1', '父编号1', '子编号2', '父名称2', ... , 'end')


如果select对象需要加上空的选项，可以通过setNullOption进行设置
    function setNullOption(parentNull, parentLabel, childNull, childLabel)
    @parentNull 父select是否有空选项
    @parentLabel 父select的空选项的显示LABEL
    @childNull 子select是否有空选项（参数可以不存在）
    @childLabel 子select的空选项的显示LABEL（参数可以不存在，如果childNull参数存在，childLabel参数必须存在）

在父select对象中加上 onChange事件，调用changeParentSelect方法就可以实现需要了

对于选项列表中的数据可以通过
循环使用<bean:write ... />从list中输出
<script language="JavaScript">
    var parentTable = new Array ( <bean:write ...>); 采用循环将父一级的内容输出，
    var childTable = new Array ( <bean:write ...>); 采用循环将子级的内容输出，格式：父编号，子编号，说明。
</script>

例如：
var parentTable = new Array (<logic:iterate id="provice" property="list[@type='province']">"<bean:write id='provice' property='province/provinceID'/>","<bean:write id='provice' property='province/provinceName'/>",</logic:iterate>"end");

如果在一个页面中需要多个两级选项，可以直接创建多个LevelSelect对象就可以解决这个问题

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
     * 初始化两级select
     * @param frmName select对象所在地FORM的名称
     * @param parentSelect 父select对象的名称
     * @param childSelect 子select对象的名称
     * @parentTable 父列表，数组类型，
     *          如果子列表存在，格式如下（两个一组，最后有一个'end'元素）：('父编号1', '父名称1', '父编号2', '父名称2', ... , 'end')
     *          如果子列表没有，格式如下（四个一组，最后有一个'end'元素）：('父编号1', '父名称1', '子编号1', '子名称1', '父编号2', '父名称2', '子编号2', '子名称2', ... , 'end')
     * @childTable 子列表（参数可以不存在），数组类型，
     *          如果列表存在，格式依次如下（三个一组，最后有一个'end'元素）： ('父编号1', '子编号1', '父名称1', '父编号1', '子编号2', '父名称2', ... , 'end')
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
                alert("初始化数据错误！");
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
                alert("初始化数据错误！");
                return;
            }
            this.parentNum = Math.round(len/2);
            len = childTable.length - 1;
            if ((len % 3) != 0) {
                alert("初始化数据错误！");
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
     * 设置两级select是否有空选项
     * @parentNull 父select是否有空选项
     * @parentLabel 父select的空选项的显示LABEL
     * @childNull 子select是否有空选项（参数可以不存在）
     * @childLabel 子select的空选项的显示LABEL（参数可以不存在，如果childNull参数存在，childLabel参数必须存在）
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
