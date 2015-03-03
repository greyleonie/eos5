<%@include file="/internet/common.jsp"%>
<script>
var frm=parent.document.forms["opeForm"];
 frm.elements["NumField/field1"].value = <bean:write property="WorkLoad/Num1"/>;
 frm.elements["NumField/field2"].value = <bean:write property="WorkLoad/Num2"/>;
 frm.elements["NumField/field3"].value = <bean:write property="WorkLoad/Num3"/>;
 frm.elements["NumField/field4"].value = <bean:write property="WorkLoad/Num4"/>;
 frm.elements["NumField/field7"].value = <bean:write property="WorkLoad/Num7"/>;
 frm.elements["NumField/field12"].value = 0;
 frm.elements["NumField/field13"].value = 0;
 frm.elements["WorkLoadCollect/LessonJB1"].value = 0;
 frm.elements["WorkLoadCollect/LessonJB2"].value = 0;
 frm.elements["WorkLoadCollect/LessonJB3"].value = 0;


</script>