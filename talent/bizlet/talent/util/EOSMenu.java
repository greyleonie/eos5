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
	 * @return 返回 displayOrder。
	 */
	public int getDisplayOrder() {
		return displayOrder;
	}
	/**
	 * @param displayOrder 要设置的 displayOrder。
	 */
	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}
	/**
	 * @return 返回 inputKey。
	 */
	public String getInputKey() {
		return inputKey;
	}
	/**
	 * @param inputKey 要设置的 inputKey。
	 */
	public void setInputKey(String inputKey) {
		this.inputKey = inputKey;
	}
	/**
	 * @return 返回 inputValue。
	 */
	public String getInputValue() {
		return inputValue;
	}
	/**
	 * @param inputValue 要设置的 inputValue。
	 */
	public void setInputValue(String inputValue) {
		this.inputValue = inputValue;
	}
	/**
	 * @return 返回 isLeaf。
	 */
	public String getIsLeaf() {
		return isLeaf;
	}
	/**
	 * @param isLeaf 要设置的 isLeaf。
	 */
	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}
	/**
	 * @return 返回 menuAction。
	 */
	public String getMenuAction() {
		return menuAction;
	}
	/**
	 * @param menuAction 要设置的 menuAction。
	 */
	public void setMenuAction(String menuAction) {
		this.menuAction = menuAction;
	}
	/**
	 * @return 返回 menuID。
	 */
	public String getMenuID() {
		return menuID;
	}
	/**
	 * @param menuID 要设置的 menuID。
	 */
	public void setMenuID(String menuID) {
		this.menuID = menuID;
	}
	/**
	 * @return 返回 menuLabel。
	 */
	public String getMenuLabel() {
		return menuLabel;
	}
	/**
	 * @param menuLabel 要设置的 menuLabel。
	 */
	public void setMenuLabel(String menuLabel) {
		this.menuLabel = menuLabel;
	}
	/**
	 * @return 返回 menuLevel。
	 */
	public int getMenuLevel() {
		return menuLevel;
	}
	/**
	 * @param menuLevel 要设置的 menuLevel。
	 */
	public void setMenuLevel(int menuLevel) {
		this.menuLevel = menuLevel;
	}
	/**
	 * @return 返回 menuName。
	 */
	public String getMenuName() {
		return menuName;
	}
	/**
	 * @param menuName 要设置的 menuName。
	 */
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	/**
	 * @return 返回 menuView。
	 */
	public String getMenuView() {
		return menuView;
	}
	/**
	 * @param menuView 要设置的 menuView。
	 */
	public void setMenuView(String menuView) {
		this.menuView = menuView;
	}
	/**
	 * @return 返回 parentsID。
	 */
	public String getParentsID() {
		return parentsID;
	}
	/**
	 * @param parentsID 要设置的 parentsID。
	 */
	public void setParentsID(String parentsID) {
		this.parentsID = parentsID;
	}
	/**
	 * @return 返回 remark。
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark 要设置的 remark。
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * @return 返回 rootID。
	 */
	public String getRootID() {
		return rootID;
	}
	/**
	 * @param rootID 要设置的 rootID。
	 */
	public void setRootID(String rootID) {
		this.rootID = rootID;
	}
}