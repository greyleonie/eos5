<%@include file="/internet/common.jsp"%>
<script>
   var listName = "booklist/TextbookInventory[@hciTagIndex='";
   var listNameOther = "booklistother/TextbookInventory[@hciTagIndex='";
   var index = <bean:write property="InventoryUtil/Index"/>;
   var frm=parent.document.forms["opeForm"];
   var Entry_name=listName +index +"']/Entry";
   var Delivery_name=listName +index +"']/Delivery";
   var NomialNum_name=listNameOther +index +"']/NominalNum";   //’ √Êø‚¥Ê
   var BalanceNum_name=listNameOther +index +"']/BalanceNum"; //≤Ó∂Ó
   
  

   var Entry_value = <bean:write property="InventoryUtil/Entry"/>;
   var Delivery_value = <bean:write property="InventoryUtil/Delivery"/>;
   var Balance_value = <bean:write property="InventoryUtil/Balance"/>;
   var StockNum_value = <bean:write property="InventoryUtil/StockNum"/>;
   
   
   var NomialNum_value = 0;
   var BalanceNum_value = 0;
   
   NomialNum_value = Balance_value + Entry_value - Delivery_value;
   BalanceNum_value = StockNum_value - NomialNum_value;
 

   
  



  frm.elements[Entry_name].value = Entry_value;
  frm.elements[Delivery_name].value = Delivery_value;
  frm.elements[BalanceNum_name].value = BalanceNum_value;
  frm.elements[NomialNum_name].value = NomialNum_value;

 

  
</script>