<?xml version="1.0" encoding="GB2312" standalone="no"?>
<autoGraphics>
    <graphic name="usermodify" type="prg" router="0">
        <states>
            <state color="16777215" id="2" typeName="End" height="48" width="48" x="416" y="56" lookAndFeel="classic">
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
            <state color="16777215" id="4" typeName="view" height="48" width="48" x="296" y="56" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">view</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>用户修改页面</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">/talent/page/powermanage/user/usermodify.jsp</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                    <property name="description" type="0">
                        <value/>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="3" typeName="useCase" height="48" width="48" x="176" y="56" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">useCase</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>查询用户信息</value>
                    </property>
                    <property name="unitName" type="0">
                        <value>Product</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">talent.biz.usermodify</column>
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
                            <column num="2" name="value" type="0">sysTUser/operatorID</column>
                            <column num="3" name="inPath" type="0">/</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="1" typeName="Start" height="48" width="48" x="56" y="56" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">usermodify</name>
                <propertyList>
                    <property name="id" type="0">
                        <value>usermodify</value>
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
                        <value>Wed Dec 27 11:00:16 CST 2006</value>
                    </property>
                    <property name="productVersion" type="0">
                        <value>5.0</value>
                    </property>
                    <property name="automationVersion" type="0">
                        <value/>
                    </property>
                    <property name="description" type="0">
                        <value>用户修改页面</value>
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
            <state color="16777215" id="5" typeName="annotate" height="100" width="220" x="170" y="244" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">annotate</name>
                <propertyList>
                    <property name="title" type="0">
                        <value>Administrator	06-12-27 上午11:01</value>
                    </property>
                    <property name="text" type="0">
                        <value>@description 用户修改页面&#13;
@author 冯长春</value>
                    </property>
                </propertyList>
                <description/>
            </state>
        </states>
        <connectors>
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.view.4</from>
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
                <from>Shape.useCase.3</from>
                <to>Shape.view.4</to>
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
                <from>Shape.Start.1</from>
                <to>Shape.useCase.3</to>
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
