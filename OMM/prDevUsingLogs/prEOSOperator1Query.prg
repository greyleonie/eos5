<?xml version="1.0" encoding="GB2312" standalone="no"?>
<autoGraphics>
    <graphic name="prFile" type="prg" router="0">
        <states>
            <state color="16777215" id="1" typeName="Start" height="48" width="48" x="56" y="96" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">prFile</name>
                <propertyList>
                    <property name="id" type="0">
                        <value>prFile</value>
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
                        <value></value>
                    </property>
                    <property name="date" type="0">
                        <value>Fri Aug 07 06:52:47 GMT 2009</value>
                    </property>
                    <property name="productVersion" type="0">
                        <value>5.0</value>
                    </property>
                    <property name="automationVersion" type="0">
                        <value/>
                    </property>
                    <property name="description" type="0">
                        <value/>
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
            <state color="16777215" id="2" typeName="End" height="48" width="48" x="416" y="96" lookAndFeel="classic">
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
            <state color="16777215" id="4" typeName="useCase" height="48" width="48" x="176" y="96" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">useCase</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>查询(EOSOperator1)记录</value>
                    </property>
                    <property name="unitName" type="0">
                        <value>Product</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">OMM.bizDevUsingLogs.bizEOSOperator1Query</column>
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
                            <column num="2" name="value" type="0">EOSOperator1</column>
                            <column num="3" name="inPath" type="0">/</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                        
                        <row num="1">
                            <column num="0" name="passing" type="1">in</column>
                            <column num="1" name="type" type="1">EOSEntity</column>
                            <column num="2" name="value" type="0">PageCond</column>
                            <column num="3" name="inPath" type="0">/</column>
                            <column num="4" name="name" type="0"/>
                        </row>
                        
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="5" typeName="view" height="48" width="48" x="296" y="56" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">view</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>查询结果页面</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">/OMM/pageDevUsingLogs/EOSOperator1QueryResult.jsp</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                    <property name="description" type="0">
                        <value/>
                    </property>
                </propertyList>
                <description/>
            </state>
            <state color="16777215" id="6" typeName="view" height="48" width="48" x="296" y="176" lookAndFeel="classic">
                <name fontName="System" fontSize="12" fontWidth="550" foreColor="0" isItalic="0" isUnderline="0" textHeight="60">view</name>
                <propertyList>
                    <property name="display_text" type="0">
                        <value>错误页面</value>
                    </property>
                    <property name="action" type="2">
                        <row num="0">
                            <column num="0" name="action">/internet/error.jsp</column>
                            <column num="1" name="type">constant</column>
                        </row>
                    </property>
                    <property name="description" type="0">
                        <value/>
                    </property>
                </propertyList>
                <description/>
            </state>
        </states>
        <connectors>
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
            <connector color="0" description="" id="-2" type="connection">
                <from>Shape.useCase.4</from>
                <to>Shape.view.5</to>
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
                <from>Shape.view.5</from>
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
        </connectors>
        <groups/>
    </graphic>
</autoGraphics>