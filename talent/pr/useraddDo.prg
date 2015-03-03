<?xml version="1.0" encoding="GB2312" standalone="no"?>
<autoGraphics>
    <graphic name="useraddDo" type="prg" router="0">
        <states>
            <state color="16777215" id="2" typeName="End" height="48" width="48" x="496" y="176" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">End</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>结束</value>
                    </property>
                    <property name="description" type="0">
                        <value/>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">end</column>
                            <column num="1" name="type"/>
                        </row>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="6" typeName="view" height="48" width="48" x="376" y="176" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">view</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>失败页面</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">/talent/page/powermanage/user/VO_fail.jsp</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                    <property name="description" type="0">
                        <value/>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="9" typeName="sub" height="48" width="48" x="376" y="296" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">sub</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>用户列表</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">talent.pr.userlist</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                    <property name="description" type="0">
                        <value/>
                    </property>
                    <property name="parameter" type="5"/>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="10" typeName="view" height="48" width="48" x="376" y="56" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">view</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>用户新增页面</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">/talent/page/powermanage/user/useradd.jsp</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                    <property name="description" type="0">
                        <value/>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="8" typeName="removeEntity" height="48" width="48" x="256" y="296" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">removeEntity</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>数据移除</value>
                    </property>
                    <property name="parameter" type="5">
                        <row num="0">
                            <column num="0" name="name" type="0"/>
                            <column num="1" name="paraType" type="1">appArea</column>
                            <column num="2" name="value" type="0">sysTUser/operatorID</column>
                        </row>
                        <row num="1">
                            <column num="0" name="name" type="0"/>
                            <column num="1" name="paraType" type="1">appArea</column>
                            <column num="2" name="value" type="0">sysTUser/isLocal</column>
                        </row>
                        <row num="2">
                            <column num="0" name="name" type="0"/>
                            <column num="1" name="paraType" type="1">appArea</column>
                            <column num="2" name="value" type="0">sysTUser/cardID</column>
                        </row>
                        <row num="3">
                            <column num="0" name="name" type="0"/>
                            <column num="1" name="paraType" type="1">appArea</column>
                            <column num="2" name="value" type="0">sysTUser/userTypeID</column>
                        </row>
                        <row num="4">
                            <column num="0" name="name" type="0"/>
                            <column num="1" name="paraType" type="1">appArea</column>
                            <column num="2" name="value" type="0">sysTUser/userID</column>
                        </row>
                        <row num="5">
                            <column num="0" name="name" type="0"/>
                            <column num="1" name="paraType" type="1">appArea</column>
                            <column num="2" name="value" type="0">sysTUser/status</column>
                        </row>
                        <row num="6">
                            <column num="0" name="name" type="0"/>
                            <column num="1" name="paraType" type="1">appArea</column>
                            <column num="2" name="value" type="0">sysTUser/password</column>
                        </row>
                        <row num="7">
                            <column num="0" name="name" type="0"/>
                            <column num="1" name="paraType" type="1">appArea</column>
                            <column num="2" name="value" type="0">sysTUser/operatorName</column>
                        </row>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">removeEntity</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="5" typeName="useCase" height="48" width="48" x="256" y="176" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">useCase</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>新增用户</value>
                    </property>
                    <property name="unitName" type="0">
                        <value>Product</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">talent.biz.useraddDo</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                    <property name="unitId" type="2">
                        <row num="0">
                            <column num="0" name="unitId">0</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                    <property name="txType" type="1">
                        <value>supports</value>
                    </property>
                    <property name="synchronization" type="1">
                        <value>true</value>
                    </property>
                    <property name="description" type="0">
                        <value/>
                    </property>
                    <property name="parameter" type="5">
                        <row num="0">
                            <column num="0" name="passing" type="1">in</column>
                            <column num="1" name="type" type="1">EOSEntity</column>
                            <column num="2" name="value" type="0">sysTUser</column>
                            <column num="3" name="inPath" type="0">/</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                        <row num="1">
                            <column num="0" name="passing" type="1">in</column>
                            <column num="1" name="type" type="1">EOSEntity</column>
                            <column num="2" name="value" type="0">baseTUser</column>
                            <column num="3" name="inPath" type="0">/</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="4" typeName="useCase" height="48" width="48" x="256" y="56" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">useCase</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>判断该帐号是否已存在</value>
                    </property>
                    <property name="unitName" type="0">
                        <value>Product</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">talent.biz.useronly</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                    <property name="unitId" type="2">
                        <row num="0">
                            <column num="0" name="unitId">0</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                    <property name="txType" type="1">
                        <value>supports</value>
                    </property>
                    <property name="synchronization" type="1">
                        <value>true</value>
                    </property>
                    <property name="description" type="0">
                        <value/>
                    </property>
                    <property name="parameter" type="5">
                        <row num="0">
                            <column num="0" name="passing" type="1">in</column>
                            <column num="1" name="type" type="1">field</column>
                            <column num="2" name="value" type="0">sysTUser/userID</column>
                            <column num="3" name="inPath" type="0">/</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="1" typeName="Start" height="48" width="48" x="136" y="56" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">useraddDo</name>
                <propertyList>
                    <property name="id" type="0">
                        <value>useraddDo</value>
                    </property>
                    <property name="display_text" type="0">
                        <value>开始</value>
                    </property>
                    <property name="return_value" type="0">
                        <value/>
                    </property>
                    <property name="author" type="0">
                        <value>Administrator</value>
                    </property>
                    <property name="department" type="0">
                        <value/>
                    </property>
                    <property name="date" type="0">
                        <value>Tue Dec 26 14:19:35 CST 2006</value>
                    </property>
                    <property name="productVersion" type="0">
                        <value>5.0</value>
                    </property>
                    <property name="automationVersion" type="0">
                        <value/>
                    </property>
                    <property name="description" type="0">
                        <value>新增用户</value>
                    </property>
                    <property name="type" type="1">
                        <value>hci</value>
                    </property>
                    <property name="parameter" type="5"/>
                    <property name="graphicRef" type="0">
                        <value/>
                    </property>
                    <property name="ModelName" type="0">
                        <value>Product</value>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="11" typeName="annotate" height="100" width="220" x="456" y="384" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">annotate</name>
                <propertyList>
                    <property name="title" type="0">
                        <value>Administrator	06-12-27 上午10:11</value>
                    </property>
                    <property name="text" type="0">
                        <value>@description 新增用户&#13;
@author 冯长春</value>
                    </property>
                </propertyList>
                <description/>
            </state>
        </states>
        <connectors>
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.view.6</from>
                <to>Shape.End.2</to>
                <propertyList>
                    <property name="isSimpleExpression" type="0">
                        <value>true</value>
                    </property>
                    <property name="display_text" type="0">
                        <value/>
                    </property>
                    <property name="type" type="0">
                        <value/>
                    </property>
                    <property name="valueType" type="0">
                        <value/>
                    </property>
                    <property name="default" type="0">
                        <value>true</value>
                    </property>
                    <property name="refPath" type="3">
                        <row num="0">
                            <column num="0" name="leftValue"/>
                            <column num="1" name="compType"/>
                            <column num="2" name="rightValue"/>
                        </row>
                    </property>
                    <property name="expression" type="0">
                        <value/>
                    </property>
                </propertyList>
                <bendpoints/>
            </connector>
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.sub.9</from>
                <to>Shape.End.2</to>
                <propertyList>
                    <property name="isSimpleExpression" type="0">
                        <value>true</value>
                    </property>
                    <property name="display_text" type="0">
                        <value/>
                    </property>
                    <property name="type" type="0">
                        <value/>
                    </property>
                    <property name="valueType" type="0">
                        <value/>
                    </property>
                    <property name="default" type="0">
                        <value>true</value>
                    </property>
                    <property name="refPath" type="3">
                        <row num="0">
                            <column num="0" name="leftValue"/>
                            <column num="1" name="compType"/>
                            <column num="2" name="rightValue"/>
                        </row>
                    </property>
                    <property name="expression" type="0">
                        <value/>
                    </property>
                </propertyList>
                <bendpoints/>
            </connector>
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.view.10</from>
                <to>Shape.End.2</to>
                <propertyList>
                    <property name="isSimpleExpression" type="0">
                        <value>true</value>
                    </property>
                    <property name="display_text" type="0">
                        <value/>
                    </property>
                    <property name="type" type="0">
                        <value/>
                    </property>
                    <property name="valueType" type="0">
                        <value/>
                    </property>
                    <property name="default" type="0">
                        <value>true</value>
                    </property>
                    <property name="refPath" type="3">
                        <row num="0">
                            <column num="0" name="leftValue"/>
                            <column num="1" name="compType"/>
                            <column num="2" name="rightValue"/>
                        </row>
                    </property>
                    <property name="expression" type="0">
                        <value/>
                    </property>
                </propertyList>
                <bendpoints/>
            </connector>
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.removeEntity.8</from>
                <to>Shape.sub.9</to>
                <propertyList>
                    <property name="isSimpleExpression" type="0">
                        <value>true</value>
                    </property>
                    <property name="display_text" type="0">
                        <value/>
                    </property>
                    <property name="type" type="0">
                        <value/>
                    </property>
                    <property name="valueType" type="0">
                        <value/>
                    </property>
                    <property name="default" type="0">
                        <value>true</value>
                    </property>
                    <property name="refPath" type="3">
                        <row num="0">
                            <column num="0" name="leftValue"/>
                            <column num="1" name="compType"/>
                            <column num="2" name="rightValue"/>
                        </row>
                    </property>
                    <property name="expression" type="0">
                        <value/>
                    </property>
                </propertyList>
                <bendpoints/>
            </connector>
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.useCase.5</from>
                <to>Shape.removeEntity.8</to>
                <propertyList>
                    <property name="isSimpleExpression" type="0">
                        <value>true</value>
                    </property>
                    <property name="display_text" type="0">
                        <value/>
                    </property>
                    <property name="type" type="0">
                        <value/>
                    </property>
                    <property name="valueType" type="0">
                        <value/>
                    </property>
                    <property name="default" type="0">
                        <value>true</value>
                    </property>
                    <property name="refPath" type="3">
                        <row num="0">
                            <column num="0" name="leftValue"/>
                            <column num="1" name="compType"/>
                            <column num="2" name="rightValue"/>
                        </row>
                    </property>
                    <property name="expression" type="0">
                        <value/>
                    </property>
                </propertyList>
                <bendpoints/>
            </connector>
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.useCase.5</from>
                <to>Shape.view.6</to>
                <propertyList>
                    <property name="isSimpleExpression" type="0">
                        <value>true</value>
                    </property>
                    <property name="display_text" type="0">
                        <value/>
                    </property>
                    <property name="type" type="0">
                        <value>retCode</value>
                    </property>
                    <property name="valueType" type="0">
                        <value>constant</value>
                    </property>
                    <property name="default" type="0">
                        <value>false</value>
                    </property>
                    <property name="refPath" type="3">
                        <row num="0">
                            <column num="0" name="leftValue"/>
                            <column num="1" name="compType">EQ</column>
                            <column num="2" name="rightValue">-1</column>
                        </row>
                    </property>
                    <property name="expression" type="0">
                        <value/>
                    </property>
                </propertyList>
                <bendpoints/>
            </connector>
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.useCase.4</from>
                <to>Shape.useCase.5</to>
                <propertyList>
                    <property name="isSimpleExpression" type="0">
                        <value>true</value>
                    </property>
                    <property name="display_text" type="0">
                        <value/>
                    </property>
                    <property name="type" type="0">
                        <value/>
                    </property>
                    <property name="valueType" type="0">
                        <value/>
                    </property>
                    <property name="default" type="0">
                        <value>true</value>
                    </property>
                    <property name="refPath" type="3">
                        <row num="0">
                            <column num="0" name="leftValue"/>
                            <column num="1" name="compType"/>
                            <column num="2" name="rightValue"/>
                        </row>
                    </property>
                    <property name="expression" type="0">
                        <value/>
                    </property>
                </propertyList>
                <bendpoints/>
            </connector>
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.useCase.4</from>
                <to>Shape.view.10</to>
                <propertyList>
                    <property name="isSimpleExpression" type="0">
                        <value>true</value>
                    </property>
                    <property name="display_text" type="0">
                        <value>存在</value>
                    </property>
                    <property name="type" type="0">
                        <value>entityField</value>
                    </property>
                    <property name="valueType" type="0">
                        <value>constant</value>
                    </property>
                    <property name="default" type="0">
                        <value>false</value>
                    </property>
                    <property name="refPath" type="3">
                        <row num="0">
                            <column num="0" name="leftValue">only</column>
                            <column num="1" name="compType">GT</column>
                            <column num="2" name="rightValue">0</column>
                        </row>
                    </property>
                    <property name="expression" type="0">
                        <value/>
                    </property>
                </propertyList>
                <bendpoints/>
            </connector>
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.Start.1</from>
                <to>Shape.useCase.4</to>
                <propertyList>
                    <property name="isSimpleExpression" type="0">
                        <value>true</value>
                    </property>
                    <property name="display_text" type="0">
                        <value/>
                    </property>
                    <property name="type" type="0">
                        <value/>
                    </property>
                    <property name="valueType" type="0">
                        <value/>
                    </property>
                    <property name="default" type="0">
                        <value>true</value>
                    </property>
                    <property name="refPath" type="3">
                        <row num="0">
                            <column num="0" name="leftValue"/>
                            <column num="1" name="compType"/>
                            <column num="2" name="rightValue"/>
                        </row>
                    </property>
                    <property name="expression" type="0">
                        <value/>
                    </property>
                </propertyList>
                <bendpoints/>
            </connector>
        </connectors>
        <groups/>
    </graphic>
</autoGraphics>
