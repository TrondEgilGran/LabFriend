<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.3.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="no"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="teg4">
<packages>
<package name="TSSOP14">
<description>&lt;b&gt;14-Lead Thin Shrink Small Outline Package [TSSOP]&lt;/b&gt;&lt;p&gt;
Source: Analog Devices .. 780914713ADD8704_0.pdf</description>
<wire x1="-0.6" y1="2.4484" x2="0.6" y2="2.4484" width="0.2032" layer="21" curve="180"/>
<wire x1="-2.1484" y1="-2.4484" x2="2.1484" y2="-2.4484" width="0.2032" layer="21"/>
<wire x1="2.1484" y1="-2.4484" x2="2.1484" y2="2.4484" width="0.2032" layer="21"/>
<wire x1="2.1484" y1="2.4484" x2="-2.1484" y2="2.4484" width="0.2032" layer="21"/>
<wire x1="-2.1484" y1="2.4484" x2="-2.1484" y2="-2.4484" width="0.2032" layer="21"/>
<smd name="1" x="-2.875" y="1.95" dx="0.9" dy="0.35" layer="1"/>
<smd name="2" x="-2.875" y="1.3" dx="0.9" dy="0.35" layer="1"/>
<smd name="3" x="-2.875" y="0.65" dx="0.9" dy="0.35" layer="1"/>
<smd name="4" x="-2.875" y="0" dx="0.9" dy="0.35" layer="1"/>
<smd name="5" x="-2.875" y="-0.65" dx="0.9" dy="0.35" layer="1"/>
<smd name="6" x="-2.875" y="-1.3" dx="0.9" dy="0.35" layer="1"/>
<smd name="7" x="-2.875" y="-1.95" dx="0.9" dy="0.35" layer="1"/>
<smd name="8" x="2.875" y="-1.95" dx="0.9" dy="0.35" layer="1"/>
<smd name="9" x="2.875" y="-1.3" dx="0.9" dy="0.35" layer="1"/>
<smd name="10" x="2.875" y="-0.65" dx="0.9" dy="0.35" layer="1"/>
<smd name="11" x="2.875" y="0" dx="0.9" dy="0.35" layer="1"/>
<smd name="12" x="2.875" y="0.65" dx="0.9" dy="0.35" layer="1"/>
<smd name="13" x="2.875" y="1.3" dx="0.9" dy="0.35" layer="1"/>
<smd name="14" x="2.875" y="1.95" dx="0.9" dy="0.35" layer="1"/>
<text x="-3.175" y="3.175" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2" y1="1.8" x2="-2.25" y2="2.1" layer="51"/>
<rectangle x1="-3.2" y1="1.15" x2="-2.25" y2="1.45" layer="51"/>
<rectangle x1="-3.2" y1="0.5" x2="-2.25" y2="0.8" layer="51"/>
<rectangle x1="-3.2" y1="-0.15" x2="-2.25" y2="0.15" layer="51"/>
<rectangle x1="-3.2" y1="-0.8" x2="-2.25" y2="-0.5" layer="51"/>
<rectangle x1="-3.2" y1="-1.45" x2="-2.25" y2="-1.15" layer="51"/>
<rectangle x1="-3.2" y1="-2.1" x2="-2.25" y2="-1.8" layer="51"/>
<rectangle x1="2.25" y1="-2.1" x2="3.2" y2="-1.8" layer="51"/>
<rectangle x1="2.25" y1="-1.45" x2="3.2" y2="-1.15" layer="51"/>
<rectangle x1="2.25" y1="-0.8" x2="3.2" y2="-0.5" layer="51"/>
<rectangle x1="2.25" y1="-0.15" x2="3.2" y2="0.15" layer="51"/>
<rectangle x1="2.25" y1="0.5" x2="3.2" y2="0.8" layer="51"/>
<rectangle x1="2.25" y1="1.15" x2="3.2" y2="1.45" layer="51"/>
<rectangle x1="2.25" y1="1.8" x2="3.2" y2="2.1" layer="51"/>
</package>
<package name="SO14">
<description>&lt;b&gt;14-Lead Narrow-Body SOIC&lt;/b&gt; (SO-14)&lt;p&gt;
Source: http://www.analog.com/static/imported-files/data_sheets/SSM2166.pdf</description>
<wire x1="4.305" y1="1.9" x2="4.305" y2="-1.4" width="0.2032" layer="21"/>
<wire x1="4.305" y1="-1.4" x2="4.305" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="4.305" y1="-1.9" x2="-4.305" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-4.305" y1="-1.9" x2="-4.305" y2="-1.4" width="0.2032" layer="21"/>
<wire x1="-4.305" y1="-1.4" x2="-4.305" y2="1.9" width="0.2032" layer="21"/>
<wire x1="-4.305" y1="1.9" x2="4.305" y2="1.9" width="0.2032" layer="51"/>
<wire x1="4.305" y1="-1.4" x2="-4.305" y2="-1.4" width="0.2032" layer="51"/>
<smd name="2" x="-2.54" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="3.81" y="-2.6" dx="0.6" dy="2.2" layer="1" rot="R180"/>
<smd name="1" x="-3.81" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="-1.27" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="0" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="3.81" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="2.54" y="-2.6" dx="0.6" dy="2.2" layer="1" rot="R180"/>
<smd name="5" x="1.27" y="-2.6" dx="0.6" dy="2.2" layer="1" rot="R180"/>
<smd name="9" x="2.54" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="10" x="1.27" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="11" x="0" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="12" x="-1.27" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="13" x="-2.54" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="14" x="-3.81" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-5.08" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="-3.81" y="-0.635" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-4.0551" y1="-3.1001" x2="-3.5649" y2="-2" layer="51"/>
<rectangle x1="-2.7851" y1="-3.1001" x2="-2.2949" y2="-2" layer="51"/>
<rectangle x1="-1.5151" y1="-3.1001" x2="-1.0249" y2="-2" layer="51"/>
<rectangle x1="-0.2451" y1="-3.1001" x2="0.2451" y2="-2" layer="51"/>
<rectangle x1="1.0249" y1="-3.1" x2="1.5151" y2="-2" layer="51" rot="R180"/>
<rectangle x1="2.2949" y1="-3.1" x2="2.7851" y2="-2" layer="51" rot="R180"/>
<rectangle x1="3.5649" y1="-3.1" x2="4.0551" y2="-2" layer="51" rot="R180"/>
<rectangle x1="3.5649" y1="2" x2="4.0551" y2="3.1001" layer="51"/>
<rectangle x1="2.2949" y1="2" x2="2.7851" y2="3.1001" layer="51"/>
<rectangle x1="1.0249" y1="2" x2="1.5151" y2="3.1001" layer="51"/>
<rectangle x1="-0.2451" y1="2" x2="0.2451" y2="3.1001" layer="51"/>
<rectangle x1="-1.5151" y1="2" x2="-1.0249" y2="3.1001" layer="51"/>
<rectangle x1="-2.7851" y1="2" x2="-2.2949" y2="3.1001" layer="51"/>
<rectangle x1="-4.0551" y1="2" x2="-3.5649" y2="3.1001" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="OP_PD">
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="5.08" y2="0" width="0.254" layer="94"/>
<wire x1="5.08" y1="0" x2="-2.54" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="2.54" y2="-1.778" width="0.1524" layer="94"/>
<text x="5.08" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="5.08" y="-3.81" size="1.778" layer="96">&gt;VALUE</text>
<text x="-1.778" y="1.778" size="1.27" layer="96">+</text>
<text x="-1.524" y="-2.794" size="1.27" layer="96">-</text>
<text x="2.794" y="-1.016" size="1.016" layer="96" rot="R90">!PD</text>
<pin name="IN+" x="-5.08" y="2.54" visible="pad" length="short" direction="in" swaplevel="1"/>
<pin name="IN-" x="-5.08" y="-2.54" visible="pad" length="short" direction="in" swaplevel="1"/>
<pin name="OUT" x="7.62" y="0" visible="pad" length="short" direction="out" rot="R180"/>
<pin name="!POWERDOWN" x="2.54" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
</symbol>
<symbol name="PWR+-">
<text x="1.27" y="3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="1.27" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="V+" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
<pin name="V-" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ADA4853-3RU" prefix="IC">
<description>&lt;b&gt;Low Power, Rail-to-Rail Output, Video Op Amps with Ultralow Power&lt;/b&gt;&lt;p&gt;
Source: http://www.analog.com/static/imported-files/data_sheets/ADA4853-1_4853-2_4853-3.pdf</description>
<gates>
<gate name="A" symbol="OP_PD" x="-10.16" y="12.7"/>
<gate name="B" symbol="OP_PD" x="-10.16" y="0"/>
<gate name="C" symbol="OP_PD" x="-10.16" y="-12.7"/>
<gate name="P" symbol="PWR+-" x="10.16" y="0"/>
</gates>
<devices>
<device name="TSSOP" package="TSSOP14">
<connects>
<connect gate="A" pin="!POWERDOWN" pad="1"/>
<connect gate="A" pin="IN+" pad="5"/>
<connect gate="A" pin="IN-" pad="6"/>
<connect gate="A" pin="OUT" pad="7"/>
<connect gate="B" pin="!POWERDOWN" pad="2"/>
<connect gate="B" pin="IN+" pad="10"/>
<connect gate="B" pin="IN-" pad="9"/>
<connect gate="B" pin="OUT" pad="8"/>
<connect gate="C" pin="!POWERDOWN" pad="3"/>
<connect gate="C" pin="IN+" pad="12"/>
<connect gate="C" pin="IN-" pad="13"/>
<connect gate="C" pin="OUT" pad="14"/>
<connect gate="P" pin="V+" pad="4"/>
<connect gate="P" pin="V-" pad="11"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="ADA4853-3YRUZ" constant="no"/>
<attribute name="OC_FARNELL" value="1498692" constant="no"/>
<attribute name="OC_NEWARK" value="15P0326" constant="no"/>
</technology>
</technologies>
</device>
<device name="" package="SO14">
<connects>
<connect gate="A" pin="!POWERDOWN" pad="1"/>
<connect gate="A" pin="IN+" pad="5"/>
<connect gate="A" pin="IN-" pad="6"/>
<connect gate="A" pin="OUT" pad="7"/>
<connect gate="B" pin="!POWERDOWN" pad="2"/>
<connect gate="B" pin="IN+" pad="10"/>
<connect gate="B" pin="IN-" pad="9"/>
<connect gate="B" pin="OUT" pad="8"/>
<connect gate="C" pin="!POWERDOWN" pad="3"/>
<connect gate="C" pin="IN+" pad="12"/>
<connect gate="C" pin="IN-" pad="13"/>
<connect gate="C" pin="OUT" pad="14"/>
<connect gate="P" pin="V+" pad="4"/>
<connect gate="P" pin="V-" pad="11"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+5V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+12V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.635" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+12V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="-12V">
<wire x1="-1.27" y1="1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="1.905" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0.635" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="1.27" y2="0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="-12V" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="-24V">
<wire x1="-1.27" y1="0.635" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="0.635" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0.635" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="1.27" y2="0.635" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="-24V" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+5V" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="+5V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+12V" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="+12V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="-12V" prefix="P-">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="-12V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="-24V" prefix="P-">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="-24V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="40xx">
<description>&lt;b&gt;CMOS Logic Devices, 4000 Series&lt;/b&gt;&lt;p&gt;
Based on the following sources:
&lt;ul&gt;
&lt;li&gt;Motorola &lt;i&gt;CMOS LOGIC DATA&lt;/i&gt;; book, 02/88, DL131 REV 1
&lt;li&gt;http://www.elexp.com
&lt;li&gt;http://www.intersil.com
&lt;li&gt;http://www.ls3c.com.tw/product/1/COMOS.html
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL16">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="10.16" y1="2.921" x2="-10.16" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="10.16" y1="2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="2.921" x2="-10.16" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="-10.16" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.016" x2="-10.16" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-10.541" y="-2.921" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-7.493" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SO16">
<description>&lt;b&gt;Small Outline package&lt;/b&gt; 150 mil</description>
<wire x1="4.699" y1="1.9558" x2="-4.699" y2="1.9558" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-1.9558" x2="5.08" y2="-1.5748" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.5748" x2="-4.699" y2="1.9558" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="1.9558" x2="5.08" y2="1.5748" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.5748" x2="-4.699" y2="-1.9558" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.699" y1="-1.9558" x2="4.699" y2="-1.9558" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.5748" x2="5.08" y2="1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.5748" x2="-5.08" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.508" x2="-5.08" y2="-1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21" curve="-180"/>
<wire x1="-5.08" y1="-1.6002" x2="5.08" y2="-1.6002" width="0.0508" layer="21"/>
<smd name="1" x="-4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="16" x="-4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="2" x="-3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="3" x="-1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="15" x="-3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="14" x="-1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="4" x="-0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="13" x="-0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="5" x="0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="12" x="0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="6" x="1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="7" x="3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="11" x="1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="10" x="3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="8" x="4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="9" x="4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<text x="-4.064" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.461" y="-2.032" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<rectangle x1="-0.889" y1="1.9558" x2="-0.381" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="-3.0988" x2="-4.191" y2="-1.9558" layer="51"/>
<rectangle x1="-3.429" y1="-3.0988" x2="-2.921" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="-3.0734" x2="-1.651" y2="-1.9304" layer="51"/>
<rectangle x1="-0.889" y1="-3.0988" x2="-0.381" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="1.9558" x2="-1.651" y2="3.0988" layer="51"/>
<rectangle x1="-3.429" y1="1.9558" x2="-2.921" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="1.9558" x2="-4.191" y2="3.0988" layer="51"/>
<rectangle x1="0.381" y1="-3.0988" x2="0.889" y2="-1.9558" layer="51"/>
<rectangle x1="1.651" y1="-3.0988" x2="2.159" y2="-1.9558" layer="51"/>
<rectangle x1="2.921" y1="-3.0988" x2="3.429" y2="-1.9558" layer="51"/>
<rectangle x1="4.191" y1="-3.0988" x2="4.699" y2="-1.9558" layer="51"/>
<rectangle x1="0.381" y1="1.9558" x2="0.889" y2="3.0988" layer="51"/>
<rectangle x1="1.651" y1="1.9558" x2="2.159" y2="3.0988" layer="51"/>
<rectangle x1="2.921" y1="1.9558" x2="3.429" y2="3.0988" layer="51"/>
<rectangle x1="4.191" y1="1.9558" x2="4.699" y2="3.0988" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="4052">
<wire x1="-7.62" y1="-17.78" x2="7.62" y2="-17.78" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-17.78" x2="7.62" y2="15.24" width="0.4064" layer="94"/>
<wire x1="7.62" y1="15.24" x2="-7.62" y2="15.24" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="15.24" x2="-7.62" y2="-17.78" width="0.4064" layer="94"/>
<text x="-7.62" y="15.875" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-20.32" size="1.778" layer="96">&gt;VALUE</text>
<pin name="Y0" x="-12.7" y="0" length="middle"/>
<pin name="Y2" x="-12.7" y="-5.08" length="middle"/>
<pin name="Y" x="12.7" y="0" length="middle" rot="R180"/>
<pin name="Y3" x="-12.7" y="-7.62" length="middle"/>
<pin name="Y1" x="-12.7" y="-2.54" length="middle"/>
<pin name="INH" x="-12.7" y="-10.16" length="middle" direction="in"/>
<pin name="B" x="-12.7" y="-15.24" length="middle" direction="in"/>
<pin name="A" x="-12.7" y="-12.7" length="middle" direction="in"/>
<pin name="X3" x="-12.7" y="5.08" length="middle"/>
<pin name="X0" x="-12.7" y="12.7" length="middle"/>
<pin name="X" x="12.7" y="12.7" length="middle" rot="R180"/>
<pin name="X1" x="-12.7" y="10.16" length="middle"/>
<pin name="X2" x="-12.7" y="7.62" length="middle"/>
</symbol>
<symbol name="PWR+VEE">
<text x="-2.54" y="-0.635" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.175" y="-5.842" size="1.27" layer="95" rot="R90">VEE</text>
<text x="1.905" y="-5.842" size="1.27" layer="95" rot="R90">GND</text>
<text x="1.905" y="2.54" size="1.27" layer="95" rot="R90">VCC</text>
<pin name="VEE" x="-5.08" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="GND" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="VCC" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="4052" prefix="IC">
<description>Dual 4-channel &lt;b&gt;ANALOG MULTIPLEXER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="4052" x="20.32" y="0"/>
<gate name="P" symbol="PWR+VEE" x="-5.08" y="0" addlevel="request"/>
</gates>
<devices>
<device name="N" package="DIL16">
<connects>
<connect gate="A" pin="A" pad="10"/>
<connect gate="A" pin="B" pad="9"/>
<connect gate="A" pin="INH" pad="6"/>
<connect gate="A" pin="X" pad="13"/>
<connect gate="A" pin="X0" pad="12"/>
<connect gate="A" pin="X1" pad="14"/>
<connect gate="A" pin="X2" pad="15"/>
<connect gate="A" pin="X3" pad="11"/>
<connect gate="A" pin="Y" pad="3"/>
<connect gate="A" pin="Y0" pad="1"/>
<connect gate="A" pin="Y1" pad="5"/>
<connect gate="A" pin="Y2" pad="2"/>
<connect gate="A" pin="Y3" pad="4"/>
<connect gate="P" pin="GND" pad="8"/>
<connect gate="P" pin="VCC" pad="16"/>
<connect gate="P" pin="VEE" pad="7"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="D" package="SO16">
<connects>
<connect gate="A" pin="A" pad="10"/>
<connect gate="A" pin="B" pad="9"/>
<connect gate="A" pin="INH" pad="6"/>
<connect gate="A" pin="X" pad="13"/>
<connect gate="A" pin="X0" pad="12"/>
<connect gate="A" pin="X1" pad="14"/>
<connect gate="A" pin="X2" pad="15"/>
<connect gate="A" pin="X3" pad="11"/>
<connect gate="A" pin="Y" pad="3"/>
<connect gate="A" pin="Y0" pad="1"/>
<connect gate="A" pin="Y1" pad="5"/>
<connect gate="A" pin="Y2" pad="2"/>
<connect gate="A" pin="Y3" pad="4"/>
<connect gate="P" pin="GND" pad="8"/>
<connect gate="P" pin="VCC" pad="16"/>
<connect gate="P" pin="VEE" pad="7"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="74xx-eu">
<description>&lt;b&gt;TTL Devices, 74xx Series with European Symbols&lt;/b&gt;&lt;p&gt;
Based on the following sources:
&lt;ul&gt;
&lt;li&gt;Texas Instruments &lt;i&gt;TTL Data Book&lt;/i&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;Volume 1, 1996.
&lt;li&gt;TTL Data Book, Volume 2 , 1993
&lt;li&gt;National Seminconductor Databook 1990, ALS/LS Logic
&lt;li&gt;ttl 74er digital data dictionary, ECA Electronic + Acustic GmbH, ISBN 3-88109-032-0
&lt;li&gt;http://icmaster.com/ViewCompare.asp
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="LCC20">
<description>&lt;b&gt;Leadless Chip Carrier&lt;/b&gt;&lt;p&gt; Ceramic Package</description>
<wire x1="-0.4001" y1="4.4" x2="-0.87" y2="4.4" width="0.2032" layer="51"/>
<wire x1="-3.3" y1="4.4" x2="-4.4" y2="3.3" width="0.2032" layer="51"/>
<wire x1="-0.4001" y1="4.3985" x2="0.4001" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-1.6701" y1="4.3985" x2="-0.8699" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.3985" y1="2.14" x2="-4.3985" y2="2.94" width="0.2032" layer="51" curve="180"/>
<wire x1="-2.9401" y1="4.4" x2="-3.3" y2="4.4" width="0.2032" layer="51"/>
<wire x1="0.87" y1="4.4" x2="0.4001" y2="4.4" width="0.2032" layer="51"/>
<wire x1="0.87" y1="4.3985" x2="1.67" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.4" y1="3.3" x2="-4.4" y2="2.9401" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="2.14" x2="-4.4" y2="1.6701" width="0.2032" layer="51"/>
<wire x1="-4.3985" y1="0.87" x2="-4.3985" y2="1.67" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.3985" y1="-0.4001" x2="-4.3985" y2="0.4001" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.3985" y1="-1.6701" x2="-4.3985" y2="-0.8699" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.4" y1="0.87" x2="-4.4" y2="0.4001" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-0.4001" x2="-4.4" y2="-0.87" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-2.9401" x2="-4.4" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-4.4" x2="-4.4" y2="-4.4099" width="0.2032" layer="51"/>
<wire x1="2.14" y1="4.3985" x2="2.94" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="2.14" y1="4.4" x2="1.6701" y2="4.4" width="0.2032" layer="51"/>
<wire x1="4.4" y1="4.4" x2="2.9401" y2="4.4" width="0.2032" layer="51"/>
<wire x1="0.4001" y1="-4.4" x2="0.87" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-0.4001" y1="-4.3985" x2="0.4001" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="0.87" y1="-4.3985" x2="1.67" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="2.9401" y1="-4.4" x2="4.4" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-0.87" y1="-4.4" x2="-0.4001" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-1.6701" y1="-4.3985" x2="-0.8699" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="-2.9401" y1="-4.3985" x2="-2.1399" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="-2.14" y1="-4.4" x2="-1.6701" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-4.4" x2="-2.9401" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="4.4" y1="0.4001" x2="4.4" y2="0.87" width="0.2032" layer="51"/>
<wire x1="4.3985" y1="0.4001" x2="4.3985" y2="-0.4001" width="0.2032" layer="51" curve="180"/>
<wire x1="4.3985" y1="1.6701" x2="4.3985" y2="0.8699" width="0.2032" layer="51" curve="180"/>
<wire x1="4.4" y1="2.9401" x2="4.4" y2="4.4" width="0.2032" layer="51"/>
<wire x1="4.4" y1="-0.87" x2="4.4" y2="-0.4001" width="0.2032" layer="51"/>
<wire x1="4.3985" y1="-0.87" x2="4.3985" y2="-1.67" width="0.2032" layer="51" curve="180"/>
<wire x1="4.3985" y1="-2.14" x2="4.3985" y2="-2.94" width="0.2032" layer="51" curve="180"/>
<wire x1="4.4" y1="-2.14" x2="4.4" y2="-1.6701" width="0.2032" layer="51"/>
<wire x1="4.4" y1="-4.4" x2="4.4" y2="-2.9401" width="0.2032" layer="51"/>
<wire x1="-2.9401" y1="4.3985" x2="-2.1399" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-1.6701" y1="4.4" x2="-2.14" y2="4.4" width="0.2032" layer="51"/>
<wire x1="-4.3985" y1="-2.9401" x2="-4.3985" y2="-2.1399" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.4" y1="-1.6701" x2="-4.4" y2="-2.14" width="0.2032" layer="51"/>
<wire x1="1.6701" y1="-4.4" x2="2.14" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="2.14" y1="-4.3985" x2="2.94" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="4.3985" y1="2.9401" x2="4.3985" y2="2.1399" width="0.2032" layer="51" curve="180"/>
<wire x1="4.4" y1="1.6701" x2="4.4" y2="2.14" width="0.2032" layer="51"/>
<wire x1="-3.3" y1="4.4" x2="-4.4" y2="3.3" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="-3.1941" x2="-4.4" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="-4.4" x2="-3.1941" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="3.1941" y1="-4.4" x2="4.4" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="4.4" y1="-4.4" x2="4.4" y2="-3.1941" width="0.2032" layer="21"/>
<wire x1="4.4" y1="3.1941" x2="4.4" y2="4.4" width="0.2032" layer="21"/>
<wire x1="4.4" y1="4.4" x2="3.1941" y2="4.4" width="0.2032" layer="21"/>
<smd name="2" x="-1.27" y="4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="1" x="0" y="3.8001" dx="0.8" dy="3.4" layer="1"/>
<smd name="3" x="-2.54" y="4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="4" x="-4.5001" y="2.54" dx="2" dy="0.8" layer="1"/>
<smd name="5" x="-4.5001" y="1.27" dx="2" dy="0.8" layer="1"/>
<smd name="6" x="-4.5001" y="0" dx="2" dy="0.8" layer="1"/>
<smd name="7" x="-4.5001" y="-1.27" dx="2" dy="0.8" layer="1"/>
<smd name="8" x="-4.5001" y="-2.54" dx="2" dy="0.8" layer="1"/>
<smd name="9" x="-2.54" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="10" x="-1.27" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="11" x="0" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="12" x="1.27" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="13" x="2.54" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="14" x="4.5001" y="-2.54" dx="2" dy="0.8" layer="1"/>
<smd name="15" x="4.5001" y="-1.27" dx="2" dy="0.8" layer="1"/>
<smd name="16" x="4.5001" y="0" dx="2" dy="0.8" layer="1"/>
<smd name="17" x="4.5001" y="1.27" dx="2" dy="0.8" layer="1"/>
<smd name="18" x="4.5001" y="2.54" dx="2" dy="0.8" layer="1"/>
<smd name="19" x="2.54" y="4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="20" x="1.27" y="4.5001" dx="0.8" dy="2" layer="1"/>
<text x="-4.0051" y="6.065" size="1.778" layer="25">&gt;NAME</text>
<text x="-3.9751" y="-7.5601" size="1.778" layer="27">&gt;VALUE</text>
</package>
<package name="DIL16">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="10.16" y1="2.921" x2="-10.16" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="10.16" y1="2.921" x2="10.16" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="2.921" x2="-10.16" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-2.921" x2="-10.16" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.016" x2="-10.16" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-10.541" y="-2.921" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-7.493" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SO16">
<description>&lt;b&gt;Small Outline package&lt;/b&gt; 150 mil</description>
<wire x1="4.699" y1="1.9558" x2="-4.699" y2="1.9558" width="0.1524" layer="51"/>
<wire x1="4.699" y1="-1.9558" x2="5.08" y2="-1.5748" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.5748" x2="-4.699" y2="1.9558" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="1.9558" x2="5.08" y2="1.5748" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.5748" x2="-4.699" y2="-1.9558" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.699" y1="-1.9558" x2="4.699" y2="-1.9558" width="0.1524" layer="51"/>
<wire x1="5.08" y1="-1.5748" x2="5.08" y2="1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.5748" x2="-5.08" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.508" x2="-5.08" y2="-1.5748" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.508" x2="-5.08" y2="-0.508" width="0.1524" layer="21" curve="-180"/>
<wire x1="-5.08" y1="-1.6002" x2="5.08" y2="-1.6002" width="0.0508" layer="21"/>
<smd name="1" x="-4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="16" x="-4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="2" x="-3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="3" x="-1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="15" x="-3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="14" x="-1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="4" x="-0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="13" x="-0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="5" x="0.635" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="12" x="0.635" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="6" x="1.905" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="7" x="3.175" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="11" x="1.905" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="10" x="3.175" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="8" x="4.445" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="9" x="4.445" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<text x="-3.81" y="-0.762" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.461" y="-1.905" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<rectangle x1="-0.889" y1="1.9558" x2="-0.381" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="-3.0988" x2="-4.191" y2="-1.9558" layer="51"/>
<rectangle x1="-3.429" y1="-3.0988" x2="-2.921" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="-3.0734" x2="-1.651" y2="-1.9304" layer="51"/>
<rectangle x1="-0.889" y1="-3.0988" x2="-0.381" y2="-1.9558" layer="51"/>
<rectangle x1="-2.159" y1="1.9558" x2="-1.651" y2="3.0988" layer="51"/>
<rectangle x1="-3.429" y1="1.9558" x2="-2.921" y2="3.0988" layer="51"/>
<rectangle x1="-4.699" y1="1.9558" x2="-4.191" y2="3.0988" layer="51"/>
<rectangle x1="0.381" y1="-3.0988" x2="0.889" y2="-1.9558" layer="51"/>
<rectangle x1="1.651" y1="-3.0988" x2="2.159" y2="-1.9558" layer="51"/>
<rectangle x1="2.921" y1="-3.0988" x2="3.429" y2="-1.9558" layer="51"/>
<rectangle x1="4.191" y1="-3.0988" x2="4.699" y2="-1.9558" layer="51"/>
<rectangle x1="0.381" y1="1.9558" x2="0.889" y2="3.0988" layer="51"/>
<rectangle x1="1.651" y1="1.9558" x2="2.159" y2="3.0988" layer="51"/>
<rectangle x1="2.921" y1="1.9558" x2="3.429" y2="3.0988" layer="51"/>
<rectangle x1="4.191" y1="1.9558" x2="4.699" y2="3.0988" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="PWRN">
<text x="-0.635" y="-0.635" size="1.778" layer="95">&gt;NAME</text>
<text x="1.905" y="-5.842" size="1.27" layer="95" rot="R90">GND</text>
<text x="1.905" y="2.54" size="1.27" layer="95" rot="R90">VCC</text>
<pin name="GND" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="VCC" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
</symbol>
<symbol name="74595">
<wire x1="-7.62" y1="-15.24" x2="7.62" y2="-15.24" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-15.24" x2="7.62" y2="12.7" width="0.4064" layer="94"/>
<wire x1="7.62" y1="12.7" x2="-7.62" y2="12.7" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="12.7" x2="-7.62" y2="-15.24" width="0.4064" layer="94"/>
<text x="-7.62" y="13.335" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-17.78" size="1.778" layer="96">&gt;VALUE</text>
<pin name="QB" x="12.7" y="7.62" length="middle" direction="hiz" rot="R180"/>
<pin name="QC" x="12.7" y="5.08" length="middle" direction="hiz" rot="R180"/>
<pin name="QD" x="12.7" y="2.54" length="middle" direction="hiz" rot="R180"/>
<pin name="QE" x="12.7" y="0" length="middle" direction="hiz" rot="R180"/>
<pin name="QF" x="12.7" y="-2.54" length="middle" direction="hiz" rot="R180"/>
<pin name="QG" x="12.7" y="-5.08" length="middle" direction="hiz" rot="R180"/>
<pin name="QH" x="12.7" y="-7.62" length="middle" direction="hiz" rot="R180"/>
<pin name="SCL" x="-12.7" y="2.54" length="middle" direction="in" function="dot"/>
<pin name="SCK" x="-12.7" y="5.08" length="middle" direction="in" function="clk"/>
<pin name="RCK" x="-12.7" y="-2.54" length="middle" direction="in" function="clk"/>
<pin name="G" x="-12.7" y="-12.7" length="middle" direction="in" function="dot"/>
<pin name="SER" x="-12.7" y="10.16" length="middle" direction="in"/>
<pin name="QA" x="12.7" y="10.16" length="middle" direction="hiz" rot="R180"/>
<pin name="QH*" x="12.7" y="-12.7" length="middle" direction="hiz" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="74*595" prefix="IC">
<description>8-bit &lt;b&gt;SHIFT REGISTER&lt;/b&gt;, output latch</description>
<gates>
<gate name="A" symbol="74595" x="22.86" y="0"/>
<gate name="P" symbol="PWRN" x="-5.08" y="0" addlevel="request"/>
</gates>
<devices>
<device name="N" package="DIL16">
<connects>
<connect gate="A" pin="G" pad="13"/>
<connect gate="A" pin="QA" pad="15"/>
<connect gate="A" pin="QB" pad="1"/>
<connect gate="A" pin="QC" pad="2"/>
<connect gate="A" pin="QD" pad="3"/>
<connect gate="A" pin="QE" pad="4"/>
<connect gate="A" pin="QF" pad="5"/>
<connect gate="A" pin="QG" pad="6"/>
<connect gate="A" pin="QH" pad="7"/>
<connect gate="A" pin="QH*" pad="9"/>
<connect gate="A" pin="RCK" pad="12"/>
<connect gate="A" pin="SCK" pad="11"/>
<connect gate="A" pin="SCL" pad="10"/>
<connect gate="A" pin="SER" pad="14"/>
<connect gate="P" pin="GND" pad="8"/>
<connect gate="P" pin="VCC" pad="16"/>
</connects>
<technologies>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
</technologies>
</device>
<device name="D" package="SO16">
<connects>
<connect gate="A" pin="G" pad="13"/>
<connect gate="A" pin="QA" pad="15"/>
<connect gate="A" pin="QB" pad="1"/>
<connect gate="A" pin="QC" pad="2"/>
<connect gate="A" pin="QD" pad="3"/>
<connect gate="A" pin="QE" pad="4"/>
<connect gate="A" pin="QF" pad="5"/>
<connect gate="A" pin="QG" pad="6"/>
<connect gate="A" pin="QH" pad="7"/>
<connect gate="A" pin="QH*" pad="9"/>
<connect gate="A" pin="RCK" pad="12"/>
<connect gate="A" pin="SCK" pad="11"/>
<connect gate="A" pin="SCL" pad="10"/>
<connect gate="A" pin="SER" pad="14"/>
<connect gate="P" pin="GND" pad="8"/>
<connect gate="P" pin="VCC" pad="16"/>
</connects>
<technologies>
<technology name="HC"/>
<technology name="HCT"/>
</technologies>
</device>
<device name="FK" package="LCC20">
<connects>
<connect gate="A" pin="G" pad="17"/>
<connect gate="A" pin="QA" pad="19"/>
<connect gate="A" pin="QB" pad="2"/>
<connect gate="A" pin="QC" pad="3"/>
<connect gate="A" pin="QD" pad="4"/>
<connect gate="A" pin="QE" pad="5"/>
<connect gate="A" pin="QF" pad="7"/>
<connect gate="A" pin="QG" pad="8"/>
<connect gate="A" pin="QH" pad="9"/>
<connect gate="A" pin="QH*" pad="12"/>
<connect gate="A" pin="RCK" pad="15"/>
<connect gate="A" pin="SCK" pad="14"/>
<connect gate="A" pin="SCL" pad="13"/>
<connect gate="A" pin="SER" pad="18"/>
<connect gate="P" pin="GND" pad="10"/>
<connect gate="P" pin="VCC" pad="20"/>
</connects>
<technologies>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="A3L-LOC">
<wire x1="288.29" y1="3.81" x2="342.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="342.265" y1="3.81" x2="373.38" y2="3.81" width="0.1016" layer="94"/>
<wire x1="373.38" y1="3.81" x2="383.54" y2="3.81" width="0.1016" layer="94"/>
<wire x1="383.54" y1="3.81" x2="383.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="383.54" y1="8.89" x2="383.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="383.54" y1="13.97" x2="383.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="383.54" y1="19.05" x2="383.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="288.29" y1="3.81" x2="288.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="288.29" y1="24.13" x2="342.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="342.265" y1="24.13" x2="383.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="373.38" y1="3.81" x2="373.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="373.38" y1="8.89" x2="383.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="373.38" y1="8.89" x2="342.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="342.265" y1="8.89" x2="342.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="342.265" y1="8.89" x2="342.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="342.265" y1="13.97" x2="383.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="342.265" y1="13.97" x2="342.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="342.265" y1="19.05" x2="383.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="342.265" y1="19.05" x2="342.265" y2="24.13" width="0.1016" layer="94"/>
<text x="344.17" y="15.24" size="2.54" layer="94" font="vector">&gt;DRAWING_NAME</text>
<text x="344.17" y="10.16" size="2.286" layer="94" font="vector">&gt;LAST_DATE_TIME</text>
<text x="357.505" y="5.08" size="2.54" layer="94" font="vector">&gt;SHEET</text>
<text x="343.916" y="4.953" size="2.54" layer="94" font="vector">Sheet:</text>
<frame x1="0" y1="0" x2="387.35" y2="260.35" columns="8" rows="5" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A3L-LOC" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A3, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A3L-LOC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="relay">
<description>&lt;b&gt;Relays&lt;/b&gt;&lt;p&gt;
&lt;ul&gt;
&lt;li&gt;Eichhoff
&lt;li&gt;Finder
&lt;li&gt;Fujitsu
&lt;li&gt;HAMLIN
&lt;li&gt;OMRON
&lt;li&gt;Matsushita
&lt;li&gt;NAiS
&lt;li&gt;Siemens
&lt;li&gt;Schrack
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="G6K-2F">
<description>&lt;b&gt;Low Signal Relay&lt;/b&gt;&lt;p&gt;
oeiwcsnts1.omron.com/.. D20G6K0100.pdf</description>
<wire x1="-4.9" y1="-3.15" x2="-4.55" y2="-3.15" width="0.254" layer="21"/>
<wire x1="-4.55" y1="-3.15" x2="-3.1" y2="-3.15" width="0.254" layer="51"/>
<wire x1="-3.1" y1="-3.15" x2="-2" y2="-3.15" width="0.254" layer="21"/>
<wire x1="-0.55" y1="-3.15" x2="0.55" y2="-3.15" width="0.254" layer="21"/>
<wire x1="2" y1="-3.15" x2="3.1" y2="-3.15" width="0.254" layer="21"/>
<wire x1="-2" y1="-3.15" x2="-0.55" y2="-3.15" width="0.254" layer="51"/>
<wire x1="0.55" y1="-3.15" x2="2" y2="-3.15" width="0.254" layer="51"/>
<wire x1="3.1" y1="-3.15" x2="4.55" y2="-3.15" width="0.254" layer="51"/>
<wire x1="-4.9" y1="3.15" x2="-4.55" y2="3.15" width="0.254" layer="21"/>
<wire x1="-4.55" y1="3.15" x2="-3.1" y2="3.15" width="0.254" layer="51"/>
<wire x1="-3.1" y1="3.15" x2="-2" y2="3.15" width="0.254" layer="21"/>
<wire x1="-0.55" y1="3.15" x2="0.55" y2="3.15" width="0.254" layer="21"/>
<wire x1="2" y1="3.15" x2="3.1" y2="3.15" width="0.254" layer="21"/>
<wire x1="-2" y1="3.15" x2="-0.55" y2="3.15" width="0.254" layer="51"/>
<wire x1="0.55" y1="3.15" x2="2" y2="3.15" width="0.254" layer="51"/>
<wire x1="3.1" y1="3.15" x2="4.55" y2="3.15" width="0.254" layer="51"/>
<wire x1="-4.9" y1="3.15" x2="-4.9" y2="-3.15" width="0.254" layer="21"/>
<wire x1="4.9" y1="3.15" x2="4.55" y2="3.15" width="0.254" layer="21"/>
<wire x1="4.9" y1="-3.15" x2="4.55" y2="-3.15" width="0.254" layer="21"/>
<wire x1="4.9" y1="-3.15" x2="4.9" y2="3.15" width="0.254" layer="21"/>
<circle x="-3.84" y="-1.8" radius="0.6" width="0" layer="21"/>
<smd name="1" x="-3.81" y="-3.6" dx="1" dy="2" layer="1"/>
<smd name="2" x="-1.27" y="-3.6" dx="1" dy="2" layer="1"/>
<smd name="3" x="1.27" y="-3.6" dx="1" dy="2" layer="1"/>
<smd name="4" x="3.81" y="-3.6" dx="1" dy="2" layer="1"/>
<smd name="5" x="3.81" y="3.6" dx="1" dy="2" layer="1"/>
<smd name="6" x="1.27" y="3.6" dx="1" dy="2" layer="1"/>
<smd name="7" x="-1.27" y="3.6" dx="1" dy="2" layer="1"/>
<smd name="8" x="-3.81" y="3.6" dx="1" dy="2" layer="1"/>
<text x="-3.81" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-4.06" y1="-3.9" x2="-3.56" y2="-3.2" layer="51"/>
<rectangle x1="-1.52" y1="-3.9" x2="-1.02" y2="-3.2" layer="51"/>
<rectangle x1="1.02" y1="-3.9" x2="1.52" y2="-3.2" layer="51"/>
<rectangle x1="3.56" y1="-3.9" x2="4.06" y2="-3.2" layer="51"/>
<rectangle x1="-4.06" y1="3.2" x2="-3.56" y2="3.9" layer="51"/>
<rectangle x1="-1.52" y1="3.2" x2="-1.02" y2="3.9" layer="51"/>
<rectangle x1="1.02" y1="3.2" x2="1.52" y2="3.9" layer="51"/>
<rectangle x1="3.56" y1="3.2" x2="4.06" y2="3.9" layer="51"/>
</package>
<package name="G6K-2G">
<description>&lt;b&gt;Low Signal Relay&lt;/b&gt;&lt;p&gt;
oeiwcsnts1.omron.com/.. D20G6K0100.pdf</description>
<wire x1="-4.9" y1="-3.15" x2="-4.55" y2="-3.15" width="0.254" layer="21"/>
<wire x1="-4.55" y1="-3.15" x2="-3.1" y2="-3.15" width="0.254" layer="51"/>
<wire x1="-3.1" y1="-3.15" x2="-2" y2="-3.15" width="0.254" layer="21"/>
<wire x1="-0.55" y1="-3.15" x2="0.55" y2="-3.15" width="0.254" layer="21"/>
<wire x1="2" y1="-3.15" x2="3.1" y2="-3.15" width="0.254" layer="21"/>
<wire x1="-2" y1="-3.15" x2="-0.55" y2="-3.15" width="0.254" layer="51"/>
<wire x1="0.55" y1="-3.15" x2="2" y2="-3.15" width="0.254" layer="51"/>
<wire x1="3.1" y1="-3.15" x2="4.55" y2="-3.15" width="0.254" layer="51"/>
<wire x1="-4.9" y1="3.15" x2="-4.55" y2="3.15" width="0.254" layer="21"/>
<wire x1="-4.55" y1="3.15" x2="-3.1" y2="3.15" width="0.254" layer="51"/>
<wire x1="-3.1" y1="3.15" x2="-2" y2="3.15" width="0.254" layer="21"/>
<wire x1="-0.55" y1="3.15" x2="0.55" y2="3.15" width="0.254" layer="21"/>
<wire x1="2" y1="3.15" x2="3.1" y2="3.15" width="0.254" layer="21"/>
<wire x1="-2" y1="3.15" x2="-0.55" y2="3.15" width="0.254" layer="51"/>
<wire x1="0.55" y1="3.15" x2="2" y2="3.15" width="0.254" layer="51"/>
<wire x1="3.1" y1="3.15" x2="4.55" y2="3.15" width="0.254" layer="51"/>
<wire x1="-4.9" y1="3.15" x2="-4.9" y2="-3.15" width="0.254" layer="21"/>
<wire x1="4.9" y1="3.15" x2="4.55" y2="3.15" width="0.254" layer="21"/>
<wire x1="4.9" y1="-3.15" x2="4.55" y2="-3.15" width="0.254" layer="21"/>
<wire x1="4.9" y1="-3.15" x2="4.9" y2="3.15" width="0.254" layer="21"/>
<circle x="-3.84" y="-1.165" radius="0.6" width="0" layer="21"/>
<smd name="1" x="-3.81" y="-2.75" dx="1" dy="2" layer="1"/>
<smd name="2" x="-1.27" y="-2.75" dx="1" dy="2" layer="1"/>
<smd name="3" x="1.27" y="-2.75" dx="1" dy="2" layer="1"/>
<smd name="4" x="3.81" y="-2.75" dx="1" dy="2" layer="1"/>
<smd name="5" x="3.81" y="2.75" dx="1" dy="2" layer="1"/>
<smd name="6" x="1.27" y="2.75" dx="1" dy="2" layer="1"/>
<smd name="7" x="-1.27" y="2.75" dx="1" dy="2" layer="1"/>
<smd name="8" x="-3.81" y="2.75" dx="1" dy="2" layer="1"/>
<text x="-3.81" y="0.235" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-1.305" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-4.06" y1="-3.15" x2="-3.56" y2="-2.45" layer="51"/>
<rectangle x1="-1.52" y1="-3.15" x2="-1.02" y2="-2.45" layer="51"/>
<rectangle x1="1.02" y1="-3.15" x2="1.52" y2="-2.45" layer="51"/>
<rectangle x1="3.56" y1="-3.15" x2="4.06" y2="-2.45" layer="51"/>
<rectangle x1="-4.06" y1="2.45" x2="-3.56" y2="3.15" layer="51"/>
<rectangle x1="-1.52" y1="2.45" x2="-1.02" y2="3.15" layer="51"/>
<rectangle x1="1.02" y1="2.45" x2="1.52" y2="3.15" layer="51"/>
<rectangle x1="3.56" y1="2.45" x2="4.06" y2="3.15" layer="51"/>
</package>
<package name="G6K-2P">
<description>&lt;b&gt;Low Signal Relay&lt;/b&gt;&lt;p&gt;
oeiwcsnts1.omron.com/.. D20G6K0100.pdf</description>
<wire x1="-3.63" y1="-3.15" x2="-3.28" y2="-3.15" width="0.254" layer="21"/>
<wire x1="-3.28" y1="-3.15" x2="-1.83" y2="-3.15" width="0.254" layer="51"/>
<wire x1="-1.83" y1="-3.15" x2="-0.73" y2="-3.15" width="0.254" layer="21"/>
<wire x1="0.72" y1="-3.15" x2="1.82" y2="-3.15" width="0.254" layer="21"/>
<wire x1="3.27" y1="-3.15" x2="4.37" y2="-3.15" width="0.254" layer="21"/>
<wire x1="-0.73" y1="-3.15" x2="0.72" y2="-3.15" width="0.254" layer="51"/>
<wire x1="1.82" y1="-3.15" x2="3.27" y2="-3.15" width="0.254" layer="51"/>
<wire x1="4.37" y1="-3.15" x2="5.82" y2="-3.15" width="0.254" layer="51"/>
<wire x1="-3.63" y1="3.15" x2="-3.28" y2="3.15" width="0.254" layer="21"/>
<wire x1="-3.28" y1="3.15" x2="-1.83" y2="3.15" width="0.254" layer="51"/>
<wire x1="-1.83" y1="3.15" x2="-0.73" y2="3.15" width="0.254" layer="21"/>
<wire x1="0.72" y1="3.15" x2="1.82" y2="3.15" width="0.254" layer="21"/>
<wire x1="3.27" y1="3.15" x2="4.37" y2="3.15" width="0.254" layer="21"/>
<wire x1="-0.73" y1="3.15" x2="0.72" y2="3.15" width="0.254" layer="51"/>
<wire x1="1.82" y1="3.15" x2="3.27" y2="3.15" width="0.254" layer="51"/>
<wire x1="4.37" y1="3.15" x2="5.82" y2="3.15" width="0.254" layer="51"/>
<wire x1="-3.63" y1="3.15" x2="-3.63" y2="-3.15" width="0.254" layer="21"/>
<wire x1="6.17" y1="3.15" x2="5.82" y2="3.15" width="0.254" layer="21"/>
<wire x1="6.17" y1="-3.15" x2="5.82" y2="-3.15" width="0.254" layer="21"/>
<wire x1="6.17" y1="-3.15" x2="6.17" y2="3.15" width="0.254" layer="21"/>
<circle x="-2.57" y="-1.165" radius="0.6" width="0" layer="21"/>
<pad name="1" x="-2.54" y="-2.54" drill="0.8" shape="octagon"/>
<pad name="2" x="0" y="-2.54" drill="0.8" shape="octagon"/>
<pad name="3" x="2.54" y="-2.54" drill="0.8" shape="octagon"/>
<pad name="4" x="5.08" y="-2.54" drill="0.8" shape="octagon"/>
<pad name="5" x="5.08" y="2.54" drill="0.8" shape="octagon"/>
<pad name="6" x="2.54" y="2.54" drill="0.8" shape="octagon"/>
<pad name="7" x="0" y="2.54" drill="0.8" shape="octagon"/>
<pad name="8" x="-2.54" y="2.54" drill="0.8" shape="octagon"/>
<text x="-2.54" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="G6K-2F-Y">
<description>&lt;b&gt;Low Signal Relay&lt;/b&gt;&lt;p&gt;
oeiwcsnts1.omron.com/.. D20G6K0100.pdf</description>
<wire x1="-5" y1="3.3" x2="-4.5" y2="3.3" width="0.254" layer="21"/>
<wire x1="-4.5" y1="3.3" x2="-3.1" y2="3.3" width="0.254" layer="51"/>
<wire x1="-3.1" y1="3.3" x2="-1.3" y2="3.3" width="0.254" layer="21"/>
<wire x1="-1.3" y1="3.3" x2="0.1" y2="3.3" width="0.254" layer="51"/>
<wire x1="0.1" y1="3.3" x2="0.9" y2="3.3" width="0.254" layer="21"/>
<wire x1="0.9" y1="3.3" x2="2.3" y2="3.3" width="0.254" layer="51"/>
<wire x1="2.3" y1="3.3" x2="3.1" y2="3.3" width="0.254" layer="21"/>
<wire x1="3.1" y1="3.3" x2="4.6" y2="3.3" width="0.254" layer="51"/>
<wire x1="5" y1="3.3" x2="5" y2="-3.3" width="0.254" layer="21"/>
<wire x1="5" y1="-3.3" x2="4.6" y2="-3.3" width="0.254" layer="21"/>
<wire x1="4.6" y1="-3.3" x2="3.1" y2="-3.3" width="0.254" layer="51"/>
<wire x1="3.1" y1="-3.3" x2="2.3" y2="-3.3" width="0.254" layer="21"/>
<wire x1="2.3" y1="-3.3" x2="0.9" y2="-3.3" width="0.254" layer="51"/>
<wire x1="0.9" y1="-3.3" x2="0.1" y2="-3.3" width="0.254" layer="21"/>
<wire x1="0.1" y1="-3.3" x2="-1.3" y2="-3.3" width="0.254" layer="51"/>
<wire x1="-1.3" y1="-3.3" x2="-3" y2="-3.3" width="0.254" layer="21"/>
<wire x1="-3" y1="-3.3" x2="-4.5" y2="-3.3" width="0.254" layer="51"/>
<wire x1="-5" y1="-3.3" x2="-5" y2="3.3" width="0.254" layer="21"/>
<wire x1="-5" y1="-3.3" x2="-4.5" y2="-3.3" width="0.254" layer="21"/>
<wire x1="5" y1="3.3" x2="4.6" y2="3.3" width="0.254" layer="21"/>
<smd name="1" x="-3.8" y="-3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="8" x="-3.8" y="3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="2" x="-0.6" y="-3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="7" x="-0.6" y="3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="3" x="1.6" y="-3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="6" x="1.6" y="3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="4" x="3.8" y="-3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="5" x="3.8" y="3.5" dx="1.2" dy="1.8" layer="1"/>
<text x="-3.81" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-4.05" y1="-3.9" x2="-3.55" y2="-3.4" layer="51"/>
<rectangle x1="-0.85" y1="-3.9" x2="-0.35" y2="-3.4" layer="51"/>
<rectangle x1="1.35" y1="-3.9" x2="1.85" y2="-3.4" layer="51"/>
<rectangle x1="3.55" y1="-3.9" x2="4.05" y2="-3.4" layer="51"/>
<rectangle x1="3.55" y1="3.4" x2="4.05" y2="3.9" layer="51"/>
<rectangle x1="1.35" y1="3.4" x2="1.85" y2="3.9" layer="51"/>
<rectangle x1="-0.85" y1="3.4" x2="-0.35" y2="3.9" layer="51"/>
<rectangle x1="-4.05" y1="3.4" x2="-3.55" y2="3.9" layer="51"/>
</package>
<package name="G6K-2G-Y">
<description>&lt;b&gt;Low Signal Relay&lt;/b&gt;&lt;p&gt;
oeiwcsnts1.omron.com/.. D20G6K0100.pdf</description>
<wire x1="-5" y1="3.3" x2="-4.5" y2="3.3" width="0.254" layer="21"/>
<wire x1="-4.5" y1="3.3" x2="-3.1" y2="3.3" width="0.254" layer="51"/>
<wire x1="-3.1" y1="3.3" x2="-1.3" y2="3.3" width="0.254" layer="21"/>
<wire x1="-1.3" y1="3.3" x2="0.1" y2="3.3" width="0.254" layer="51"/>
<wire x1="0.1" y1="3.3" x2="0.9" y2="3.3" width="0.254" layer="21"/>
<wire x1="0.9" y1="3.3" x2="2.3" y2="3.3" width="0.254" layer="51"/>
<wire x1="2.3" y1="3.3" x2="3.1" y2="3.3" width="0.254" layer="21"/>
<wire x1="3.1" y1="3.3" x2="4.6" y2="3.3" width="0.254" layer="51"/>
<wire x1="5" y1="3.3" x2="5" y2="-3.3" width="0.254" layer="21"/>
<wire x1="5" y1="-3.3" x2="4.6" y2="-3.3" width="0.254" layer="21"/>
<wire x1="4.6" y1="-3.3" x2="3.1" y2="-3.3" width="0.254" layer="51"/>
<wire x1="3.1" y1="-3.3" x2="2.3" y2="-3.3" width="0.254" layer="21"/>
<wire x1="2.3" y1="-3.3" x2="0.9" y2="-3.3" width="0.254" layer="51"/>
<wire x1="0.9" y1="-3.3" x2="0.1" y2="-3.3" width="0.254" layer="21"/>
<wire x1="0.1" y1="-3.3" x2="-1.3" y2="-3.3" width="0.254" layer="51"/>
<wire x1="-1.3" y1="-3.3" x2="-3" y2="-3.3" width="0.254" layer="21"/>
<wire x1="-3" y1="-3.3" x2="-4.5" y2="-3.3" width="0.254" layer="51"/>
<wire x1="-5" y1="-3.3" x2="-5" y2="3.3" width="0.254" layer="21"/>
<wire x1="-5" y1="-3.3" x2="-4.5" y2="-3.3" width="0.254" layer="21"/>
<wire x1="5" y1="3.3" x2="4.6" y2="3.3" width="0.254" layer="21"/>
<smd name="1" x="-3.8" y="-2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="8" x="-3.8" y="2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="2" x="-0.6" y="-2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="7" x="-0.6" y="2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="3" x="1.6" y="-2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="6" x="1.6" y="2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="4" x="3.8" y="-2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="5" x="3.8" y="2.85" dx="1.2" dy="1.8" layer="1"/>
<text x="-3.81" y="0.235" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="-1.505" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-4.05" y1="2.45" x2="-3.55" y2="3.25" layer="51"/>
<rectangle x1="-0.85" y1="2.45" x2="-0.35" y2="3.25" layer="51"/>
<rectangle x1="1.35" y1="2.45" x2="1.85" y2="3.25" layer="51"/>
<rectangle x1="3.55" y1="2.45" x2="4.05" y2="3.25" layer="51"/>
<rectangle x1="3.55" y1="-3.25" x2="4.05" y2="-2.45" layer="51"/>
<rectangle x1="1.35" y1="-3.25" x2="1.85" y2="-2.45" layer="51"/>
<rectangle x1="-0.85" y1="-3.25" x2="-0.35" y2="-2.45" layer="51"/>
<rectangle x1="-4.05" y1="-3.25" x2="-3.55" y2="-2.45" layer="51"/>
</package>
<package name="G6K-2P-Y">
<description>&lt;b&gt;Low Signal Relay&lt;/b&gt;&lt;p&gt;
oeiwcsnts1.omron.com/.. D20G6K0100.pdf</description>
<wire x1="-0.7" y1="3.1" x2="0.9" y2="3.1" width="0.254" layer="51"/>
<wire x1="0.9" y1="3.1" x2="2.5" y2="3.1" width="0.254" layer="21"/>
<wire x1="6.9" y1="3.1" x2="8.3" y2="3.1" width="0.254" layer="51"/>
<wire x1="8.7" y1="3.1" x2="8.7" y2="-3.1" width="0.254" layer="21"/>
<wire x1="8.3" y1="-3.1" x2="6.9" y2="-3.1" width="0.254" layer="51"/>
<wire x1="0.9" y1="-3.1" x2="-0.7" y2="-3.1" width="0.254" layer="51"/>
<wire x1="-1.1" y1="-3.1" x2="-1.1" y2="3.1" width="0.254" layer="21"/>
<wire x1="4.7" y1="3.1" x2="6.1" y2="3.1" width="0.254" layer="51"/>
<wire x1="2.5" y1="3.1" x2="3.9" y2="3.1" width="0.254" layer="51"/>
<wire x1="6.1" y1="-3.1" x2="4.7" y2="-3.1" width="0.254" layer="51"/>
<wire x1="3.9" y1="-3.1" x2="2.5" y2="-3.1" width="0.254" layer="51"/>
<wire x1="2.5" y1="-3.1" x2="0.9" y2="-3.1" width="0.254" layer="21"/>
<wire x1="4.7" y1="-3.1" x2="3.9" y2="-3.1" width="0.254" layer="21"/>
<wire x1="6.9" y1="-3.1" x2="6.1" y2="-3.1" width="0.254" layer="21"/>
<wire x1="6.9" y1="3.1" x2="6.1" y2="3.1" width="0.254" layer="21"/>
<wire x1="4.7" y1="3.1" x2="3.9" y2="3.1" width="0.254" layer="21"/>
<wire x1="8.7" y1="3.1" x2="8.3" y2="3.1" width="0.254" layer="21"/>
<wire x1="8.7" y1="-3.1" x2="8.3" y2="-3.1" width="0.254" layer="21"/>
<wire x1="-0.7" y1="3.1" x2="-1.1" y2="3.1" width="0.254" layer="21"/>
<wire x1="-0.7" y1="-3.1" x2="-1.1" y2="-3.1" width="0.254" layer="21"/>
<pad name="1" x="0" y="-2.54" drill="0.85" shape="octagon"/>
<pad name="2" x="3.2" y="-2.54" drill="0.85" shape="octagon"/>
<pad name="3" x="5.4" y="-2.54" drill="0.85" shape="octagon"/>
<pad name="4" x="7.6" y="-2.54" drill="0.85" shape="octagon"/>
<pad name="5" x="7.6" y="2.54" drill="0.85" shape="octagon"/>
<pad name="6" x="5.4" y="2.54" drill="0.85" shape="octagon"/>
<pad name="7" x="3.2" y="2.54" drill="0.85" shape="octagon"/>
<pad name="8" x="0" y="2.54" drill="0.85" shape="octagon"/>
<text x="-0.01" y="0.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.01" y="-1.57" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="G6KU-2F-Y">
<description>&lt;b&gt;Low Signal Relay&lt;/b&gt;&lt;p&gt;
oeiwcsnts1.omron.com/.. D20G6K0100.pdf</description>
<wire x1="-5" y1="3.3" x2="-4.5" y2="3.3" width="0.254" layer="21"/>
<wire x1="-4.5" y1="3.3" x2="-3.1" y2="3.3" width="0.254" layer="51"/>
<wire x1="-3.1" y1="3.3" x2="-1.3" y2="3.3" width="0.254" layer="21"/>
<wire x1="-1.3" y1="3.3" x2="0.1" y2="3.3" width="0.254" layer="51"/>
<wire x1="0.1" y1="3.3" x2="0.9" y2="3.3" width="0.254" layer="21"/>
<wire x1="0.9" y1="3.3" x2="2.3" y2="3.3" width="0.254" layer="51"/>
<wire x1="2.3" y1="3.3" x2="3.1" y2="3.3" width="0.254" layer="21"/>
<wire x1="3.1" y1="3.3" x2="4.6" y2="3.3" width="0.254" layer="51"/>
<wire x1="5" y1="3.3" x2="5" y2="-3.3" width="0.254" layer="21"/>
<wire x1="5" y1="-3.3" x2="4.6" y2="-3.3" width="0.254" layer="21"/>
<wire x1="4.6" y1="-3.3" x2="3.1" y2="-3.3" width="0.254" layer="51"/>
<wire x1="3.1" y1="-3.3" x2="2.3" y2="-3.3" width="0.254" layer="21"/>
<wire x1="2.3" y1="-3.3" x2="0.9" y2="-3.3" width="0.254" layer="51"/>
<wire x1="0.9" y1="-3.3" x2="0.1" y2="-3.3" width="0.254" layer="21"/>
<wire x1="0.1" y1="-3.3" x2="-1.3" y2="-3.3" width="0.254" layer="51"/>
<wire x1="-1.3" y1="-3.3" x2="-3" y2="-3.3" width="0.254" layer="21"/>
<wire x1="-3" y1="-3.3" x2="-4.5" y2="-3.3" width="0.254" layer="51"/>
<wire x1="-5" y1="-3.3" x2="-5" y2="3.3" width="0.254" layer="21"/>
<wire x1="-5" y1="-3.3" x2="-4.5" y2="-3.3" width="0.254" layer="21"/>
<wire x1="5" y1="3.3" x2="4.6" y2="3.3" width="0.254" layer="21"/>
<smd name="1" x="-3.8" y="-3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="8" x="-3.8" y="3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="2" x="-0.6" y="-3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="7" x="-0.6" y="3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="3" x="1.6" y="-3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="6" x="1.6" y="3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="4" x="3.8" y="-3.5" dx="1.2" dy="1.8" layer="1"/>
<smd name="5" x="3.8" y="3.5" dx="1.2" dy="1.8" layer="1"/>
<text x="-3.81" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-4.05" y1="-3.9" x2="-3.55" y2="-3.4" layer="51"/>
<rectangle x1="-0.85" y1="-3.9" x2="-0.35" y2="-3.4" layer="51"/>
<rectangle x1="1.35" y1="-3.9" x2="1.85" y2="-3.4" layer="51"/>
<rectangle x1="3.55" y1="-3.9" x2="4.05" y2="-3.4" layer="51"/>
<rectangle x1="3.55" y1="3.4" x2="4.05" y2="3.9" layer="51"/>
<rectangle x1="1.35" y1="3.4" x2="1.85" y2="3.9" layer="51"/>
<rectangle x1="-0.85" y1="3.4" x2="-0.35" y2="3.9" layer="51"/>
<rectangle x1="-4.05" y1="3.4" x2="-3.55" y2="3.9" layer="51"/>
</package>
<package name="G6KU-2G-Y">
<description>&lt;b&gt;Low Signal Relay&lt;/b&gt;&lt;p&gt;
oeiwcsnts1.omron.com/.. D20G6K0100.pdf</description>
<wire x1="-5" y1="3.3" x2="-4.5" y2="3.3" width="0.254" layer="21"/>
<wire x1="-4.5" y1="3.3" x2="-3.1" y2="3.3" width="0.254" layer="51"/>
<wire x1="-3.1" y1="3.3" x2="-1.3" y2="3.3" width="0.254" layer="21"/>
<wire x1="-1.3" y1="3.3" x2="0.1" y2="3.3" width="0.254" layer="51"/>
<wire x1="0.1" y1="3.3" x2="0.9" y2="3.3" width="0.254" layer="21"/>
<wire x1="0.9" y1="3.3" x2="2.3" y2="3.3" width="0.254" layer="51"/>
<wire x1="2.3" y1="3.3" x2="3.1" y2="3.3" width="0.254" layer="21"/>
<wire x1="3.1" y1="3.3" x2="4.6" y2="3.3" width="0.254" layer="51"/>
<wire x1="5" y1="3.3" x2="5" y2="-3.3" width="0.254" layer="21"/>
<wire x1="5" y1="-3.3" x2="4.6" y2="-3.3" width="0.254" layer="21"/>
<wire x1="4.6" y1="-3.3" x2="3.1" y2="-3.3" width="0.254" layer="51"/>
<wire x1="3.1" y1="-3.3" x2="2.3" y2="-3.3" width="0.254" layer="21"/>
<wire x1="2.3" y1="-3.3" x2="0.9" y2="-3.3" width="0.254" layer="51"/>
<wire x1="0.9" y1="-3.3" x2="0.1" y2="-3.3" width="0.254" layer="21"/>
<wire x1="0.1" y1="-3.3" x2="-1.3" y2="-3.3" width="0.254" layer="51"/>
<wire x1="-1.3" y1="-3.3" x2="-3" y2="-3.3" width="0.254" layer="21"/>
<wire x1="-3" y1="-3.3" x2="-4.5" y2="-3.3" width="0.254" layer="51"/>
<wire x1="-5" y1="-3.3" x2="-5" y2="3.3" width="0.254" layer="21"/>
<wire x1="-5" y1="-3.3" x2="-4.5" y2="-3.3" width="0.254" layer="21"/>
<wire x1="5" y1="3.3" x2="4.6" y2="3.3" width="0.254" layer="21"/>
<smd name="1" x="-3.8" y="-2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="8" x="-3.8" y="2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="2" x="-0.6" y="-2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="7" x="-0.6" y="2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="3" x="1.6" y="-2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="6" x="1.6" y="2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="4" x="3.8" y="-2.85" dx="1.2" dy="1.8" layer="1"/>
<smd name="5" x="3.8" y="2.85" dx="1.2" dy="1.8" layer="1"/>
<text x="-3.81" y="0.235" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="-1.505" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-4.05" y1="2.45" x2="-3.55" y2="3.25" layer="51"/>
<rectangle x1="-0.85" y1="2.45" x2="-0.35" y2="3.25" layer="51"/>
<rectangle x1="1.35" y1="2.45" x2="1.85" y2="3.25" layer="51"/>
<rectangle x1="3.55" y1="2.45" x2="4.05" y2="3.25" layer="51"/>
<rectangle x1="3.55" y1="-3.25" x2="4.05" y2="-2.45" layer="51"/>
<rectangle x1="1.35" y1="-3.25" x2="1.85" y2="-2.45" layer="51"/>
<rectangle x1="-0.85" y1="-3.25" x2="-0.35" y2="-2.45" layer="51"/>
<rectangle x1="-4.05" y1="-3.25" x2="-3.55" y2="-2.45" layer="51"/>
</package>
<package name="G6KU-2P-Y">
<description>&lt;b&gt;Low Signal Relay&lt;/b&gt;&lt;p&gt;
oeiwcsnts1.omron.com/.. D20G6K0100.pdf</description>
<wire x1="-4.5" y1="3.1" x2="-2.9" y2="3.1" width="0.254" layer="51"/>
<wire x1="-2.9" y1="3.1" x2="-1.3" y2="3.1" width="0.254" layer="21"/>
<wire x1="3.1" y1="3.1" x2="4.5" y2="3.1" width="0.254" layer="51"/>
<wire x1="4.9" y1="3.1" x2="4.9" y2="-3.1" width="0.254" layer="21"/>
<wire x1="4.5" y1="-3.1" x2="3.1" y2="-3.1" width="0.254" layer="51"/>
<wire x1="-2.9" y1="-3.1" x2="-4.5" y2="-3.1" width="0.254" layer="51"/>
<wire x1="-4.9" y1="-3.1" x2="-4.9" y2="3.1" width="0.254" layer="21"/>
<wire x1="0.9" y1="3.1" x2="2.3" y2="3.1" width="0.254" layer="51"/>
<wire x1="-1.3" y1="3.1" x2="0.1" y2="3.1" width="0.254" layer="51"/>
<wire x1="2.3" y1="-3.1" x2="0.9" y2="-3.1" width="0.254" layer="51"/>
<wire x1="0.1" y1="-3.1" x2="-1.3" y2="-3.1" width="0.254" layer="51"/>
<wire x1="-1.3" y1="-3.1" x2="-2.9" y2="-3.1" width="0.254" layer="21"/>
<wire x1="0.9" y1="-3.1" x2="0.1" y2="-3.1" width="0.254" layer="21"/>
<wire x1="3.1" y1="-3.1" x2="2.3" y2="-3.1" width="0.254" layer="21"/>
<wire x1="3.1" y1="3.1" x2="2.3" y2="3.1" width="0.254" layer="21"/>
<wire x1="0.9" y1="3.1" x2="0.1" y2="3.1" width="0.254" layer="21"/>
<wire x1="4.9" y1="3.1" x2="4.5" y2="3.1" width="0.254" layer="21"/>
<wire x1="4.9" y1="-3.1" x2="4.5" y2="-3.1" width="0.254" layer="21"/>
<wire x1="-4.5" y1="3.1" x2="-4.9" y2="3.1" width="0.254" layer="21"/>
<wire x1="-4.5" y1="-3.1" x2="-4.9" y2="-3.1" width="0.254" layer="21"/>
<pad name="1" x="-3.8" y="-2.54" drill="0.85" shape="octagon"/>
<pad name="2" x="-0.6" y="-2.54" drill="0.85" shape="octagon"/>
<pad name="3" x="1.6" y="-2.54" drill="0.85" shape="octagon"/>
<pad name="4" x="3.8" y="-2.54" drill="0.85" shape="octagon"/>
<pad name="5" x="3.8" y="2.54" drill="0.85" shape="octagon"/>
<pad name="6" x="1.6" y="2.54" drill="0.85" shape="octagon"/>
<pad name="7" x="-0.6" y="2.54" drill="0.85" shape="octagon"/>
<pad name="8" x="-3.8" y="2.54" drill="0.85" shape="octagon"/>
<text x="-3.81" y="0.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="-1.57" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="K+-">
<wire x1="-3.81" y1="-1.905" x2="-1.905" y2="-1.905" width="0.254" layer="94"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="1.905" width="0.254" layer="94"/>
<wire x1="3.81" y1="1.905" x2="1.905" y2="1.905" width="0.254" layer="94"/>
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="0" y1="-1.905" x2="3.81" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.905" width="0.1524" layer="94"/>
<wire x1="0" y1="1.905" x2="-3.81" y2="1.905" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="1.905" y2="1.905" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="0" y2="-1.905" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.905" x2="0" y2="1.905" width="0.254" layer="94"/>
<wire x1="-1.016" y1="2.667" x2="-0.508" y2="2.667" width="0.1524" layer="94"/>
<wire x1="-0.762" y1="2.921" x2="-0.762" y2="2.413" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="-2.667" x2="-0.508" y2="-2.667" width="0.1524" layer="94"/>
<text x="1.27" y="2.921" size="1.778" layer="96">&gt;VALUE</text>
<text x="1.27" y="5.08" size="1.778" layer="95">&gt;PART</text>
<pin name="-" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="+" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
</symbol>
<symbol name="U">
<wire x1="3.175" y1="5.08" x2="1.905" y2="5.08" width="0.254" layer="94"/>
<wire x1="-3.175" y1="5.08" x2="-1.905" y2="5.08" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="2.54" y2="5.715" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="0" y2="0" width="0.254" layer="94"/>
<circle x="0" y="1.27" radius="0.127" width="0.4064" layer="94"/>
<text x="2.54" y="0" size="1.778" layer="95">&gt;PART</text>
<pin name="O" x="5.08" y="5.08" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="S" x="-5.08" y="5.08" visible="pad" length="short" direction="pas"/>
<pin name="P" x="0" y="-2.54" visible="pad" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="G6K" prefix="K">
<description>&lt;b&gt;Low Signal Relay&lt;/b&gt;&lt;p&gt;
oeiwcsnts1.omron.com/.. D20G6K0100.pdf</description>
<gates>
<gate name="1" symbol="K+-" x="-7.62" y="0" addlevel="must"/>
<gate name="2" symbol="U" x="10.16" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="3" symbol="U" x="10.16" y="-12.7" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="-2F" package="G6K-2F">
<connects>
<connect gate="1" pin="+" pad="1"/>
<connect gate="1" pin="-" pad="8"/>
<connect gate="2" pin="O" pad="2"/>
<connect gate="2" pin="P" pad="3"/>
<connect gate="2" pin="S" pad="4"/>
<connect gate="3" pin="O" pad="7"/>
<connect gate="3" pin="P" pad="6"/>
<connect gate="3" pin="S" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="OMRON COMPONENTS USA" constant="no"/>
<attribute name="MPN" value="G6K-2F DC24" constant="no"/>
<attribute name="OC_FARNELL" value="1690427" constant="no"/>
<attribute name="OC_NEWARK" value="36K7467" constant="no"/>
</technology>
</technologies>
</device>
<device name="-2G" package="G6K-2G">
<connects>
<connect gate="1" pin="+" pad="1"/>
<connect gate="1" pin="-" pad="8"/>
<connect gate="2" pin="O" pad="2"/>
<connect gate="2" pin="P" pad="3"/>
<connect gate="2" pin="S" pad="4"/>
<connect gate="3" pin="O" pad="7"/>
<connect gate="3" pin="P" pad="6"/>
<connect gate="3" pin="S" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="OMRON COMPONENTS USA" constant="no"/>
<attribute name="MPN" value="G6K-2G DC12" constant="no"/>
<attribute name="OC_FARNELL" value="4601695" constant="no"/>
<attribute name="OC_NEWARK" value="93B9118" constant="no"/>
</technology>
</technologies>
</device>
<device name="-2P" package="G6K-2P">
<connects>
<connect gate="1" pin="+" pad="1"/>
<connect gate="1" pin="-" pad="8"/>
<connect gate="2" pin="O" pad="2"/>
<connect gate="2" pin="P" pad="3"/>
<connect gate="2" pin="S" pad="4"/>
<connect gate="3" pin="O" pad="7"/>
<connect gate="3" pin="P" pad="6"/>
<connect gate="3" pin="S" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="OMRON COMPONENTS USA" constant="no"/>
<attribute name="MPN" value="G6K-2P DC3" constant="no"/>
<attribute name="OC_FARNELL" value="3937276" constant="no"/>
<attribute name="OC_NEWARK" value="89C6482" constant="no"/>
</technology>
</technologies>
</device>
<device name="-2F-Y" package="G6K-2F-Y">
<connects>
<connect gate="1" pin="+" pad="1"/>
<connect gate="1" pin="-" pad="8"/>
<connect gate="2" pin="O" pad="2"/>
<connect gate="2" pin="P" pad="3"/>
<connect gate="2" pin="S" pad="4"/>
<connect gate="3" pin="O" pad="7"/>
<connect gate="3" pin="P" pad="6"/>
<connect gate="3" pin="S" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="OMRON COMPONENTS USA" constant="no"/>
<attribute name="MPN" value="G6K-2F-Y DC3" constant="no"/>
<attribute name="OC_FARNELL" value="1690316" constant="no"/>
<attribute name="OC_NEWARK" value="89C6451" constant="no"/>
</technology>
</technologies>
</device>
<device name="-2G-Y" package="G6K-2G-Y">
<connects>
<connect gate="1" pin="+" pad="1"/>
<connect gate="1" pin="-" pad="8"/>
<connect gate="2" pin="O" pad="2"/>
<connect gate="2" pin="P" pad="3"/>
<connect gate="2" pin="S" pad="4"/>
<connect gate="3" pin="O" pad="7"/>
<connect gate="3" pin="P" pad="6"/>
<connect gate="3" pin="S" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="4484794" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="-2P-Y" package="G6K-2P-Y">
<connects>
<connect gate="1" pin="+" pad="1"/>
<connect gate="1" pin="-" pad="8"/>
<connect gate="2" pin="O" pad="2"/>
<connect gate="2" pin="P" pad="3"/>
<connect gate="2" pin="S" pad="4"/>
<connect gate="3" pin="O" pad="7"/>
<connect gate="3" pin="P" pad="6"/>
<connect gate="3" pin="S" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="OMRON COMPONENTS USA" constant="no"/>
<attribute name="MPN" value="G6K-2P-Y DC12" constant="no"/>
<attribute name="OC_FARNELL" value="3937276" constant="no"/>
<attribute name="OC_NEWARK" value="34C3464" constant="no"/>
</technology>
</technologies>
</device>
<device name="U-2F-Y" package="G6KU-2F-Y">
<connects>
<connect gate="1" pin="+" pad="1"/>
<connect gate="1" pin="-" pad="8"/>
<connect gate="2" pin="O" pad="2"/>
<connect gate="2" pin="P" pad="3"/>
<connect gate="2" pin="S" pad="4"/>
<connect gate="3" pin="O" pad="7"/>
<connect gate="3" pin="P" pad="6"/>
<connect gate="3" pin="S" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="OMRON COMPONENTS USA" constant="no"/>
<attribute name="MPN" value="G6KU-2F-Y DC3" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="89C6496" constant="no"/>
</technology>
</technologies>
</device>
<device name="U-2G-Y" package="G6KU-2G-Y">
<connects>
<connect gate="1" pin="+" pad="1"/>
<connect gate="1" pin="-" pad="8"/>
<connect gate="2" pin="O" pad="2"/>
<connect gate="2" pin="P" pad="3"/>
<connect gate="2" pin="S" pad="4"/>
<connect gate="3" pin="O" pad="7"/>
<connect gate="3" pin="P" pad="6"/>
<connect gate="3" pin="S" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="OMRON COMPONENTS USA" constant="no"/>
<attribute name="MPN" value="G6KU-2G-Y DC5" constant="no"/>
<attribute name="OC_FARNELL" value="1690320" constant="no"/>
<attribute name="OC_NEWARK" value="89C6505" constant="no"/>
</technology>
</technologies>
</device>
<device name="U-2P-Y" package="G6KU-2P-Y">
<connects>
<connect gate="1" pin="+" pad="1"/>
<connect gate="1" pin="-" pad="8"/>
<connect gate="2" pin="O" pad="2"/>
<connect gate="2" pin="P" pad="3"/>
<connect gate="2" pin="S" pad="4"/>
<connect gate="3" pin="O" pad="7"/>
<connect gate="3" pin="P" pad="6"/>
<connect gate="3" pin="S" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="OMRON COMPONENTS USA" constant="no"/>
<attribute name="MPN" value="G6KU-2P-Y DC5" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="35K4536" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="rcl">
<description>&lt;b&gt;Resistors, Capacitors, Inductors&lt;/b&gt;&lt;p&gt;
Based on the previous libraries:
&lt;ul&gt;
&lt;li&gt;r.lbr
&lt;li&gt;cap.lbr 
&lt;li&gt;cap-fe.lbr
&lt;li&gt;captant.lbr
&lt;li&gt;polcap.lbr
&lt;li&gt;ipc-smd.lbr
&lt;/ul&gt;
All SMD packages are defined according to the IPC specifications and  CECC&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;&lt;p&gt;
&lt;p&gt;
for Electrolyt Capacitors see also :&lt;p&gt;
www.bccomponents.com &lt;p&gt;
www.panasonic.com&lt;p&gt;
www.kemet.com&lt;p&gt;
http://www.secc.co.jp/pdf/os_e/2004/e_os_all.pdf &lt;b&gt;(SANYO)&lt;/b&gt;
&lt;p&gt;
for trimmer refence see : &lt;u&gt;www.electrospec-inc.com/cross_references/trimpotcrossref.asp&lt;/u&gt;&lt;p&gt;

&lt;table border=0 cellspacing=0 cellpadding=0 width="100%" cellpaddding=0&gt;
&lt;tr valign="top"&gt;

&lt;! &lt;td width="10"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td width="90%"&gt;

&lt;b&gt;&lt;font color="#0000FF" size="4"&gt;TRIM-POT CROSS REFERENCE&lt;/font&gt;&lt;/b&gt;
&lt;P&gt;
&lt;TABLE BORDER=0 CELLSPACING=1 CELLPADDING=2&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;RECTANGULAR MULTI-TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;BOURNS&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;BI&amp;nbsp;TECH&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;DALE-VISHAY&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;PHILIPS/MEPCO&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;MURATA&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;PANASONIC&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;SPECTROL&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;MILSPEC&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;&lt;TD&gt;&amp;nbsp;&lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3 &gt;
      3005P&lt;BR&gt;
      3006P&lt;BR&gt;
      3006W&lt;BR&gt;
      3006Y&lt;BR&gt;
      3009P&lt;BR&gt;
      3009W&lt;BR&gt;
      3009Y&lt;BR&gt;
      3057J&lt;BR&gt;
      3057L&lt;BR&gt;
      3057P&lt;BR&gt;
      3057Y&lt;BR&gt;
      3059J&lt;BR&gt;
      3059L&lt;BR&gt;
      3059P&lt;BR&gt;
      3059Y&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      89P&lt;BR&gt;
      89W&lt;BR&gt;
      89X&lt;BR&gt;
      89PH&lt;BR&gt;
      76P&lt;BR&gt;
      89XH&lt;BR&gt;
      78SLT&lt;BR&gt;
      78L&amp;nbsp;ALT&lt;BR&gt;
      56P&amp;nbsp;ALT&lt;BR&gt;
      78P&amp;nbsp;ALT&lt;BR&gt;
      T8S&lt;BR&gt;
      78L&lt;BR&gt;
      56P&lt;BR&gt;
      78P&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      T18/784&lt;BR&gt;
      783&lt;BR&gt;
      781&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      2199&lt;BR&gt;
      1697/1897&lt;BR&gt;
      1680/1880&lt;BR&gt;
      2187&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      8035EKP/CT20/RJ-20P&lt;BR&gt;
      -&lt;BR&gt;
      RJ-20X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      1211L&lt;BR&gt;
      8012EKQ&amp;nbsp;ALT&lt;BR&gt;
      8012EKR&amp;nbsp;ALT&lt;BR&gt;
      1211P&lt;BR&gt;
      8012EKJ&lt;BR&gt;
      8012EKL&lt;BR&gt;
      8012EKQ&lt;BR&gt;
      8012EKR&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      2101P&lt;BR&gt;
      2101W&lt;BR&gt;
      2101Y&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      2102L&lt;BR&gt;
      2102S&lt;BR&gt;
      2102Y&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      EVMCOG&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      43P&lt;BR&gt;
      43W&lt;BR&gt;
      43Y&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      40L&lt;BR&gt;
      40P&lt;BR&gt;
      40Y&lt;BR&gt;
      70Y-T602&lt;BR&gt;
      70L&lt;BR&gt;
      70P&lt;BR&gt;
      70Y&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      RT/RTR12&lt;BR&gt;
      RT/RTR12&lt;BR&gt;
      RT/RTR12&lt;BR&gt;
      -&lt;BR&gt;
      RJ/RJR12&lt;BR&gt;
      RJ/RJR12&lt;BR&gt;
      RJ/RJR12&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;&amp;nbsp;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SQUARE MULTI-TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
   &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MURATA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;SPECTROL&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MILSPEC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3250L&lt;BR&gt;
      3250P&lt;BR&gt;
      3250W&lt;BR&gt;
      3250X&lt;BR&gt;
      3252P&lt;BR&gt;
      3252W&lt;BR&gt;
      3252X&lt;BR&gt;
      3260P&lt;BR&gt;
      3260W&lt;BR&gt;
      3260X&lt;BR&gt;
      3262P&lt;BR&gt;
      3262W&lt;BR&gt;
      3262X&lt;BR&gt;
      3266P&lt;BR&gt;
      3266W&lt;BR&gt;
      3266X&lt;BR&gt;
      3290H&lt;BR&gt;
      3290P&lt;BR&gt;
      3290W&lt;BR&gt;
      3292P&lt;BR&gt;
      3292W&lt;BR&gt;
      3292X&lt;BR&gt;
      3296P&lt;BR&gt;
      3296W&lt;BR&gt;
      3296X&lt;BR&gt;
      3296Y&lt;BR&gt;
      3296Z&lt;BR&gt;
      3299P&lt;BR&gt;
      3299W&lt;BR&gt;
      3299X&lt;BR&gt;
      3299Y&lt;BR&gt;
      3299Z&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      66P&amp;nbsp;ALT&lt;BR&gt;
      66W&amp;nbsp;ALT&lt;BR&gt;
      66X&amp;nbsp;ALT&lt;BR&gt;
      66P&amp;nbsp;ALT&lt;BR&gt;
      66W&amp;nbsp;ALT&lt;BR&gt;
      66X&amp;nbsp;ALT&lt;BR&gt;
      -&lt;BR&gt;
      64W&amp;nbsp;ALT&lt;BR&gt;
      -&lt;BR&gt;
      64P&amp;nbsp;ALT&lt;BR&gt;
      64W&amp;nbsp;ALT&lt;BR&gt;
      64X&amp;nbsp;ALT&lt;BR&gt;
      64P&lt;BR&gt;
      64W&lt;BR&gt;
      64X&lt;BR&gt;
      66X&amp;nbsp;ALT&lt;BR&gt;
      66P&amp;nbsp;ALT&lt;BR&gt;
      66W&amp;nbsp;ALT&lt;BR&gt;
      66P&lt;BR&gt;
      66W&lt;BR&gt;
      66X&lt;BR&gt;
      67P&lt;BR&gt;
      67W&lt;BR&gt;
      67X&lt;BR&gt;
      67Y&lt;BR&gt;
      67Z&lt;BR&gt;
      68P&lt;BR&gt;
      68W&lt;BR&gt;
      68X&lt;BR&gt;
      67Y&amp;nbsp;ALT&lt;BR&gt;
      67Z&amp;nbsp;ALT&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      5050&lt;BR&gt;
      5091&lt;BR&gt;
      5080&lt;BR&gt;
      5087&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      T63YB&lt;BR&gt;
      T63XB&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      5887&lt;BR&gt;
      5891&lt;BR&gt;
      5880&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      T93Z&lt;BR&gt;
      T93YA&lt;BR&gt;
      T93XA&lt;BR&gt;
      T93YB&lt;BR&gt;
      T93XB&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      8026EKP&lt;BR&gt;
      8026EKW&lt;BR&gt;
      8026EKM&lt;BR&gt;
      8026EKP&lt;BR&gt;
      8026EKB&lt;BR&gt;
      8026EKM&lt;BR&gt;
      1309X&lt;BR&gt;
      1309P&lt;BR&gt;
      1309W&lt;BR&gt;
      8024EKP&lt;BR&gt;
      8024EKW&lt;BR&gt;
      8024EKN&lt;BR&gt;
      RJ-9P/CT9P&lt;BR&gt;
      RJ-9W&lt;BR&gt;
      RJ-9X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3103P&lt;BR&gt;
      3103Y&lt;BR&gt;
      3103Z&lt;BR&gt;
      3103P&lt;BR&gt;
      3103Y&lt;BR&gt;
      3103Z&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3105P/3106P&lt;BR&gt;
      3105W/3106W&lt;BR&gt;
      3105X/3106X&lt;BR&gt;
      3105Y/3106Y&lt;BR&gt;
      3105Z/3105Z&lt;BR&gt;
      3102P&lt;BR&gt;
      3102W&lt;BR&gt;
      3102X&lt;BR&gt;
      3102Y&lt;BR&gt;
      3102Z&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMCBG&lt;BR&gt;
      EVMCCG&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      55-1-X&lt;BR&gt;
      55-4-X&lt;BR&gt;
      55-3-X&lt;BR&gt;
      55-2-X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      50-2-X&lt;BR&gt;
      50-4-X&lt;BR&gt;
      50-3-X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      64P&lt;BR&gt;
      64W&lt;BR&gt;
      64X&lt;BR&gt;
      64Y&lt;BR&gt;
      64Z&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      RT/RTR22&lt;BR&gt;
      RT/RTR22&lt;BR&gt;
      RT/RTR22&lt;BR&gt;
      RT/RTR22&lt;BR&gt;
      RJ/RJR22&lt;BR&gt;
      RJ/RJR22&lt;BR&gt;
      RJ/RJR22&lt;BR&gt;
      RT/RTR26&lt;BR&gt;
      RT/RTR26&lt;BR&gt;
      RT/RTR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RT/RTR24&lt;BR&gt;
      RT/RTR24&lt;BR&gt;
      RT/RTR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;&amp;nbsp;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SINGLE TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MURATA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;SPECTROL&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MILSPEC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3323P&lt;BR&gt;
      3323S&lt;BR&gt;
      3323W&lt;BR&gt;
      3329H&lt;BR&gt;
      3329P&lt;BR&gt;
      3329W&lt;BR&gt;
      3339H&lt;BR&gt;
      3339P&lt;BR&gt;
      3339W&lt;BR&gt;
      3352E&lt;BR&gt;
      3352H&lt;BR&gt;
      3352K&lt;BR&gt;
      3352P&lt;BR&gt;
      3352T&lt;BR&gt;
      3352V&lt;BR&gt;
      3352W&lt;BR&gt;
      3362H&lt;BR&gt;
      3362M&lt;BR&gt;
      3362P&lt;BR&gt;
      3362R&lt;BR&gt;
      3362S&lt;BR&gt;
      3362U&lt;BR&gt;
      3362W&lt;BR&gt;
      3362X&lt;BR&gt;
      3386B&lt;BR&gt;
      3386C&lt;BR&gt;
      3386F&lt;BR&gt;
      3386H&lt;BR&gt;
      3386K&lt;BR&gt;
      3386M&lt;BR&gt;
      3386P&lt;BR&gt;
      3386S&lt;BR&gt;
      3386W&lt;BR&gt;
      3386X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      25P&lt;BR&gt;
      25S&lt;BR&gt;
      25RX&lt;BR&gt;
      82P&lt;BR&gt;
      82M&lt;BR&gt;
      82PA&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      91E&lt;BR&gt;
      91X&lt;BR&gt;
      91T&lt;BR&gt;
      91B&lt;BR&gt;
      91A&lt;BR&gt;
      91V&lt;BR&gt;
      91W&lt;BR&gt;
      25W&lt;BR&gt;
      25V&lt;BR&gt;
      25P&lt;BR&gt;
      -&lt;BR&gt;
      25S&lt;BR&gt;
      25U&lt;BR&gt;
      25RX&lt;BR&gt;
      25X&lt;BR&gt;
      72XW&lt;BR&gt;
      72XL&lt;BR&gt;
      72PM&lt;BR&gt;
      72RX&lt;BR&gt;
      -&lt;BR&gt;
      72PX&lt;BR&gt;
      72P&lt;BR&gt;
      72RXW&lt;BR&gt;
      72RXL&lt;BR&gt;
      72X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      T7YB&lt;BR&gt;
      T7YA&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      TXD&lt;BR&gt;
      TYA&lt;BR&gt;
      TYP&lt;BR&gt;
      -&lt;BR&gt;
      TYD&lt;BR&gt;
      TX&lt;BR&gt;
      -&lt;BR&gt;
      150SX&lt;BR&gt;
      100SX&lt;BR&gt;
      102T&lt;BR&gt;
      101S&lt;BR&gt;
      190T&lt;BR&gt;
      150TX&lt;BR&gt;
      101&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      101SX&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      ET6P&lt;BR&gt;
      ET6S&lt;BR&gt;
      ET6X&lt;BR&gt;
      RJ-6W/8014EMW&lt;BR&gt;
      RJ-6P/8014EMP&lt;BR&gt;
      RJ-6X/8014EMX&lt;BR&gt;
      TM7W&lt;BR&gt;
      TM7P&lt;BR&gt;
      TM7X&lt;BR&gt;
      -&lt;BR&gt;
      8017SMS&lt;BR&gt;
      -&lt;BR&gt;
      8017SMB&lt;BR&gt;
      8017SMA&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      CT-6W&lt;BR&gt;
      CT-6H&lt;BR&gt;
      CT-6P&lt;BR&gt;
      CT-6R&lt;BR&gt;
      -&lt;BR&gt;
      CT-6V&lt;BR&gt;
      CT-6X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      8038EKV&lt;BR&gt;
      -&lt;BR&gt;
      8038EKX&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      8038EKP&lt;BR&gt;
      8038EKZ&lt;BR&gt;
      8038EKW&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3321H&lt;BR&gt;
      3321P&lt;BR&gt;
      3321N&lt;BR&gt;
      1102H&lt;BR&gt;
      1102P&lt;BR&gt;
      1102T&lt;BR&gt;
      RVA0911V304A&lt;BR&gt;
      -&lt;BR&gt;
      RVA0911H413A&lt;BR&gt;
      RVG0707V100A&lt;BR&gt;
      RVA0607V(H)306A&lt;BR&gt;
      RVA1214H213A&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3104B&lt;BR&gt;
      3104C&lt;BR&gt;
      3104F&lt;BR&gt;
      3104H&lt;BR&gt;
      -&lt;BR&gt;
      3104M&lt;BR&gt;
      3104P&lt;BR&gt;
      3104S&lt;BR&gt;
      3104W&lt;BR&gt;
      3104X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      EVMQ0G&lt;BR&gt;
      EVMQIG&lt;BR&gt;
      EVMQ3G&lt;BR&gt;
      EVMS0G&lt;BR&gt;
      EVMQ0G&lt;BR&gt;
      EVMG0G&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMK4GA00B&lt;BR&gt;
      EVM30GA00B&lt;BR&gt;
      EVMK0GA00B&lt;BR&gt;
      EVM38GA00B&lt;BR&gt;
      EVMB6&lt;BR&gt;
      EVLQ0&lt;BR&gt;
      -&lt;BR&gt;
      EVMMSG&lt;BR&gt;
      EVMMBG&lt;BR&gt;
      EVMMAG&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMMCS&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMM1&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMM0&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMM3&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      62-3-1&lt;BR&gt;
      62-1-2&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      67R&lt;BR&gt;
      -&lt;BR&gt;
      67P&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      67X&lt;BR&gt;
      63V&lt;BR&gt;
      63S&lt;BR&gt;
      63M&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      63H&lt;BR&gt;
      63P&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      63X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      RJ/RJR50&lt;BR&gt;
      RJ/RJR50&lt;BR&gt;
      RJ/RJR50&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
&lt;/TABLE&gt;
&lt;P&gt;&amp;nbsp;&lt;P&gt;
&lt;TABLE BORDER=0 CELLSPACING=1 CELLPADDING=3&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=7&gt;
      &lt;FONT color="#0000FF" SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SMD TRIM-POT CROSS REFERENCE&lt;/B&gt;&lt;/FONT&gt;
      &lt;P&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;MULTI-TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURNS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;TOCOS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;AUX/KYOCERA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3224G&lt;BR&gt;
      3224J&lt;BR&gt;
      3224W&lt;BR&gt;
      3269P&lt;BR&gt;
      3269W&lt;BR&gt;
      3269X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      44G&lt;BR&gt;
      44J&lt;BR&gt;
      44W&lt;BR&gt;
      84P&lt;BR&gt;
      84W&lt;BR&gt;
      84X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      ST63Z&lt;BR&gt;
      ST63Y&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      ST5P&lt;BR&gt;
      ST5W&lt;BR&gt;
      ST5X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=7&gt;&amp;nbsp;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=7&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SINGLE TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURNS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;TOCOS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;AUX/KYOCERA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3314G&lt;BR&gt;
      3314J&lt;BR&gt;
      3364A/B&lt;BR&gt;
      3364C/D&lt;BR&gt;
      3364W/X&lt;BR&gt;
      3313G&lt;BR&gt;
      3313J&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      23B&lt;BR&gt;
      23A&lt;BR&gt;
      21X&lt;BR&gt;
      21W&lt;BR&gt;
      -&lt;BR&gt;
      22B&lt;BR&gt;
      22A&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      ST5YL/ST53YL&lt;BR&gt;
      ST5YJ/5T53YJ&lt;BR&gt;
      ST-23A&lt;BR&gt;
      ST-22B&lt;BR&gt;
      ST-22&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      ST-4B&lt;BR&gt;
      ST-4A&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      ST-3B&lt;BR&gt;
      ST-3A&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      EVM-6YS&lt;BR&gt;
      EVM-1E&lt;BR&gt;
      EVM-1G&lt;BR&gt;
      EVM-1D&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      G4B&lt;BR&gt;
      G4A&lt;BR&gt;
      TR04-3S1&lt;BR&gt;
      TRG04-2S1&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      DVR-43A&lt;BR&gt;
      CVR-42C&lt;BR&gt;
      CVR-42A/C&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
&lt;/TABLE&gt;
&lt;P&gt;
&lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;ALT =&amp;nbsp;ALTERNATE&lt;/B&gt;&lt;/FONT&gt;
&lt;P&gt;

&amp;nbsp;
&lt;P&gt;
&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;</description>
<packages>
<package name="CTRIM3008">
<description>&lt;b&gt;Trimm capacitor SMD&lt;/b&gt; STELCO GmbH</description>
<wire x1="-2.15" y1="1.9" x2="2.15" y2="1.9" width="0.254" layer="21"/>
<wire x1="2.15" y1="1.9" x2="2.15" y2="0.9" width="0.254" layer="21"/>
<wire x1="2.15" y1="0.9" x2="2.15" y2="-0.9" width="0.254" layer="51"/>
<wire x1="2.15" y1="-0.9" x2="2.15" y2="-1.9" width="0.254" layer="21"/>
<wire x1="2.15" y1="-1.9" x2="-2.15" y2="-1.9" width="0.254" layer="21"/>
<wire x1="-2.15" y1="-1.9" x2="-2.15" y2="-0.9" width="0.254" layer="21"/>
<wire x1="-2.15" y1="-0.9" x2="-2.15" y2="0.9" width="0.254" layer="51"/>
<wire x1="-2.15" y1="0.9" x2="-2.15" y2="1.9" width="0.254" layer="21"/>
<wire x1="-1.4" y1="0.8" x2="1.4" y2="0.8" width="0.1016" layer="21" curve="-120.510237"/>
<wire x1="-1.4" y1="-0.8" x2="1.4" y2="-0.8" width="0.1016" layer="21" curve="120.510237"/>
<wire x1="-1.4" y1="0.8" x2="-1.4" y2="-0.8" width="0.1016" layer="51" curve="59.489763"/>
<wire x1="1.4" y1="-0.8" x2="1.4" y2="0.8" width="0.1016" layer="51" curve="59.489763"/>
<pad name="+" x="-1.875" y="0" drill="1"/>
<pad name="-" x="1.875" y="0" drill="1"/>
<text x="-2.54" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.25" y1="-1.25" x2="0.25" y2="1.25" layer="21"/>
<rectangle x1="-1.25" y1="-0.25" x2="1.25" y2="0.25" layer="21"/>
<rectangle x1="-2.5" y1="-0.9" x2="-2.25" y2="0.9" layer="51"/>
<rectangle x1="2.25" y1="-1" x2="2.45" y2="1" layer="51"/>
<rectangle x1="2.45" y1="-0.5" x2="2.65" y2="0.5" layer="51"/>
</package>
<package name="CTRIM3018_11">
<description>&lt;b&gt;Trimm capacitor SMD&lt;/b&gt; STELCO GmbH</description>
<wire x1="-2.15" y1="1.9" x2="2.15" y2="1.9" width="0.254" layer="21"/>
<wire x1="2.15" y1="1.9" x2="2.15" y2="0.9" width="0.254" layer="21"/>
<wire x1="2.15" y1="0.9" x2="2.15" y2="-0.9" width="0.254" layer="51"/>
<wire x1="2.15" y1="-0.9" x2="2.15" y2="-1.9" width="0.254" layer="21"/>
<wire x1="2.15" y1="-1.9" x2="-2.15" y2="-1.9" width="0.254" layer="21"/>
<wire x1="-2.15" y1="-1.9" x2="-2.15" y2="-0.9" width="0.254" layer="21"/>
<wire x1="-2.15" y1="-0.9" x2="-2.15" y2="0.9" width="0.254" layer="51"/>
<wire x1="-2.15" y1="0.9" x2="-2.15" y2="1.9" width="0.254" layer="21"/>
<wire x1="-1.4" y1="0.8" x2="1.4" y2="0.8" width="0.1016" layer="21" curve="-120.510237"/>
<wire x1="-1.4" y1="-0.8" x2="1.4" y2="-0.8" width="0.1016" layer="21" curve="120.510237"/>
<wire x1="-1.4" y1="0.8" x2="-1.4" y2="-0.8" width="0.1016" layer="51" curve="59.489763"/>
<wire x1="1.4" y1="-0.8" x2="1.4" y2="0.8" width="0.1016" layer="51" curve="59.489763"/>
<smd name="+" x="-2.35" y="0" dx="2.3" dy="1.6" layer="1"/>
<smd name="-" x="2.35" y="0" dx="2.3" dy="1.6" layer="1"/>
<text x="-2.54" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.25" y1="-1.25" x2="0.25" y2="1.25" layer="21"/>
<rectangle x1="-1.25" y1="-0.25" x2="1.25" y2="0.25" layer="21"/>
<rectangle x1="-2.6" y1="-0.6" x2="-2.25" y2="0.6" layer="51"/>
<rectangle x1="2.25" y1="-0.6" x2="2.6" y2="0.6" layer="51"/>
</package>
<package name="CTRIM3018_12">
<description>&lt;b&gt;Trimm capacitor SMD&lt;/b&gt; STELCO GmbH</description>
<wire x1="-2.15" y1="1.9" x2="2.15" y2="1.9" width="0.254" layer="21"/>
<wire x1="2.15" y1="1.9" x2="2.15" y2="0.9" width="0.254" layer="21"/>
<wire x1="2.15" y1="0.9" x2="2.15" y2="-0.9" width="0.254" layer="51"/>
<wire x1="2.15" y1="-0.9" x2="2.15" y2="-1.9" width="0.254" layer="21"/>
<wire x1="2.15" y1="-1.9" x2="-2.15" y2="-1.9" width="0.254" layer="21"/>
<wire x1="-2.15" y1="-1.9" x2="-2.15" y2="-0.9" width="0.254" layer="21"/>
<wire x1="-2.15" y1="-0.9" x2="-2.15" y2="0.9" width="0.254" layer="51"/>
<wire x1="-2.15" y1="0.9" x2="-2.15" y2="1.9" width="0.254" layer="21"/>
<wire x1="-1.4" y1="0.8" x2="1.4" y2="0.8" width="0.1016" layer="21" curve="-120.510237"/>
<wire x1="-1.4" y1="-0.8" x2="1.4" y2="-0.8" width="0.1016" layer="21" curve="120.510237"/>
<wire x1="-1.4" y1="0.8" x2="-1.4" y2="-0.8" width="0.1016" layer="51" curve="59.489763"/>
<wire x1="1.4" y1="-0.8" x2="1.4" y2="0.8" width="0.1016" layer="51" curve="59.489763"/>
<smd name="+" x="-3" y="0" dx="2" dy="1.6" layer="1"/>
<smd name="-" x="3" y="0" dx="2" dy="1.6" layer="1"/>
<text x="-2.54" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.25" y1="-1.25" x2="0.25" y2="1.25" layer="21"/>
<rectangle x1="-1.25" y1="-0.25" x2="1.25" y2="0.25" layer="21"/>
<rectangle x1="-3.5" y1="-0.6" x2="-2.25" y2="0.6" layer="51"/>
<rectangle x1="2.25" y1="-0.6" x2="3.5" y2="0.6" layer="51"/>
</package>
<package name="CTRIM3040.427">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; STELCO GmbH&lt;p&gt;
 7 S-Triko 160 V DC for PCB mounting &lt;p&gt;
 Adjustable from one side, vertical to PCB</description>
<wire x1="0.3" y1="1.5" x2="-0.7" y2="-1.35" width="0.1524" layer="21"/>
<wire x1="-0.3" y1="-1.5" x2="0.7" y2="1.35" width="0.1524" layer="21"/>
<wire x1="-3.3" y1="1.2" x2="3.3" y2="1.2" width="0.254" layer="21" curve="-140.033787"/>
<wire x1="-3.3" y1="-1.2" x2="3.3" y2="-1.2" width="0.254" layer="21" curve="140.033787"/>
<wire x1="-3.3" y1="1.2" x2="-3.3" y2="-1.2" width="0.254" layer="51" curve="39.966213"/>
<wire x1="3.3" y1="-1.2" x2="3.3" y2="1.2" width="0.254" layer="51" curve="39.966213"/>
<circle x="0" y="0" radius="1.6" width="0.1524" layer="21"/>
<pad name="1A" x="-3.5" y="0" drill="1.3"/>
<pad name="2" x="0" y="-3.5" drill="1.3"/>
<pad name="1B" x="3.5" y="0" drill="1.3"/>
<text x="-2.54" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.9" y1="-0.6" x2="-3.5" y2="0.6" layer="51"/>
<rectangle x1="3.5" y1="-0.6" x2="3.9" y2="0.6" layer="51"/>
<rectangle x1="-0.6" y1="-3.9" x2="0.6" y2="-3.5" layer="51"/>
</package>
<package name="CTRIM3040.428">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; STELCO GmbH&lt;p&gt;
 7 S-Triko 160 V DC for PCB mounting &lt;p&gt;
 Adjustable from both sides, vertical to PCB</description>
<wire x1="0.3" y1="1.5" x2="-0.7" y2="-1.3" width="0.1524" layer="21"/>
<wire x1="-0.3" y1="-1.5" x2="0.7" y2="1.3" width="0.1524" layer="21"/>
<wire x1="-3.3" y1="1.2" x2="3.3" y2="1.2" width="0.254" layer="21" curve="-140.033787"/>
<wire x1="-3.3" y1="-1.2" x2="3.3" y2="-1.2" width="0.254" layer="21" curve="140.033787"/>
<wire x1="-3.3" y1="1.2" x2="-3.3" y2="-1.2" width="0.254" layer="51" curve="39.966213"/>
<wire x1="3.3" y1="-1.2" x2="3.3" y2="1.2" width="0.254" layer="51" curve="39.966213"/>
<circle x="0" y="0" radius="1.6" width="0.1524" layer="21"/>
<pad name="1A" x="-3.5" y="0" drill="1.3"/>
<pad name="2" x="0" y="-3.5" drill="1.3"/>
<pad name="1B" x="3.5" y="0" drill="1.3"/>
<text x="-2.54" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.9" y1="-0.6" x2="-3.5" y2="0.6" layer="51"/>
<rectangle x1="3.5" y1="-0.6" x2="3.9" y2="0.6" layer="51"/>
<rectangle x1="-0.6" y1="-3.9" x2="0.6" y2="-3.5" layer="51"/>
<hole x="0" y="0" drill="4.5"/>
</package>
<package name="CTRIM3040.448">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; STELCO GmbH&lt;p&gt;
 7 S-Triko 160 V DC for PCB mounting &lt;p&gt;
 Adjustable from one side, parallel to PCB</description>
<wire x1="-3.75" y1="2.91" x2="3.75" y2="2.91" width="0.254" layer="51"/>
<wire x1="3.75" y1="2.91" x2="3.75" y2="-2.54" width="0.254" layer="21"/>
<wire x1="3.75" y1="-2.54" x2="-3.75" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-3.75" y1="-2.54" x2="-3.75" y2="2.91" width="0.254" layer="21"/>
<wire x1="-1.5" y1="-2.64" x2="-1.5" y2="-3.64" width="0.254" layer="21"/>
<wire x1="-1.5" y1="-3.64" x2="-0.45" y2="-3.64" width="0.254" layer="21"/>
<wire x1="0.45" y1="-3.64" x2="1.5" y2="-3.64" width="0.254" layer="21"/>
<wire x1="1.5" y1="-3.64" x2="1.5" y2="-2.64" width="0.254" layer="21"/>
<wire x1="-0.45" y1="-3.64" x2="-0.45" y2="-3.14" width="0.254" layer="21"/>
<wire x1="-0.45" y1="-3.14" x2="0.45" y2="-3.14" width="0.254" layer="21"/>
<wire x1="0.45" y1="-3.14" x2="0.45" y2="-3.64" width="0.254" layer="21"/>
<wire x1="-1.55" y1="2.91" x2="1.5" y2="2.91" width="0.254" layer="21"/>
<pad name="1A" x="-2.5" y="3.81" drill="1.3"/>
<pad name="1B" x="2.5" y="3.81" drill="1.3"/>
<pad name="2" x="0" y="1.31" drill="1.3"/>
<text x="-2.54" y="5.08" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-1.27" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.8" y1="3.01" x2="-2.2" y2="4.56" layer="51"/>
<rectangle x1="2.2" y1="3.01" x2="2.8" y2="4.56" layer="51"/>
</package>
<package name="CTRIM3040.450">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; STELCO GmbH&lt;p&gt;
 7 S-Triko 160 V DC for PCB mounting &lt;p&gt;
 Adjustable from both sides, parallel to PCB</description>
<wire x1="-3.75" y1="2.91" x2="3.75" y2="2.91" width="0.254" layer="51"/>
<wire x1="3.75" y1="2.91" x2="3.75" y2="-2.54" width="0.254" layer="21"/>
<wire x1="3.75" y1="-2.54" x2="-3.75" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-3.75" y1="-2.54" x2="-3.75" y2="2.91" width="0.254" layer="21"/>
<wire x1="-1.5" y1="-2.64" x2="-1.5" y2="-3.64" width="0.254" layer="21"/>
<wire x1="-1.5" y1="-3.64" x2="-0.45" y2="-3.64" width="0.254" layer="21"/>
<wire x1="0.45" y1="-3.64" x2="1.5" y2="-3.64" width="0.254" layer="21"/>
<wire x1="1.5" y1="-3.64" x2="1.5" y2="-2.64" width="0.254" layer="21"/>
<wire x1="-0.45" y1="-3.64" x2="-0.45" y2="-3.14" width="0.254" layer="21"/>
<wire x1="-0.45" y1="-3.14" x2="0.45" y2="-3.14" width="0.254" layer="21"/>
<wire x1="0.45" y1="-3.14" x2="0.45" y2="-3.64" width="0.254" layer="21"/>
<wire x1="-1.55" y1="2.91" x2="1.5" y2="2.91" width="0.254" layer="21"/>
<pad name="1A" x="-2.5" y="3.81" drill="1.3"/>
<pad name="1B" x="2.5" y="3.81" drill="1.3"/>
<pad name="2" x="0" y="1.31" drill="1.3"/>
<text x="-2.54" y="5.08" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-1.27" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.8" y1="3.01" x2="-2.2" y2="4.56" layer="51"/>
<rectangle x1="2.2" y1="3.01" x2="2.8" y2="4.56" layer="51"/>
</package>
<package name="CTRIM3040.452">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; STELCO GmbH&lt;p&gt;
 7 S-Triko 160 V DC for PCB mounting &lt;p&gt;
 Adjustable from one side for automatic adjustment, vertical to PCB</description>
<wire x1="-3.3" y1="1.2" x2="3.3" y2="1.2" width="0.254" layer="21" curve="-140.033787"/>
<wire x1="-3.3" y1="-1.2" x2="3.3" y2="-1.2" width="0.254" layer="21" curve="140.033787"/>
<wire x1="-3.3" y1="1.2" x2="-3.3" y2="-1.2" width="0.254" layer="51" curve="39.966213"/>
<wire x1="3.3" y1="-1.2" x2="3.3" y2="1.2" width="0.254" layer="51" curve="39.966213"/>
<wire x1="-0.85" y1="1.5" x2="-1.7" y2="0" width="0.1016" layer="21"/>
<wire x1="-1.7" y1="0" x2="-0.85" y2="-1.5" width="0.1016" layer="21"/>
<wire x1="-0.85" y1="-1.5" x2="0.85" y2="-1.5" width="0.1016" layer="21"/>
<wire x1="0.85" y1="-1.5" x2="1.7" y2="0" width="0.1016" layer="21"/>
<wire x1="1.7" y1="0" x2="0.85" y2="1.5" width="0.1016" layer="21"/>
<wire x1="-0.85" y1="1.5" x2="0.85" y2="1.5" width="0.1016" layer="21"/>
<wire x1="-1.35" y1="0.45" x2="1.05" y2="-1" width="0.1016" layer="21"/>
<wire x1="-1.05" y1="0.95" x2="1.35" y2="-0.5" width="0.1016" layer="21"/>
<circle x="0" y="0" radius="1.5" width="0.1016" layer="21"/>
<circle x="0" y="0" radius="1.4508" width="0.1016" layer="21"/>
<pad name="1A" x="-3.5" y="0" drill="1.3"/>
<pad name="2" x="0" y="-3.5" drill="1.3"/>
<pad name="1B" x="3.5" y="0" drill="1.3"/>
<text x="-2.54" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.9" y1="-0.6" x2="-3.5" y2="0.6" layer="51"/>
<rectangle x1="3.5" y1="-0.6" x2="3.9" y2="0.6" layer="51"/>
<rectangle x1="-0.6" y1="-3.9" x2="0.6" y2="-3.5" layer="51"/>
</package>
<package name="CTRIM3050.504">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; STELCO GmbH&lt;p&gt;
 5 S-Triko 160 V DC for PCB mounting,&lt;p&gt;
 Adjustable from one side, vertical to PCB</description>
<wire x1="-0.7" y1="0.4" x2="0.6" y2="-0.9" width="0.1524" layer="21"/>
<wire x1="-0.2" y1="0.9" x2="1.1" y2="-0.4" width="0.1524" layer="21"/>
<wire x1="-2.4" y1="1" x2="2.8" y2="1" width="0.254" layer="21" curve="-137.924978"/>
<wire x1="-2.4" y1="-1" x2="2.8" y2="-1" width="0.254" layer="21" curve="137.924978"/>
<wire x1="-2.4" y1="1" x2="-2.4" y2="-1" width="0.254" layer="51" curve="42.075022"/>
<wire x1="2.8" y1="-1" x2="2.8" y2="1" width="0.254" layer="51" curve="42.075022"/>
<circle x="0.2" y="0" radius="1" width="0.1524" layer="21"/>
<pad name="1" x="-2.5" y="0" drill="1.1"/>
<pad name="2" x="2.5" y="0" drill="1.1"/>
<text x="-2.54" y="3.175" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="CTRIM3050.505">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; STELCO GmbH&lt;p&gt;
 5 S-Triko 160 V DC for PCB mounting,&lt;p&gt;
 Adjustable from both sides, vertical to PCB</description>
<wire x1="-0.7" y1="0.4" x2="0.6" y2="-0.9" width="0.1524" layer="21"/>
<wire x1="-0.2" y1="0.9" x2="1.1" y2="-0.4" width="0.1524" layer="21"/>
<wire x1="-2.4" y1="1" x2="2.8" y2="1" width="0.254" layer="21" curve="-137.924978"/>
<wire x1="-2.4" y1="-1" x2="2.8" y2="-1" width="0.254" layer="21" curve="137.924978"/>
<wire x1="-2.4" y1="1" x2="-2.4" y2="-1" width="0.254" layer="51" curve="42.075022"/>
<wire x1="2.8" y1="-1" x2="2.8" y2="1" width="0.254" layer="51" curve="42.075022"/>
<circle x="0.2" y="0" radius="1" width="0.1524" layer="21"/>
<pad name="1" x="-2.5" y="0" drill="1.1"/>
<pad name="2" x="2.5" y="0" drill="1.1"/>
<text x="-2.54" y="3.175" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<hole x="0.2" y="0" drill="2.5"/>
</package>
<package name="CTRIM3050.506">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; STELCO GmbH&lt;p&gt;
 5 S-Triko 160 V DC for PCB mounting,&lt;p&gt;
 Adjustable from one side, parallel to PCB</description>
<wire x1="-2.4" y1="0.22" x2="-2.4" y2="-1.63" width="0.254" layer="21"/>
<wire x1="-1.2" y1="-2.63" x2="-1.2" y2="-1.63" width="0.254" layer="21"/>
<wire x1="-1.2" y1="-1.63" x2="1.2" y2="-1.63" width="0.254" layer="21"/>
<wire x1="1.2" y1="-1.63" x2="1.2" y2="-2.63" width="0.254" layer="21"/>
<wire x1="2.4" y1="-1.63" x2="2.4" y2="0.22" width="0.254" layer="21"/>
<wire x1="2.4" y1="1.67" x2="-2.4" y2="1.67" width="0.254" layer="51"/>
<wire x1="-1.2" y1="-2.63" x2="-0.4" y2="-2.63" width="0.254" layer="21"/>
<wire x1="-0.4" y1="-2.63" x2="-0.4" y2="-2.13" width="0.254" layer="21"/>
<wire x1="-0.4" y1="-2.13" x2="0.4" y2="-2.13" width="0.254" layer="21"/>
<wire x1="0.4" y1="-2.13" x2="0.4" y2="-2.63" width="0.254" layer="21"/>
<wire x1="0.4" y1="-2.63" x2="1.2" y2="-2.63" width="0.254" layer="21"/>
<wire x1="-1.2" y1="-1.63" x2="-2.4" y2="-1.63" width="0.254" layer="21"/>
<wire x1="1.2" y1="-1.63" x2="2.4" y2="-1.63" width="0.254" layer="21"/>
<wire x1="-2.4" y1="0.22" x2="-2.4" y2="1.67" width="0.254" layer="51"/>
<wire x1="2.4" y1="0.22" x2="2.4" y2="1.67" width="0.254" layer="51"/>
<wire x1="-1.45" y1="1.67" x2="1.45" y2="1.67" width="0.254" layer="21"/>
<pad name="1A" x="-2.5" y="1.27" drill="1.1"/>
<pad name="1B" x="2.5" y="1.27" drill="1.1"/>
<pad name="2" x="0" y="-0.23" drill="1.1"/>
<text x="-2.54" y="3.175" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="CTRIMCTZ2">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; AVX</description>
<wire x1="-1.15" y1="-1.4" x2="-1.15" y2="0.45" width="0.254" layer="51"/>
<wire x1="-1.15" y1="0.45" x2="-0.45" y2="1.35" width="0.254" layer="51"/>
<wire x1="-0.45" y1="1.35" x2="0.45" y2="1.35" width="0.254" layer="51"/>
<wire x1="0.45" y1="1.35" x2="1.15" y2="0.4" width="0.254" layer="51"/>
<wire x1="1.15" y1="0.4" x2="1.15" y2="-1.4" width="0.254" layer="51"/>
<wire x1="1.15" y1="-1.4" x2="-1.15" y2="-1.4" width="0.254" layer="51"/>
<wire x1="-0.5" y1="-1.4" x2="-1.15" y2="-1.4" width="0.254" layer="21"/>
<wire x1="-1.15" y1="-1.4" x2="-1.15" y2="0.45" width="0.254" layer="21"/>
<wire x1="-1.15" y1="0.45" x2="-0.45" y2="1.35" width="0.254" layer="21"/>
<wire x1="0.5" y1="-1.4" x2="1.15" y2="-1.4" width="0.254" layer="21"/>
<wire x1="1.15" y1="-1.4" x2="1.15" y2="0.4" width="0.254" layer="21"/>
<wire x1="1.15" y1="0.4" x2="0.45" y2="1.35" width="0.254" layer="21"/>
<circle x="0" y="0" radius="0.75" width="0.1524" layer="21"/>
<smd name="1" x="0" y="1.25" dx="0.5" dy="0.45" layer="1"/>
<smd name="2" x="0" y="-1.25" dx="0.55" dy="0.5" layer="1"/>
<text x="-1.4" y="-1.5" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="2.7" y="-1.5" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.15" y1="-0.55" x2="0.15" y2="0.55" layer="21"/>
<rectangle x1="-0.55" y1="-0.15" x2="0.55" y2="0.15" layer="21"/>
</package>
<package name="CTRIMCTZ3">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; AVX</description>
<wire x1="-1.45" y1="-2.15" x2="-1.45" y2="0.75" width="0.254" layer="51"/>
<wire x1="-1.45" y1="0.75" x2="-0.45" y2="2.1" width="0.254" layer="51"/>
<wire x1="-0.45" y1="2.1" x2="0.45" y2="2.1" width="0.254" layer="51"/>
<wire x1="0.45" y1="2.1" x2="1.45" y2="0.75" width="0.254" layer="51"/>
<wire x1="1.45" y1="0.75" x2="1.45" y2="-2.15" width="0.254" layer="51"/>
<wire x1="1.45" y1="-2.15" x2="-1.45" y2="-2.15" width="0.254" layer="51"/>
<wire x1="-0.6" y1="-2.15" x2="-1.45" y2="-2.15" width="0.254" layer="21"/>
<wire x1="-1.45" y1="-2.15" x2="-1.45" y2="0.75" width="0.254" layer="21"/>
<wire x1="-1.45" y1="0.75" x2="-0.45" y2="2.1" width="0.254" layer="21"/>
<wire x1="0.6" y1="-2.15" x2="1.45" y2="-2.15" width="0.254" layer="21"/>
<wire x1="1.45" y1="-2.15" x2="1.45" y2="0.75" width="0.254" layer="21"/>
<wire x1="1.45" y1="0.75" x2="0.45" y2="2.1" width="0.254" layer="21"/>
<circle x="0" y="0" radius="1.1" width="0.1524" layer="21"/>
<smd name="1" x="0" y="1.95" dx="0.6" dy="0.6" layer="1"/>
<smd name="2" x="0" y="-1.95" dx="0.78" dy="0.6" layer="1"/>
<text x="-1.85" y="-2.3" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.1" y="-2.3" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.25" y1="-0.85" x2="0.25" y2="0.85" layer="21"/>
<rectangle x1="-0.85" y1="-0.25" x2="0.85" y2="0.25" layer="21"/>
</package>
<package name="CTRIMTZBX4">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; muRata</description>
<wire x1="-1.9" y1="2.15" x2="-1.9" y2="-2.15" width="0.254" layer="51"/>
<wire x1="-1.9" y1="-2.15" x2="1.9" y2="-2.15" width="0.254" layer="51"/>
<wire x1="1.9" y1="-2.15" x2="1.9" y2="2.15" width="0.254" layer="51"/>
<wire x1="1.9" y1="2.15" x2="-1.9" y2="2.15" width="0.254" layer="51"/>
<wire x1="-1.05" y1="-2.15" x2="-1.9" y2="-2.15" width="0.254" layer="21"/>
<wire x1="-1.9" y1="-2.15" x2="-1.9" y2="2.15" width="0.254" layer="21"/>
<wire x1="-1.9" y1="2.15" x2="-1.05" y2="2.15" width="0.254" layer="21"/>
<wire x1="1.05" y1="-2.15" x2="1.9" y2="-2.15" width="0.254" layer="21"/>
<wire x1="1.9" y1="-2.15" x2="1.9" y2="2.15" width="0.254" layer="21"/>
<wire x1="1.9" y1="2.15" x2="1.05" y2="2.15" width="0.254" layer="21"/>
<circle x="0" y="0" radius="1.5" width="0.1524" layer="51"/>
<smd name="1" x="0" y="1.8" dx="1.6" dy="1.2" layer="1"/>
<smd name="2" x="0" y="-1.8" dx="1.6" dy="1.2" layer="1"/>
<text x="-2.3" y="-2.25" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.55" y="-2.25" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.25" y1="-1.2" x2="0.25" y2="1.2" layer="51"/>
<rectangle x1="-1.2" y1="-0.25" x2="1.2" y2="0.25" layer="51"/>
</package>
<package name="CTRIMCV05">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; BC-Components</description>
<wire x1="-2.8" y1="0" x2="2.8" y2="0" width="0.254" layer="51" curve="-180"/>
<wire x1="-2.8" y1="0" x2="-1.05" y2="2.6" width="0.254" layer="21" curve="-68.064256"/>
<wire x1="1.05" y1="2.6" x2="2.8" y2="0" width="0.254" layer="21" curve="-68.064256"/>
<wire x1="-2.8" y1="0" x2="-2.8" y2="-2.9" width="0.254" layer="21"/>
<wire x1="-2.8" y1="-2.9" x2="-1.1" y2="-2.9" width="0.254" layer="21"/>
<wire x1="-1.1" y1="-2.9" x2="1.15" y2="-2.9" width="0.254" layer="51"/>
<wire x1="1.15" y1="-2.9" x2="2.8" y2="-2.9" width="0.254" layer="21"/>
<wire x1="2.8" y1="-2.9" x2="2.8" y2="0" width="0.254" layer="21"/>
<wire x1="-1.95" y1="-1.15" x2="-1.95" y2="1.15" width="0.1524" layer="51"/>
<wire x1="-1.95" y1="1.15" x2="0" y2="2.25" width="0.1524" layer="51"/>
<wire x1="0" y1="2.25" x2="1.95" y2="1.15" width="0.1524" layer="51"/>
<wire x1="1.95" y1="1.15" x2="1.95" y2="-1.1" width="0.1524" layer="51"/>
<wire x1="1.95" y1="-1.1" x2="0" y2="-2.25" width="0.1524" layer="51"/>
<wire x1="0" y1="-2.25" x2="-1.95" y2="-1.15" width="0.1524" layer="51"/>
<wire x1="-1.95" y1="-1.15" x2="-1.95" y2="1.15" width="0.1524" layer="21"/>
<wire x1="-1.95" y1="1.15" x2="-0.7" y2="1.85" width="0.1524" layer="21"/>
<wire x1="0.7" y1="1.85" x2="1.95" y2="1.15" width="0.1524" layer="21"/>
<wire x1="1.95" y1="1.15" x2="1.95" y2="-1.1" width="0.1524" layer="21"/>
<wire x1="-1.95" y1="-1.15" x2="-0.7" y2="-1.85" width="0.1524" layer="21"/>
<wire x1="0.7" y1="-1.85" x2="1.95" y2="-1.1" width="0.1524" layer="21"/>
<pad name="1" x="0" y="2.5" drill="1"/>
<pad name="2" x="0" y="-2.5" drill="1"/>
<text x="-3.3" y="-3.05" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="4.5" y="-3.05" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.9" y1="-0.5" x2="1.95" y2="0.5" layer="21"/>
</package>
<package name="CTRIMTZ03">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt; muRata</description>
<wire x1="1.45" y1="-2.5" x2="-1.45" y2="-2.5" width="0.254" layer="51"/>
<wire x1="-1.45" y1="-2.5" x2="-1.05" y2="2.7" width="0.254" layer="21" curve="-128.646369"/>
<wire x1="1.05" y1="2.7" x2="1.45" y2="-2.5" width="0.254" layer="21" curve="-128.646369"/>
<wire x1="-1.05" y1="2.7" x2="1.05" y2="2.7" width="0.254" layer="51" curve="-42.501011"/>
<circle x="0" y="0" radius="1.6" width="0.1524" layer="21"/>
<pad name="1" x="0" y="2.5" drill="1"/>
<pad name="2" x="0" y="-2.5" drill="1"/>
<text x="-3.3" y="-2.6" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="4.6" y="-2.6" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.35" y1="-1.2" x2="0.35" y2="1.2" layer="21"/>
<rectangle x1="-1.2" y1="-0.35" x2="1.2" y2="0.35" layer="21"/>
</package>
<package name="CTRIM808-BC">
<description>&lt;b&gt;Trimm capacitor &lt;/b&gt; BC-Components</description>
<wire x1="-3.4036" y1="1.016" x2="-1.016" y2="3.4036" width="0.254" layer="21" curve="-56.758486"/>
<wire x1="1.016" y1="3.4036" x2="3.4036" y2="1.016" width="0.254" layer="21" curve="-56.758486"/>
<wire x1="-3.4036" y1="-1.016" x2="3.4036" y2="-1.016" width="0.254" layer="21" curve="146.758486"/>
<circle x="0" y="0" radius="3.556" width="0.254" layer="51"/>
<circle x="0" y="0" radius="1.271" width="0.1524" layer="21"/>
<pad name="2" x="0" y="3.6068" drill="1.3"/>
<pad name="1" x="-3.6068" y="0" drill="1.3"/>
<pad name="3" x="3.6068" y="0" drill="1.3"/>
<text x="-4.4684" y="-3.4056" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.77" y="-3.4056" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.2192" y1="-0.3048" x2="1.2192" y2="0.3048" layer="21"/>
</package>
<package name="CTRIM808-1">
<description>&lt;b&gt;Trimm capacitor &lt;/b&gt; STELCO GmbH&lt;p&gt;
diameter 8.6 mm, grid 3.55 mm</description>
<wire x1="-3.4925" y1="1.5227" x2="3.4925" y2="1.5227" width="0.1524" layer="21" curve="-132.886424"/>
<wire x1="-1.5227" y1="-3.4925" x2="1.5227" y2="-3.4925" width="0.1524" layer="51" curve="47.113576"/>
<wire x1="-3.4925" y1="1.5227" x2="-3.4925" y2="-1.5227" width="0.1524" layer="51" curve="47.113576"/>
<wire x1="-3.4925" y1="-1.5227" x2="-1.5227" y2="-3.4925" width="0.1524" layer="21" curve="42.886424"/>
<wire x1="0.889" y1="-4.191" x2="-0.889" y2="-4.191" width="0.1524" layer="51"/>
<wire x1="-0.889" y1="-3.705" x2="-0.889" y2="-4.191" width="0.1524" layer="51"/>
<wire x1="0.889" y1="-3.705" x2="0.889" y2="-4.191" width="0.1524" layer="51"/>
<wire x1="-1.2443" y1="-0.254" x2="1.2443" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-1.2443" y1="0.254" x2="1.2443" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-4.191" y1="0.889" x2="-4.191" y2="-0.889" width="0.1524" layer="51"/>
<wire x1="-4.191" y1="0.889" x2="-3.705" y2="0.889" width="0.1524" layer="51"/>
<wire x1="-4.191" y1="-0.889" x2="-3.705" y2="-0.889" width="0.1524" layer="51"/>
<wire x1="3.4925" y1="-1.5227" x2="3.4925" y2="1.5227" width="0.1524" layer="51" curve="47.113576"/>
<wire x1="1.5227" y1="-3.4925" x2="3.4925" y2="-1.5227" width="0.1524" layer="21" curve="42.886424"/>
<wire x1="4.191" y1="0.889" x2="4.191" y2="-0.889" width="0.1524" layer="51"/>
<wire x1="3.705" y1="-0.889" x2="4.191" y2="-0.889" width="0.1524" layer="51"/>
<wire x1="3.705" y1="0.889" x2="4.191" y2="0.889" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="1.27" width="0.1524" layer="21"/>
<pad name="1" x="-3.556" y="0" drill="1.3208"/>
<pad name="3" x="3.556" y="0" drill="1.3208"/>
<pad name="2" x="0" y="-3.556" drill="1.3208"/>
<text x="-4.445" y="-3.937" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="6.223" y="-4.318" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.27" y1="-0.254" x2="1.27" y2="0.254" layer="21"/>
<hole x="0" y="0" drill="3.302"/>
</package>
<package name="CTRIM808-BC7.5">
<description>&lt;b&gt;Trimm capacitor &lt;/b&gt; BC-Components</description>
<wire x1="1.3" y1="5.05" x2="3.35" y2="-1.6" width="0.254" layer="21" curve="-110.073805"/>
<wire x1="-3.35" y1="-1.6" x2="-1.3" y2="5.05" width="0.254" layer="21" curve="-110.073805"/>
<wire x1="-1.45" y1="-3" x2="1.45" y2="-3" width="0.254" layer="21" curve="39.851161"/>
<circle x="0" y="1" radius="4.25" width="0.254" layer="51"/>
<circle x="0" y="1" radius="1.271" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="-2.54" drill="1.3"/>
<pad name="2" x="0" y="5.08" drill="1.3"/>
<pad name="3" x="2.54" y="-2.54" drill="1.3"/>
<text x="-4.4684" y="-3.4056" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.77" y="-3.4056" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.2192" y1="0.6952" x2="1.2192" y2="1.3048" layer="21"/>
<hole x="0" y="1" drill="3"/>
</package>
<package name="L2012C">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.864" y1="0.54" x2="0.864" y2="0.54" width="0.1016" layer="51"/>
<wire x1="-0.864" y1="-0.553" x2="0.864" y2="-0.553" width="0.1016" layer="51"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1" y="0" dx="1" dy="1" layer="1"/>
<smd name="2" x="1" y="0" dx="1" dy="1" layer="1"/>
<text x="-1.905" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.143" y1="-0.6096" x2="-0.843" y2="0.5903" layer="51"/>
<rectangle x1="0.8382" y1="-0.6096" x2="1.1382" y2="0.5903" layer="51"/>
<rectangle x1="-0.3" y1="-0.4001" x2="0.3" y2="0.4001" layer="35"/>
</package>
<package name="L2825P">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;&lt;p&gt;
precision wire wound</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="-0.762" y1="1.2" x2="0.762" y2="1.2" width="0.1016" layer="51"/>
<wire x1="-0.762" y1="-1.213" x2="0.762" y2="-1.213" width="0.1016" layer="51"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="1.34" y1="-0.965" x2="1.34" y2="0.965" width="0.1016" layer="51"/>
<wire x1="-1.34" y1="0.965" x2="-1.34" y2="-0.965" width="0.1016" layer="51"/>
<circle x="0" y="0" radius="0.6604" width="0.1524" layer="51"/>
<smd name="1" x="-1.2" y="0" dx="1.4" dy="2.4" layer="1"/>
<smd name="2" x="1.2" y="0" dx="1.4" dy="2.4" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.7366" y1="-1.27" x2="1.3208" y2="1.27" layer="51"/>
<rectangle x1="-1.3208" y1="-1.27" x2="-0.7366" y2="1.27" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="L3216C">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="-1.27" y1="0.896" x2="1.27" y2="0.896" width="0.1016" layer="51"/>
<wire x1="-1.27" y1="-0.883" x2="1.27" y2="-0.883" width="0.1016" layer="51"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.5" y="0" dx="1.2" dy="1.6" layer="1"/>
<smd name="2" x="1.5" y="0" dx="1.2" dy="1.6" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7526" y1="-0.9525" x2="-1.2525" y2="0.9474" layer="51"/>
<rectangle x1="1.2446" y1="-0.9525" x2="1.7447" y2="0.9474" layer="51"/>
<rectangle x1="-0.4001" y1="-0.5999" x2="0.4001" y2="0.5999" layer="35"/>
</package>
<package name="L3225M">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;&lt;p&gt;
molded</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-1.575" y1="1.27" x2="1.575" y2="1.27" width="0.1524" layer="51"/>
<wire x1="1.575" y1="1.27" x2="1.575" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.575" y1="-1.27" x2="-1.575" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-1.575" y1="-1.27" x2="-1.575" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-1.651" y1="0.94" x2="-1.651" y2="-0.94" width="0.1524" layer="51"/>
<wire x1="1.651" y1="0.94" x2="1.651" y2="-0.94" width="0.1524" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.2" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.2" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-1" x2="0.3" y2="1" layer="35"/>
</package>
<package name="L3225P">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;&lt;p&gt;
precision wire wound</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="-1.676" y1="0.845" x2="1.676" y2="0.845" width="0.1524" layer="51"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-1.676" y1="0.838" x2="-1.676" y2="-0.838" width="0.1524" layer="51"/>
<wire x1="-1.168" y1="0.838" x2="-1.168" y2="-0.838" width="0.1524" layer="51"/>
<wire x1="1.168" y1="0.838" x2="1.168" y2="-0.838" width="0.1524" layer="51"/>
<wire x1="1.676" y1="0.838" x2="1.676" y2="-0.838" width="0.1524" layer="51"/>
<wire x1="1.676" y1="-0.845" x2="-1.676" y2="-0.845" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="0.7117" width="0.1524" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.8" dy="2" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.8" dy="2" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="L3230M">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;&lt;p&gt;
molded</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-1.575" y1="1.27" x2="1.575" y2="1.27" width="0.1524" layer="51"/>
<wire x1="1.575" y1="1.27" x2="1.575" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.575" y1="-1.27" x2="-1.575" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-1.575" y1="-1.27" x2="-1.575" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-1.651" y1="0.94" x2="-1.651" y2="-0.94" width="0.1524" layer="51"/>
<wire x1="1.651" y1="0.94" x2="1.651" y2="-0.94" width="0.1524" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.2" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.2" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-1" x2="0.3" y2="1" layer="35"/>
</package>
<package name="L4035M">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;&lt;p&gt;
molded</description>
<wire x1="-2.973" y1="1.983" x2="2.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-1.983" x2="-2.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-1.983" x2="-2.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="1.983" x2="2.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-2.083" y1="0.686" x2="-2.083" y2="-0.686" width="0.1524" layer="51"/>
<wire x1="2.083" y1="0.686" x2="2.083" y2="-0.686" width="0.1524" layer="51"/>
<wire x1="-1.981" y1="1.524" x2="-1.981" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-1.981" y1="-1.524" x2="1.981" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="1.981" y1="-1.524" x2="1.981" y2="1.524" width="0.1524" layer="51"/>
<wire x1="1.981" y1="1.524" x2="-1.981" y2="1.524" width="0.1524" layer="51"/>
<smd name="1" x="-1.6" y="0" dx="2.2" dy="1.4" layer="1"/>
<smd name="2" x="1.6" y="0" dx="2.2" dy="1.4" layer="1"/>
<text x="-1.905" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="L4516C">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;</description>
<wire x1="-2.973" y1="0.983" x2="2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-0.983" x2="-2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-0.983" x2="-2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-1.626" y1="0.54" x2="1.626" y2="0.54" width="0.1016" layer="51"/>
<wire x1="-1.626" y1="-0.527" x2="1.626" y2="-0.527" width="0.1016" layer="51"/>
<wire x1="2.973" y1="0.983" x2="2.973" y2="-0.983" width="0.0508" layer="39"/>
<smd name="1" x="-2.1" y="0" dx="1" dy="1.6" layer="1"/>
<smd name="2" x="2.1" y="0" dx="1" dy="1.6" layer="1"/>
<text x="-1.905" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4003" y1="-0.5969" x2="-1.6002" y2="0.603" layer="51"/>
<rectangle x1="1.6002" y1="-0.603" x2="2.4003" y2="0.5969" layer="51"/>
<rectangle x1="-0.7" y1="-0.3" x2="0.7" y2="0.3" layer="35"/>
</package>
<package name="L4532M">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;&lt;p&gt;
molded</description>
<wire x1="-3.473" y1="1.983" x2="3.473" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.983" x2="-3.473" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.983" x2="-3.473" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.983" x2="3.473" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-2.21" y1="-1.626" x2="2.21" y2="-1.626" width="0.1524" layer="51"/>
<wire x1="2.21" y1="1.626" x2="-2.21" y2="1.626" width="0.1524" layer="51"/>
<wire x1="-2.337" y1="1.041" x2="-2.337" y2="-1.041" width="0.1524" layer="51"/>
<wire x1="2.337" y1="1.041" x2="2.337" y2="-1.041" width="0.1524" layer="51"/>
<wire x1="-2.21" y1="1.626" x2="-2.21" y2="-1.626" width="0.1524" layer="51"/>
<wire x1="2.21" y1="1.626" x2="2.21" y2="-1.626" width="0.1524" layer="51"/>
<smd name="1" x="-1.9" y="0" dx="2" dy="2.4" layer="1"/>
<smd name="2" x="1.9" y="0" dx="2" dy="2.4" layer="1"/>
<text x="-1.905" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="L4532P">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;&lt;p&gt;
precision wire wound</description>
<wire x1="-2.973" y1="1.983" x2="2.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-1.983" x2="-2.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-1.983" x2="-2.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="-2.311" y1="1.675" x2="2.311" y2="1.675" width="0.1524" layer="51"/>
<wire x1="2.973" y1="1.983" x2="2.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-2.311" y1="-1.653" x2="2.311" y2="-1.653" width="0.1524" layer="51"/>
<wire x1="-2.311" y1="1.626" x2="-2.311" y2="-1.626" width="0.1524" layer="51"/>
<wire x1="2.311" y1="1.675" x2="2.311" y2="-1.626" width="0.1524" layer="51"/>
<wire x1="-1.448" y1="1.651" x2="-1.448" y2="-1.626" width="0.1524" layer="51"/>
<wire x1="1.448" y1="1.626" x2="1.448" y2="-1.626" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="1.3211" width="0.1524" layer="51"/>
<smd name="1" x="-2" y="0" dx="1.8" dy="3.6" layer="1"/>
<smd name="2" x="2" y="0" dx="1.8" dy="3.6" layer="1"/>
<text x="-1.905" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="L5038P">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;&lt;p&gt;
precision wire wound</description>
<wire x1="-2.973" y1="1.983" x2="2.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-1.983" x2="-2.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-1.983" x2="-2.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="-2.286" y1="1.853" x2="2.311" y2="1.853" width="0.1016" layer="51"/>
<wire x1="2.973" y1="1.983" x2="2.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-2.286" y1="-1.856" x2="2.311" y2="-1.856" width="0.1016" layer="51"/>
<wire x1="2.389" y1="-1.27" x2="2.389" y2="1.27" width="0.1016" layer="51"/>
<wire x1="-2.386" y1="-1.27" x2="-2.386" y2="1.27" width="0.1016" layer="51"/>
<wire x1="1.602" y1="-1.854" x2="1.602" y2="1.854" width="0.1016" layer="51"/>
<wire x1="-1.624" y1="-1.854" x2="-1.624" y2="1.854" width="0.1016" layer="51"/>
<wire x1="-2.31" y1="-1.854" x2="-2.31" y2="1.854" width="0.1016" layer="51"/>
<wire x1="2.313" y1="-1.854" x2="2.313" y2="1.854" width="0.1016" layer="51"/>
<circle x="0" y="0" radius="1.4732" width="0.1524" layer="51"/>
<smd name="1" x="-2.2" y="0" dx="1.4" dy="2.8" layer="1"/>
<smd name="2" x="2.2" y="0" dx="1.4" dy="2.8" layer="1"/>
<text x="-1.905" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="L5650M">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;&lt;p&gt;
molded</description>
<wire x1="-3.973" y1="2.983" x2="3.973" y2="2.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-2.983" x2="-3.973" y2="-2.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-2.983" x2="-3.973" y2="2.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="2.983" x2="3.973" y2="-2.983" width="0.0508" layer="39"/>
<wire x1="-2.108" y1="-2.591" x2="2.083" y2="-2.591" width="0.1524" layer="51"/>
<wire x1="2.083" y1="2.591" x2="-2.108" y2="2.591" width="0.1524" layer="51"/>
<wire x1="2.184" y1="2.032" x2="2.184" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="-2.21" y1="2.032" x2="-2.21" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="-2.108" y1="2.591" x2="-2.108" y2="-2.591" width="0.1524" layer="51"/>
<wire x1="2.083" y1="2.591" x2="2.083" y2="-2.591" width="0.1524" layer="51"/>
<smd name="1" x="-2.5" y="0" dx="1.8" dy="4" layer="1"/>
<smd name="2" x="2.5" y="0" dx="1.8" dy="4" layer="1"/>
<text x="-1.905" y="3.175" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="L8530M">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;&lt;p&gt;
molded</description>
<wire x1="-5.473" y1="1.983" x2="5.473" y2="1.983" width="0.0508" layer="39"/>
<wire x1="5.473" y1="-1.983" x2="-5.473" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-5.473" y1="-1.983" x2="-5.473" y2="1.983" width="0.0508" layer="39"/>
<wire x1="5.473" y1="1.983" x2="5.473" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-4.191" y1="-1.524" x2="-4.191" y2="1.524" width="0.1524" layer="51"/>
<wire x1="4.191" y1="1.524" x2="-4.191" y2="1.524" width="0.1524" layer="51"/>
<wire x1="4.191" y1="-1.524" x2="-4.191" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-4.293" y1="-0.66" x2="-4.293" y2="0.66" width="0.1524" layer="51"/>
<wire x1="4.293" y1="-0.66" x2="4.293" y2="0.66" width="0.1524" layer="51"/>
<wire x1="4.191" y1="-1.524" x2="4.191" y2="1.524" width="0.1524" layer="51"/>
<smd name="1" x="-3.7" y="0" dx="2.4" dy="1.4" layer="1"/>
<smd name="2" x="3.7" y="0" dx="2.4" dy="1.4" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="0204/5">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 5 mm</description>
<wire x1="2.54" y1="0" x2="2.032" y2="0" width="0.508" layer="51"/>
<wire x1="-2.54" y1="0" x2="-2.032" y2="0" width="0.508" layer="51"/>
<wire x1="-1.778" y1="0.635" x2="-1.524" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.778" y1="-0.635" x2="-1.524" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="1.524" y1="-0.889" x2="1.778" y2="-0.635" width="0.1524" layer="21" curve="90"/>
<wire x1="1.524" y1="0.889" x2="1.778" y2="0.635" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.778" y1="-0.635" x2="-1.778" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-1.524" y1="0.889" x2="-1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="0.762" x2="-1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-0.889" x2="-1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-0.762" x2="-1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="0.762" x2="1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="0.762" x2="-1.143" y2="0.762" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-0.762" x2="1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-0.762" x2="-1.143" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="1.524" y1="0.889" x2="1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-0.889" x2="1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.635" x2="1.778" y2="0.635" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.0066" y="1.1684" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.1336" y="-2.3114" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-0.254" x2="-1.778" y2="0.254" layer="51"/>
<rectangle x1="1.778" y1="-0.254" x2="2.032" y2="0.254" layer="51"/>
</package>
<package name="0207/10">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 10 mm</description>
<wire x1="5.08" y1="0" x2="4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="0" x2="-4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.048" y="1.524" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.2606" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
</package>
<package name="0207/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 12 mm</description>
<wire x1="6.35" y1="0" x2="5.334" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.334" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="4.445" y1="0" x2="4.064" y2="0" width="0.6096" layer="21"/>
<wire x1="-4.445" y1="0" x2="-4.064" y2="0" width="0.6096" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.175" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
<rectangle x1="4.445" y1="-0.3048" x2="5.3086" y2="0.3048" layer="21"/>
<rectangle x1="-5.3086" y1="-0.3048" x2="-4.445" y2="0.3048" layer="21"/>
</package>
<package name="0207/2V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 2.5 mm</description>
<wire x1="-1.27" y1="0" x2="-0.381" y2="0" width="0.6096" layer="51"/>
<wire x1="-0.254" y1="0" x2="0.254" y2="0" width="0.6096" layer="21"/>
<wire x1="0.381" y1="0" x2="1.27" y2="0" width="0.6096" layer="51"/>
<circle x="-1.27" y="0" radius="1.27" width="0.1524" layer="21"/>
<circle x="-1.27" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-0.0508" y="1.016" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.0508" y="-2.2352" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0207/5V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 5 mm</description>
<wire x1="-2.54" y1="0" x2="-0.889" y2="0" width="0.6096" layer="51"/>
<wire x1="-0.762" y1="0" x2="0.762" y2="0" width="0.6096" layer="21"/>
<wire x1="0.889" y1="0" x2="2.54" y2="0" width="0.6096" layer="51"/>
<circle x="-2.54" y="0" radius="1.27" width="0.1016" layer="21"/>
<circle x="-2.54" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-1.143" y="0.889" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.143" y="-2.159" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0207/7">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 7.5 mm</description>
<wire x1="-3.81" y1="0" x2="-3.429" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="51"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="51"/>
<wire x1="3.429" y1="0" x2="3.81" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.5588" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.429" y1="-0.3048" x2="-3.175" y2="0.3048" layer="51"/>
<rectangle x1="3.175" y1="-0.3048" x2="3.429" y2="0.3048" layer="51"/>
</package>
<package name="0207/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 15mm</description>
<wire x1="7.62" y1="0" x2="6.604" y2="0" width="0.6096" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.604" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="5.715" y1="0" x2="4.064" y2="0" width="0.6096" layer="21"/>
<wire x1="-5.715" y1="0" x2="-4.064" y2="0" width="0.6096" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.175" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
<rectangle x1="5.715" y1="-0.3048" x2="6.5786" y2="0.3048" layer="21"/>
<rectangle x1="-6.5786" y1="-0.3048" x2="-5.715" y2="0.3048" layer="21"/>
</package>
<package name="0204/7">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 7.5 mm</description>
<wire x1="3.81" y1="0" x2="2.921" y2="0" width="0.508" layer="51"/>
<wire x1="-3.81" y1="0" x2="-2.921" y2="0" width="0.508" layer="51"/>
<wire x1="-2.54" y1="0.762" x2="-2.286" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.54" y1="-0.762" x2="-2.286" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="-1.016" x2="2.54" y2="-0.762" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="1.016" x2="2.54" y2="0.762" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.54" y1="-0.762" x2="-2.54" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.016" x2="-1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="0.889" x2="-1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.016" x2="-1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="-0.889" x2="-1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="0.889" x2="1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="0.889" x2="-1.778" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.889" x2="1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.889" x2="-1.778" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.016" x2="1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-1.016" x2="1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.762" x2="2.54" y2="0.762" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="1.2954" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.6256" y="-0.4826" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.54" y1="-0.254" x2="2.921" y2="0.254" layer="21"/>
<rectangle x1="-2.921" y1="-0.254" x2="-2.54" y2="0.254" layer="21"/>
</package>
<package name="0204V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 2.5 mm</description>
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.508" layer="51"/>
<wire x1="-0.127" y1="0" x2="0.127" y2="0" width="0.508" layer="21"/>
<circle x="-1.27" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="-1.27" y="0" radius="0.635" width="0.0508" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.1336" y="1.1684" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.1336" y="-2.3114" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="L1812">
<description>&lt;b&gt;INDUCTOR&lt;/b&gt;&lt;p&gt;
chip</description>
<wire x1="-1.4732" y1="1.6002" x2="1.4732" y2="1.6002" width="0.1016" layer="51"/>
<wire x1="-1.4478" y1="-1.6002" x2="1.4732" y2="-1.6002" width="0.1016" layer="51"/>
<smd name="1" x="-1.95" y="0" dx="1.9" dy="3.4" layer="1"/>
<smd name="2" x="1.95" y="0" dx="1.9" dy="3.4" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.3876" y1="-1.651" x2="-1.4376" y2="1.649" layer="51"/>
<rectangle x1="1.4478" y1="-1.651" x2="2.3978" y2="1.649" layer="51"/>
</package>
<package name="TJ3-U1">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<wire x1="-3.65" y1="8.15" x2="3.65" y2="8.15" width="0.2032" layer="21"/>
<wire x1="3.65" y1="-8.15" x2="-3.65" y2="-8.15" width="0.2032" layer="21"/>
<wire x1="-3.65" y1="-8.15" x2="-3.65" y2="-1.1" width="0.2032" layer="21"/>
<wire x1="-3.65" y1="-1.1" x2="-3.65" y2="1.1" width="0.2032" layer="51"/>
<wire x1="-3.65" y1="1.1" x2="-3.65" y2="8.15" width="0.2032" layer="21"/>
<wire x1="3.65" y1="8.15" x2="3.65" y2="1.1" width="0.2032" layer="21"/>
<wire x1="3.65" y1="1.1" x2="3.65" y2="-1.1" width="0.2032" layer="51"/>
<wire x1="3.65" y1="-1.1" x2="3.65" y2="-8.15" width="0.2032" layer="21"/>
<pad name="1" x="-3.3" y="0" drill="0.9"/>
<pad name="2" x="3.3" y="0" drill="0.9"/>
<text x="-0.635" y="-5.08" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-5.08" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="TJ3-U2">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<circle x="0" y="0" radius="8.3" width="0.2032" layer="27"/>
<pad name="1" x="-7.35" y="0" drill="0.9"/>
<pad name="2" x="7.35" y="0" drill="0.9"/>
<text x="-5.08" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.08" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="TJ4-U1">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<wire x1="-4.95" y1="11.05" x2="4.95" y2="11.05" width="0.2032" layer="21"/>
<wire x1="4.95" y1="11.05" x2="4.95" y2="-11.05" width="0.2032" layer="21"/>
<wire x1="4.95" y1="-11.05" x2="-4.95" y2="-11.05" width="0.2032" layer="21"/>
<wire x1="-4.95" y1="-11.05" x2="-4.95" y2="11.05" width="0.2032" layer="21"/>
<pad name="1" x="-3.935" y="0" drill="0.9"/>
<pad name="2" x="3.935" y="0" drill="0.9"/>
<text x="-0.635" y="-5.08" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-5.08" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="TJ4-U2">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<circle x="0" y="0" radius="11.1" width="0.2032" layer="27"/>
<pad name="1" x="-9.9" y="0" drill="0.9"/>
<pad name="2" x="9.9" y="0" drill="0.9"/>
<text x="-5.08" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.08" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="TJ5-U1">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<wire x1="-5.55" y1="12.55" x2="5.55" y2="12.55" width="0.2032" layer="21"/>
<wire x1="5.55" y1="12.55" x2="5.55" y2="-12.55" width="0.2032" layer="21"/>
<wire x1="5.55" y1="-12.55" x2="-5.55" y2="-12.55" width="0.2032" layer="21"/>
<wire x1="-5.55" y1="-12.55" x2="-5.55" y2="12.55" width="0.2032" layer="21"/>
<pad name="1" x="-4.7" y="0" drill="0.9"/>
<pad name="2" x="4.7" y="0" drill="0.9"/>
<text x="-0.635" y="-5.08" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-5.08" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="TJ5-U2">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<circle x="0" y="0" radius="12.6" width="0.2032" layer="27"/>
<pad name="1" x="-11.45" y="0" drill="0.9"/>
<pad name="2" x="11.45" y="0" drill="0.9"/>
<text x="-5.08" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.08" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="TJ6-U1">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<wire x1="-10.95" y1="17.45" x2="10.95" y2="17.45" width="0.2032" layer="21"/>
<wire x1="10.95" y1="17.45" x2="10.95" y2="-17.45" width="0.2032" layer="21"/>
<wire x1="10.95" y1="-17.45" x2="-10.95" y2="-17.45" width="0.2032" layer="21"/>
<wire x1="-10.95" y1="-17.45" x2="-10.95" y2="17.45" width="0.2032" layer="21"/>
<pad name="1" x="-9.25" y="0" drill="1.3"/>
<pad name="2" x="9.25" y="0" drill="1.3"/>
<text x="-0.635" y="-5.08" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-5.08" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="TJ6-U2">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<circle x="0" y="0" radius="17.5" width="0.2032" layer="27"/>
<pad name="1" x="-15.5" y="0" drill="1.3"/>
<pad name="2" x="15.5" y="0" drill="1.3"/>
<text x="-5.08" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.08" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="TJ7-U1">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<wire x1="-9.45" y1="20.85" x2="9.43" y2="20.85" width="0.2032" layer="21"/>
<wire x1="9.43" y1="20.85" x2="9.45" y2="-20.85" width="0.2032" layer="21"/>
<wire x1="9.45" y1="-20.85" x2="-9.45" y2="-20.85" width="0.2032" layer="21"/>
<wire x1="-9.45" y1="-20.85" x2="-9.45" y2="20.85" width="0.2032" layer="21"/>
<pad name="1" x="-7.9" y="0" drill="1.3"/>
<pad name="2" x="7.9" y="0" drill="1.3"/>
<text x="-0.635" y="-5.08" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-5.08" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="TJ7-U2">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<circle x="0" y="0" radius="20.9" width="0.2032" layer="27"/>
<pad name="1" x="-18.8" y="0" drill="1.3"/>
<pad name="2" x="18.8" y="0" drill="1.3"/>
<text x="-5.08" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.08" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="TJ8-U1">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<wire x1="-12.55" y1="24.25" x2="12.55" y2="24.25" width="0.2032" layer="21"/>
<wire x1="12.55" y1="24.25" x2="12.55" y2="-24.25" width="0.2032" layer="21"/>
<wire x1="12.55" y1="-24.25" x2="-12.55" y2="-24.25" width="0.2032" layer="21"/>
<wire x1="-12.55" y1="-24.25" x2="-12.55" y2="24.25" width="0.2032" layer="21"/>
<pad name="1" x="-10.4" y="0" drill="1.5"/>
<pad name="2" x="10.4" y="0" drill="1.5"/>
<text x="-0.635" y="-5.08" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-5.08" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="TJ8-U2">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<circle x="0" y="0" radius="24.6" width="0.2032" layer="27"/>
<pad name="1" x="-22.35" y="0" drill="1.5"/>
<pad name="2" x="22.35" y="0" drill="1.5"/>
<text x="-5.08" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.08" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="TJ9-U1">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<wire x1="-17.95" y1="33.75" x2="17.95" y2="33.75" width="0.2032" layer="21"/>
<wire x1="17.95" y1="33.75" x2="17.95" y2="-33.75" width="0.2032" layer="21"/>
<wire x1="17.95" y1="-33.75" x2="-17.95" y2="-33.75" width="0.2032" layer="21"/>
<wire x1="-17.95" y1="-33.75" x2="-17.95" y2="33.75" width="0.2032" layer="21"/>
<pad name="1" x="-15.9" y="0" drill="1.8"/>
<pad name="2" x="15.9" y="0" drill="1.8"/>
<text x="-0.635" y="-5.08" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-5.08" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
<package name="TJ9-U2">
<description>&lt;b&gt;Inductor&lt;/b&gt;&lt;p&gt;
Source: TJ-Serie Vishay.pdf</description>
<circle x="0" y="0" radius="34.5" width="0.2032" layer="27"/>
<pad name="1" x="-31.6" y="0" drill="1.8"/>
<pad name="2" x="31.6" y="0" drill="1.8"/>
<text x="-5.08" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.08" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="POWER-CHOKE_WE-TPC">
<description>&lt;b&gt;POWER-CHOKE WE-TPC&lt;/b&gt;&lt;p&gt;
Würth Elektronik, Partnumber: 744053220&lt;br&gt;
Source: WE-TPC 744053220.pdf</description>
<wire x1="-2.8" y1="2.3" x2="-2.3" y2="2.8" width="0.2" layer="51" curve="-90"/>
<wire x1="-2.3" y1="2.8" x2="2.3" y2="2.8" width="0.2" layer="51"/>
<wire x1="2.3" y1="2.8" x2="2.8" y2="2.3" width="0.2" layer="51" curve="-90"/>
<wire x1="2.8" y1="2.3" x2="2.8" y2="-2.3" width="0.2" layer="51"/>
<wire x1="2.8" y1="-2.3" x2="2.3" y2="-2.8" width="0.2" layer="51" curve="-90"/>
<wire x1="2.3" y1="-2.8" x2="-2.3" y2="-2.8" width="0.2" layer="51"/>
<wire x1="-2.3" y1="-2.8" x2="-2.8" y2="-2.3" width="0.2" layer="51" curve="-90"/>
<wire x1="-2.8" y1="-2.3" x2="-2.8" y2="2.3" width="0.2" layer="51"/>
<wire x1="-2.8" y1="0.65" x2="-2.8" y2="-0.65" width="0.2" layer="21"/>
<wire x1="-2" y1="0.65" x2="-2" y2="-0.65" width="0.2" layer="21" curve="36.008323"/>
<wire x1="2.8" y1="-0.65" x2="2.8" y2="0.65" width="0.2" layer="21"/>
<wire x1="2" y1="-0.65" x2="2" y2="0.65" width="0.2" layer="21" curve="36.008323"/>
<circle x="0" y="0" radius="2.1" width="0.2" layer="51"/>
<smd name="1" x="0" y="2.05" dx="6.3" dy="2.2" layer="1" roundness="25"/>
<smd name="2" x="0" y="-2.05" dx="6.3" dy="2.2" layer="1" roundness="25" rot="R180"/>
<text x="-3.5" y="3.5" size="1.778" layer="25">&gt;NAME</text>
<text x="-3.5" y="-5.3" size="1.778" layer="27">&gt;VALUE</text>
</package>
<package name="2200-12.7">
<description>&lt;b&gt;newport components&lt;/b&gt; 2200 Serie RM 12.7 mm&lt;p&gt;
Miniatur Axial Lead Inductors&lt;br&gt;
Source: www.rsonline.de&lt;br&gt;
Order code 240-517</description>
<wire x1="-4.9" y1="1.9" x2="4.9" y2="1.9" width="0.2032" layer="51"/>
<wire x1="4.9" y1="1.9" x2="4.9" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="4.9" y1="-1.9" x2="-4.9" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-4.9" y1="-1.9" x2="-4.9" y2="1.9" width="0.2032" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.08" y2="0" width="0.5" layer="51"/>
<wire x1="6.35" y1="0" x2="5.08" y2="0" width="0.5" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="0.8" diameter="1.27"/>
<pad name="2" x="6.35" y="0" drill="0.8" diameter="1.27"/>
<text x="-4.445" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="-0.635" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="2200-15.24">
<description>&lt;b&gt;newport components&lt;/b&gt; 2200 Serie RM 15.24 mm&lt;p&gt;
Miniatur Axial Lead Inductors&lt;br&gt;
Source: www.rsonline.de&lt;br&gt;
Order code 240-517</description>
<wire x1="-4.9" y1="1.9" x2="4.9" y2="1.9" width="0.2032" layer="51"/>
<wire x1="4.9" y1="1.9" x2="4.9" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="4.9" y1="-1.9" x2="-4.9" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-4.9" y1="-1.9" x2="-4.9" y2="1.9" width="0.2032" layer="51"/>
<wire x1="-7.62" y1="0" x2="-5.08" y2="0" width="0.5" layer="51"/>
<wire x1="7.62" y1="0" x2="5.08" y2="0" width="0.5" layer="51"/>
<pad name="1" x="-7.62" y="0" drill="0.8" diameter="1.27"/>
<pad name="2" x="7.62" y="0" drill="0.8" diameter="1.27"/>
<text x="-4.445" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="-0.635" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="2200-11.43">
<description>&lt;b&gt;newport components&lt;/b&gt; 2200 Serie RM 11.43 mm&lt;p&gt;
Miniatur Axial Lead Inductors&lt;br&gt;
Source: www.rsonline.de&lt;br&gt;
Order code 240-517</description>
<wire x1="-4.9" y1="1.9" x2="4.9" y2="1.9" width="0.2032" layer="51"/>
<wire x1="4.9" y1="1.9" x2="4.9" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="4.9" y1="-1.9" x2="-4.9" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-4.9" y1="-1.9" x2="-4.9" y2="1.9" width="0.2032" layer="51"/>
<wire x1="-5.715" y1="0" x2="-5.08" y2="0" width="0.5" layer="51"/>
<wire x1="5.715" y1="0" x2="5.08" y2="0" width="0.5" layer="51"/>
<pad name="1" x="-5.715" y="0" drill="0.8" diameter="1.27"/>
<pad name="2" x="5.715" y="0" drill="0.8" diameter="1.27"/>
<text x="-4.445" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="-0.635" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="CEP125">
<description>&lt;b&gt;POWER INDUCTORS&lt;/b&gt; (SMT Type)&lt;p&gt;
Source: www.sumida.com/products/pdf/CEP125.pdf</description>
<wire x1="-1.5796" y1="6.3448" x2="-1.5533" y2="6.3448" width="0.2032" layer="21"/>
<wire x1="-1.5533" y1="6.3448" x2="-1.29" y2="6.0815" width="0.2032" layer="21"/>
<wire x1="-1.29" y1="6.0815" x2="-1.1584" y2="6.0816" width="0.2032" layer="21"/>
<wire x1="-1.1584" y1="6.0816" x2="-1.1584" y2="6.2922" width="0.2032" layer="21"/>
<wire x1="-1.1584" y1="6.2922" x2="-1.1583" y2="6.2922" width="0.2032" layer="21"/>
<wire x1="-1.1583" y1="6.2922" x2="-1.1057" y2="6.3448" width="0.2032" layer="21"/>
<wire x1="-1.1057" y1="6.3448" x2="1.1057" y2="6.3448" width="0.2032" layer="21"/>
<wire x1="1.1057" y1="6.3448" x2="1.1057" y2="6.0815" width="0.2032" layer="21"/>
<wire x1="1.1057" y1="6.0815" x2="1.211" y2="6.0815" width="0.2032" layer="21"/>
<wire x1="1.211" y1="6.0815" x2="1.4217" y2="6.3448" width="0.2032" layer="21"/>
<wire x1="1.4217" y1="6.3448" x2="6.1079" y2="6.3448" width="0.2032" layer="51"/>
<wire x1="6.1079" y1="6.3448" x2="6.3448" y2="6.1079" width="0.2032" layer="21" curve="-96.645912"/>
<wire x1="6.3448" y1="6.1079" x2="6.3448" y2="1.8166" width="0.2032" layer="21"/>
<wire x1="6.3448" y1="1.8166" x2="6.2658" y2="1.7376" width="0.2032" layer="21"/>
<wire x1="6.2658" y1="1.7376" x2="6.2658" y2="-1.7376" width="0.2032" layer="21"/>
<wire x1="6.2658" y1="-1.7376" x2="6.3448" y2="-1.8166" width="0.2032" layer="21"/>
<wire x1="6.3448" y1="-1.8166" x2="6.3448" y2="-6.0289" width="0.2032" layer="21"/>
<wire x1="6.3448" y1="-6.0289" x2="6.0289" y2="-6.3448" width="0.2032" layer="21" curve="-91.024745"/>
<wire x1="6.0289" y1="-6.3448" x2="-6.0289" y2="-6.3448" width="0.2032" layer="51"/>
<wire x1="-6.3448" y1="-6.0289" x2="-6.3448" y2="6.1342" width="0.2032" layer="21"/>
<wire x1="-6.3448" y1="6.1342" x2="-6.1342" y2="6.3448" width="0.2032" layer="21" curve="-83.297108"/>
<wire x1="-6.1342" y1="6.3448" x2="-1.5533" y2="6.3448" width="0.2032" layer="51"/>
<wire x1="-6.2395" y1="5.7393" x2="-2.0535" y2="5.7393" width="0.2032" layer="51"/>
<wire x1="-2.0535" y1="5.7393" x2="-1.5534" y2="3.9754" width="0.2032" layer="51"/>
<wire x1="-1.5534" y1="3.9754" x2="1.527" y2="3.9754" width="0.2032" layer="21"/>
<wire x1="1.527" y1="3.9754" x2="2.0535" y2="5.7393" width="0.2032" layer="51"/>
<wire x1="2.0535" y1="5.7393" x2="6.2395" y2="5.7393" width="0.2032" layer="51"/>
<wire x1="6.2395" y1="-3.4752" x2="-6.2658" y2="-3.4752" width="0.2032" layer="21"/>
<wire x1="-5.6077" y1="-3.5805" x2="-5.6077" y2="-6.2395" width="0.2032" layer="21"/>
<wire x1="-4.8968" y1="-6.2395" x2="-4.8968" y2="-3.5805" width="0.2032" layer="21"/>
<wire x1="-4.7915" y1="-6.0552" x2="-2.2115" y2="-6.0552" width="0.2032" layer="21"/>
<wire x1="-2.9486" y1="-5.9499" x2="-2.9223" y2="-5.9499" width="0.2032" layer="21"/>
<wire x1="-2.9223" y1="-5.9499" x2="-2.9223" y2="-3.5805" width="0.2032" layer="21"/>
<wire x1="-2.1588" y1="-6.2395" x2="-2.1588" y2="-3.8701" width="0.2032" layer="21"/>
<wire x1="2.1325" y1="-6.2395" x2="2.1325" y2="-3.8701" width="0.2032" layer="21"/>
<wire x1="2.2378" y1="-6.0289" x2="4.8968" y2="-6.0289" width="0.2032" layer="21"/>
<wire x1="4.8968" y1="-3.5805" x2="4.8968" y2="-6.2395" width="0.2032" layer="21"/>
<wire x1="2.9486" y1="-5.9236" x2="2.9486" y2="-3.5805" width="0.2032" layer="21"/>
<wire x1="5.5813" y1="-6.2395" x2="5.5813" y2="-3.5805" width="0.2032" layer="21"/>
<wire x1="2.5011" y1="-3.5805" x2="-2.4747" y2="-3.5805" width="0.2032" layer="51" curve="-63.906637"/>
<wire x1="1.1057" y1="6.0815" x2="-1.1584" y2="6.0815" width="0.2032" layer="21"/>
<wire x1="-1.7902" y1="5.1601" x2="1.7376" y2="5.1863" width="0.2032" layer="21" curve="-37.134171"/>
<wire x1="-6.0289" y1="-6.3448" x2="-6.3448" y2="-6.0289" width="0.2032" layer="21" curve="-90.91408"/>
<smd name="1" x="-3.5" y="5.375" dx="3" dy="2.75" layer="1"/>
<smd name="2" x="3.5" y="5.375" dx="3" dy="2.75" layer="1"/>
<smd name="3" x="0" y="-5.48" dx="3" dy="2.55" layer="1"/>
<text x="-5.08" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.08" y="-1.27" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="L0201">
<description>&lt;b&gt;NIS02 Chip Inductor&lt;/b&gt;&lt;p&gt;
Source: http://www.niccomp.com/Catalog/nis.pdf</description>
<smd name="1" x="-0.275" y="0" dx="0.25" dy="0.35" layer="1"/>
<smd name="2" x="0.275" y="0" dx="0.25" dy="0.35" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-0.15" x2="-0.15" y2="0.15" layer="51"/>
<rectangle x1="0.15" y1="-0.15" x2="0.3" y2="0.15" layer="51"/>
<rectangle x1="-0.15" y1="0.05" x2="0.15" y2="0.15" layer="51"/>
<rectangle x1="-0.15" y1="-0.15" x2="0.15" y2="-0.05" layer="51"/>
</package>
<package name="PIS2816">
<description>&lt;b&gt;PIS 2826&lt;/b&gt; Inductor&lt;p&gt;
Source: http://www.stetco.com/products/inductors/pdf/PIS2816.pdf</description>
<wire x1="-3.65" y1="-3.65" x2="3.65" y2="-3.65" width="0.2032" layer="51"/>
<wire x1="3.65" y1="-3.65" x2="3.65" y2="3.65" width="0.2032" layer="21"/>
<wire x1="3.65" y1="3.65" x2="-3.65" y2="3.65" width="0.2032" layer="51"/>
<wire x1="-3.65" y1="3.65" x2="-3.65" y2="-3.65" width="0.2032" layer="21"/>
<wire x1="2.75" y1="1.125" x2="-2.875" y2="-0.625" width="0.1016" layer="21"/>
<wire x1="-2.75" y1="-1.125" x2="2.875" y2="0.625" width="0.1016" layer="21"/>
<wire x1="-2.875" y1="-0.625" x2="2.75" y2="1.125" width="0.1016" layer="51" curve="-169.840784"/>
<wire x1="2.875" y1="0.625" x2="-2.75" y2="-1.125" width="0.1016" layer="51" curve="-169.840784"/>
<wire x1="-2.875" y1="-0.625" x2="-1.375" y2="2.6" width="0.1016" layer="21" curve="-74.384165"/>
<wire x1="2.75" y1="1.125" x2="1.275" y2="2.675" width="0.1016" layer="21" curve="42.122709"/>
<wire x1="2.875" y1="0.625" x2="1.375" y2="-2.6" width="0.1016" layer="21" curve="-74.384165"/>
<wire x1="-2.75" y1="-1.125" x2="-1.275" y2="-2.675" width="0.1016" layer="21" curve="42.122709"/>
<wire x1="-1.35" y1="3.65" x2="-3.65" y2="3.65" width="0.2032" layer="21"/>
<wire x1="-3.65" y1="-3.65" x2="-1.35" y2="-3.65" width="0.2032" layer="21"/>
<wire x1="1.35" y1="-3.65" x2="3.65" y2="-3.65" width="0.2032" layer="21"/>
<wire x1="3.65" y1="3.65" x2="1.35" y2="3.65" width="0.2032" layer="21"/>
<circle x="1.5" y="1.375" radius="0.25" width="0" layer="21"/>
<smd name="1" x="0" y="3.2" dx="2.2" dy="1.6" layer="1"/>
<smd name="2" x="0" y="-3.2" dx="2.2" dy="1.6" layer="1"/>
<text x="-3.625" y="4.5" size="1.778" layer="25">&gt;NAME</text>
<text x="-3.625" y="-6.25" size="1.778" layer="27">&gt;VALUE</text>
</package>
<package name="IR-2">
<description>&lt;B&gt;Vishay Dale Inductor&lt;/b&gt;&lt;p&gt;
Source: www.vishay.com .. ir.pdf</description>
<wire x1="5.08" y1="0" x2="4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="0" x2="-4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="1.164" x2="-2.9" y2="1.425" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-1.164" x2="-2.925" y2="-1.425" width="0.1524" layer="21" curve="90"/>
<wire x1="2.925" y1="-1.425" x2="3.175" y2="-1.164" width="0.1524" layer="21" curve="90"/>
<wire x1="2.925" y1="1.425" x2="3.175" y2="1.164" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-1.164" x2="-3.175" y2="1.164" width="0.1524" layer="21"/>
<wire x1="2.925" y1="1.425" x2="-2.9" y2="1.425" width="0.1524" layer="21"/>
<wire x1="2.925" y1="-1.425" x2="-2.925" y2="-1.425" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.164" x2="3.175" y2="1.164" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="1" diameter="1.6764"/>
<pad name="2" x="5.08" y="0" drill="1" diameter="1.6764"/>
<text x="-3.175" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.2606" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
</package>
<package name="IR-4">
<description>&lt;B&gt;Vishay Dale Inductor&lt;/b&gt;&lt;p&gt;
Source: www.vishay.com .. ir.pdf</description>
<wire x1="6.73" y1="0" x2="5.714" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.705" y1="0" x2="-5.689" y2="0" width="0.6096" layer="51"/>
<wire x1="-4.8" y1="1.939" x2="-4.525" y2="2.2" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.8" y1="-1.939" x2="-4.55" y2="-2.2" width="0.1524" layer="21" curve="90"/>
<wire x1="4.575" y1="-2.2" x2="4.825" y2="-1.939" width="0.1524" layer="21" curve="90"/>
<wire x1="4.575" y1="2.2" x2="4.825" y2="1.939" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.8" y1="-1.939" x2="-4.8" y2="1.939" width="0.1524" layer="21"/>
<wire x1="4.575" y1="2.2" x2="-4.525" y2="2.2" width="0.1524" layer="21"/>
<wire x1="4.575" y1="-2.2" x2="-4.55" y2="-2.2" width="0.1524" layer="21"/>
<wire x1="4.825" y1="-1.939" x2="4.825" y2="1.939" width="0.1524" layer="21"/>
<pad name="1" x="-6.705" y="0" drill="1" diameter="1.6764"/>
<pad name="2" x="6.73" y="0" drill="1" diameter="1.6764"/>
<text x="-3.81" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.825" y1="-0.3048" x2="5.6886" y2="0.3048" layer="21"/>
<rectangle x1="-5.6636" y1="-0.3048" x2="-4.8" y2="0.3048" layer="21"/>
</package>
<package name="IRF-1">
<description>&lt;B&gt;Vishay Dale Inductor&lt;/b&gt;&lt;p&gt;
Source: www.vishay.com .. irf.pdf</description>
<wire x1="5.715" y1="0" x2="4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.715" y1="0" x2="-4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="1.164" x2="-2.9" y2="1.425" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-1.164" x2="-2.925" y2="-1.425" width="0.1524" layer="21" curve="90"/>
<wire x1="2.925" y1="-1.425" x2="3.175" y2="-1.164" width="0.1524" layer="21" curve="90"/>
<wire x1="2.925" y1="1.425" x2="3.175" y2="1.164" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-1.164" x2="-3.175" y2="1.164" width="0.1524" layer="21"/>
<wire x1="2.925" y1="1.425" x2="-2.9" y2="1.425" width="0.1524" layer="21"/>
<wire x1="2.925" y1="-1.425" x2="-2.925" y2="-1.425" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.164" x2="3.175" y2="1.164" width="0.1524" layer="21"/>
<pad name="1" x="-5.715" y="0" drill="1" diameter="1.6764"/>
<pad name="2" x="5.715" y="0" drill="1" diameter="1.6764"/>
<text x="-3.175" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.2606" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.2" y2="0.3048" layer="21"/>
<rectangle x1="-4.2" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
</package>
<package name="IRF-3">
<description>&lt;B&gt;Vishay Dale Inductor&lt;/b&gt;&lt;p&gt;
Source: www.vishay.com .. irf.pdf</description>
<wire x1="6.73" y1="0" x2="5.2" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.705" y1="0" x2="-5.225" y2="0" width="0.6096" layer="51"/>
<wire x1="-4.8" y1="1.739" x2="-4.525" y2="2" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.8" y1="-1.764" x2="-4.55" y2="-2.025" width="0.1524" layer="21" curve="90"/>
<wire x1="4.575" y1="-2.025" x2="4.825" y2="-1.764" width="0.1524" layer="21" curve="90"/>
<wire x1="4.575" y1="2" x2="4.825" y2="1.739" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.8" y1="-1.764" x2="-4.8" y2="1.739" width="0.1524" layer="21"/>
<wire x1="4.575" y1="2" x2="-4.525" y2="2" width="0.1524" layer="21"/>
<wire x1="4.575" y1="-2.025" x2="-4.55" y2="-2.025" width="0.1524" layer="21"/>
<wire x1="4.825" y1="-1.764" x2="4.825" y2="1.739" width="0.1524" layer="21"/>
<pad name="1" x="-6.705" y="0" drill="1" diameter="1.6764"/>
<pad name="2" x="6.73" y="0" drill="1" diameter="1.6764"/>
<text x="-3.81" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.825" y1="-0.3048" x2="5.2" y2="0.3048" layer="21"/>
<rectangle x1="-5.2" y1="-0.3048" x2="-4.8" y2="0.3048" layer="21"/>
</package>
<package name="IRF24">
<description>&lt;B&gt;Vishay Dale Inductor&lt;/b&gt;&lt;p&gt;
Source: www.vishay.com .. irf24.pdf</description>
<wire x1="5.825" y1="0" x2="6.985" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.915" y1="0" x2="-6.985" y2="0" width="0.6096" layer="51"/>
<wire x1="-1.925" y1="1.164" x2="-1.65" y2="1.425" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.925" y1="-1.164" x2="-1.675" y2="-1.425" width="0.1524" layer="21" curve="90"/>
<wire x1="1.675" y1="-1.425" x2="1.925" y2="-1.164" width="0.1524" layer="21" curve="90"/>
<wire x1="1.675" y1="1.425" x2="1.925" y2="1.164" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.925" y1="-1.164" x2="-5.725" y2="0" width="0.1524" layer="21"/>
<wire x1="-5.725" y1="0" x2="-1.925" y2="1.164" width="0.1524" layer="21"/>
<wire x1="1.675" y1="1.425" x2="-1.65" y2="1.425" width="0.1524" layer="21"/>
<wire x1="1.675" y1="-1.425" x2="-1.675" y2="-1.425" width="0.1524" layer="21"/>
<wire x1="1.925" y1="-1.164" x2="5.725" y2="0" width="0.1524" layer="21"/>
<wire x1="5.725" y1="0" x2="1.925" y2="1.164" width="0.1524" layer="21"/>
<pad name="1" x="-6.985" y="0" drill="1" diameter="1.6764"/>
<pad name="2" x="6.985" y="0" drill="1" diameter="1.6764"/>
<text x="-3.175" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.2606" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="5" y1="-0.3048" x2="5.825" y2="0.3048" layer="21"/>
<rectangle x1="-5.85" y1="-0.3048" x2="-5" y2="0.3048" layer="21"/>
</package>
<package name="IRF36">
<description>&lt;B&gt;Vishay Dale Inductor&lt;/b&gt;&lt;p&gt;
Source: www.vishay.com .. irf36.pdf</description>
<wire x1="7.825" y1="0" x2="8.89" y2="0" width="0.6096" layer="51"/>
<wire x1="-7.915" y1="0" x2="-8.89" y2="0" width="0.6096" layer="51"/>
<wire x1="-2.925" y1="1.639" x2="-2.65" y2="1.9" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.925" y1="-1.664" x2="-2.675" y2="-1.925" width="0.1524" layer="21" curve="90"/>
<wire x1="2.675" y1="-1.925" x2="2.925" y2="-1.664" width="0.1524" layer="21" curve="90"/>
<wire x1="2.675" y1="1.9" x2="2.925" y2="1.639" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.925" y1="-1.664" x2="-7.95" y2="0" width="0.1524" layer="21"/>
<wire x1="-7.95" y1="0" x2="-2.925" y2="1.639" width="0.1524" layer="21"/>
<wire x1="2.675" y1="1.9" x2="-2.65" y2="1.9" width="0.1524" layer="21"/>
<wire x1="2.675" y1="-1.925" x2="-2.675" y2="-1.925" width="0.1524" layer="21"/>
<wire x1="2.925" y1="-1.664" x2="7.95" y2="0" width="0.1524" layer="21"/>
<wire x1="7.95" y1="0" x2="2.925" y2="1.639" width="0.1524" layer="21"/>
<pad name="1" x="-8.89" y="0" drill="1" diameter="1.6764"/>
<pad name="2" x="8.89" y="0" drill="1" diameter="1.6764"/>
<text x="-3.175" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="7" y1="-0.3048" x2="8.05" y2="0.3048" layer="21"/>
<rectangle x1="-8.05" y1="-0.3048" x2="-7" y2="0.3048" layer="21"/>
</package>
<package name="IRF46">
<description>&lt;B&gt;Vishay Dale Inductor&lt;/b&gt;&lt;p&gt;
Source: www.vishay.com .. irf46.pdf</description>
<wire x1="5.715" y1="0" x2="4.445" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.715" y1="0" x2="-4.445" y2="0" width="0.6096" layer="51"/>
<wire x1="-2.925" y1="2.164" x2="-2.65" y2="2.425" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.925" y1="-2.164" x2="-2.675" y2="-2.425" width="0.1524" layer="21" curve="90"/>
<wire x1="2.675" y1="-2.425" x2="2.925" y2="-2.164" width="0.1524" layer="21" curve="90"/>
<wire x1="2.675" y1="2.425" x2="2.925" y2="2.164" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.925" y1="-2.164" x2="-2.925" y2="2.164" width="0.1524" layer="21"/>
<wire x1="2.675" y1="2.425" x2="-2.65" y2="2.425" width="0.1524" layer="21"/>
<wire x1="2.675" y1="-2.425" x2="-2.675" y2="-2.425" width="0.1524" layer="21"/>
<wire x1="2.925" y1="-2.164" x2="2.925" y2="2.164" width="0.1524" layer="21"/>
<pad name="1" x="-5.715" y="0" drill="1" diameter="1.6764"/>
<pad name="2" x="5.715" y="0" drill="1" diameter="1.6764"/>
<text x="-3.81" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.925" y1="-0.3048" x2="4.9" y2="0.3048" layer="21"/>
<rectangle x1="-4.925" y1="-0.3048" x2="-2.925" y2="0.3048" layer="21"/>
</package>
<package name="LAL02">
<description>&lt;b&gt;TAYO YUDEN Inductor&lt;/b&gt;&lt;p&gt;
Source: je999f5.pdf</description>
<wire x1="2.54" y1="0" x2="1.905" y2="0" width="0.508" layer="51"/>
<wire x1="-2.54" y1="0" x2="-1.905" y2="0" width="0.508" layer="51"/>
<wire x1="-1.615" y1="0.812" x2="-1.361" y2="1.066" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.615" y1="-0.812" x2="-1.361" y2="-1.066" width="0.1524" layer="21" curve="90"/>
<wire x1="1.361" y1="-1.066" x2="1.615" y2="-0.812" width="0.1524" layer="21" curve="90"/>
<wire x1="1.361" y1="1.066" x2="1.615" y2="0.812" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.615" y1="-0.812" x2="-1.615" y2="0.812" width="0.1524" layer="21"/>
<wire x1="-1.361" y1="1.066" x2="-0.98" y2="1.066" width="0.1524" layer="21"/>
<wire x1="-0.853" y1="0.939" x2="-0.98" y2="1.066" width="0.1524" layer="21"/>
<wire x1="-1.361" y1="-1.066" x2="-0.98" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="-0.853" y1="-0.939" x2="-0.98" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="0.853" y1="0.939" x2="0.98" y2="1.066" width="0.1524" layer="21"/>
<wire x1="0.853" y1="0.939" x2="-0.853" y2="0.939" width="0.1524" layer="21"/>
<wire x1="0.853" y1="-0.939" x2="0.98" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="0.853" y1="-0.939" x2="-0.853" y2="-0.939" width="0.1524" layer="21"/>
<wire x1="1.361" y1="1.066" x2="0.98" y2="1.066" width="0.1524" layer="21"/>
<wire x1="1.361" y1="-1.066" x2="0.98" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="1.615" y1="-0.812" x2="1.615" y2="0.812" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="0.8" diameter="1.3"/>
<pad name="2" x="2.54" y="0" drill="0.8" diameter="1.3"/>
<text x="-2.54" y="1.27" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="1.615" y1="-0.254" x2="1.9" y2="0.254" layer="21"/>
<rectangle x1="-1.9" y1="-0.254" x2="-1.615" y2="0.254" layer="21"/>
</package>
<package name="LAL03">
<description>&lt;b&gt;TAYO YUDEN Inductor&lt;/b&gt;&lt;p&gt;
Source: je999f5.pdf</description>
<wire x1="5.08" y1="0" x2="3.705" y2="0" width="0.508" layer="51"/>
<wire x1="-5.08" y1="0" x2="-3.705" y2="0" width="0.508" layer="51"/>
<wire x1="-3.415" y1="0.962" x2="-3.161" y2="1.216" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.415" y1="-0.962" x2="-3.161" y2="-1.216" width="0.1524" layer="21" curve="90"/>
<wire x1="3.161" y1="-1.216" x2="3.415" y2="-0.962" width="0.1524" layer="21" curve="90"/>
<wire x1="3.161" y1="1.216" x2="3.415" y2="0.962" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.415" y1="-0.962" x2="-3.415" y2="0.962" width="0.1524" layer="21"/>
<wire x1="-3.161" y1="1.216" x2="-2.78" y2="1.216" width="0.1524" layer="21"/>
<wire x1="-2.653" y1="1.089" x2="-2.78" y2="1.216" width="0.1524" layer="21"/>
<wire x1="-3.161" y1="-1.216" x2="-2.78" y2="-1.216" width="0.1524" layer="21"/>
<wire x1="-2.653" y1="-1.089" x2="-2.78" y2="-1.216" width="0.1524" layer="21"/>
<wire x1="2.653" y1="1.089" x2="2.78" y2="1.216" width="0.1524" layer="21"/>
<wire x1="2.653" y1="1.089" x2="-2.653" y2="1.089" width="0.1524" layer="21"/>
<wire x1="2.653" y1="-1.089" x2="2.78" y2="-1.216" width="0.1524" layer="21"/>
<wire x1="2.653" y1="-1.089" x2="-2.653" y2="-1.089" width="0.1524" layer="21"/>
<wire x1="3.161" y1="1.216" x2="2.78" y2="1.216" width="0.1524" layer="21"/>
<wire x1="3.161" y1="-1.216" x2="2.78" y2="-1.216" width="0.1524" layer="21"/>
<wire x1="3.415" y1="-0.962" x2="3.415" y2="0.962" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="0.8" diameter="1.3"/>
<pad name="2" x="5.08" y="0" drill="0.8" diameter="1.3"/>
<text x="-3.175" y="1.905" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-0.635" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.415" y1="-0.254" x2="3.7" y2="0.254" layer="21"/>
<rectangle x1="-3.7" y1="-0.254" x2="-3.415" y2="0.254" layer="21"/>
</package>
<package name="LAL03KH">
<description>&lt;b&gt;TAYO YUDEN Inductor&lt;/b&gt;&lt;p&gt;
Source: je999f5.pdf</description>
<wire x1="5" y1="0" x2="4.405" y2="0" width="0.508" layer="51"/>
<wire x1="-5" y1="0" x2="-4.405" y2="0" width="0.508" layer="51"/>
<wire x1="-4.115" y1="0.962" x2="-3.861" y2="1.216" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.115" y1="-0.962" x2="-3.861" y2="-1.216" width="0.1524" layer="21" curve="90"/>
<wire x1="3.861" y1="-1.216" x2="4.115" y2="-0.962" width="0.1524" layer="21" curve="90"/>
<wire x1="3.861" y1="1.216" x2="4.115" y2="0.962" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.115" y1="-0.962" x2="-4.115" y2="0.962" width="0.1524" layer="21"/>
<wire x1="-3.861" y1="1.216" x2="-3.48" y2="1.216" width="0.1524" layer="21"/>
<wire x1="-3.353" y1="1.089" x2="-3.48" y2="1.216" width="0.1524" layer="21"/>
<wire x1="-3.861" y1="-1.216" x2="-3.48" y2="-1.216" width="0.1524" layer="21"/>
<wire x1="-3.353" y1="-1.089" x2="-3.48" y2="-1.216" width="0.1524" layer="21"/>
<wire x1="3.353" y1="1.089" x2="3.48" y2="1.216" width="0.1524" layer="21"/>
<wire x1="3.353" y1="1.089" x2="-3.353" y2="1.089" width="0.1524" layer="21"/>
<wire x1="3.353" y1="-1.089" x2="3.48" y2="-1.216" width="0.1524" layer="21"/>
<wire x1="3.353" y1="-1.089" x2="-3.353" y2="-1.089" width="0.1524" layer="21"/>
<wire x1="3.861" y1="1.216" x2="3.48" y2="1.216" width="0.1524" layer="21"/>
<wire x1="3.861" y1="-1.216" x2="3.48" y2="-1.216" width="0.1524" layer="21"/>
<wire x1="4.115" y1="-0.962" x2="4.115" y2="0.962" width="0.1524" layer="21"/>
<pad name="1" x="-5" y="0" drill="0.8" diameter="1.3"/>
<pad name="2" x="5" y="0" drill="0.8" diameter="1.3"/>
<text x="-3.81" y="1.905" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.115" y1="-0.254" x2="4.4" y2="0.254" layer="21"/>
<rectangle x1="-4.4" y1="-0.254" x2="-4.115" y2="0.254" layer="21"/>
</package>
<package name="LAL04">
<description>&lt;b&gt;TAYO YUDEN Inductor&lt;/b&gt;&lt;p&gt;
Source: je999f5.pdf</description>
<wire x1="6.35" y1="0" x2="5.13" y2="0" width="0.508" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.105" y2="0" width="0.508" layer="51"/>
<wire x1="-4.815" y1="1.662" x2="-4.561" y2="1.916" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.815" y1="-1.662" x2="-4.561" y2="-1.916" width="0.1524" layer="21" curve="90"/>
<wire x1="4.586" y1="-1.916" x2="4.84" y2="-1.662" width="0.1524" layer="21" curve="90"/>
<wire x1="4.586" y1="1.916" x2="4.84" y2="1.662" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.815" y1="-1.662" x2="-4.815" y2="1.662" width="0.1524" layer="21"/>
<wire x1="-4.561" y1="1.916" x2="-4.18" y2="1.916" width="0.1524" layer="21"/>
<wire x1="-4.053" y1="1.789" x2="-4.18" y2="1.916" width="0.1524" layer="21"/>
<wire x1="-4.561" y1="-1.916" x2="-4.18" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="-4.053" y1="-1.789" x2="-4.18" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="4.078" y1="1.789" x2="4.205" y2="1.916" width="0.1524" layer="21"/>
<wire x1="4.078" y1="1.789" x2="-4.053" y2="1.789" width="0.1524" layer="21"/>
<wire x1="4.078" y1="-1.789" x2="4.205" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="4.078" y1="-1.789" x2="-4.053" y2="-1.789" width="0.1524" layer="21"/>
<wire x1="4.586" y1="1.916" x2="4.205" y2="1.916" width="0.1524" layer="21"/>
<wire x1="4.586" y1="-1.916" x2="4.205" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="4.84" y1="-1.662" x2="4.84" y2="1.662" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.8" diameter="1.3"/>
<pad name="2" x="6.35" y="0" drill="0.8" diameter="1.3"/>
<text x="-4.445" y="2.54" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-0.635" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.84" y1="-0.254" x2="5.125" y2="0.254" layer="21"/>
<rectangle x1="-5.1" y1="-0.254" x2="-4.815" y2="0.254" layer="21"/>
</package>
<package name="LAL04KB">
<description>&lt;b&gt;TAYO YUDEN Inductor&lt;/b&gt;&lt;p&gt;
Source: je999f5.pdf</description>
<wire x1="6.25" y1="0" x2="5.13" y2="0" width="0.508" layer="51"/>
<wire x1="-6.25" y1="0" x2="-5.105" y2="0" width="0.508" layer="51"/>
<wire x1="-4.815" y1="1.662" x2="-4.561" y2="1.916" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.815" y1="-1.662" x2="-4.561" y2="-1.916" width="0.1524" layer="21" curve="90"/>
<wire x1="4.586" y1="-1.916" x2="4.84" y2="-1.662" width="0.1524" layer="21" curve="90"/>
<wire x1="4.586" y1="1.916" x2="4.84" y2="1.662" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.815" y1="-1.662" x2="-4.815" y2="1.662" width="0.1524" layer="21"/>
<wire x1="-4.561" y1="1.916" x2="-4.18" y2="1.916" width="0.1524" layer="21"/>
<wire x1="-4.053" y1="1.789" x2="-4.18" y2="1.916" width="0.1524" layer="21"/>
<wire x1="-4.561" y1="-1.916" x2="-4.18" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="-4.053" y1="-1.789" x2="-4.18" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="4.078" y1="1.789" x2="4.205" y2="1.916" width="0.1524" layer="21"/>
<wire x1="4.078" y1="1.789" x2="-4.053" y2="1.789" width="0.1524" layer="21"/>
<wire x1="4.078" y1="-1.789" x2="4.205" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="4.078" y1="-1.789" x2="-4.053" y2="-1.789" width="0.1524" layer="21"/>
<wire x1="4.586" y1="1.916" x2="4.205" y2="1.916" width="0.1524" layer="21"/>
<wire x1="4.586" y1="-1.916" x2="4.205" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="4.84" y1="-1.662" x2="4.84" y2="1.662" width="0.1524" layer="21"/>
<pad name="1" x="-6.25" y="0" drill="0.8" diameter="1.3"/>
<pad name="2" x="6.25" y="0" drill="0.8" diameter="1.3"/>
<text x="-4.445" y="2.54" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-0.635" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.84" y1="-0.254" x2="5.125" y2="0.254" layer="21"/>
<rectangle x1="-5.1" y1="-0.254" x2="-4.815" y2="0.254" layer="21"/>
</package>
<package name="LAN02KR">
<description>&lt;b&gt;TAYO YUDEN Inductor&lt;/b&gt;&lt;p&gt;
Source: je999f5.pdf</description>
<wire x1="2.5" y1="0" x2="1.905" y2="0" width="0.508" layer="51"/>
<wire x1="-2.5" y1="0" x2="-1.905" y2="0" width="0.508" layer="51"/>
<wire x1="-1.615" y1="0.862" x2="-1.361" y2="1.116" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.615" y1="-0.862" x2="-1.361" y2="-1.116" width="0.1524" layer="21" curve="90"/>
<wire x1="1.361" y1="-1.116" x2="1.615" y2="-0.862" width="0.1524" layer="21" curve="90"/>
<wire x1="1.361" y1="1.116" x2="1.615" y2="0.862" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.615" y1="-0.862" x2="-1.615" y2="0.862" width="0.1524" layer="21"/>
<wire x1="-1.361" y1="1.116" x2="-0.98" y2="1.116" width="0.1524" layer="21"/>
<wire x1="-0.853" y1="0.989" x2="-0.98" y2="1.116" width="0.1524" layer="21"/>
<wire x1="-1.361" y1="-1.116" x2="-0.98" y2="-1.116" width="0.1524" layer="21"/>
<wire x1="-0.853" y1="-0.989" x2="-0.98" y2="-1.116" width="0.1524" layer="21"/>
<wire x1="0.853" y1="0.989" x2="0.98" y2="1.116" width="0.1524" layer="21"/>
<wire x1="0.853" y1="0.989" x2="-0.853" y2="0.989" width="0.1524" layer="21"/>
<wire x1="0.853" y1="-0.989" x2="0.98" y2="-1.116" width="0.1524" layer="21"/>
<wire x1="0.853" y1="-0.989" x2="-0.853" y2="-0.989" width="0.1524" layer="21"/>
<wire x1="1.361" y1="1.116" x2="0.98" y2="1.116" width="0.1524" layer="21"/>
<wire x1="1.361" y1="-1.116" x2="0.98" y2="-1.116" width="0.1524" layer="21"/>
<wire x1="1.615" y1="-0.862" x2="1.615" y2="0.862" width="0.1524" layer="21"/>
<pad name="1" x="-2.5" y="0" drill="0.8" diameter="1.3"/>
<pad name="2" x="2.5" y="0" drill="0.8" diameter="1.3"/>
<text x="-2.54" y="1.27" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="1.615" y1="-0.254" x2="1.9" y2="0.254" layer="21"/>
<rectangle x1="-1.9" y1="-0.254" x2="-1.615" y2="0.254" layer="21"/>
</package>
<package name="LAP02KR">
<description>&lt;b&gt;TAYO YUDEN Inductor&lt;/b&gt;&lt;p&gt;
Source: je999f5.pdf</description>
<wire x1="2.5" y1="0" x2="1.905" y2="0" width="0.508" layer="51"/>
<wire x1="-2.5" y1="0" x2="-1.905" y2="0" width="0.508" layer="51"/>
<wire x1="-1.615" y1="0.812" x2="-1.361" y2="1.066" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.615" y1="-0.812" x2="-1.361" y2="-1.066" width="0.1524" layer="21" curve="90"/>
<wire x1="1.361" y1="-1.066" x2="1.615" y2="-0.812" width="0.1524" layer="21" curve="90"/>
<wire x1="1.361" y1="1.066" x2="1.615" y2="0.812" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.615" y1="-0.812" x2="-1.615" y2="0.812" width="0.1524" layer="21"/>
<wire x1="-1.361" y1="1.066" x2="-0.98" y2="1.066" width="0.1524" layer="21"/>
<wire x1="-0.853" y1="0.939" x2="-0.98" y2="1.066" width="0.1524" layer="21"/>
<wire x1="-1.361" y1="-1.066" x2="-0.98" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="-0.853" y1="-0.939" x2="-0.98" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="0.853" y1="0.939" x2="0.98" y2="1.066" width="0.1524" layer="21"/>
<wire x1="0.853" y1="0.939" x2="-0.853" y2="0.939" width="0.1524" layer="21"/>
<wire x1="0.853" y1="-0.939" x2="0.98" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="0.853" y1="-0.939" x2="-0.853" y2="-0.939" width="0.1524" layer="21"/>
<wire x1="1.361" y1="1.066" x2="0.98" y2="1.066" width="0.1524" layer="21"/>
<wire x1="1.361" y1="-1.066" x2="0.98" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="1.615" y1="-0.812" x2="1.615" y2="0.812" width="0.1524" layer="21"/>
<pad name="1" x="-2.5" y="0" drill="0.8" diameter="1.3"/>
<pad name="2" x="2.5" y="0" drill="0.8" diameter="1.3"/>
<text x="-2.54" y="1.27" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="1.615" y1="-0.254" x2="1.9" y2="0.254" layer="21"/>
<rectangle x1="-1.9" y1="-0.254" x2="-1.615" y2="0.254" layer="21"/>
</package>
<package name="TFI0204">
<description>&lt;b&gt;Axial Conformal Coated Inductor&lt;/b&gt;&lt;p&gt;
Source: TOP MAGNETICS CORPORATION .. tfi.pdf</description>
<wire x1="3.81" y1="0" x2="2.54" y2="0" width="0.508" layer="51"/>
<wire x1="-3.81" y1="0" x2="-2.54" y2="0" width="0.508" layer="51"/>
<wire x1="-2.165" y1="0.812" x2="-1.911" y2="1.066" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.165" y1="-0.812" x2="-1.911" y2="-1.066" width="0.1524" layer="21" curve="90"/>
<wire x1="1.911" y1="-1.066" x2="2.165" y2="-0.812" width="0.1524" layer="21" curve="90"/>
<wire x1="1.911" y1="1.066" x2="2.165" y2="0.812" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.165" y1="-0.812" x2="-2.165" y2="0.812" width="0.1524" layer="21"/>
<wire x1="-1.911" y1="1.066" x2="-1.53" y2="1.066" width="0.1524" layer="21"/>
<wire x1="-1.403" y1="0.939" x2="-1.53" y2="1.066" width="0.1524" layer="21"/>
<wire x1="-1.911" y1="-1.066" x2="-1.53" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="-1.403" y1="-0.939" x2="-1.53" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="1.403" y1="0.939" x2="1.53" y2="1.066" width="0.1524" layer="21"/>
<wire x1="1.403" y1="0.939" x2="-1.403" y2="0.939" width="0.1524" layer="21"/>
<wire x1="1.403" y1="-0.939" x2="1.53" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="1.403" y1="-0.939" x2="-1.403" y2="-0.939" width="0.1524" layer="21"/>
<wire x1="1.911" y1="1.066" x2="1.53" y2="1.066" width="0.1524" layer="21"/>
<wire x1="1.911" y1="-1.066" x2="1.53" y2="-1.066" width="0.1524" layer="21"/>
<wire x1="2.165" y1="-0.812" x2="2.165" y2="0.812" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.9" diameter="1.5"/>
<pad name="2" x="3.81" y="0" drill="0.9" diameter="1.5"/>
<text x="-2.54" y="1.2954" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.6256" y="-0.4826" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.165" y1="-0.254" x2="2.546" y2="0.254" layer="21"/>
<rectangle x1="-2.546" y1="-0.254" x2="-2.165" y2="0.254" layer="21"/>
</package>
<package name="TFI0305">
<description>&lt;b&gt;Axial Conformal Coated Inductor&lt;/b&gt;&lt;p&gt;
Source: TOP MAGNETICS CORPORATION .. tfi.pdf</description>
<wire x1="3.81" y1="0" x2="2.79" y2="0" width="0.508" layer="51"/>
<wire x1="-3.81" y1="0" x2="-2.79" y2="0" width="0.508" layer="51"/>
<wire x1="-2.415" y1="1.162" x2="-2.161" y2="1.416" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.415" y1="-1.162" x2="-2.161" y2="-1.416" width="0.1524" layer="21" curve="90"/>
<wire x1="2.161" y1="-1.416" x2="2.415" y2="-1.162" width="0.1524" layer="21" curve="90"/>
<wire x1="2.161" y1="1.416" x2="2.415" y2="1.162" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.415" y1="-1.162" x2="-2.415" y2="1.162" width="0.1524" layer="21"/>
<wire x1="-2.161" y1="1.416" x2="-1.78" y2="1.416" width="0.1524" layer="21"/>
<wire x1="-1.653" y1="1.289" x2="-1.78" y2="1.416" width="0.1524" layer="21"/>
<wire x1="-2.161" y1="-1.416" x2="-1.78" y2="-1.416" width="0.1524" layer="21"/>
<wire x1="-1.653" y1="-1.289" x2="-1.78" y2="-1.416" width="0.1524" layer="21"/>
<wire x1="1.653" y1="1.289" x2="1.78" y2="1.416" width="0.1524" layer="21"/>
<wire x1="1.653" y1="1.289" x2="-1.653" y2="1.289" width="0.1524" layer="21"/>
<wire x1="1.653" y1="-1.289" x2="1.78" y2="-1.416" width="0.1524" layer="21"/>
<wire x1="1.653" y1="-1.289" x2="-1.653" y2="-1.289" width="0.1524" layer="21"/>
<wire x1="2.161" y1="1.416" x2="1.78" y2="1.416" width="0.1524" layer="21"/>
<wire x1="2.161" y1="-1.416" x2="1.78" y2="-1.416" width="0.1524" layer="21"/>
<wire x1="2.415" y1="-1.162" x2="2.415" y2="1.162" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.9" diameter="1.5"/>
<pad name="2" x="3.81" y="0" drill="0.9" diameter="1.5"/>
<text x="-2.54" y="1.6454" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.8756" y="-0.4826" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.415" y1="-0.254" x2="2.796" y2="0.254" layer="21"/>
<rectangle x1="-2.796" y1="-0.254" x2="-2.415" y2="0.254" layer="21"/>
</package>
<package name="TFI0307">
<description>&lt;b&gt;Axial Conformal Coated Inductor&lt;/b&gt;&lt;p&gt;
Source: TOP MAGNETICS CORPORATION .. tfi.pdf</description>
<wire x1="4.445" y1="0" x2="3.79" y2="0" width="0.508" layer="51"/>
<wire x1="-4.445" y1="0" x2="-3.79" y2="0" width="0.508" layer="51"/>
<wire x1="-3.415" y1="1.162" x2="-3.161" y2="1.416" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.415" y1="-1.162" x2="-3.161" y2="-1.416" width="0.1524" layer="21" curve="90"/>
<wire x1="3.161" y1="-1.416" x2="3.415" y2="-1.162" width="0.1524" layer="21" curve="90"/>
<wire x1="3.161" y1="1.416" x2="3.415" y2="1.162" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.415" y1="-1.162" x2="-3.415" y2="1.162" width="0.1524" layer="21"/>
<wire x1="-3.161" y1="1.416" x2="-2.78" y2="1.416" width="0.1524" layer="21"/>
<wire x1="-2.653" y1="1.289" x2="-2.78" y2="1.416" width="0.1524" layer="21"/>
<wire x1="-3.161" y1="-1.416" x2="-2.78" y2="-1.416" width="0.1524" layer="21"/>
<wire x1="-2.653" y1="-1.289" x2="-2.78" y2="-1.416" width="0.1524" layer="21"/>
<wire x1="2.653" y1="1.289" x2="2.78" y2="1.416" width="0.1524" layer="21"/>
<wire x1="2.653" y1="1.289" x2="-2.653" y2="1.289" width="0.1524" layer="21"/>
<wire x1="2.653" y1="-1.289" x2="2.78" y2="-1.416" width="0.1524" layer="21"/>
<wire x1="2.653" y1="-1.289" x2="-2.653" y2="-1.289" width="0.1524" layer="21"/>
<wire x1="3.161" y1="1.416" x2="2.78" y2="1.416" width="0.1524" layer="21"/>
<wire x1="3.161" y1="-1.416" x2="2.78" y2="-1.416" width="0.1524" layer="21"/>
<wire x1="3.415" y1="-1.162" x2="3.415" y2="1.162" width="0.1524" layer="21"/>
<pad name="1" x="-4.445" y="0" drill="0.9" diameter="1.5"/>
<pad name="2" x="4.445" y="0" drill="0.9" diameter="1.5"/>
<text x="-2.54" y="1.6454" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.8756" y="-0.4826" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.415" y1="-0.254" x2="3.796" y2="0.254" layer="21"/>
<rectangle x1="-3.796" y1="-0.254" x2="-3.415" y2="0.254" layer="21"/>
</package>
<package name="TFI0410">
<description>&lt;b&gt;Axial Conformal Coated Inductor&lt;/b&gt;&lt;p&gt;
Source: TOP MAGNETICS CORPORATION .. tfi.pdf</description>
<wire x1="6.35" y1="0" x2="5.54" y2="0" width="0.508" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.54" y2="0" width="0.508" layer="51"/>
<wire x1="-5.165" y1="1.662" x2="-4.911" y2="1.916" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.165" y1="-1.662" x2="-4.911" y2="-1.916" width="0.1524" layer="21" curve="90"/>
<wire x1="4.911" y1="-1.916" x2="5.165" y2="-1.662" width="0.1524" layer="21" curve="90"/>
<wire x1="4.911" y1="1.916" x2="5.165" y2="1.662" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.165" y1="-1.662" x2="-5.165" y2="1.662" width="0.1524" layer="21"/>
<wire x1="-4.911" y1="1.916" x2="-4.53" y2="1.916" width="0.1524" layer="21"/>
<wire x1="-4.403" y1="1.789" x2="-4.53" y2="1.916" width="0.1524" layer="21"/>
<wire x1="-4.911" y1="-1.916" x2="-4.53" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="-4.403" y1="-1.789" x2="-4.53" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="4.403" y1="1.789" x2="4.53" y2="1.916" width="0.1524" layer="21"/>
<wire x1="4.403" y1="1.789" x2="-4.403" y2="1.789" width="0.1524" layer="21"/>
<wire x1="4.403" y1="-1.789" x2="4.53" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="4.403" y1="-1.789" x2="-4.403" y2="-1.789" width="0.1524" layer="21"/>
<wire x1="4.911" y1="1.916" x2="4.53" y2="1.916" width="0.1524" layer="21"/>
<wire x1="4.911" y1="-1.916" x2="4.53" y2="-1.916" width="0.1524" layer="21"/>
<wire x1="5.165" y1="-1.662" x2="5.165" y2="1.662" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="1" diameter="1.6"/>
<pad name="2" x="6.35" y="0" drill="1" diameter="1.6"/>
<text x="-2.54" y="2.1454" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.8756" y="-0.4826" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="5.165" y1="-0.254" x2="5.546" y2="0.254" layer="21"/>
<rectangle x1="-5.546" y1="-0.254" x2="-5.165" y2="0.254" layer="21"/>
</package>
<package name="TFI0510">
<description>&lt;b&gt;Axial Conformal Coated Inductor&lt;/b&gt;&lt;p&gt;
Source: TOP MAGNETICS CORPORATION .. tfi.pdf</description>
<wire x1="7.62" y1="0" x2="6.315" y2="0" width="0.508" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.29" y2="0" width="0.508" layer="51"/>
<wire x1="-5.915" y1="2.162" x2="-5.661" y2="2.416" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.915" y1="-2.187" x2="-5.661" y2="-2.441" width="0.1524" layer="21" curve="90"/>
<wire x1="5.686" y1="-2.441" x2="5.94" y2="-2.187" width="0.1524" layer="21" curve="90"/>
<wire x1="5.686" y1="2.416" x2="5.94" y2="2.162" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.915" y1="-2.187" x2="-5.915" y2="2.162" width="0.1524" layer="21"/>
<wire x1="-5.661" y1="2.416" x2="-5.28" y2="2.416" width="0.1524" layer="21"/>
<wire x1="-5.153" y1="2.289" x2="-5.28" y2="2.416" width="0.1524" layer="21"/>
<wire x1="-5.661" y1="-2.441" x2="-5.28" y2="-2.441" width="0.1524" layer="21"/>
<wire x1="-5.153" y1="-2.314" x2="-5.28" y2="-2.441" width="0.1524" layer="21"/>
<wire x1="5.178" y1="2.289" x2="5.305" y2="2.416" width="0.1524" layer="21"/>
<wire x1="5.178" y1="2.289" x2="-5.153" y2="2.289" width="0.1524" layer="21"/>
<wire x1="5.178" y1="-2.314" x2="5.305" y2="-2.441" width="0.1524" layer="21"/>
<wire x1="5.178" y1="-2.314" x2="-5.153" y2="-2.314" width="0.1524" layer="21"/>
<wire x1="5.686" y1="2.416" x2="5.305" y2="2.416" width="0.1524" layer="21"/>
<wire x1="5.686" y1="-2.441" x2="5.305" y2="-2.441" width="0.1524" layer="21"/>
<wire x1="5.94" y1="-2.187" x2="5.94" y2="2.162" width="0.1524" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="1" diameter="1.6"/>
<pad name="2" x="7.62" y="0" drill="1" diameter="1.6"/>
<text x="-2.54" y="2.6454" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.8756" y="-0.4826" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="5.94" y1="-0.254" x2="6.321" y2="0.254" layer="21"/>
<rectangle x1="-6.296" y1="-0.254" x2="-5.915" y2="0.254" layer="21"/>
</package>
<package name="6000-XXXX-RC">
<description>&lt;b&gt;Radial Lead RF Chokes&lt;/b&gt;&lt;p&gt;
Source: www.bourns.com .. 6000_series.pdf</description>
<circle x="0" y="0" radius="4.4" width="0.2032" layer="21"/>
<pad name="1" x="-2.5" y="0" drill="0.9" diameter="1.4224"/>
<pad name="2" x="2.5" y="0" drill="0.9" diameter="1.4224"/>
<text x="-4.5056" y="4.6326" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.5056" y="-6.4106" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="C-TRIMM">
<wire x1="0" y1="0" x2="0" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="1.524" y1="-3.048" x2="-2.286" y2="0.762" width="0.3048" layer="94"/>
<wire x1="-3.048" y1="0" x2="-2.286" y2="0.762" width="0.3048" layer="94"/>
<wire x1="-2.286" y1="0.762" x2="-1.524" y2="1.524" width="0.3048" layer="94"/>
<wire x1="-3.048" y1="-3.302" x2="-3.048" y2="-1.016" width="0.1524" layer="94"/>
<wire x1="-3.048" y1="-1.016" x2="-3.302" y2="-1.778" width="0.1524" layer="94"/>
<wire x1="-3.048" y1="-1.016" x2="-2.794" y2="-1.778" width="0.1524" layer="94"/>
<text x="1.524" y="0.381" size="1.778" layer="95">&gt;NAME</text>
<text x="2.286" y="-5.207" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-2.032" x2="2.032" y2="-1.524" layer="94"/>
<rectangle x1="-2.032" y1="-1.016" x2="2.032" y2="-0.508" layer="94"/>
<pin name="E" x="0" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="A" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="L-EU">
<text x="-1.4986" y="-3.81" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="3.302" y="-3.81" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.016" y1="-3.556" x2="1.016" y2="3.556" layer="94"/>
<pin name="2" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
<pin name="1" x="0" y="5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="C-TRIMM" prefix="C" uservalue="yes">
<description>&lt;b&gt;Trimm capacitor&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="C-TRIMM" x="0" y="0"/>
</gates>
<devices>
<device name="3008" package="CTRIM3008">
<connects>
<connect gate="G$1" pin="A" pad="-"/>
<connect gate="G$1" pin="E" pad="+"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3018_11" package="CTRIM3018_11">
<connects>
<connect gate="G$1" pin="A" pad="-"/>
<connect gate="G$1" pin="E" pad="+"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3018_12" package="CTRIM3018_12">
<connects>
<connect gate="G$1" pin="A" pad="-"/>
<connect gate="G$1" pin="E" pad="+"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3040.427" package="CTRIM3040.427">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1A"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3040.428" package="CTRIM3040.428">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1A"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3040.448" package="CTRIM3040.448">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1A"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3040.450" package="CTRIM3040.450">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1A"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3040.452" package="CTRIM3040.452">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1A"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3050.504" package="CTRIM3050.504">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3050.505" package="CTRIM3050.505">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3050.506" package="CTRIM3050.506">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1A"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CTZ2" package="CTRIMCTZ2">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CTZ3" package="CTRIMCTZ3">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TZBX4" package="CTRIMTZBX4">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CV05" package="CTRIMCV05">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TZ03" package="CTRIMTZ03">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="808" package="CTRIM808-BC">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="808-1" package="CTRIM808-1">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="808-7.5" package="CTRIM808-BC7.5">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="L-EU" prefix="L" uservalue="yes">
<description>&lt;B&gt;INDUCTOR&lt;/B&gt;, European symbol</description>
<gates>
<gate name="G$1" symbol="L-EU" x="0" y="0"/>
</gates>
<devices>
<device name="L2012C" package="L2012C">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L2825P" package="L2825P">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L3216C" package="L3216C">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L3225M" package="L3225M">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L3225P" package="L3225P">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L3230M" package="L3230M">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L4035M" package="L4035M">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L4516C" package="L4516C">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L4532C" package="L4532M">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L4532P" package="L4532P">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L5038P" package="L5038P">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L5650M" package="L5650M">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L8530M" package="L8530M">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204/5" package="0204/5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/10" package="0207/10">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/12" package="0207/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/2V" package="0207/2V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/5V" package="0207/5V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/7" package="0207/7">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/15" package="0207/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204/7" package="0204/7">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204V" package="0204V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L1812" package="L1812">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ3-U1" package="TJ3-U1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ3-U2" package="TJ3-U2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ4-U1" package="TJ4-U1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ4-U2" package="TJ4-U2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ5-U1" package="TJ5-U1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ5-U2" package="TJ5-U2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ6-U1" package="TJ6-U1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ6-U2" package="TJ6-U2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ7-U1" package="TJ7-U1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ7-U2" package="TJ7-U2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ8-U1" package="TJ8-U1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ8-U2" package="TJ8-U2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ9-U1" package="TJ9-U1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TJ9-U2" package="TJ9-U2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WE-TPC" package="POWER-CHOKE_WE-TPC">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2200-12.7" package="2200-12.7">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2200-15.24" package="2200-15.24">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2200-11.43" package="2200-11.43">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CEP125" package="CEP125">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="L0201" package="L0201">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PIS2816" package="PIS2816">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="IR-2" package="IR-2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="IR-4" package="IR-4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="IRF-1" package="IRF-1">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="IRF-3" package="IRF-3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="IRF-24" package="IRF24">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="IRF-36" package="IRF36">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="IRF-46" package="IRF46">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LAL02" package="LAL02">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LAL03" package="LAL03">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LAL03KB" package="LAL03KH">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LAL04" package="LAL04">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LAL04KB" package="LAL04KB">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LAN02KR" package="LAN02KR">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LAP02KR" package="LAP02KR">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TFI0204" package="TFI0204">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TFI0305" package="TFI0305">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TFI0307" package="TFI0307">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TFI0410" package="TFI0410">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TFI0510" package="TFI0510">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="6000-XXX-RC" package="6000-XXXX-RC">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="linear">
<description>&lt;b&gt;Linear Devices&lt;/b&gt;&lt;p&gt;
Operational amplifiers,  comparators, voltage regulators, ADCs, DACs, etc.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="SO08">
<description>&lt;b&gt;Small Outline Package 8&lt;/b&gt;&lt;br&gt;
NS Package M08A</description>
<wire x1="2.4" y1="1.9" x2="2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.4" x2="2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.9" x2="-2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.9" x2="-2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.4" x2="-2.4" y2="1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="1.9" x2="2.4" y2="1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.4" x2="-2.4" y2="-1.4" width="0.2032" layer="51"/>
<smd name="2" x="-0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="-0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="1" x="-1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="-1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-2.667" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.937" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.15" y1="-3.1" x2="-1.66" y2="-2" layer="51"/>
<rectangle x1="-0.88" y1="-3.1" x2="-0.39" y2="-2" layer="51"/>
<rectangle x1="0.39" y1="-3.1" x2="0.88" y2="-2" layer="51"/>
<rectangle x1="1.66" y1="-3.1" x2="2.15" y2="-2" layer="51"/>
<rectangle x1="1.66" y1="2" x2="2.15" y2="3.1" layer="51"/>
<rectangle x1="0.39" y1="2" x2="0.88" y2="3.1" layer="51"/>
<rectangle x1="-0.88" y1="2" x2="-0.39" y2="3.1" layer="51"/>
<rectangle x1="-2.15" y1="2" x2="-1.66" y2="3.1" layer="51"/>
</package>
<package name="MSOP08">
<description>&lt;b&gt;Mini Small Outline Package&lt;/b&gt;</description>
<wire x1="1.624" y1="1.299" x2="1.624" y2="-1.301" width="0.1524" layer="21"/>
<wire x1="-1.626" y1="-1.301" x2="-1.626" y2="1.299" width="0.1524" layer="21"/>
<wire x1="1.299" y1="1.624" x2="1.624" y2="1.299" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.626" y1="1.299" x2="-1.301" y2="1.624" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.626" y1="-1.301" x2="-1.301" y2="-1.626" width="0.1524" layer="21" curve="90"/>
<wire x1="1.299" y1="-1.626" x2="1.624" y2="-1.301" width="0.1524" layer="21" curve="90"/>
<wire x1="-1.341" y1="-1.626" x2="-1.204" y2="-1.626" width="0.1524" layer="51"/>
<wire x1="-0.747" y1="-1.626" x2="-0.554" y2="-1.626" width="0.1524" layer="51"/>
<wire x1="-0.097" y1="-1.626" x2="0.096" y2="-1.626" width="0.1524" layer="51"/>
<wire x1="0.553" y1="-1.626" x2="0.746" y2="-1.626" width="0.1524" layer="51"/>
<wire x1="1.203" y1="-1.626" x2="1.299" y2="-1.626" width="0.1524" layer="51"/>
<wire x1="-1.301" y1="1.624" x2="-1.204" y2="1.624" width="0.1524" layer="51"/>
<wire x1="-0.747" y1="1.624" x2="-0.554" y2="1.624" width="0.1524" layer="51"/>
<wire x1="-0.097" y1="1.624" x2="0.096" y2="1.624" width="0.1524" layer="51"/>
<wire x1="0.553" y1="1.624" x2="0.746" y2="1.624" width="0.1524" layer="51"/>
<wire x1="1.203" y1="1.624" x2="1.299" y2="1.624" width="0.1524" layer="51"/>
<circle x="-0.9456" y="-0.7906" radius="0.5" width="0.0508" layer="21"/>
<smd name="8" x="-0.976" y="2.112" dx="0.3" dy="1.2" layer="1"/>
<smd name="7" x="-0.326" y="2.112" dx="0.3" dy="1.2" layer="1"/>
<smd name="6" x="0.324" y="2.112" dx="0.3" dy="1.2" layer="1"/>
<smd name="5" x="0.974" y="2.112" dx="0.3" dy="1.2" layer="1"/>
<smd name="4" x="0.974" y="-2.113" dx="0.3" dy="1.2" layer="1"/>
<smd name="3" x="0.324" y="-2.113" dx="0.3" dy="1.2" layer="1"/>
<smd name="2" x="-0.326" y="-2.113" dx="0.3" dy="1.2" layer="1"/>
<smd name="1" x="-0.976" y="-2.113" dx="0.3" dy="1.2" layer="1"/>
<text x="-2.032" y="-2.54" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="3.302" y="-2.54" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.0975" y1="1.6244" x2="-0.8537" y2="2.3557" layer="51"/>
<rectangle x1="-0.4475" y1="1.6244" x2="-0.2037" y2="2.3557" layer="51"/>
<rectangle x1="0.2025" y1="1.6244" x2="0.4463" y2="2.3557" layer="51"/>
<rectangle x1="0.8525" y1="1.6244" x2="1.0963" y2="2.3557" layer="51"/>
<rectangle x1="-1.0975" y1="-2.3569" x2="-0.8537" y2="-1.6256" layer="51"/>
<rectangle x1="-0.4475" y1="-2.3569" x2="-0.2037" y2="-1.6256" layer="51"/>
<rectangle x1="0.2025" y1="-2.3569" x2="0.4463" y2="-1.6256" layer="51"/>
<rectangle x1="0.8525" y1="-2.3569" x2="1.0963" y2="-1.6256" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="OPAMP">
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="3.175" x2="-3.81" y2="1.905" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="-2.54" x2="-3.175" y2="-2.54" width="0.1524" layer="94"/>
<text x="2.54" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="-IN" x="-7.62" y="-2.54" visible="pad" length="short" direction="in"/>
<pin name="+IN" x="-7.62" y="2.54" visible="pad" length="short" direction="in"/>
<pin name="OUT" x="7.62" y="0" visible="pad" length="short" direction="out" rot="R180"/>
</symbol>
<symbol name="PWR+-">
<text x="1.27" y="3.175" size="0.8128" layer="93" rot="R90">V+</text>
<text x="1.27" y="-4.445" size="0.8128" layer="93" rot="R90">V-</text>
<pin name="V+" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
<pin name="V-" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="AD8682" prefix="IC">
<description>&lt;b&gt;Dual Low Power, High Speed JFET Operational Amplifiers&lt;/b&gt;&lt;p&gt;
Source: http://www.analog.com/UploadedFiles/Data_Sheets/AD8682_8684.pdf</description>
<gates>
<gate name="A" symbol="OPAMP" x="0" y="10.16"/>
<gate name="B" symbol="OPAMP" x="0" y="-10.16"/>
<gate name="P" symbol="PWR+-" x="0" y="10.16" addlevel="always"/>
</gates>
<devices>
<device name="R" package="SO08">
<connects>
<connect gate="A" pin="+IN" pad="3"/>
<connect gate="A" pin="-IN" pad="2"/>
<connect gate="A" pin="OUT" pad="1"/>
<connect gate="B" pin="+IN" pad="5"/>
<connect gate="B" pin="-IN" pad="6"/>
<connect gate="B" pin="OUT" pad="7"/>
<connect gate="P" pin="V+" pad="8"/>
<connect gate="P" pin="V-" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RM" package="MSOP08">
<connects>
<connect gate="A" pin="+IN" pad="3"/>
<connect gate="A" pin="-IN" pad="2"/>
<connect gate="A" pin="OUT" pad="1"/>
<connect gate="B" pin="+IN" pad="5"/>
<connect gate="B" pin="-IN" pad="6"/>
<connect gate="B" pin="OUT" pad="7"/>
<connect gate="P" pin="V+" pad="8"/>
<connect gate="P" pin="V-" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="transistor">
<description>&lt;b&gt;NPN Transistors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="SOT23">
<description>&lt;b&gt;SOT-23&lt;/b&gt;</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="51"/>
<smd name="3" x="0" y="1.1" dx="1" dy="1.4" layer="1"/>
<smd name="2" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<smd name="1" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="NPN">
<wire x1="2.54" y1="2.54" x2="0.508" y2="1.524" width="0.1524" layer="94"/>
<wire x1="1.778" y1="-1.524" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.778" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="1.54" y1="-2.04" x2="0.308" y2="-1.424" width="0.1524" layer="94"/>
<wire x1="1.524" y1="-2.413" x2="2.286" y2="-2.413" width="0.254" layer="94"/>
<wire x1="2.286" y1="-2.413" x2="1.778" y2="-1.778" width="0.254" layer="94"/>
<wire x1="1.778" y1="-1.778" x2="1.524" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.524" y1="-2.286" x2="1.905" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.905" y1="-2.286" x2="1.778" y2="-2.032" width="0.254" layer="94"/>
<text x="-10.16" y="7.62" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-2.54" x2="0.508" y2="2.54" layer="94"/>
<pin name="B" x="-2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="E" x="2.54" y="-5.08" visible="off" length="short" direction="pas" swaplevel="3" rot="R90"/>
<pin name="C" x="2.54" y="5.08" visible="off" length="short" direction="pas" swaplevel="2" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="BC850" prefix="T">
<description>&lt;b&gt;NPN TRANSISTOR&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="NPN" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="transistor-pnp">
<description>&lt;b&gt;PNP Transistors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="SOT23-BEC">
<description>&lt;b&gt;TO-236&lt;/b&gt; ITT Intermetall</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.127" layer="51"/>
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.127" layer="51"/>
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.127" layer="51"/>
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.127" layer="51"/>
<smd name="C" x="0" y="1.1" dx="1" dy="1.4" layer="1"/>
<smd name="E" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<smd name="B" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="PNP">
<wire x1="2.086" y1="1.678" x2="1.578" y2="2.594" width="0.1524" layer="94"/>
<wire x1="1.578" y1="2.594" x2="0.516" y2="1.478" width="0.1524" layer="94"/>
<wire x1="0.516" y1="1.478" x2="2.086" y2="1.678" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="1.808" y2="2.124" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0.508" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="1.905" y1="1.778" x2="1.524" y2="2.413" width="0.254" layer="94"/>
<wire x1="1.524" y1="2.413" x2="0.762" y2="1.651" width="0.254" layer="94"/>
<wire x1="0.762" y1="1.651" x2="1.778" y2="1.778" width="0.254" layer="94"/>
<wire x1="1.778" y1="1.778" x2="1.524" y2="2.159" width="0.254" layer="94"/>
<wire x1="1.524" y1="2.159" x2="1.143" y2="1.905" width="0.254" layer="94"/>
<wire x1="1.143" y1="1.905" x2="1.524" y2="1.905" width="0.254" layer="94"/>
<text x="-10.16" y="7.62" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-2.54" x2="0.508" y2="2.54" layer="94"/>
<pin name="B" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="E" x="2.54" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="C" x="2.54" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="BC856*" prefix="Q">
<description>&lt;b&gt;PNP Transistror&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PNP" x="0" y="0"/>
</gates>
<devices>
<device name="SMD" package="SOT23-BEC">
<connects>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="C" pad="C"/>
<connect gate="G$1" pin="E" pad="E"/>
</connects>
<technologies>
<technology name="A"/>
<technology name="ALT1"/>
<technology name="B"/>
<technology name="BALT1"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="passive">
<packages>
<package name="0402">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<smd name="1" x="-0.4976" y="0" dx="0.635" dy="0.635" layer="1" roundness="10"/>
<smd name="2" x="0.523" y="0" dx="0.635" dy="0.635" layer="1" roundness="10"/>
<text x="-0.735" y="-0.165" size="0.4064" layer="25">&gt;NAME</text>
<wire x1="-0.15" y1="0.35" x2="-0.8" y2="0.35" width="0.1" layer="21"/>
<wire x1="-0.8" y1="0.35" x2="-0.8" y2="-0.3" width="0.1" layer="21"/>
<wire x1="-0.8" y1="-0.3" x2="-0.15" y2="-0.3" width="0.1" layer="21"/>
<wire x1="0.15" y1="0.35" x2="0.85" y2="0.35" width="0.1" layer="21"/>
<wire x1="0.85" y1="0.35" x2="0.85" y2="-0.3" width="0.1" layer="21"/>
<wire x1="0.85" y1="-0.3" x2="0.15" y2="-0.3" width="0.1" layer="21"/>
</package>
<package name="0603">
<smd name="2" x="0.7874" y="0" dx="0.762" dy="0.9652" layer="1" roundness="10"/>
<smd name="1" x="-0.7874" y="0" dx="0.762" dy="0.9652" layer="1" roundness="10"/>
<text x="-1.1192" y="-0.2658" size="0.6096" layer="25" ratio="10">&gt;NAME</text>
<wire x1="-0.3" y1="0.5" x2="-1.2" y2="0.5" width="0.127" layer="21"/>
<wire x1="-1.2" y1="0.5" x2="-1.2" y2="-0.5" width="0.127" layer="21"/>
<wire x1="-1.2" y1="-0.5" x2="-0.3" y2="-0.5" width="0.127" layer="21"/>
<wire x1="0.3" y1="0.5" x2="1.2" y2="0.5" width="0.127" layer="21"/>
<wire x1="1.2" y1="0.5" x2="1.2" y2="-0.5" width="0.127" layer="21"/>
<wire x1="1.2" y1="-0.5" x2="0.3" y2="-0.5" width="0.127" layer="21"/>
</package>
<package name="0805">
<smd name="2" x="0.9398" y="0" dx="1.0922" dy="1.397" layer="1"/>
<smd name="1" x="-0.9398" y="0" dx="1.0922" dy="1.397" layer="1"/>
<text x="-1.36525" y="-0.254" size="0.6096" layer="25">&gt;NAME</text>
<wire x1="-0.15875" y1="0.635" x2="-1.42875" y2="0.635" width="0.127" layer="21"/>
<wire x1="-1.42875" y1="0.635" x2="-1.42875" y2="-0.635" width="0.127" layer="21"/>
<wire x1="-1.42875" y1="-0.635" x2="-0.15875" y2="-0.635" width="0.127" layer="21"/>
<wire x1="0.15875" y1="0.635" x2="1.42875" y2="0.635" width="0.127" layer="21"/>
<wire x1="1.42875" y1="0.635" x2="1.42875" y2="-0.635" width="0.127" layer="21"/>
<wire x1="1.42875" y1="-0.635" x2="0.15875" y2="-0.635" width="0.127" layer="21"/>
</package>
<package name="1206">
<smd name="2" x="1.4732" y="0" dx="1.143" dy="1.7018" layer="1"/>
<smd name="1" x="-1.4732" y="0" dx="1.143" dy="1.7018" layer="1"/>
<text x="-1.87325" y="-0.508" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<wire x1="-0.3175" y1="0.79375" x2="-2.06375" y2="0.79375" width="0.127" layer="21"/>
<wire x1="-2.06375" y1="0.79375" x2="-2.06375" y2="-0.79375" width="0.127" layer="21"/>
<wire x1="-2.06375" y1="-0.79375" x2="-0.3175" y2="-0.79375" width="0.127" layer="21"/>
<wire x1="0.3175" y1="0.79375" x2="2.06375" y2="0.79375" width="0.127" layer="21"/>
<wire x1="2.06375" y1="0.79375" x2="2.06375" y2="-0.79375" width="0.127" layer="21"/>
<wire x1="2.06375" y1="-0.79375" x2="0.3175" y2="-0.79375" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="CAP">
<wire x1="-2.54" y1="0" x2="-0.508" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.508" y1="1.524" x2="-0.508" y2="-1.524" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="0.508" y2="0" width="0.1524" layer="94"/>
<wire x1="0.508" y1="1.524" x2="0.508" y2="-1.524" width="0.254" layer="94"/>
<text x="-5.08" y="1.778" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="-3.556" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="RES">
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.27" x2="-5.08" y2="1.27" width="0.254" layer="94"/>
<text x="-4.572" y="1.524" size="1.778" layer="95">&gt;NAME</text>
<text x="-4.318" y="-0.762" size="1.4224" layer="96">&gt;VALUE</text>
<pin name="P$1" x="-7.62" y="0" visible="off" length="short"/>
<pin name="P$2" x="5.08" y="0" visible="off" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CAP" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="CAP" x="0" y="0"/>
</gates>
<devices>
<device name="C0402" package="0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C0603" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C0805" package="0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1206" package="1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="RES" prefix="R" uservalue="yes">
<gates>
<gate name="G$1" symbol="RES" x="0" y="0"/>
</gates>
<devices>
<device name="R0402" package="0402">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0603" package="0603">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0805" package="0805">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1206" package="1206">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="connectors">
<packages>
<package name="AMP_227161">
<description>&lt;b&gt;JACK,  RIGHT ANGLE, 50 OHM, PCB, BNC&lt;/b&gt;&lt;p&gt;
Source: ENG_CD_5227161_B1.pdf</description>
<wire x1="7.275" y1="7.275" x2="-7.275" y2="7.275" width="0.2032" layer="21"/>
<wire x1="-6.4" y1="7.375" x2="-6.4" y2="16.025" width="0.2032" layer="21"/>
<wire x1="-6.4" y1="16.025" x2="6.4" y2="16.025" width="0.2032" layer="21"/>
<wire x1="6.4" y1="16.025" x2="6.4" y2="7.35" width="0.2032" layer="21"/>
<wire x1="-4.9" y1="16.15" x2="-4.9" y2="28.475" width="0.2032" layer="21"/>
<wire x1="-4.9" y1="28.475" x2="4.9" y2="28.475" width="0.2032" layer="21"/>
<wire x1="4.9" y1="28.475" x2="4.9" y2="16.125" width="0.2032" layer="21"/>
<circle x="0" y="23.94" radius="1.26" width="0" layer="21"/>
<pad name="1" x="0" y="-5.08" drill="0.9" diameter="1.778"/>
<pad name="2" x="-2.54" y="-5.08" drill="0.9" diameter="1.778"/>
<text x="-6.985" y="-8.89" size="1.27" layer="25">&gt;NAME</text>
<pad name="P$1" x="-5.08" y="0" drill="2" shape="square" rot="R90"/>
<pad name="P$2" x="5.08" y="0" drill="2" shape="square" rot="R90"/>
<wire x1="-7.2136" y1="7.2136" x2="-7.3152" y2="7.112" width="0.3048" layer="21"/>
<wire x1="-7.3152" y1="7.112" x2="-7.3152" y2="-7.2136" width="0.3048" layer="21"/>
<wire x1="-7.3152" y1="-7.2136" x2="7.3152" y2="-7.2136" width="0.3048" layer="21"/>
<wire x1="7.3152" y1="-7.2136" x2="7.3152" y2="7.2136" width="0.3048" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="BU-BNC">
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="0" y1="-2.54" x2="-0.762" y2="-1.778" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-0.508" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0.254" x2="-0.762" y2="0.254" width="0.254" layer="94"/>
<wire x1="-0.762" y1="0.254" x2="-0.508" y2="0" width="0.254" layer="94"/>
<wire x1="-0.508" y1="0" x2="-0.762" y2="-0.254" width="0.254" layer="94"/>
<wire x1="-0.762" y1="-0.254" x2="-2.54" y2="-0.254" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.54" y="3.302" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="2.54" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="?227161*" prefix="X">
<description>&lt;b&gt;JACK,  RIGHT ANGLE, 50 OHM, PCB, BNC&lt;/b&gt;&lt;p&gt;
Source: ENG_CD_5227161_B1.pdf</description>
<gates>
<gate name="G$1" symbol="BU-BNC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="AMP_227161">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="-8">
<attribute name="ALTERNATIVE" value="LowCost(DX, ebay...)" constant="no"/>
<attribute name="ALTPRICE" value="5.6" constant="no"/>
<attribute name="DIGIKEY" value="A32260-ND" constant="no"/>
<attribute name="PRICE" value="16" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC1" library="teg4" deviceset="ADA4853-3RU" device=""/>
<part name="R1" library="passive" deviceset="RES" device="R0603" value="200R"/>
<part name="R2" library="passive" deviceset="RES" device="R0603" value="30R"/>
<part name="R3" library="passive" deviceset="RES" device="R0603" value="20R"/>
<part name="R4" library="passive" deviceset="RES" device="R0603" value="22R"/>
<part name="R5" library="passive" deviceset="RES" device="R0603" value="300R"/>
<part name="R6" library="passive" deviceset="RES" device="R0603" value="100R"/>
<part name="R8" library="passive" deviceset="RES" device="R0603" value="22R"/>
<part name="R9" library="passive" deviceset="RES" device="R0603" value="300R"/>
<part name="R10" library="passive" deviceset="RES" device="R0603" value="300R"/>
<part name="R12" library="passive" deviceset="RES" device="R0603" value="22R"/>
<part name="IC3" library="40xx" deviceset="4052" device="D"/>
<part name="IC2" library="40xx" deviceset="4052" device="D"/>
<part name="R11" library="passive" deviceset="RES" device="R0603" value="10k"/>
<part name="R13" library="passive" deviceset="RES" device="R0603" value="10k"/>
<part name="R14" library="passive" deviceset="RES" device="R0603" value="10k"/>
<part name="C1" library="passive" deviceset="CAP" device="C0603" value="10uF"/>
<part name="C2" library="passive" deviceset="CAP" device="C0603" value="100nF"/>
<part name="C5" library="passive" deviceset="CAP" device="C0603" value="100nF"/>
<part name="C6" library="passive" deviceset="CAP" device="C0603" value="100nF"/>
<part name="C7" library="passive" deviceset="CAP" device="C0603" value="100nF"/>
<part name="C8" library="passive" deviceset="CAP" device="C0603" value="100nF"/>
<part name="P+1" library="supply1" deviceset="+5V" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="FRAME1" library="frames" deviceset="A3L-LOC" device=""/>
<part name="K1" library="relay" deviceset="G6K" device="-2F-Y"/>
<part name="C11" library="passive" deviceset="CAP" device="C0603" value="100nF"/>
<part name="R7" library="passive" deviceset="RES" device="R0603" value="30k"/>
<part name="C12" library="passive" deviceset="CAP" device="C0603" value="12pF"/>
<part name="R15" library="passive" deviceset="RES" device="R0603" value="30k"/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="C13" library="rcl" deviceset="C-TRIMM" device="TZBX4" value="6/30"/>
<part name="R16" library="passive" deviceset="RES" device="R0603" value="470k"/>
<part name="R17" library="passive" deviceset="RES" device="R0603" value="470k"/>
<part name="C15" library="passive" deviceset="CAP" device="C0603" value="12pF"/>
<part name="R18" library="passive" deviceset="RES" device="R0603" value="51k"/>
<part name="C17" library="passive" deviceset="CAP" device="C0603" value="220pF"/>
<part name="R19" library="passive" deviceset="RES" device="R0603" value="39k"/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="C18" library="rcl" deviceset="C-TRIMM" device="TZBX4" value="6/30"/>
<part name="R20" library="passive" deviceset="RES" device="R0603" value="910k"/>
<part name="R21" library="passive" deviceset="RES" device="R0603" value="1k"/>
<part name="C20" library="passive" deviceset="CAP" device="C0603" value="12pF"/>
<part name="R22" library="passive" deviceset="RES" device="R0603" value="300R"/>
<part name="R23" library="passive" deviceset="RES" device="R0603" value="300R"/>
<part name="R24" library="passive" deviceset="RES" device="R0603" value="7R5"/>
<part name="IC4" library="linear" deviceset="AD8682" device="RM" value="OPA2354"/>
<part name="P+2" library="supply1" deviceset="+12V" device="" value="+3VA"/>
<part name="P-1" library="supply1" deviceset="-12V" device="" value="-2V5A"/>
<part name="C3" library="passive" deviceset="CAP" device="C0603" value="100nF"/>
<part name="C4" library="passive" deviceset="CAP" device="C0402" value="100nF"/>
<part name="P-5" library="supply1" deviceset="-24V" device="" value="AVREFM"/>
<part name="P-6" library="supply1" deviceset="-24V" device="" value="AVREFM"/>
<part name="P-7" library="supply1" deviceset="-24V" device="" value="AVREFM"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="C21" library="passive" deviceset="CAP" device="C0402" value="100nF"/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="X1" library="connectors" deviceset="?227161*" device="" technology="-8" value="31-5431-10RFX"/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="T1" library="transistor" deviceset="BC850" device=""/>
<part name="T2" library="transistor" deviceset="BC850" device=""/>
<part name="T5" library="transistor-pnp" deviceset="BC856*" device="SMD" technology="A"/>
<part name="T6" library="transistor-pnp" deviceset="BC856*" device="SMD" technology="A"/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="IC7" library="74xx-eu" deviceset="74*595" device="D" technology="HC"/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
<part name="P+3" library="supply1" deviceset="+5V" device=""/>
<part name="T3" library="transistor" deviceset="BC850" device=""/>
<part name="T7" library="transistor-pnp" deviceset="BC856*" device="SMD" technology="A"/>
<part name="T4" library="transistor" deviceset="BC850" device=""/>
<part name="T8" library="transistor-pnp" deviceset="BC856*" device="SMD" technology="A"/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="GND17" library="supply1" deviceset="GND" device=""/>
<part name="R27" library="passive" deviceset="RES" device="R0603" value="10R"/>
<part name="R28" library="passive" deviceset="RES" device="R0603" value="10R"/>
<part name="R29" library="passive" deviceset="RES" device="R0603" value="10R"/>
<part name="R30" library="passive" deviceset="RES" device="R0603" value="10R"/>
<part name="R31" library="passive" deviceset="RES" device="R0603" value="10R"/>
<part name="P+4" library="supply1" deviceset="+5V" device=""/>
<part name="R32" library="passive" deviceset="RES" device="R0603" value="22R"/>
<part name="R33" library="passive" deviceset="RES" device="R0603" value="300R"/>
<part name="K2" library="relay" deviceset="G6K" device="-2F-Y"/>
<part name="R37" library="passive" deviceset="RES" device="R0603" value="22R"/>
<part name="P-2" library="supply1" deviceset="-24V" device="" value="AVREFM"/>
<part name="P-3" library="supply1" deviceset="-24V" device="" value="AVREFM"/>
<part name="P-4" library="supply1" deviceset="-24V" device="" value="AVREFM"/>
<part name="C9" library="passive" deviceset="CAP" device="C0603" value="100nF"/>
<part name="C26" library="passive" deviceset="CAP" device="C0603" value="12pF"/>
<part name="C27" library="passive" deviceset="CAP" device="C0603" value="12pF"/>
<part name="L1" library="rcl" deviceset="L-EU" device="L3216C" value="1uH"/>
<part name="C10" library="passive" deviceset="CAP" device="C1206" value="100uF"/>
<part name="C14" library="passive" deviceset="CAP" device="C0402" value="100nF"/>
<part name="C16" library="passive" deviceset="CAP" device="C0402" value="100nF"/>
<part name="C19" library="passive" deviceset="CAP" device="C0402" value="100nF"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="C22" library="passive" deviceset="CAP" device="C0603" value="1pF"/>
<part name="C23" library="passive" deviceset="CAP" device="C0603" value="1pF"/>
<part name="R25" library="passive" deviceset="RES" device="R0603" value="1R"/>
<part name="R26" library="passive" deviceset="RES" device="R0603" value="100R"/>
<part name="R34" library="passive" deviceset="RES" device="R0603" value="47R"/>
<part name="R35" library="passive" deviceset="RES" device="R0603" value="47R"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="317.5" y="73.66" size="1.778" layer="97">SPIDI
SPICLK
SPICS
SPICHAIN</text>
<text x="317.5" y="55.88" size="1.778" layer="97">OUTPUT
AUXOUT
AUXIN
+5V
-2.5VA
+3VA</text>
</plain>
<instances>
<instance part="IC1" gate="A" x="139.7" y="175.26" smashed="yes">
<attribute name="NAME" x="144.78" y="177.8" size="1.778" layer="95"/>
<attribute name="VALUE" x="139.7" y="181.61" size="1.778" layer="96"/>
</instance>
<instance part="IC1" gate="B" x="218.44" y="175.26"/>
<instance part="IC1" gate="C" x="261.62" y="175.26"/>
<instance part="R1" gate="G$1" x="142.24" y="162.56"/>
<instance part="R2" gate="G$1" x="134.62" y="154.94" rot="R90"/>
<instance part="R3" gate="G$1" x="134.62" y="142.24" rot="R90"/>
<instance part="R4" gate="G$1" x="160.02" y="175.26" smashed="yes" rot="R180">
<attribute name="NAME" x="164.592" y="178.816" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="164.338" y="176.022" size="1.4224" layer="96" rot="R180"/>
</instance>
<instance part="R5" gate="G$1" x="220.98" y="162.56"/>
<instance part="R6" gate="G$1" x="213.36" y="154.94" rot="R90"/>
<instance part="R8" gate="G$1" x="241.3" y="180.34" rot="R270"/>
<instance part="R9" gate="G$1" x="264.16" y="162.56"/>
<instance part="R10" gate="G$1" x="256.54" y="154.94" rot="R90"/>
<instance part="R12" gate="G$1" x="284.48" y="180.34" rot="R270"/>
<instance part="IC3" gate="A" x="317.5" y="185.42"/>
<instance part="IC2" gate="A" x="193.04" y="177.8"/>
<instance part="IC2" gate="P" x="205.74" y="2.54"/>
<instance part="IC3" gate="P" x="231.14" y="2.54"/>
<instance part="R11" gate="G$1" x="205.74" y="172.72" rot="R90"/>
<instance part="R13" gate="G$1" x="248.92" y="172.72" rot="R90"/>
<instance part="R14" gate="G$1" x="129.54" y="172.72" rot="R90"/>
<instance part="IC1" gate="P" x="172.72" y="2.54" smashed="yes">
<attribute name="NAME" x="163.83" y="-3.81" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="167.64" y="-3.81" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C1" gate="G$1" x="182.88" y="7.62" rot="R90"/>
<instance part="C2" gate="G$1" x="193.04" y="7.62" rot="R90"/>
<instance part="C5" gate="G$1" x="243.84" y="-22.86" rot="R90"/>
<instance part="C6" gate="G$1" x="218.44" y="7.62" rot="R90"/>
<instance part="C7" gate="G$1" x="218.44" y="-22.86" rot="R90"/>
<instance part="C8" gate="G$1" x="243.84" y="5.08" rot="R90"/>
<instance part="P+1" gate="1" x="172.72" y="20.32"/>
<instance part="GND7" gate="1" x="213.36" y="-12.7"/>
<instance part="GND8" gate="1" x="177.8" y="154.94"/>
<instance part="GND9" gate="1" x="302.26" y="162.56"/>
<instance part="FRAME1" gate="G$1" x="-25.4" y="-48.26"/>
<instance part="K1" gate="1" x="30.48" y="27.94" rot="R90"/>
<instance part="K1" gate="2" x="15.24" y="190.5" rot="R270"/>
<instance part="K1" gate="3" x="0" y="198.12"/>
<instance part="C11" gate="G$1" x="12.7" y="177.8" rot="R180"/>
<instance part="R7" gate="G$1" x="53.34" y="180.34" rot="R90"/>
<instance part="C12" gate="G$1" x="63.5" y="160.02" rot="R90"/>
<instance part="R15" gate="G$1" x="53.34" y="167.64" rot="R90"/>
<instance part="GND10" gate="1" x="55.88" y="144.78"/>
<instance part="C13" gate="G$1" x="38.1" y="170.18"/>
<instance part="R16" gate="G$1" x="53.34" y="193.04" rot="R90"/>
<instance part="R17" gate="G$1" x="53.34" y="154.94" rot="R90"/>
<instance part="C15" gate="G$1" x="63.5" y="193.04" rot="R90"/>
<instance part="R18" gate="G$1" x="53.34" y="121.92" rot="R90"/>
<instance part="C17" gate="G$1" x="63.5" y="101.6" rot="R90"/>
<instance part="R19" gate="G$1" x="53.34" y="109.22" rot="R90"/>
<instance part="GND11" gate="1" x="55.88" y="86.36"/>
<instance part="C18" gate="G$1" x="38.1" y="111.76"/>
<instance part="R20" gate="G$1" x="53.34" y="134.62" rot="R90"/>
<instance part="R21" gate="G$1" x="53.34" y="96.52" rot="R90"/>
<instance part="C20" gate="G$1" x="63.5" y="134.62" rot="R90"/>
<instance part="R22" gate="G$1" x="109.22" y="139.7"/>
<instance part="R23" gate="G$1" x="91.44" y="134.62" rot="R90"/>
<instance part="R24" gate="G$1" x="119.38" y="154.94" rot="R270"/>
<instance part="IC4" gate="A" x="99.06" y="149.86"/>
<instance part="IC4" gate="P" x="147.32" y="5.08"/>
<instance part="P+2" gate="1" x="147.32" y="20.32"/>
<instance part="P-1" gate="1" x="147.32" y="-38.1"/>
<instance part="C3" gate="G$1" x="154.94" y="5.08" rot="R90"/>
<instance part="C4" gate="G$1" x="154.94" y="-22.86" rot="R90"/>
<instance part="P-5" gate="1" x="134.62" y="129.54"/>
<instance part="P-6" gate="1" x="213.36" y="142.24"/>
<instance part="P-7" gate="1" x="256.54" y="142.24"/>
<instance part="GND1" gate="1" x="147.32" y="167.64"/>
<instance part="GND2" gate="1" x="226.06" y="167.64"/>
<instance part="GND3" gate="1" x="269.24" y="167.64"/>
<instance part="IC4" gate="B" x="236.22" y="83.82" smashed="yes">
<attribute name="NAME" x="238.76" y="86.995" size="1.778" layer="95"/>
<attribute name="VALUE" x="243.84" y="91.44" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="C21" gate="G$1" x="101.6" y="124.46" rot="R180"/>
<instance part="GND12" gate="1" x="111.76" y="121.92"/>
<instance part="X1" gate="G$1" x="-7.62" y="177.8" smashed="yes">
<attribute name="VALUE" x="-20.32" y="180.34" size="1.778" layer="96"/>
<attribute name="NAME" x="-20.32" y="183.642" size="1.778" layer="95"/>
</instance>
<instance part="GND13" gate="1" x="-5.08" y="160.02"/>
<instance part="T1" gate="G$1" x="17.78" y="35.56"/>
<instance part="T2" gate="G$1" x="43.18" y="35.56" rot="MR0"/>
<instance part="T5" gate="G$1" x="17.78" y="20.32" smashed="yes">
<attribute name="NAME" x="5.08" y="15.24" size="1.778" layer="95"/>
<attribute name="VALUE" x="5.08" y="12.7" size="1.778" layer="96"/>
</instance>
<instance part="T6" gate="G$1" x="43.18" y="20.32" smashed="yes" rot="MR0">
<attribute name="NAME" x="48.26" y="15.24" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="58.42" y="12.7" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="GND14" gate="1" x="30.48" y="10.16"/>
<instance part="IC7" gate="A" x="330.2" y="119.38"/>
<instance part="GND15" gate="1" x="317.5" y="104.14"/>
<instance part="P+3" gate="1" x="307.34" y="121.92" smashed="yes" rot="R90">
<attribute name="VALUE" x="304.8" y="121.92" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="T3" gate="G$1" x="76.2" y="35.56"/>
<instance part="T7" gate="G$1" x="76.2" y="20.32" smashed="yes">
<attribute name="NAME" x="63.5" y="15.24" size="1.778" layer="95"/>
<attribute name="VALUE" x="63.5" y="12.7" size="1.778" layer="96"/>
</instance>
<instance part="T4" gate="G$1" x="101.6" y="35.56" rot="MR0"/>
<instance part="T8" gate="G$1" x="101.6" y="20.32" smashed="yes" rot="MR0">
<attribute name="NAME" x="106.68" y="15.24" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="116.84" y="12.7" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="GND16" gate="1" x="88.9" y="10.16"/>
<instance part="GND17" gate="1" x="71.12" y="53.34"/>
<instance part="R27" gate="G$1" x="50.8" y="55.88" rot="R90"/>
<instance part="R28" gate="G$1" x="53.34" y="33.02" rot="R180"/>
<instance part="R29" gate="G$1" x="63.5" y="25.4" rot="R180"/>
<instance part="R30" gate="G$1" x="5.08" y="27.94" rot="R180"/>
<instance part="R31" gate="G$1" x="111.76" y="27.94" rot="R180"/>
<instance part="P+4" gate="1" x="50.8" y="63.5"/>
<instance part="R32" gate="G$1" x="256.54" y="83.82" rot="R180"/>
<instance part="R33" gate="G$1" x="233.68" y="71.12"/>
<instance part="K2" gate="1" x="88.9" y="27.94" rot="R90"/>
<instance part="K2" gate="2" x="22.86" y="177.8" rot="R270"/>
<instance part="K2" gate="3" x="88.9" y="152.4" rot="MR270"/>
<instance part="R37" gate="G$1" x="259.08" y="101.6"/>
<instance part="P-2" gate="1" x="129.54" y="160.02" smashed="yes">
<attribute name="VALUE" x="127" y="152.4" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="P-3" gate="1" x="205.74" y="160.02" smashed="yes">
<attribute name="VALUE" x="203.2" y="152.4" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="P-4" gate="1" x="248.92" y="160.02" smashed="yes">
<attribute name="VALUE" x="246.38" y="152.4" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="IC7" gate="P" x="251.46" y="2.54"/>
<instance part="C9" gate="G$1" x="261.62" y="5.08" rot="R90"/>
<instance part="C26" gate="G$1" x="38.1" y="124.46" rot="R90"/>
<instance part="C27" gate="G$1" x="38.1" y="185.42" rot="R90"/>
<instance part="L1" gate="G$1" x="91.44" y="119.38"/>
<instance part="C10" gate="G$1" x="60.96" y="53.34" rot="R90"/>
<instance part="C14" gate="G$1" x="147.32" y="134.62"/>
<instance part="C16" gate="G$1" x="223.52" y="147.32"/>
<instance part="C19" gate="G$1" x="266.7" y="147.32"/>
<instance part="GND4" gate="1" x="154.94" y="132.08"/>
<instance part="GND5" gate="1" x="228.6" y="144.78"/>
<instance part="GND6" gate="1" x="271.78" y="144.78"/>
<instance part="C22" gate="G$1" x="73.66" y="193.04" rot="R90"/>
<instance part="C23" gate="G$1" x="73.66" y="134.62" rot="R90"/>
<instance part="R25" gate="G$1" x="-5.08" y="170.18" rot="R90"/>
<instance part="R26" gate="G$1" x="0" y="177.8" rot="R180"/>
<instance part="R34" gate="G$1" x="71.12" y="167.64" rot="R180"/>
<instance part="R35" gate="G$1" x="71.12" y="109.22" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="P$2"/>
<pinref part="R1" gate="G$1" pin="P$1"/>
<wire x1="134.62" y1="160.02" x2="134.62" y2="162.56" width="0.1524" layer="91"/>
<pinref part="IC1" gate="A" pin="IN-"/>
<wire x1="134.62" y1="162.56" x2="134.62" y2="172.72" width="0.1524" layer="91"/>
<junction x="134.62" y="162.56"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="P$2"/>
<wire x1="147.32" y1="162.56" x2="154.94" y2="162.56" width="0.1524" layer="91"/>
<wire x1="154.94" y1="162.56" x2="154.94" y2="175.26" width="0.1524" layer="91"/>
<pinref part="IC1" gate="A" pin="OUT"/>
<pinref part="R4" gate="G$1" pin="P$2"/>
<junction x="154.94" y="175.26"/>
<wire x1="154.94" y1="175.26" x2="147.32" y2="175.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="P$1"/>
<pinref part="R3" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="193.04" y1="2.54" x2="193.04" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="IC2" gate="P" pin="GND"/>
<wire x1="205.74" y1="-5.08" x2="205.74" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="205.74" y1="-10.16" x2="193.04" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="182.88" y1="2.54" x2="182.88" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="193.04" y1="-10.16" x2="182.88" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="1"/>
<pinref part="C7" gate="G$1" pin="2"/>
<wire x1="218.44" y1="2.54" x2="218.44" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="218.44" y1="-10.16" x2="218.44" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="205.74" y1="-10.16" x2="213.36" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="1"/>
<pinref part="C5" gate="G$1" pin="2"/>
<wire x1="213.36" y1="-10.16" x2="218.44" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="243.84" y1="0" x2="243.84" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="243.84" y1="-10.16" x2="243.84" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="218.44" y1="-10.16" x2="231.14" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="IC3" gate="P" pin="GND"/>
<wire x1="231.14" y1="-10.16" x2="243.84" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="231.14" y1="-5.08" x2="231.14" y2="-10.16" width="0.1524" layer="91"/>
<junction x="205.74" y="-10.16"/>
<junction x="231.14" y="-10.16"/>
<pinref part="GND7" gate="1" pin="GND"/>
<junction x="213.36" y="-10.16"/>
<junction x="243.84" y="-10.16"/>
<wire x1="243.84" y1="-10.16" x2="251.46" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="IC1" gate="P" pin="V-"/>
<wire x1="172.72" y1="-5.08" x2="172.72" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="172.72" y1="-10.16" x2="182.88" y2="-10.16" width="0.1524" layer="91"/>
<junction x="182.88" y="-10.16"/>
<junction x="193.04" y="-10.16"/>
<junction x="218.44" y="-10.16"/>
<pinref part="C4" gate="G$1" pin="2"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="154.94" y1="-17.78" x2="154.94" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="154.94" y1="-10.16" x2="154.94" y2="0" width="0.1524" layer="91"/>
<wire x1="154.94" y1="-10.16" x2="172.72" y2="-10.16" width="0.1524" layer="91"/>
<junction x="154.94" y="-10.16"/>
<junction x="172.72" y="-10.16"/>
<pinref part="IC7" gate="P" pin="GND"/>
<wire x1="251.46" y1="-10.16" x2="251.46" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="1"/>
<wire x1="251.46" y1="-10.16" x2="261.62" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="261.62" y1="-10.16" x2="261.62" y2="0" width="0.1524" layer="91"/>
<junction x="251.46" y="-10.16"/>
</segment>
<segment>
<pinref part="GND8" gate="1" pin="GND"/>
<wire x1="177.8" y1="157.48" x2="177.8" y2="167.64" width="0.1524" layer="91"/>
<pinref part="IC2" gate="A" pin="INH"/>
<wire x1="177.8" y1="167.64" x2="180.34" y2="167.64" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND9" gate="1" pin="GND"/>
<wire x1="302.26" y1="165.1" x2="302.26" y2="175.26" width="0.1524" layer="91"/>
<pinref part="IC3" gate="A" pin="INH"/>
<wire x1="302.26" y1="175.26" x2="304.8" y2="175.26" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND10" gate="1" pin="GND"/>
<wire x1="53.34" y1="147.32" x2="55.88" y2="147.32" width="0.1524" layer="91"/>
<pinref part="C12" gate="G$1" pin="1"/>
<wire x1="55.88" y1="147.32" x2="63.5" y2="147.32" width="0.1524" layer="91"/>
<wire x1="63.5" y1="147.32" x2="63.5" y2="154.94" width="0.1524" layer="91"/>
<pinref part="R17" gate="G$1" pin="P$1"/>
<pinref part="C13" gate="G$1" pin="A"/>
<wire x1="38.1" y1="165.1" x2="38.1" y2="147.32" width="0.1524" layer="91"/>
<wire x1="38.1" y1="147.32" x2="53.34" y2="147.32" width="0.1524" layer="91"/>
<junction x="53.34" y="147.32"/>
<junction x="55.88" y="147.32"/>
</segment>
<segment>
<pinref part="GND11" gate="1" pin="GND"/>
<wire x1="53.34" y1="88.9" x2="55.88" y2="88.9" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="1"/>
<wire x1="55.88" y1="88.9" x2="63.5" y2="88.9" width="0.1524" layer="91"/>
<wire x1="63.5" y1="88.9" x2="63.5" y2="96.52" width="0.1524" layer="91"/>
<pinref part="R21" gate="G$1" pin="P$1"/>
<pinref part="C18" gate="G$1" pin="A"/>
<wire x1="38.1" y1="106.68" x2="38.1" y2="88.9" width="0.1524" layer="91"/>
<wire x1="38.1" y1="88.9" x2="53.34" y2="88.9" width="0.1524" layer="91"/>
<junction x="53.34" y="88.9"/>
<junction x="55.88" y="88.9"/>
</segment>
<segment>
<pinref part="IC1" gate="A" pin="!POWERDOWN"/>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="142.24" y1="170.18" x2="147.32" y2="170.18" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC1" gate="B" pin="!POWERDOWN"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="220.98" y1="170.18" x2="226.06" y2="170.18" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC1" gate="C" pin="!POWERDOWN"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="264.16" y1="170.18" x2="269.24" y2="170.18" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C21" gate="G$1" pin="1"/>
<pinref part="GND12" gate="1" pin="GND"/>
<wire x1="106.68" y1="124.46" x2="111.76" y2="124.46" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="T5" gate="G$1" pin="C"/>
<wire x1="20.32" y1="15.24" x2="20.32" y2="12.7" width="0.1524" layer="91"/>
<pinref part="T6" gate="G$1" pin="C"/>
<wire x1="20.32" y1="12.7" x2="30.48" y2="12.7" width="0.1524" layer="91"/>
<wire x1="30.48" y1="12.7" x2="40.64" y2="12.7" width="0.1524" layer="91"/>
<wire x1="40.64" y1="12.7" x2="40.64" y2="15.24" width="0.1524" layer="91"/>
<pinref part="GND14" gate="1" pin="GND"/>
<junction x="30.48" y="12.7"/>
</segment>
<segment>
<pinref part="IC7" gate="A" pin="G"/>
<pinref part="GND15" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="T7" gate="G$1" pin="C"/>
<wire x1="78.74" y1="15.24" x2="78.74" y2="12.7" width="0.1524" layer="91"/>
<pinref part="T8" gate="G$1" pin="C"/>
<wire x1="78.74" y1="12.7" x2="88.9" y2="12.7" width="0.1524" layer="91"/>
<wire x1="88.9" y1="12.7" x2="99.06" y2="12.7" width="0.1524" layer="91"/>
<wire x1="99.06" y1="12.7" x2="99.06" y2="15.24" width="0.1524" layer="91"/>
<pinref part="GND16" gate="1" pin="GND"/>
<junction x="88.9" y="12.7"/>
</segment>
<segment>
<pinref part="C10" gate="G$1" pin="2"/>
<wire x1="60.96" y1="58.42" x2="71.12" y2="58.42" width="0.1524" layer="91"/>
<pinref part="GND17" gate="1" pin="GND"/>
<wire x1="71.12" y1="58.42" x2="71.12" y2="55.88" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C16" gate="G$1" pin="2"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C19" gate="G$1" pin="2"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C14" gate="G$1" pin="2"/>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="152.4" y1="134.62" x2="154.94" y2="134.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND13" gate="1" pin="GND"/>
<pinref part="R25" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="R6" gate="G$1" pin="P$2"/>
<pinref part="R5" gate="G$1" pin="P$1"/>
<wire x1="213.36" y1="160.02" x2="213.36" y2="162.56" width="0.1524" layer="91"/>
<pinref part="IC1" gate="B" pin="IN-"/>
<wire x1="213.36" y1="162.56" x2="213.36" y2="172.72" width="0.1524" layer="91"/>
<junction x="213.36" y="162.56"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="R10" gate="G$1" pin="P$2"/>
<pinref part="R9" gate="G$1" pin="P$1"/>
<wire x1="256.54" y1="160.02" x2="256.54" y2="162.56" width="0.1524" layer="91"/>
<wire x1="256.54" y1="162.56" x2="256.54" y2="172.72" width="0.1524" layer="91"/>
<junction x="256.54" y="162.56"/>
<pinref part="IC1" gate="C" pin="IN-"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="P$2"/>
<wire x1="269.24" y1="162.56" x2="284.48" y2="162.56" width="0.1524" layer="91"/>
<wire x1="284.48" y1="162.56" x2="284.48" y2="175.26" width="0.1524" layer="91"/>
<pinref part="R12" gate="G$1" pin="P$2"/>
<pinref part="IC1" gate="C" pin="OUT"/>
<wire x1="269.24" y1="175.26" x2="284.48" y2="175.26" width="0.1524" layer="91"/>
<junction x="284.48" y="175.26"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="IC1" gate="A" pin="IN+"/>
<pinref part="IC3" gate="A" pin="X0"/>
<wire x1="134.62" y1="198.12" x2="134.62" y2="177.8" width="0.1524" layer="91"/>
<wire x1="304.8" y1="198.12" x2="177.8" y2="198.12" width="0.1524" layer="91"/>
<wire x1="177.8" y1="198.12" x2="175.26" y2="198.12" width="0.1524" layer="91"/>
<wire x1="175.26" y1="198.12" x2="134.62" y2="198.12" width="0.1524" layer="91"/>
<pinref part="IC2" gate="A" pin="Y1"/>
<wire x1="180.34" y1="175.26" x2="177.8" y2="175.26" width="0.1524" layer="91"/>
<wire x1="177.8" y1="175.26" x2="177.8" y2="198.12" width="0.1524" layer="91"/>
<junction x="177.8" y="198.12"/>
<pinref part="IC2" gate="A" pin="X2"/>
<wire x1="180.34" y1="185.42" x2="175.26" y2="185.42" width="0.1524" layer="91"/>
<wire x1="175.26" y1="185.42" x2="175.26" y2="198.12" width="0.1524" layer="91"/>
<junction x="175.26" y="198.12"/>
<pinref part="R14" gate="G$1" pin="P$2"/>
<wire x1="129.54" y1="177.8" x2="134.62" y2="177.8" width="0.1524" layer="91"/>
<junction x="134.62" y="177.8"/>
<pinref part="R24" gate="G$1" pin="P$1"/>
<wire x1="119.38" y1="162.56" x2="119.38" y2="198.12" width="0.1524" layer="91"/>
<wire x1="119.38" y1="198.12" x2="134.62" y2="198.12" width="0.1524" layer="91"/>
<junction x="134.62" y="198.12"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="IC1" gate="B" pin="OUT"/>
<pinref part="R8" gate="G$1" pin="P$2"/>
<junction x="241.3" y="175.26"/>
<wire x1="241.3" y1="175.26" x2="226.06" y2="175.26" width="0.1524" layer="91"/>
<wire x1="241.3" y1="162.56" x2="241.3" y2="175.26" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="P$2"/>
<wire x1="226.06" y1="162.56" x2="241.3" y2="162.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="R4" gate="G$1" pin="P$1"/>
<wire x1="167.64" y1="175.26" x2="175.26" y2="175.26" width="0.1524" layer="91"/>
<wire x1="175.26" y1="175.26" x2="175.26" y2="177.8" width="0.1524" layer="91"/>
<wire x1="175.26" y1="177.8" x2="180.34" y2="177.8" width="0.1524" layer="91"/>
<pinref part="IC2" gate="A" pin="Y0"/>
<wire x1="175.26" y1="177.8" x2="175.26" y2="182.88" width="0.1524" layer="91"/>
<pinref part="IC2" gate="A" pin="X3"/>
<wire x1="175.26" y1="182.88" x2="180.34" y2="182.88" width="0.1524" layer="91"/>
<junction x="175.26" y="177.8"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="IC1" gate="C" pin="IN+"/>
<wire x1="248.92" y1="177.8" x2="256.54" y2="177.8" width="0.1524" layer="91"/>
<pinref part="IC2" gate="A" pin="X"/>
<wire x1="248.92" y1="190.5" x2="248.92" y2="177.8" width="0.1524" layer="91"/>
<wire x1="205.74" y1="190.5" x2="248.92" y2="190.5" width="0.1524" layer="91"/>
<pinref part="R13" gate="G$1" pin="P$2"/>
<junction x="248.92" y="177.8"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="IC3" gate="A" pin="X1"/>
<wire x1="304.8" y1="195.58" x2="243.84" y2="195.58" width="0.1524" layer="91"/>
<pinref part="IC2" gate="A" pin="X0"/>
<wire x1="180.34" y1="190.5" x2="180.34" y2="200.66" width="0.1524" layer="91"/>
<wire x1="180.34" y1="200.66" x2="243.84" y2="200.66" width="0.1524" layer="91"/>
<wire x1="243.84" y1="200.66" x2="243.84" y2="195.58" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="P$1"/>
<wire x1="243.84" y1="195.58" x2="241.3" y2="195.58" width="0.1524" layer="91"/>
<wire x1="241.3" y1="187.96" x2="241.3" y2="195.58" width="0.1524" layer="91"/>
<junction x="243.84" y="195.58"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="IC3" gate="A" pin="X2"/>
<pinref part="R12" gate="G$1" pin="P$1"/>
<wire x1="304.8" y1="193.04" x2="284.48" y2="193.04" width="0.1524" layer="91"/>
<wire x1="284.48" y1="193.04" x2="284.48" y2="187.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="IC1" gate="B" pin="IN+"/>
<wire x1="205.74" y1="177.8" x2="213.36" y2="177.8" width="0.1524" layer="91"/>
<pinref part="IC2" gate="A" pin="Y"/>
<pinref part="R11" gate="G$1" pin="P$2"/>
<junction x="205.74" y="177.8"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="IC1" gate="P" pin="V+"/>
<wire x1="172.72" y1="10.16" x2="172.72" y2="15.24" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="2"/>
<wire x1="172.72" y1="15.24" x2="182.88" y2="15.24" width="0.1524" layer="91"/>
<wire x1="182.88" y1="15.24" x2="193.04" y2="15.24" width="0.1524" layer="91"/>
<wire x1="193.04" y1="15.24" x2="205.74" y2="15.24" width="0.1524" layer="91"/>
<wire x1="205.74" y1="15.24" x2="218.44" y2="15.24" width="0.1524" layer="91"/>
<wire x1="218.44" y1="15.24" x2="231.14" y2="15.24" width="0.1524" layer="91"/>
<wire x1="231.14" y1="15.24" x2="243.84" y2="15.24" width="0.1524" layer="91"/>
<wire x1="243.84" y1="15.24" x2="243.84" y2="10.16" width="0.1524" layer="91"/>
<pinref part="IC3" gate="P" pin="VCC"/>
<wire x1="231.14" y1="10.16" x2="231.14" y2="15.24" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="2"/>
<wire x1="218.44" y1="12.7" x2="218.44" y2="15.24" width="0.1524" layer="91"/>
<pinref part="IC2" gate="P" pin="VCC"/>
<wire x1="205.74" y1="10.16" x2="205.74" y2="15.24" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="193.04" y1="12.7" x2="193.04" y2="15.24" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="182.88" y1="12.7" x2="182.88" y2="15.24" width="0.1524" layer="91"/>
<pinref part="P+1" gate="1" pin="+5V"/>
<wire x1="172.72" y1="17.78" x2="172.72" y2="15.24" width="0.1524" layer="91"/>
<junction x="172.72" y="15.24"/>
<junction x="182.88" y="15.24"/>
<junction x="231.14" y="15.24"/>
<junction x="218.44" y="15.24"/>
<junction x="205.74" y="15.24"/>
<junction x="193.04" y="15.24"/>
<wire x1="243.84" y1="15.24" x2="251.46" y2="15.24" width="0.1524" layer="91"/>
<junction x="243.84" y="15.24"/>
<pinref part="IC7" gate="P" pin="VCC"/>
<wire x1="251.46" y1="15.24" x2="251.46" y2="10.16" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="2"/>
<wire x1="251.46" y1="15.24" x2="261.62" y2="15.24" width="0.1524" layer="91"/>
<wire x1="261.62" y1="15.24" x2="261.62" y2="10.16" width="0.1524" layer="91"/>
<junction x="251.46" y="15.24"/>
</segment>
<segment>
<pinref part="IC7" gate="A" pin="SCL"/>
<wire x1="317.5" y1="121.92" x2="309.88" y2="121.92" width="0.1524" layer="91"/>
<pinref part="P+3" gate="1" pin="+5V"/>
</segment>
<segment>
<pinref part="R27" gate="G$1" pin="P$2"/>
<pinref part="P+4" gate="1" pin="+5V"/>
</segment>
</net>
<net name="GMUXC" class="0">
<segment>
<pinref part="IC2" gate="A" pin="A"/>
<wire x1="180.34" y1="165.1" x2="175.26" y2="165.1" width="0.1524" layer="91"/>
<label x="167.64" y="165.1" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="342.9" y1="114.3" x2="345.44" y2="114.3" width="0.1524" layer="91"/>
<label x="342.9" y="114.3" size="1.778" layer="95"/>
<pinref part="IC7" gate="A" pin="QG"/>
</segment>
</net>
<net name="GMUXD" class="0">
<segment>
<pinref part="IC2" gate="A" pin="B"/>
<wire x1="180.34" y1="162.56" x2="175.26" y2="162.56" width="0.1524" layer="91"/>
<label x="167.64" y="162.56" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="342.9" y1="111.76" x2="345.44" y2="111.76" width="0.1524" layer="91"/>
<label x="342.9" y="111.76" size="1.778" layer="95"/>
<pinref part="IC7" gate="A" pin="QH"/>
</segment>
</net>
<net name="GMUXA" class="0">
<segment>
<pinref part="IC3" gate="A" pin="A"/>
<wire x1="304.8" y1="172.72" x2="299.72" y2="172.72" width="0.1524" layer="91"/>
<label x="292.1" y="172.72" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="342.9" y1="119.38" x2="345.44" y2="119.38" width="0.1524" layer="91"/>
<label x="342.9" y="119.38" size="1.778" layer="95"/>
<pinref part="IC7" gate="A" pin="QE"/>
</segment>
</net>
<net name="GMUXB" class="0">
<segment>
<pinref part="IC3" gate="A" pin="B"/>
<wire x1="304.8" y1="170.18" x2="299.72" y2="170.18" width="0.1524" layer="91"/>
<label x="292.1" y="170.18" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="342.9" y1="116.84" x2="345.44" y2="116.84" width="0.1524" layer="91"/>
<label x="342.9" y="116.84" size="1.778" layer="95"/>
<pinref part="IC7" gate="A" pin="QF"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="C11" gate="G$1" pin="2"/>
<pinref part="K1" gate="2" pin="P"/>
<wire x1="12.7" y1="190.5" x2="7.62" y2="190.5" width="0.1524" layer="91"/>
<wire x1="7.62" y1="190.5" x2="7.62" y2="177.8" width="0.1524" layer="91"/>
<pinref part="R26" gate="G$1" pin="P$1"/>
<junction x="7.62" y="177.8"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="20.32" y1="177.8" x2="17.78" y2="177.8" width="0.1524" layer="91"/>
<pinref part="K1" gate="2" pin="O"/>
<wire x1="20.32" y1="185.42" x2="20.32" y2="177.8" width="0.1524" layer="91"/>
<pinref part="K2" gate="2" pin="P"/>
<junction x="20.32" y="177.8"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="R16" gate="G$1" pin="P$1"/>
<pinref part="R7" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="P$1"/>
<pinref part="R15" gate="G$1" pin="P$2"/>
<pinref part="C12" gate="G$1" pin="2"/>
<wire x1="63.5" y1="165.1" x2="63.5" y2="167.64" width="0.1524" layer="91"/>
<wire x1="63.5" y1="167.64" x2="63.5" y2="172.72" width="0.1524" layer="91"/>
<wire x1="63.5" y1="172.72" x2="63.5" y2="182.88" width="0.1524" layer="91"/>
<wire x1="63.5" y1="182.88" x2="63.5" y2="187.96" width="0.1524" layer="91"/>
<wire x1="53.34" y1="172.72" x2="63.5" y2="172.72" width="0.1524" layer="91"/>
<junction x="63.5" y="172.72"/>
<junction x="53.34" y="172.72"/>
<pinref part="C22" gate="G$1" pin="1"/>
<wire x1="73.66" y1="187.96" x2="73.66" y2="182.88" width="0.1524" layer="91"/>
<wire x1="73.66" y1="182.88" x2="63.5" y2="182.88" width="0.1524" layer="91"/>
<junction x="63.5" y="182.88"/>
<pinref part="R34" gate="G$1" pin="P$2"/>
<wire x1="66.04" y1="167.64" x2="63.5" y2="167.64" width="0.1524" layer="91"/>
<junction x="63.5" y="167.64"/>
<pinref part="C15" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="R17" gate="G$1" pin="P$2"/>
<pinref part="R15" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="R16" gate="G$1" pin="P$2"/>
<pinref part="C15" gate="G$1" pin="2"/>
<wire x1="63.5" y1="198.12" x2="53.34" y2="198.12" width="0.1524" layer="91"/>
<wire x1="27.94" y1="198.12" x2="38.1" y2="198.12" width="0.1524" layer="91"/>
<junction x="53.34" y="198.12"/>
<wire x1="38.1" y1="198.12" x2="53.34" y2="198.12" width="0.1524" layer="91"/>
<wire x1="27.94" y1="182.88" x2="27.94" y2="198.12" width="0.1524" layer="91"/>
<pinref part="K2" gate="2" pin="S"/>
<pinref part="C27" gate="G$1" pin="2"/>
<wire x1="38.1" y1="190.5" x2="38.1" y2="198.12" width="0.1524" layer="91"/>
<junction x="38.1" y="198.12"/>
<pinref part="C22" gate="G$1" pin="2"/>
<wire x1="63.5" y1="198.12" x2="73.66" y2="198.12" width="0.1524" layer="91"/>
<junction x="63.5" y="198.12"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="R20" gate="G$1" pin="P$1"/>
<pinref part="R18" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="R21" gate="G$1" pin="P$2"/>
<pinref part="R19" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="R20" gate="G$1" pin="P$2"/>
<pinref part="C20" gate="G$1" pin="2"/>
<wire x1="63.5" y1="139.7" x2="53.34" y2="139.7" width="0.1524" layer="91"/>
<wire x1="27.94" y1="139.7" x2="38.1" y2="139.7" width="0.1524" layer="91"/>
<junction x="53.34" y="139.7"/>
<wire x1="38.1" y1="139.7" x2="53.34" y2="139.7" width="0.1524" layer="91"/>
<wire x1="27.94" y1="172.72" x2="27.94" y2="139.7" width="0.1524" layer="91"/>
<pinref part="K2" gate="2" pin="O"/>
<pinref part="C26" gate="G$1" pin="2"/>
<wire x1="38.1" y1="129.54" x2="38.1" y2="139.7" width="0.1524" layer="91"/>
<junction x="38.1" y="139.7"/>
<pinref part="C23" gate="G$1" pin="2"/>
<wire x1="63.5" y1="139.7" x2="73.66" y2="139.7" width="0.1524" layer="91"/>
<junction x="63.5" y="139.7"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="R23" gate="G$1" pin="P$2"/>
<wire x1="91.44" y1="139.7" x2="91.44" y2="147.32" width="0.1524" layer="91"/>
<pinref part="R22" gate="G$1" pin="P$1"/>
<wire x1="101.6" y1="139.7" x2="91.44" y2="139.7" width="0.1524" layer="91"/>
<junction x="91.44" y="139.7"/>
<pinref part="IC4" gate="A" pin="-IN"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="R22" gate="G$1" pin="P$2"/>
<wire x1="114.3" y1="139.7" x2="119.38" y2="139.7" width="0.1524" layer="91"/>
<wire x1="119.38" y1="139.7" x2="119.38" y2="149.86" width="0.1524" layer="91"/>
<pinref part="R24" gate="G$1" pin="P$2"/>
<pinref part="IC4" gate="A" pin="OUT"/>
<wire x1="106.68" y1="149.86" x2="119.38" y2="149.86" width="0.1524" layer="91"/>
<junction x="119.38" y="149.86"/>
</segment>
</net>
<net name="+3VA" class="0">
<segment>
<pinref part="IC4" gate="P" pin="V+"/>
<pinref part="P+2" gate="1" pin="+12V"/>
<wire x1="147.32" y1="12.7" x2="147.32" y2="15.24" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="2"/>
<wire x1="147.32" y1="15.24" x2="147.32" y2="17.78" width="0.1524" layer="91"/>
<wire x1="154.94" y1="10.16" x2="154.94" y2="15.24" width="0.1524" layer="91"/>
<wire x1="154.94" y1="15.24" x2="147.32" y2="15.24" width="0.1524" layer="91"/>
<junction x="147.32" y="15.24"/>
</segment>
</net>
<net name="-2V5A" class="0">
<segment>
<pinref part="P-1" gate="1" pin="-12V"/>
<pinref part="IC4" gate="P" pin="V-"/>
<wire x1="147.32" y1="-35.56" x2="147.32" y2="-33.02" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="1"/>
<wire x1="147.32" y1="-33.02" x2="147.32" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="200.66" y1="-33.02" x2="218.44" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="218.44" y1="-33.02" x2="226.06" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="226.06" y1="-33.02" x2="243.84" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="243.84" y1="-33.02" x2="243.84" y2="-27.94" width="0.1524" layer="91"/>
<pinref part="C7" gate="G$1" pin="1"/>
<wire x1="218.44" y1="-27.94" x2="218.44" y2="-33.02" width="0.1524" layer="91"/>
<pinref part="IC3" gate="P" pin="VEE"/>
<wire x1="226.06" y1="-5.08" x2="226.06" y2="-33.02" width="0.1524" layer="91"/>
<pinref part="IC2" gate="P" pin="VEE"/>
<wire x1="200.66" y1="-5.08" x2="200.66" y2="-33.02" width="0.1524" layer="91"/>
<junction x="218.44" y="-33.02"/>
<junction x="226.06" y="-33.02"/>
<wire x1="200.66" y1="-33.02" x2="154.94" y2="-33.02" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="154.94" y1="-33.02" x2="147.32" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="154.94" y1="-27.94" x2="154.94" y2="-33.02" width="0.1524" layer="91"/>
<junction x="147.32" y="-33.02"/>
<junction x="154.94" y="-33.02"/>
<junction x="200.66" y="-33.02"/>
</segment>
</net>
<net name="AVREFM" class="0">
<segment>
<pinref part="R3" gate="G$1" pin="P$1"/>
<pinref part="P-5" gate="1" pin="-24V"/>
<wire x1="134.62" y1="132.08" x2="134.62" y2="134.62" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="1"/>
<wire x1="142.24" y1="134.62" x2="134.62" y2="134.62" width="0.1524" layer="91"/>
<junction x="134.62" y="134.62"/>
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="P$1"/>
<pinref part="P-6" gate="1" pin="-24V"/>
<wire x1="213.36" y1="144.78" x2="213.36" y2="147.32" width="0.1524" layer="91"/>
<pinref part="C16" gate="G$1" pin="1"/>
<wire x1="218.44" y1="147.32" x2="213.36" y2="147.32" width="0.1524" layer="91"/>
<junction x="213.36" y="147.32"/>
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="P$1"/>
<pinref part="P-7" gate="1" pin="-24V"/>
<wire x1="256.54" y1="144.78" x2="256.54" y2="147.32" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="1"/>
<wire x1="261.62" y1="147.32" x2="256.54" y2="147.32" width="0.1524" layer="91"/>
<junction x="256.54" y="147.32"/>
</segment>
<segment>
<pinref part="R14" gate="G$1" pin="P$1"/>
<pinref part="P-2" gate="1" pin="-24V"/>
<wire x1="129.54" y1="162.56" x2="129.54" y2="165.1" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R11" gate="G$1" pin="P$1"/>
<pinref part="P-3" gate="1" pin="-24V"/>
<wire x1="205.74" y1="162.56" x2="205.74" y2="165.1" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R13" gate="G$1" pin="P$1"/>
<pinref part="P-4" gate="1" pin="-24V"/>
<wire x1="248.92" y1="162.56" x2="248.92" y2="165.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="OFFSETADJUST" class="0">
<segment>
<wire x1="91.44" y1="114.3" x2="91.44" y2="106.68" width="0.1524" layer="91"/>
<label x="91.44" y="106.68" size="1.778" layer="95"/>
<pinref part="L1" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="IC3" gate="A" pin="X"/>
<wire x1="330.2" y1="198.12" x2="335.28" y2="198.12" width="0.1524" layer="91"/>
<wire x1="335.28" y1="198.12" x2="335.28" y2="137.16" width="0.1524" layer="91"/>
<wire x1="335.28" y1="137.16" x2="228.6" y2="137.16" width="0.1524" layer="91"/>
<pinref part="IC4" gate="B" pin="+IN"/>
<wire x1="228.6" y1="137.16" x2="228.6" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="T1" gate="G$1" pin="C"/>
<wire x1="20.32" y1="40.64" x2="20.32" y2="48.26" width="0.1524" layer="91"/>
<wire x1="20.32" y1="48.26" x2="40.64" y2="48.26" width="0.1524" layer="91"/>
<pinref part="T2" gate="G$1" pin="C"/>
<wire x1="40.64" y1="48.26" x2="40.64" y2="40.64" width="0.1524" layer="91"/>
<pinref part="T3" gate="G$1" pin="C"/>
<wire x1="78.74" y1="40.64" x2="78.74" y2="48.26" width="0.1524" layer="91"/>
<pinref part="T4" gate="G$1" pin="C"/>
<wire x1="78.74" y1="48.26" x2="99.06" y2="48.26" width="0.1524" layer="91"/>
<wire x1="99.06" y1="48.26" x2="99.06" y2="40.64" width="0.1524" layer="91"/>
<wire x1="40.64" y1="48.26" x2="50.8" y2="48.26" width="0.1524" layer="91"/>
<junction x="40.64" y="48.26"/>
<junction x="78.74" y="48.26"/>
<wire x1="50.8" y1="48.26" x2="60.96" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R27" gate="G$1" pin="P$1"/>
<junction x="50.8" y="48.26"/>
<pinref part="C10" gate="G$1" pin="1"/>
<wire x1="60.96" y1="48.26" x2="78.74" y2="48.26" width="0.1524" layer="91"/>
<junction x="60.96" y="48.26"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="T6" gate="G$1" pin="E"/>
<pinref part="T2" gate="G$1" pin="E"/>
<wire x1="40.64" y1="25.4" x2="40.64" y2="27.94" width="0.1524" layer="91"/>
<pinref part="K1" gate="1" pin="-"/>
<wire x1="40.64" y1="27.94" x2="40.64" y2="30.48" width="0.1524" layer="91"/>
<wire x1="35.56" y1="27.94" x2="40.64" y2="27.94" width="0.1524" layer="91"/>
<junction x="40.64" y="27.94"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="T5" gate="G$1" pin="E"/>
<pinref part="T1" gate="G$1" pin="E"/>
<wire x1="20.32" y1="25.4" x2="20.32" y2="27.94" width="0.1524" layer="91"/>
<pinref part="K1" gate="1" pin="+"/>
<wire x1="20.32" y1="27.94" x2="20.32" y2="30.48" width="0.1524" layer="91"/>
<wire x1="25.4" y1="27.94" x2="20.32" y2="27.94" width="0.1524" layer="91"/>
<junction x="20.32" y="27.94"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="T5" gate="G$1" pin="B"/>
<wire x1="15.24" y1="20.32" x2="12.7" y2="20.32" width="0.1524" layer="91"/>
<wire x1="12.7" y1="20.32" x2="12.7" y2="27.94" width="0.1524" layer="91"/>
<pinref part="T1" gate="G$1" pin="B"/>
<wire x1="12.7" y1="27.94" x2="12.7" y2="35.56" width="0.1524" layer="91"/>
<wire x1="12.7" y1="35.56" x2="15.24" y2="35.56" width="0.1524" layer="91"/>
<pinref part="R30" gate="G$1" pin="P$1"/>
<junction x="12.7" y="27.94"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="T6" gate="G$1" pin="B"/>
<wire x1="45.72" y1="20.32" x2="48.26" y2="20.32" width="0.1524" layer="91"/>
<wire x1="48.26" y1="20.32" x2="48.26" y2="33.02" width="0.1524" layer="91"/>
<pinref part="T2" gate="G$1" pin="B"/>
<wire x1="48.26" y1="33.02" x2="48.26" y2="35.56" width="0.1524" layer="91"/>
<wire x1="48.26" y1="35.56" x2="45.72" y2="35.56" width="0.1524" layer="91"/>
<pinref part="R28" gate="G$1" pin="P$2"/>
<junction x="48.26" y="33.02"/>
</segment>
</net>
<net name="SPIDI" class="0">
<segment>
<pinref part="IC7" gate="A" pin="SER"/>
<wire x1="317.5" y1="129.54" x2="312.42" y2="129.54" width="0.1524" layer="91"/>
<label x="307.34" y="129.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPICLK" class="0">
<segment>
<pinref part="IC7" gate="A" pin="SCK"/>
<wire x1="317.5" y1="124.46" x2="312.42" y2="124.46" width="0.1524" layer="91"/>
<label x="307.34" y="124.46" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPICS" class="0">
<segment>
<pinref part="IC7" gate="A" pin="RCK"/>
<wire x1="317.5" y1="116.84" x2="312.42" y2="116.84" width="0.1524" layer="91"/>
<label x="307.34" y="116.84" size="1.778" layer="95"/>
</segment>
</net>
<net name="SPICHAIN" class="0">
<segment>
<pinref part="IC7" gate="A" pin="QH*"/>
<wire x1="342.9" y1="106.68" x2="347.98" y2="106.68" width="0.1524" layer="91"/>
<label x="345.44" y="106.68" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="T7" gate="G$1" pin="E"/>
<pinref part="T3" gate="G$1" pin="E"/>
<wire x1="78.74" y1="25.4" x2="78.74" y2="27.94" width="0.1524" layer="91"/>
<wire x1="78.74" y1="27.94" x2="78.74" y2="30.48" width="0.1524" layer="91"/>
<wire x1="83.82" y1="27.94" x2="78.74" y2="27.94" width="0.1524" layer="91"/>
<junction x="78.74" y="27.94"/>
<pinref part="K2" gate="1" pin="+"/>
</segment>
</net>
<net name="N$40" class="0">
<segment>
<pinref part="T8" gate="G$1" pin="E"/>
<pinref part="T4" gate="G$1" pin="E"/>
<wire x1="99.06" y1="25.4" x2="99.06" y2="27.94" width="0.1524" layer="91"/>
<wire x1="99.06" y1="27.94" x2="99.06" y2="30.48" width="0.1524" layer="91"/>
<wire x1="93.98" y1="27.94" x2="99.06" y2="27.94" width="0.1524" layer="91"/>
<junction x="99.06" y="27.94"/>
<pinref part="K2" gate="1" pin="-"/>
</segment>
</net>
<net name="N$42" class="0">
<segment>
<pinref part="T3" gate="G$1" pin="B"/>
<wire x1="73.66" y1="35.56" x2="71.12" y2="35.56" width="0.1524" layer="91"/>
<wire x1="71.12" y1="35.56" x2="71.12" y2="25.4" width="0.1524" layer="91"/>
<pinref part="T7" gate="G$1" pin="B"/>
<wire x1="71.12" y1="25.4" x2="71.12" y2="20.32" width="0.1524" layer="91"/>
<wire x1="71.12" y1="20.32" x2="73.66" y2="20.32" width="0.1524" layer="91"/>
<pinref part="R29" gate="G$1" pin="P$1"/>
<junction x="71.12" y="25.4"/>
</segment>
</net>
<net name="N$43" class="0">
<segment>
<pinref part="T8" gate="G$1" pin="B"/>
<wire x1="104.14" y1="20.32" x2="106.68" y2="20.32" width="0.1524" layer="91"/>
<wire x1="106.68" y1="20.32" x2="106.68" y2="27.94" width="0.1524" layer="91"/>
<pinref part="T4" gate="G$1" pin="B"/>
<wire x1="106.68" y1="27.94" x2="106.68" y2="35.56" width="0.1524" layer="91"/>
<wire x1="106.68" y1="35.56" x2="104.14" y2="35.56" width="0.1524" layer="91"/>
<pinref part="R31" gate="G$1" pin="P$2"/>
<junction x="106.68" y="27.94"/>
</segment>
</net>
<net name="DCRL+" class="0">
<segment>
<pinref part="R30" gate="G$1" pin="P$2"/>
<wire x1="0" y1="27.94" x2="-5.08" y2="27.94" width="0.1524" layer="91"/>
<label x="-7.62" y="27.94" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="342.9" y1="121.92" x2="345.44" y2="121.92" width="0.1524" layer="91"/>
<label x="342.9" y="121.92" size="1.778" layer="95"/>
<pinref part="IC7" gate="A" pin="QD"/>
</segment>
</net>
<net name="DCRL-" class="0">
<segment>
<pinref part="R28" gate="G$1" pin="P$1"/>
<wire x1="60.96" y1="33.02" x2="63.5" y2="33.02" width="0.1524" layer="91"/>
<label x="60.96" y="33.02" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="342.9" y1="124.46" x2="345.44" y2="124.46" width="0.1524" layer="91"/>
<label x="342.9" y="124.46" size="1.778" layer="95"/>
<pinref part="IC7" gate="A" pin="QC"/>
</segment>
</net>
<net name="ATTRL+" class="0">
<segment>
<pinref part="R29" gate="G$1" pin="P$2"/>
<wire x1="58.42" y1="25.4" x2="55.88" y2="25.4" width="0.1524" layer="91"/>
<label x="50.8" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="342.9" y1="127" x2="345.44" y2="127" width="0.1524" layer="91"/>
<label x="342.9" y="127" size="1.778" layer="95"/>
<pinref part="IC7" gate="A" pin="QB"/>
</segment>
</net>
<net name="ATTRL-" class="0">
<segment>
<pinref part="R31" gate="G$1" pin="P$1"/>
<wire x1="119.38" y1="27.94" x2="121.92" y2="27.94" width="0.1524" layer="91"/>
<label x="119.38" y="27.94" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="342.9" y1="129.54" x2="345.44" y2="129.54" width="0.1524" layer="91"/>
<label x="342.9" y="129.54" size="1.778" layer="95"/>
<pinref part="IC7" gate="A" pin="QA"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="R32" gate="G$1" pin="P$2"/>
<pinref part="R33" gate="G$1" pin="P$2"/>
<wire x1="238.76" y1="71.12" x2="251.46" y2="71.12" width="0.1524" layer="91"/>
<wire x1="251.46" y1="71.12" x2="251.46" y2="83.82" width="0.1524" layer="91"/>
<pinref part="R37" gate="G$1" pin="P$1"/>
<wire x1="251.46" y1="101.6" x2="251.46" y2="83.82" width="0.1524" layer="91"/>
<junction x="251.46" y="83.82"/>
<pinref part="IC4" gate="B" pin="OUT"/>
<wire x1="243.84" y1="83.82" x2="251.46" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="OUTPUT" class="0">
<segment>
<pinref part="R32" gate="G$1" pin="P$1"/>
<wire x1="264.16" y1="83.82" x2="271.78" y2="83.82" width="0.1524" layer="91"/>
<label x="266.7" y="83.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="AUXIN" class="0">
<segment>
<pinref part="IC3" gate="A" pin="X3"/>
<wire x1="304.8" y1="190.5" x2="297.18" y2="190.5" width="0.1524" layer="91"/>
<label x="289.56" y="190.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$26" class="0">
<segment>
<pinref part="IC4" gate="A" pin="+IN"/>
<pinref part="K2" gate="3" pin="P"/>
</segment>
</net>
<net name="AUXOUT" class="0">
<segment>
<pinref part="R37" gate="G$1" pin="P$2"/>
<wire x1="264.16" y1="101.6" x2="276.86" y2="101.6" width="0.1524" layer="91"/>
<label x="269.24" y="101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$48" class="0">
<segment>
<pinref part="C18" gate="G$1" pin="E"/>
<pinref part="C26" gate="G$1" pin="1"/>
<wire x1="38.1" y1="114.3" x2="38.1" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$49" class="0">
<segment>
<pinref part="C13" gate="G$1" pin="E"/>
<pinref part="C27" gate="G$1" pin="1"/>
<wire x1="38.1" y1="172.72" x2="38.1" y2="180.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$41" class="0">
<segment>
<pinref part="R33" gate="G$1" pin="P$1"/>
<wire x1="226.06" y1="71.12" x2="226.06" y2="81.28" width="0.1524" layer="91"/>
<pinref part="IC4" gate="B" pin="-IN"/>
<wire x1="226.06" y1="81.28" x2="228.6" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<pinref part="C21" gate="G$1" pin="2"/>
<pinref part="L1" gate="G$1" pin="1"/>
<wire x1="96.52" y1="124.46" x2="91.44" y2="124.46" width="0.1524" layer="91"/>
<pinref part="R23" gate="G$1" pin="P$1"/>
<wire x1="91.44" y1="124.46" x2="91.44" y2="127" width="0.1524" layer="91"/>
<junction x="91.44" y="124.46"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="C20" gate="G$1" pin="1"/>
<pinref part="R18" gate="G$1" pin="P$1"/>
<pinref part="R19" gate="G$1" pin="P$2"/>
<pinref part="C17" gate="G$1" pin="2"/>
<wire x1="63.5" y1="106.68" x2="63.5" y2="109.22" width="0.1524" layer="91"/>
<wire x1="63.5" y1="109.22" x2="63.5" y2="114.3" width="0.1524" layer="91"/>
<wire x1="63.5" y1="114.3" x2="63.5" y2="124.46" width="0.1524" layer="91"/>
<wire x1="53.34" y1="114.3" x2="63.5" y2="114.3" width="0.1524" layer="91"/>
<junction x="63.5" y="114.3"/>
<junction x="53.34" y="114.3"/>
<pinref part="C23" gate="G$1" pin="1"/>
<wire x1="73.66" y1="129.54" x2="73.66" y2="124.46" width="0.1524" layer="91"/>
<wire x1="73.66" y1="124.46" x2="63.5" y2="124.46" width="0.1524" layer="91"/>
<wire x1="63.5" y1="129.54" x2="63.5" y2="124.46" width="0.1524" layer="91"/>
<junction x="63.5" y="124.46"/>
<pinref part="R35" gate="G$1" pin="P$2"/>
<wire x1="66.04" y1="109.22" x2="63.5" y2="109.22" width="0.1524" layer="91"/>
<junction x="63.5" y="109.22"/>
</segment>
</net>
<net name="N$25" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="2"/>
<pinref part="R25" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="1"/>
<pinref part="R26" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<wire x1="83.82" y1="157.48" x2="83.82" y2="167.64" width="0.1524" layer="91"/>
<pinref part="K2" gate="3" pin="S"/>
<pinref part="R34" gate="G$1" pin="P$1"/>
<wire x1="78.74" y1="167.64" x2="83.82" y2="167.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$44" class="0">
<segment>
<pinref part="K2" gate="3" pin="O"/>
<wire x1="83.82" y1="109.22" x2="83.82" y2="147.32" width="0.1524" layer="91"/>
<pinref part="R35" gate="G$1" pin="P$1"/>
<wire x1="78.74" y1="109.22" x2="83.82" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="INSTOUT" class="0">
<segment>
<pinref part="IC2" gate="A" pin="X1"/>
<wire x1="180.34" y1="187.96" x2="172.72" y2="187.96" width="0.1524" layer="91"/>
<label x="162.56" y="187.96" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC2" gate="A" pin="Y2"/>
<wire x1="180.34" y1="172.72" x2="177.8" y2="172.72" width="0.1524" layer="91"/>
<label x="167.64" y="172.72" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="102,1,147.32,17.78,+12V,+3VA,,,,"/>
<approved hash="102,1,147.32,-35.56,-12V,-2V5A,,,,"/>
<approved hash="102,1,134.62,132.08,-24V,AVREFM,,,,"/>
<approved hash="102,1,213.36,144.78,-24V,AVREFM,,,,"/>
<approved hash="102,1,256.54,144.78,-24V,AVREFM,,,,"/>
<approved hash="102,1,129.54,162.56,-24V,AVREFM,,,,"/>
<approved hash="102,1,205.74,162.56,-24V,AVREFM,,,,"/>
<approved hash="102,1,248.92,162.56,-24V,AVREFM,,,,"/>
<approved hash="104,1,172.72,10.16,IC1P,V+,+5V,,,"/>
<approved hash="104,1,172.72,-5.08,IC1P,V-,GND,,,"/>
<approved hash="104,1,226.06,-5.08,IC3P,VEE,-2V5A,,,"/>
<approved hash="104,1,231.14,10.16,IC3P,VCC,+5V,,,"/>
<approved hash="104,1,200.66,-5.08,IC2P,VEE,-2V5A,,,"/>
<approved hash="104,1,205.74,10.16,IC2P,VCC,+5V,,,"/>
<approved hash="104,1,147.32,12.7,IC4P,V+,+3VA,,,"/>
<approved hash="104,1,147.32,-2.54,IC4P,V-,-2V5A,,,"/>
<approved hash="104,1,251.46,10.16,IC7P,VCC,+5V,,,"/>
</errors>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
