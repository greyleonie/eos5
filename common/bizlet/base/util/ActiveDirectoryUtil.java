package base.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.BasicAttribute;
import javax.naming.directory.BasicAttributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.ModificationItem;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

public class ActiveDirectoryUtil {

	private DirContext ctx;

	// private String ldapCtxFactory = "com.sun.jndi.ldap.LdapCtxFactory";
	// private String baseDN = ",OU=IDSGroups,DC=data,DC=gzswdx,DC=gov,DC=cn";
	// private String serverIP = "192.168.0.202";
	// private String domain = "data.gzswdx.gov.cn";
	// private String port = "636";
	// private String authUserName = "Administrator";
	// private String authPassword = "thisisdx_server1`";
	// private String authMode = "simple";
	// private String authProtocol = "ssl";
	// private String keyStore =
	// "D:/Program Files/Java/jdk/bin/ActiveDirectory4EOS.keystore";
	// private String keyPassword = "37665163";
	private String ldapCtxFactory;

	private String baseDN;

	private String serverIP;

	private String domain;

	private String port;

	private String authUserName;

	private String authPassword;

	private String authMode;

	private String authProtocol;

	private String keyStore;

	private String keyPassword;

	public ActiveDirectoryUtil() throws IOException, NamingException {
		initProps();
		initCtx();
	}

	private void initProps() throws IOException {
		Properties cfgProps = new Properties();
		// cfgProps.load(ActiveDirectoryUtil.class
		// .getResourceAsStream("/ldap4eos.properties"));
		InputStream in = new BufferedInputStream(new FileInputStream(
				"D:\\primeton\\eosserver\\config\\ldap4eos.properties"));
		cfgProps.load(in);
		ldapCtxFactory = cfgProps.getProperty("ldapCtxFactory");
		baseDN = cfgProps.getProperty("baseDN");
		serverIP = cfgProps.getProperty("serverIP");
		domain = cfgProps.getProperty("domain");
		port = cfgProps.getProperty("port");
		authUserName = cfgProps.getProperty("authUserName");
		authPassword = cfgProps.getProperty("authPassword");
		authMode = cfgProps.getProperty("authMode");
		authProtocol = cfgProps.getProperty("authProtocol");
		keyStore = cfgProps.getProperty("keyStore");
		keyPassword = cfgProps.getProperty("keyPassword");
	}

	private void initCtx() throws NamingException {
		Hashtable env = new Hashtable();
		System.setProperty("javax.net.ssl.trustStore", keyStore);
		System.setProperty("javax.net.ssl.trustStorePassword", keyPassword);
		env.put(Context.INITIAL_CONTEXT_FACTORY, ldapCtxFactory);
		env.put(Context.SECURITY_PROTOCOL, authProtocol);
		env.put(Context.PROVIDER_URL, "ldap://" + serverIP + ":" + port);
		env.put(Context.SECURITY_AUTHENTICATION, authMode);
		env.put(Context.SECURITY_PRINCIPAL, authUserName + "@" + domain);
		env.put(Context.SECURITY_CREDENTIALS, authPassword);
		ctx = new InitialDirContext(env);
	}

	public void closeDirContext() throws NamingException {
		if (ctx != null)
			ctx.close();
	}

	public void createUser(String userName, String displayName,
			String password, String department) throws NamingException {
		String distinguishedName = "CN=" + userName + ",OU=" + department
				+ baseDN;
		Attributes attrs = new BasicAttributes(true);
		Attribute attr = new BasicAttribute("objectClass");
		attr.add("top");
		attr.add("person");
		attr.add("organizationalperson");
		attr.add("user");
		attr.add("inetOrgPerson");
		attr.add("idsUser");
		attrs.put(attr);
		attrs.put(new BasicAttribute("idsUN", userName));
		attrs.put(new BasicAttribute("actived", "TRUE"));
		attrs.put(new BasicAttribute("idsSignature", getUUID()));
		attrs.put(new BasicAttribute("userRole", "0"));
		attrs.put(new BasicAttribute("ou", department));
		attrs.put(new BasicAttribute("sAMAccountName", userName));
		attrs.put(new BasicAttribute("userPrincipalName", userName + "@"
				+ domain));
		attrs.put(new BasicAttribute("cn", userName));
		attrs.put(new BasicAttribute("sn", userName));
		attrs.put(new BasicAttribute("givenName", displayName));
		attrs.put(new BasicAttribute("displayName", displayName));
		attrs.put(new BasicAttribute("userPassword", password));
		attrs.put(new BasicAttribute("userAccountControl", Integer
				.toString(0x10200)));
		ctx.createSubcontext(distinguishedName, attrs);
	}

	public void updateUserAttributes(String userName, String department,
			String attributeName, String value) throws NamingException {
		ModificationItem[] mods = new ModificationItem[1];
		mods[0] = new ModificationItem(DirContext.REPLACE_ATTRIBUTE,
				new BasicAttribute(attributeName, value));
		ctx.modifyAttributes("cn=" + userName + ",OU=" + department + baseDN,
				mods);
	}

	public void updateUserPassword(String userName, String password,
			String department) throws UnsupportedEncodingException,
			NamingException {
		ModificationItem[] mods = new ModificationItem[3];
		String quotedPassword = "\"" + password + "\"";
		byte newUnicodePassword[] = quotedPassword.getBytes("UTF-16LE");
		mods[0] = new ModificationItem(DirContext.REPLACE_ATTRIBUTE,
				new BasicAttribute("userPassword", password));
		mods[1] = new ModificationItem(DirContext.REPLACE_ATTRIBUTE,
				new BasicAttribute("unicodePwd", newUnicodePassword));
		mods[2] = new ModificationItem(DirContext.REPLACE_ATTRIBUTE,
				new BasicAttribute("userAccountControl", Integer
						.toString(0x10200)));
		ctx.modifyAttributes("CN=" + userName + ",OU=" + department + baseDN,
				mods);
	}

	public Map queryUserAttribute(String userName, String department)
			throws NamingException {
		Map attrsMap = new HashMap();
		Attributes attributes = null;
		DirContext obj = (DirContext) ctx.lookup("CN=" + userName + ",OU="
				+ department + baseDN);
		attributes = obj.getAttributes("");
		for (NamingEnumeration ae = attributes.getAll(); ae.hasMoreElements();) {
			Attribute attr = (Attribute) ae.next();
			String attrId = attr.getID();
			for (NamingEnumeration vals = attr.getAll(); vals.hasMore();) {
				String thing = vals.next().toString();
				System.out.println(attrId + ": " + thing);
			}
		}
		return attrsMap;
	}

	public void queryUserAllAttribute(String userName) throws NamingException {
		SearchControls searchCtls = new SearchControls();
		searchCtls.setSearchScope(SearchControls.SUBTREE_SCOPE);
		String searchFilter = "(&(objectClass=idsUser)(cn=" + userName + "))";
		String searchBase = baseDN.substring(1);
		int totalResults = 0;
		String returnedAtts[] = { "accountExpires", "accountNameHistory",
				"aCSPolicyName", "actived", "badPasswordTime", "adminCount",
				"adminDescription", "adminDisplayName", "allowedAttributes",
				"allowedAttributesEffective", "allowedChildClasses",
				"allowedChildClassesEffective", "altSecurityIndentities",
				"assistant", "attributeCertificateAttribute", "audio",
				"badPasswordTime", "badPwdCount", "bridgeheadServerListBL",
				"businessCategory", "c", "canonicalName", "carLicense", "cn",
				"co", "codePage", "comment", "company", "controlAccessRights",
				"countryCode", "createTimeStamp", "dBCSPwd",
				"defaultClassStore", "department", "departmentNumber",
				"description", "desktopProfile", "destinationIndicator",
				"directReports", "displayName", "displayNamePrintable",
				"distinguishedName", "division", "dSASignature",
				"dSCorePropagationData", "dynamicLDAPServer", "employeeID",
				"employeeNumber", "employeeType", "extensionName",
				"facsimileTelephoneNumber", "flags", "fromEntry",
				"frsComputerReferenceBL", "fRSMemberReferenceBL",
				"fSMORoleOwner", "garbageCollPeriod", "gecos",
				"generationQualifier", "gidNumber", "givenName",
				"groupMembershipSAM", "groupPriority", "groupsToIgnore",
				"homeDirectory", "homeDrive", "homePhone", "homePostalAddress",
				"houseIdentifier", "idsSignatrue", "idsUN", "info", "initials",
				"instanceType", "internationalISDNNumber", "ipPhone",
				"isCriticalSystemObject", "isDeleted", "isPrivilegeHolder",
				"jpegPhoto", "l", "labeledURI", "lastKnownParent",
				"lastLogoff", "lastLogon", "lastLogonTimestamp",
				"legacyExchangeDN", "lmPwdHistory", "localeID", "lockoutTime",
				"loginShell", "logonCount", "logonHours", "logonWorkstation",
				"mail", "manageObjects", "manager", "masteredBy", "maxStorage",
				"memberOf", "mhsORAddress", "middleName", "mobile",
				"modifyTimeStamp", "msCOM-PartitionSetLink", "msCOM-UserLink",
				"msCOM-UserPartitionSetLink", "msDFSR-ComputerReferenceBL",
				"msCOM-MemberReferenceBL", "msDRM-IdentityCertificate",
				"msDS-AllowedToDelegateTo", "msDS-Approx-Immed-Subordinates",
				"msDS-AuthenticatedAtDC", "msDS-AuthenticatedToAccountlist",
				"msDS-Cached-Membership", "msDS-Cached-Membership-Time-Stamp",
				"mS-DS-ConsistencyChildCount", "mS-DS-ConsistencyGuid",
				"mS-DS-CreatorSID", "msDS-FailedInteractiveLogonCount",
				"msDS-FailedInteractiveLogonCountAtLastSuccessfulLogon",
				"msDS-HABSeniorityIndex", "msDS-IsDomainFor",
				"msDS-IsFullReplicaFor", "msDS-IsPartialReplicaFor",
				"msDS-KeyVersionNumber", "msDS-KrbTgtLinkBl",
				"msDS-LastFailedInteractiveLogonTime",
				"msDS-LastSuccessfulInteractiveLogonTime", "msDs-masteredBy",
				"msDS-MembersForAzRoleBL", "msDS-NCReplCursors",
				"msDS-NCReplInboundNeighbors", "msDS-NCReplOutboundNeighbors",
				"msDS-NC-RO-Replica-Locations-BL", "msDS-NcType",
				"msDS-NonMembersBL", "msDS-ObjectReferenceBL",
				"msDS-OperationsForAzRoleBL", "msDS-OperationsForAzTaskBL",
				"msDS-PhoneticCompanyName", "msDS-PhoneticDepartment",
				"msDS-PhoneticDisplayName", "msDS-PhoneticFirstName",
				"msDS-PhoneticLastName", "msDS-PrincipalName",
				"msDS-PSOApplied", "msDS-ReplAttributeMetaData",
				"msDS-ReplValueMetaData", "msDS-ResultantPSO",
				"msDS-RevealedDSAs", "msDS-RevealedListBL",
				"msDS-SecondaryKrbTgtNumber", "msDS-Site-Affinity",
				"msDS-SourceObjectDN", "msDS-SupportedEncryptionTypes",
				"msDS-TasksForAzRoleBL", "msDS-TasksForAzTaskBL",
				"msDS-User-Account-Control-Computed",
				"msDS-UserPasswordExpiryTimeComputed", "msExchAssistantName",
				"msExchHouseIdentifier", "msExchLabeledURI", "msIIS-FTPDir",
				"msIIS-FTPRoot", "mSMQDigests", "mSMQDigestsMig",
				"mSMQSignCertificates", "mSMQSignCertificatesMig",
				"msNPAllowDialin", "msNPCallingStationID",
				"msNPSavedCallingStationID", "msPKIDPAPIMasterKeys",
				"msPKIRoamingTimeStamp", "msRADIUSCallbackNumber",
				"msRADIUS-FramedInterfaceId", "msRADIUSFramedIPAddress",
				"msRADIUS-FramedIpv6Prefix", "msRADIUS-FramedIpv6Route",
				"msRADIUSFramedRoute", "msRADIUS-SavedFramedInterfaceId",
				"msRADIUS-SavedFramedIpv6Prefix",
				"msRADIUS-SavedFramedIpv6Route", "msRADIUSServiceType",
				"msRASSavedCallbackNumber", "msRASSavedFramedIPAddress",
				"msRASSavedFramedRoute", "msSFU30Name", "msSFU30NisDomain",
				"msSFU30PosixMemberOf", "msTSAllowLogon",
				"msTSBrokenConnectionAction", "msTSConnectClientDrives",
				"msTSConnectPrinterDrives", "msTSDefaultToMainPrinter",
				"msTSExpireDate", "msTSExpireDate2", "msTSExpireDate3",
				"msTSExpireDate4", "msTSHomeDirectory", "msTSHomeDrive",
				"msTSInitialProgram", "msTSLicenseVersion",
				"msTSLicenseVersion2", "msTSLicenseVersion3",
				"msTSLicenseVersion4", "msTSLSProperty01", "msTSLSProperty02",
				"msTSManagingLS", "msTSManagingLS2", "msTSManagingLS3",
				"msTSManagingLS4", "msTSMaxConnectionTime",
				"msTSMaxDisconnectionTime", "msTSMaxIdleTime",
				"msTSProfilePath", "msTSProperty01", "msTSProperty02",
				"msTSReconnectionAction", "msTSRemoteControl",
				"msTSWorkDirectory", "name", "netbootSCPBL", "networkAddress",
				"nonSecurityMemberBL", "ntPwdHistory", "o", "",
				"objectCategory", "objectClass", "objectGUID", "objectSid",
				"objectVersion", "operatorCount",
				"otherFacsimileTelephoneNumber", "otherHomePhone",
				"otherIpPhone", "otherLoginWorkstations", "otherMailbox",
				"otherMobile", "otherPager", "otherTelephone",
				"otherWellKnownObjects", "ou", "ownerBL", "pager",
				"partialAttributeDeletionList", "partialAttributeSet",
				"personalTitle", "photo", "physicalDeliveryOfficeName",
				"possibleInferiors", "postalAddress", "postalCode",
				"postOfficeBox", "preferredDeliveryMethod",
				"preferredLanguage", "preferredOU", "primaryGroupID",
				"primaryInternationalISDNNumber", "primaryTelexNumber",
				"profilePath", "proxiedObjectName", "proxyAddresses",
				"pwdLastSet", "queryPolicyBL", "registeredAddress",
				"replPropertyMetaData", "replUpToDateVector", "repsFrom",
				"repsTo", "revision", "rid", "roomNumber", "sAMAccountName",
				"sAMAccountType", "scriptPath", "sDRightsEffective",
				"secretary", "securityIdentifier", "seeAlso", "serialNumber",
				"serverReferenceBL", "servicePrincipalName", "shadowExpire",
				"shadowFlag", "shadowInactive", "shadowLastChange",
				"shadowMax", "shadowMin", "shadowWarning", "showInAddressBook",
				"showInAdvancedViewOnly", "sIDHistory", "siteObjectBL", "sn",
				"st", "street", "streetAddress", "structuralObjectClass",
				"subRefs", "subSchemaSubEntry", "supplementalCredentials",
				"systemFlags", "telephoneNumber", "teletexTerminalIdentifier",
				"telexNumber", "terminalServer", "textEncodedORAddress",
				"thumbnailLogo", "thumbnailPhoto", "title", // "tokenGroups","tokenGroupsGlobalAndUniversal","tokenGroupsNoGCAcceptable",
				"uid", "uidNumber", "unicodePwd", "unixHomeDirectory",
				"unixUserPassword", "url", "userAccountControl", "userCert",
				"userCertificate", "userParameters", "userPassword",
				"userPKCS12", "userPrincipalName", "userRole",
				"userSharedFolder", "userSharedFolderOther",
				"userSMIMECertificate", "userWorkstations", "uSNChanged",
				"uSNCreated", "uSNDSALastObjRemoved", "USNIntersite",
				"uSNLastObjRem", "uSNSource", "wbemPath", "wellKnownObjects",
				"whenChanged", "whenCreated", "wWWHomePage", "x121Address",
				"x500uniqueIdentifier" };
		searchCtls.setReturningAttributes(returnedAtts);
		NamingEnumeration answer = ctx.search(searchBase, searchFilter,
				searchCtls);
		while (answer.hasMoreElements()) {
			SearchResult sr = (SearchResult) answer.next();
			System.out
					.println("************************************************");
			System.out.println(sr.getName());
			Attributes Attrs = sr.getAttributes();
			if (Attrs != null) {
				try {
					for (NamingEnumeration ne = Attrs.getAll(); ne.hasMore();) {
						Attribute Attr = (Attribute) ne.next();
						// System.out.println(" AttributeID="
						// + Attr.getID().toString());
						// 读取属性值
						for (NamingEnumeration e = Attr.getAll(); e.hasMore(); totalResults++) {
							System.out.println(Attr.getID().toString() + ":"
									+ e.next().toString());
						}
					}
				} catch (NamingException e) {
					System.err.println("Throw Exception : " + e);
				}
			}
		}
	}

	public void deleteUser(String userName, String department)
			throws NamingException {
		ctx.destroySubcontext("CN=" + userName + ",OU=" + department + baseDN);
	}

	private String getUUID() {
		String uuid = "";
		java.util.Random r = new java.util.Random();
		for (int i = 0; i < 96; i++) {
			String s = String.valueOf(r.nextInt());
			uuid += s;
		}
		return uuid;
	}

	/**
	 * 更改用户组
	 * 
	 * @param userName
	 *            用户名
	 * @param oldGroupName
	 *            旧组名
	 * @param newGroupName
	 *            新组名
	 * @throws NamingException
	 */
	public void changeUserGroup(String userName, String oldGroupName,
			String newGroupName) throws NamingException {
		String oldDN = "CN=" + userName + ",OU=" + oldGroupName + baseDN;
		String newDN = "CN=" + userName + ",OU=" + newGroupName + baseDN;
		ctx.rename(oldDN, newDN);
	}
	
	public boolean isUserExist(String userName, String department) throws NamingException {
		try{
			Map userAttr = queryUserAttribute(userName, department);
			return true;
		}
		catch(Exception e)	{
			return false;
		}
	}
	
	public static void main(String[] args) throws NamingException, IOException {
		ActiveDirectoryUtil ADUtil = new ActiveDirectoryUtil();
		//		ADUtil.createUser("luoliben", "罗立本", "37665163", "信息网络中心");
		//		ADUtil.updateUserPassword("luoliben", "85776519", "信息网络中心");
		//		ADUtil.updateUserAttributes("luoliben", "信息网络中心", "displayName",
		//				"marco");
		//ADUtil.queryUserAllAttribute("luoliben");
		// Attributes a = ADUtil.queryUserAttribute("luoliben", "信息网络中心");
		// ADUtil.deleteUser("luoliben", "信息网络中心");
//		ADUtil.updateUserAttributes("DX110150028","EveryOne","OU","学员");
		for(int i=1;i<50;i++){
			String account="JJ12037000";
			String index=String.valueOf(i);
			if(index.length()<2)
				index="0"+index;
			account=account+index;
			ADUtil.changeUserGroup(account, "EveryOne", "学员");
		}

		ADUtil.closeDirContext();
		// System.out.println(ADUtil.getUUID(3));

	}
}