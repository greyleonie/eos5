<?xml version="1.0" encoding="GB2312" standalone="no"?>
<autoGraphics>
    <graphic name="teachInfoList" type="prg" router="0">
        <states>
            <state color="16777215" id="2" typeName="End" height="48" width="48" x="536" y="56" lookAndFeel="classic">
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
            <state color="16777215" id="11" typeName="useCase" height="48" width="48" x="216" y="176" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">useCase</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>查询</value>
                    </property>
                    <property name="unitName" type="0">
                        <value>Product</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">teachWorkManage.bizSearch.teachInfoList</column>
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
                            <column num="2" name="value" type="0">input</column>
                            <column num="3" name="inPath" type="0">/</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                        <row num="1">
                            <column num="0" name="passing" type="1">in</column>
                            <column num="1" name="type" type="1">EOSEntity</column>
                            <column num="2" name="value" type="0">SearchTeaching</column>
                            <column num="3" name="inPath" type="0">/</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="12" typeName="view" height="48" width="48" x="336" y="56" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">view</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>列表页面</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">/teachWorkManage/page/Search/teachInfoList.jsp</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                    <property name="description" type="0">
                        <value/>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="13" typeName="setField" height="48" width="48" x="216" y="56" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">setField</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>数据设置</value>
                    </property>
                    <property name="parameter" type="5">
                        <row num="0">
                            <column num="0" name="passing" type="1">in</column>
                            <column num="1" name="type" type="1">constant</column>
                            <column num="2" name="paraType" type="1">appArea</column>
                            <column num="3" name="value" type="0">test</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                        <row num="1">
                            <column num="0" name="passing" type="1">out</column>
                            <column num="1" name="type" type="1">constant</column>
                            <column num="2" name="paraType" type="1">appArea</column>
                            <column num="3" name="value" type="0">input/init</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                        <row num="2">
                            <column num="0" name="passing" type="1">in</column>
                            <column num="1" name="type" type="1">constant</column>
                            <column num="2" name="paraType" type="1">appArea</column>
                            <column num="3" name="value" type="0">--选择--</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                        <row num="3">
                            <column num="0" name="passing" type="1">out</column>
                            <column num="1" name="type" type="1">constant</column>
                            <column num="2" name="paraType" type="1">appArea</column>
                            <column num="3" name="value" type="0">SearchTeaching/TeachingGroupName</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                        <row num="4">
                            <column num="0" name="passing" type="1">in</column>
                            <column num="1" name="type" type="1">constant</column>
                            <column num="2" name="paraType" type="1">appArea</column>
                            <column num="3" name="value" type="0">--选择--</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                        <row num="5">
                            <column num="0" name="passing" type="1">out</column>
                            <column num="1" name="type" type="1">constant</column>
                            <column num="2" name="paraType" type="1">appArea</column>
                            <column num="3" name="value" type="0">SearchTeaching/TeacherName</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">setField</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="1" typeName="Start" height="48" width="48" x="96" y="56" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">classInfoList</name>
                <propertyList>
                    <property name="id" type="0">
                        <value>classInfoList</value>
                    </property>
                    <property name="display_text" type="0">
                        <value>开始</value>
                    </property>
                    <property name="return_value" type="0">
                        <value/>
                    </property>
                    <property name="author" type="0">
                        <value>金刚</value>
                    </property>
                    <property name="department" type="0">
                        <value/>
                    </property>
                    <property name="date" type="0">
                        <value>Thu Dec 21 14:22:36 CST 2006</value>
                    </property>
                    <property name="productVersion" type="0">
                        <value>5.0</value>
                    </property>
                    <property name="automationVersion" type="0">
                        <value/>
                    </property>
                    <property name="description" type="0">
                        <value>教师上课情况统计</value>
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
            <state color="16777215" id="10" typeName="annotate" height="100" width="197" x="462" y="190" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">annotate</name>
                <propertyList>
                    <property name="title" type="0">
                        <value>Administrator	07-3-14 下午5:44</value>
                    </property>
                    <property name="text" type="0">
                        <value>@author 金刚&#13;
@description 教师上课情况统计</value>
                    </property>
                </propertyList>
                <description/>
            </state>
        </states>
        <connectors>
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.useCase.11</from>
                <to>Shape.view.12</to>
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
                <from>Shape.view.12</from>
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
                <from>Shape.setField.13</from>
                <to>Shape.useCase.11</to>
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
                <from>Shape.setField.13</from>
                <to>Shape.view.12</to>
                <propertyList>
                    <property name="isSimpleExpression" type="0">
                        <value>true</value>
                    </property>
                    <property name="display_text" type="0">
                        <value/>
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
                            <column num="0" name="leftValue">input/isFirst</column>
                            <column num="1" name="compType">EQ</column>
                            <column num="2" name="rightValue">1</column>
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
                <to>Shape.setField.13</to>
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
