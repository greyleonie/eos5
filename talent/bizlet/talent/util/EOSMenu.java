package talent.util;
import org.w3c.dom.*;

import com.primeton.tp.core.api.BizContext;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-5-15
 * @class_displayName EOSMenu
 */

public class EOSMenu {

	private String menuID;
	private String menuName;
	private String menuAction;
	private String menuLabel;
	private String menuView;
	private String isLeaf;
	private int menuLevel;
	private String rootID;
	private String parentsID;
	private int displayOrder;
	private String inputValue;
	private String inputKey;
	private String remark;
	
	public EOSMenu(){
		
	}
	
	/**
	 * @return ���� displayOrder��
	 */
	public int getDisplayOrder() {
		return displayOrder;
	}
	/**
	 * @param displayOrder Ҫ���õ� displayOrder��
	 */
	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}
	/**
	 * @return ���� inputKey��
	 */
	public String getInputKey() {
		return inputKey;
	}
	/**
	 * @param inputKey Ҫ���õ� inputKey��
	 */
	public void setInputKey(String inputKey) {
		this.inputKey = inputKey;
	}
	/**
	 * @return ���� inputValue��
	 */
	public String getInputValue() {
		return inputValue;
	}
	/**
	 * @param inputValue Ҫ���õ� inputValue��
	 */
	public void setInputValue(String inputValue) {
		this.inputValue = inputValue;
	}
	/**
	 * @return ���� isLeaf��
	 */
	public String getIsLeaf() {
		return isLeaf;
	}
	/**
	 * @param isLeaf Ҫ���õ� isLeaf��
	 */
	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}
	/**
	 * @return ���� menuAction��
	 */
	public String getMenuAction() {
		return menuAction;
	}
	/**
	 * @param menuAction Ҫ���õ� menuAction��
	 */
	public void setMenuAction(String menuAction) {
		this.menuAction = menuAction;
	}
	/**
	 * @return ���� menuID��
	 */
	public String getMenuID() {
		return menuID;
	}
	/**
	 * @param menuID Ҫ���õ� menuID��
	 */
	public void setMenuID(String menuID) {
		this.menuID = menuID;
	}
	/**
	 * @return ���� menuLabel��
	 */
	public String getMenuLabel() {
		return menuLabel;
	}
	/**
	 * @param menuLabel Ҫ���õ� menuLabel��
	 */
	public void setMenuLabel(String menuLabel) {
		this.menuLabel = menuLabel;
	}
	/**
	 * @return ���� menuLevel��
	 */
	public int getMenuLevel() {
		return menuLevel;
	}
	/**
	 * @param menuLevel Ҫ���õ� menuLevel��
	 */
	public void setMenuLevel(int menuLevel) {
		this.menuLevel = menuLevel;
	}
	/**
	 * @return ���� menuName��
	 */
	public String getMenuName() {
		return menuName;
	}
	/**
	 * @param menuName Ҫ���õ� menuName��
	 */
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	/**
	 * @return ���� menuView��
	 */
	public String getMenuView() {
		return menuView;
	}
	/**
	 * @param menuView Ҫ���õ� menuView��
	 */
	public void setMenuView(String menuView) {
		this.menuView = menuView;
	}
	/**
	 * @return ���� parentsID��
	 */
	public String getParentsID() {
		return parentsID;
	}
	/**
	 * @param parentsID Ҫ���õ� parentsID��
	 */
	public void setParentsID(String parentsID) {
		this.parentsID = parentsID;
	}
	/**
	 * @return ���� remark��
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark Ҫ���õ� remark��
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * @return ���� rootID��
	 */
	public String getRootID() {
		return rootID;
	}
	/**
	 * @param rootID Ҫ���õ� rootID��
	 */
	public void setRootID(String rootID) {
		this.rootID = rootID;
	}
}