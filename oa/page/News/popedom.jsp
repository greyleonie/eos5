

  <link rel="stylesheet" type="text/css"  href="/internet/ext/resources/css/ext-all.css">
  
    <script type="text/javascript" src="/internet/ext/adapter/ext/ext-base.js"></script>
	<script type="text/javascript" src="/internet/ext/ext-all.js"></script>
<script>

Ext.onReady(function(btn){
Ext.Msg.show({
   title:'提示',
   msg: '正在加载...',
   msg: '您只能修改和删除您本部门信息',
   buttons: Ext.Msg.OK,
   fn:ref,
   icon: Ext.MessageBox.QUESTION
  
 
});
   
});
function ref(){
 history.go(-1);
  
}
</script>
